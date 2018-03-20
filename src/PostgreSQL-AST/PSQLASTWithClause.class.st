"
I am the WITH clause that can be used in CRUD queries.
"
Class {
	#name : #PSQLASTWithClause,
	#superclass : #PSQLASTNode,
	#instVars : [
		'isRecursive',
		'queries'
	],
	#category : #PostgreSQL-AST-SQL
}

{ #category : #visiting }
PSQLASTWithClause >> acceptVisitor: aPSQLASTVisitor [
	^ self visitPSQLASTWithClause: self
]

{ #category : #accessing }
PSQLASTWithClause >> isRecursive [
	^ isRecursive
]

{ #category : #accessing }
PSQLASTWithClause >> isRecursive: anObject [
	isRecursive := anObject
]

{ #category : #accessing }
PSQLASTWithClause >> queries [
	^ queries
]

{ #category : #accessing }
PSQLASTWithClause >> queries: anObject [
	queries := anObject
]