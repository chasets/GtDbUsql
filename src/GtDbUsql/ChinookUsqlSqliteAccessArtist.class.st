Class {
	#name : #ChinookUsqlSqliteAccessArtist,
	#superclass : #ChinookUsqlSqliteAccess,
	#category : #'GtDbUsql-Access'
}

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessArtist class >> groupClassname [
	^ 'ChinookArtist'
]

{ #category : #'as yet unclassified' }
ChinookUsqlSqliteAccessArtist >> sql [
	"could use a filter here for efficiency, but ChinookAlbum>>forArtist: subsets anyway"
	^ 'select * from artist'
]
