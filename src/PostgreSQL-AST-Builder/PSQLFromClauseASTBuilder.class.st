"
I build an AST from FROM clause using PSQLASTNode subclasses from source code given as input.
"
Class {
	#name : #PSQLFromClauseASTBuilder,
	#superclass : #PSQLFromClauseGrammar,
	#traits : 'PSQLTExpressionDependingBuilder',
	#classTraits : 'PSQLTExpressionDependingBuilder classTrait',
	#category : #'PostgreSQL-AST-Builder'
}

{ #category : #accessing }
PSQLFromClauseASTBuilder class >> selectQueryParser [
	^ PSQLSelectQueryASTBuilder
]

{ #category : #accessing }
PSQLFromClauseASTBuilder class >> tokenParser [
	^ PSQLTokenASTBuilder
]

{ #category : #accessing }
PSQLFromClauseASTBuilder class >> valuesCommandParser [
	^ PSQLValuesASTBuilder
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> columnDefinition [
	^ super columnDefinition psqlASTBuild: [ :tokens |
		PSQLASTColumnDefinition new
			columnName: tokens first;
			type: (PSQLASTIdentifier new
						identifier: ((tokens second flattened collect: [ :item | 
							item isCharacter
								ifTrue: [ ' ' ]
								ifFalse: [ item identifier ] ]) joinUsing: '');
						startPosition: (tokens second flattened detect: [ :item | item class = PSQLASTIdentifier ]) startPosition;
						endPosition: (tokens second flattened reversed detect: [ :item | item class = PSQLASTIdentifier ]) endPosition;
						yourself);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromClause [
	^ super fromClause psqlASTBuild: [ :tokens |
		PSQLASTFromClause new
			items: (tokens second reject: [ :item | item = $, ] thenCollect: #first);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems [
	^ super fromItems psqlASTBuild: [ :tokens |
		tokens second
			ifEmpty: [ tokens first ]
			ifNotEmpty: [ 
				tokens second
					inject: tokens first
					into: [ :fromItem :current |
						current
							leftFromItem: fromItem;
							yourself ] ] ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems1 [
	^ super fromItems1 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType1 new
			hasOnly: tokens first isNotNil;
			tableName: tokens second;
			areDescendantTablesIncluded: tokens third isNotNil;
			alias: (tokens fourth ifNotNil: #second);
			columnAliases: (tokens fourth ifNotNil: [ :subTokens |
				subTokens third ifNotNil: [ :subsubTokens | subsubTokens second reject: [ :item | item = $, ] ] ifNil: [ #() ] ])
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems2 [
	^ super fromItems2 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType2 new
			hasLateral: tokens first isNotNil;
			valuesOrSelect: tokens third;
			alias: tokens sixth;
			columnAliases: (tokens seventh ifNotNil: [ :subTokens |
				subTokens second reject: [ :item | item = $, ] ]);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems3 [
	^ super fromItems3 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType3 new
			withQueryName: tokens first;
			alias: (tokens second ifNotNil: #second);
			columnAliases: (tokens second ifNotNil: [ :subTokens |
				(subTokens third ifNotNil: #second) reject: [ :item | item = $, ] ]);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems4 [
	^ super fromItems4 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType4 new
			hasLateral: tokens first isNotNil;
			functionCall: tokens second;
			alias: tokens fourth;
			columnDefinitions: (tokens sixth ifNotNil: [ :subTokens |
				subTokens reject: [ :item | item = $, ] thenCollect: #first ]);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems5 [
	^ super fromItems5 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType5 new
			hasLateral: tokens first isNotNil;
			functionCall: tokens second;
			columnDefinitions: (tokens fifth ifNotNil: [ :subTokens |
				subTokens reject: [ :item | item = $, ] thenCollect: #first ]);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems6 [
	^ super fromItems6 psqlASTBuild: [ :tokens |
		|node|
		node := PSQLASTFromClauseItemType6 new
			hasNatural: tokens first isNotNil;
			joinType: tokens second;
			rightFromItem: tokens third;
			yourself.
		tokens fourth ifNotNil: [ :subTokens |
			subTokens first asLowercase = 'on'
				ifTrue: [ node joinCondition: subTokens second ]
				ifFalse: [ node usingList: (subTokens third reject: [ :item | item = $, ]) ] ].
		node ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> fromItems7 [
	^ super fromItems7 psqlASTBuild: [ :tokens |
		PSQLASTFromClauseItemType7 new
			hasLateral: tokens first isNotNil;
			functionCall: tokens second;
			hasWithOrdinality: tokens third isNotNil;
			alias: (tokens fourth ifNotNil: #second);
			columnAliases: (tokens fourth ifNotNil: [ :subTokens |
				(subTokens third ifNotNil: [ :array |
					array second reject: [ :item | item = $, ] thenCollect: #first ]) ]);
			yourself ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> joinType [
	^ super joinType psqlASTBuild: [ :tokens |
		(tokens flattened reject: #isNil) joinUsing: ' ' ]
]

{ #category : #'shared - from clause' }
PSQLFromClauseASTBuilder >> parenthesedFromItems [
	^ super parenthesedFromItems psqlASTBuild: [ :tokens |
		tokens second "Just remove parentheses" ]
]
