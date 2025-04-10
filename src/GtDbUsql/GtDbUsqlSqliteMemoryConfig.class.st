Class {
	#name : #GtDbUsqlSqliteMemoryConfig,
	#superclass : #GtDbUsqlConfig,
	#category : #'GtDbUsql-Config'
}

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteMemoryConfig >> usqlConnection [
	^ 'sqlite://:memory:'
]
