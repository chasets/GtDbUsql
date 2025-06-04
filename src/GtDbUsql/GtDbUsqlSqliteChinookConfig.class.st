Class {
	#name : #GtDbUsqlSqliteChinookConfig,
	#superclass : #GtDbUsqlSqliteConfig,
	#category : #'GtDbUsql-Config'
}

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> accessClassname [
	^ 'ChinookUsqlSqliteAccess'
]

{ #category : #'as yet unclassified' }
GtDbUsqlSqliteChinookConfig >> usqlConnection [
	^ 'gt_chinook'
]
