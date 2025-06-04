Class {
	#name : #GtDbUsqlSqliteConfig,
	#superclass : #GtDbUsqlConfig,
	#category : #'GtDbUsql-Config'
}

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteConfig class >> forFile: aFilename [
	| connectionString |
	connectionString := 'sqlite://', aFilename.
	^ self new usqlConnection: connectionString.
]

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteConfig >> informationSchemaSqlClassname [
	^ 'InformationSchemaSqliteSql'
]
