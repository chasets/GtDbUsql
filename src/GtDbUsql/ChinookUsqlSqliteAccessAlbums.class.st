Class {
	#name : #ChinookUsqlSqliteAccessAlbums,
	#superclass : #ChinookUsqlSqliteAccess,
	#category : #'GtDbUsql-Access'
}

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessAlbums class >> groupClassname [
	^ 'ChinookAlbums'
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessAlbums >> sql [ 
	^ 'select * from album'
]
