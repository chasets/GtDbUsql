Class {
	#name : #GtDbUsqlSqliteMemoryConfig,
	#superclass : #GtDbUsqlSqliteConfig,
	#category : #'GtDbUsql-Config'
}

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteMemoryConfig >> usqlConnection [
	^ 'sqlite://:memory:'
]
