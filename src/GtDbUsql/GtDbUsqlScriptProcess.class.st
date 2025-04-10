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
GtDbUsqlScriptProcess >> resultsOutput [
	[results isFailure not and: [results output size = 0]] whileTrue: [0.25 seconds wait] .
	results isFailure ifTrue: [self error: results  stateDescription, ' - see the results object'].
	output := results output.
	^ output
]

{ #category : #accessing }
GtDbUsqlScriptProcess >> version [
	| shellScriptProcess script|
	script := self databaseConfig commandPath, ' --version'.
	
	shellScriptProcess := GtShellScriptProcess new script: script.

	results := shellScriptProcess execute.
	^ self resultsOutput
]
