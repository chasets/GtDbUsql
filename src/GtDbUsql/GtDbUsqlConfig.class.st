Class {
	#name : #GtDbUsqlConfig,
	#superclass : #Object,
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
	self subclassResponsibility
]
