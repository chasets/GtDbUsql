Class {
	#name : #GtDbUsqlSqliteChinookConfig,
	#superclass : #GtDbUsqlConfig,
	#category : #'GtDbUsql-Config'
}

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> accessClassname [
	^ 'ChinookUsqlSqliteAccess'
]

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> databaseConfig [
	^ self
]

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> informationSchemaSqlClassname [
	^ 'InformationSchemaSqliteSql'
]

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> usqlConnection [
	^ 'gt_chinook'
]
