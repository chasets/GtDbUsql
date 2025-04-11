Class {
	#name : #ChinookUsqlSqliteAccessArtists,
	#superclass : #ChinookUsqlSqliteAccess,
	#category : #'GtDbUsql-Access'
}

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessArtists class >> groupClassname [
	^ 'ChinookArtists'
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessArtists >> sql [
	^ 'select * from artist'
]
