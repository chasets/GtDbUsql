Class {
	#name : #GtDbUsqlConfig,
	#superclass : #Object,
	#instVars : [
		'usqlConnection',
		'databaseConfig'
	],
	#category : #'GtDbUsql-Config'
}

{ #category : #accessing }
GtDbUsqlConfig >> commandPath [
	^ '/usr/local/bin/usql'
]

{ #category : #'as yet unclassified' }
GtDbUsqlConfig >> configFile [
	| firstPath lastPath |
	firstPath := OSPlatform current isWindows
			ifTrue: [ FileLocator preferences ]
			ifFalse: [ FileLocator userLibrary / 'Application Support' ].
	lastPath := 'usql/config.yaml'.
	^ firstPath / lastPath
]

{ #category : #'as yet unclassified' }
GtDbUsqlConfig >> configTree [
	^ YAML2JSON fromFile: self configFile
]

{ #category : #accessing }
GtDbUsqlConfig >> databaseConfig [
	databaseConfig ifNil: [databaseConfig := self].
	^ databaseConfig
]

{ #category : #accessing }
GtDbUsqlConfig >> databaseConfig: anObject [
	databaseConfig := anObject
]

{ #category : #'as yet unclassified' }
GtDbUsqlConfig >> databaseDriverClassname [
	^ 'GtDbUsqlScriptProcess'
]

{ #category : #'as yet unclassified' }
GtDbUsqlConfig >> gtConfigFor: aView [
	<gtView>
	^ aView forward
		title: 'Config File';
		priority: 20;
		object: [ self configFile ];
		view: #gtStyledCodeFor:
]

{ #category : #'as yet unclassified' }
GtDbUsqlConfig >> gtConfigTreeFor: aView [
	<gtView>
	^ aView forward
		title: 'Config Tree';
		priority: 30;
		object: [ self configTree ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtDbUsqlConfig >> usqlConnection [
	^ usqlConnection
]

{ #category : #accessing }
GtDbUsqlConfig >> usqlConnection: anObject [
	usqlConnection := anObject
]
