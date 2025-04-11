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

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> query: sqlString [
	^ self queryWithStructuredResults: sqlString
]

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> queryWithStructuredResults: sqlString [
	| sqlScript structuredResults |
	sqlScript := self sqlScriptFor: sqlString.
	self exec: sqlScript.
	structuredResults := STONJSON fromString: self resultsOutput.
	^ structuredResults
]

{ #category : #util }
GtDbUsqlScriptProcess >> resultsOutput [
	[results isFailure not and: [results output size = 0]] whileTrue: [0.25 seconds wait] .
	results isFailure ifTrue: [self error: results  stateDescription, ' - see the results object'].
	output := results output.
	^ output
]

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> sqlScriptFor: sql [
	| commandPath usqlConnection |
	commandPath := self databaseConfig commandPath. 
	usqlConnection := self databaseConfig usqlConnection. 
	^ commandPath, ' ',  usqlConnection, ' --json --quiet --command ', sql surroundedBySingleQuotes.
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
