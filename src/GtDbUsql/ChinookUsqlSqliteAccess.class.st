Class {
	#name : #ChinookUsqlSqliteAccess,
	#superclass : #GtDbRows,
	#category : #'GtDbUsql-Access'
}

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccess class >> groupClassname [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccess >> retrieve [
	| results |
	results := self query: self sql.
	rawData := results.
	^ rawData
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccess >> sql [
	self subclassResponsibility
]
