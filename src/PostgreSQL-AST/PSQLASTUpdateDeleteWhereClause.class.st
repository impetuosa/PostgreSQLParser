"
I represent the WHERE clause for an UPDATE/DELETE query.
"
Class {
	#name : #PSQLASTUpdateDeleteWhereClause,
	#superclass : #PSQLASTSelectWhereClause,
	#instVars : [
		'currentOfCursor'
	],
	#category : #PostgreSQL-AST-SQL
}

{ #category : #visiting }
PSQLASTUpdateDeleteWhereClause >> acceptVisitor: aPSQLASTVisitor [
	^ self visitPSQLASTUpdateDeleteWhereClause: self
]

{ #category : #accessing }
PSQLASTUpdateDeleteWhereClause >> currentOfCursor [
	^ currentOfCursor
]

{ #category : #accessing }
PSQLASTUpdateDeleteWhereClause >> currentOfCursor: anObject [
	currentOfCursor := anObject
]

{ #category : #testing }
PSQLASTUpdateDeleteWhereClause >> hasCursor [
	^ self currentOfCursor isNotNil
]