Class {
	#name : #ChinookUsqlSqliteAccessAlbum,
	#superclass : #ChinookUsqlSqliteAccess,
	#category : #'GtDbUsql-Access'
}

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessAlbum class >> groupClassname [
	^ 'ChinookAlbum'
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessAlbum >> sql [
	^ 'select * from album'
]
