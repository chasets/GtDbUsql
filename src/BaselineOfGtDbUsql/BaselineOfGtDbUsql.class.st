Class {
	#name : #BaselineOfGtDbUsql,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtDbUsql
}

{ #category : #loading }
BaselineOfGtDbUsql class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'GtDbUsql' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtDbUsql >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec baseline: 'GtDb'
        	with: [ spec repository: 'github://chasets/GtDb:main' ].

			
			spec package: 'GtDbUsql'
			with: [ spec requires: #('GtDb') ]
		]
]
