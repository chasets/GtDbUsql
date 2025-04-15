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
GtDbUsqlScriptProcess >> fixQuotingFor: aUsqlScript [ 
	"Since this is a shell process, it has quoting rules like a shell. Users of this module should pass SQL around as normal, that is with single quotes for string literals inside the query. So here, we need to do 2 things: (1) escape any double quotes with a backslash, and (2) wrap the whole string in double quotes"
	| escapedDoubleQuotes |
	escapedDoubleQuotes := aUsqlScript copyReplaceAll: '"' with: '\"'.
	^ escapedDoubleQuotes surroundedBy: '"'
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

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> queryWithoutResults: sqlString [
	| sqlScript |
	sqlScript := self sqlScriptFor: sqlString.
	self exec: sqlScript.
	"isRunning doesn't include the #new state, so if it runs fast enough then you miss it"
	[results state = #ran] whileFalse: [0.25 seconds wait].
	results isFailure ifTrue: [self error: (results stderr text asString), ' - see the results object for additional context'].
]

{ #category : #util }
GtDbUsqlScriptProcess >> resultsOutput [
	"isRunning doesn't include the #new state, so if it runs fast enough then you miss it, so have to check the state directly - TSC April 2025"
	[results state = #ran] whileFalse: [0.25 seconds wait].
	results isFailure ifTrue: [self error: (results stderr text asString), ' - see the results object for additional context'].
	output := results output.
	^ output
]

{ #category : #'as yet unclassified' }
GtDbUsqlScriptProcess >> sqlScriptFor: sql [
	"Since this is for a shell process, it has quoting rules like a shell. Users of this module should pass SQL around as normal, that is, with single quotes for string literals inside the query. We pass the sql script to self fixQuotingFor: to take care of this."
	| quotedSql commandPath usqlConnection |
	quotedSql := self fixQuotingFor: sql.
	commandPath := self databaseConfig commandPath. 
	usqlConnection := self databaseConfig usqlConnection. 
	^ commandPath, ' ',  usqlConnection, ' --json --quiet --command ', quotedSql.
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
