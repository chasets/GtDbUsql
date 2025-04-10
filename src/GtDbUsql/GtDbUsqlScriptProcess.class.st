Class {
	#name : #GtDbUsqlScriptProcess,
	#superclass : #Object,
	#instVars : [
		'databaseConfig',
		'results',
		'output'
	],
	#category : #'GtDbUsql-Core'
}

{ #category : #accessing }
GtDbUsqlScriptProcess >> databaseConfig [
	^ databaseConfig
]

{ #category : #accessing }
GtDbUsqlScriptProcess >> databaseConfig: anObject [
	databaseConfig := anObject
]

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> drivers [
	self exec: self driversScript.
	^ self resultsOutput lines allButFirst
]

{ #category : #script }
GtDbUsqlScriptProcess >> driversScript [
	^ self databaseConfig commandPath , ' --command ''\drivers'''
]

{ #category : #util }
GtDbUsqlScriptProcess >> exec: aUsqlScript [ 
	| shellScriptProcess |
	shellScriptProcess := GtShellScriptProcess new script: aUsqlScript.
	results := shellScriptProcess execute.
]

{ #category : #util }
GtDbUsqlScriptProcess >> resultsOutput [
	[results isFailure not and: [results output size = 0]] whileTrue: [0.25 seconds wait] .
	results isFailure ifTrue: [self error: results  stateDescription, ' - see the results object'].
	output := results output.
	^ output
]

{ #category : #util }
GtDbUsqlScriptProcess >> version [
	self exec: self versionScript.
	^ self resultsOutput
]

{ #category : #script }
GtDbUsqlScriptProcess >> versionScript [
	^ self databaseConfig commandPath , ' --version'.
]
