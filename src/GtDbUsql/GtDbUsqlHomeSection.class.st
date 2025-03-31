Class {
	#name : #GtDbUsqlHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'GtDbUsql-Card'
}

{ #category : #'as yet unclassified' }
GtDbUsqlHomeSection >> defaultPriority [
	^ 30
]

{ #category : #'as yet unclassified' }
GtDbUsqlHomeSection >> gtUsedKnowledgeBaseCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	| dbName |
	dbName := (LeDatabasesRegistry uniqueInstance defaultLogicalDatabase databases detect: [:i | i databaseName includesSubstring: 'GtDbUsql']) databaseName.
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'GtDb usql Home Card';
		description: 'Explore GtDb usql knowledge base';
		priority: 1;
		databaseName: dbName;
		recentlyEditedPage;
		editableToolbar;
		details: [ :db | 
			| snippets somePages |
			somePages := db pages select: #shouldAppearInIndexOrDailyNotes.
			snippets := somePages flatCollect: #allChildrenDepthFirst.
			'Your local knowledge base includes '
				, somePages size asString , ' pages containing '
				, snippets size asString , ' snippets of '
				, (snippets groupedBy: #class) size asString , ' different kinds.' ]
				yourself
]

{ #category : #'as yet unclassified' }
GtDbUsqlHomeSection >> sectionTitle [
	^ 'GtDb usql'
]
