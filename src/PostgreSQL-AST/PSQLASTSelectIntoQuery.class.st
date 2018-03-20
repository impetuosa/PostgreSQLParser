"
I represent a SELECT INTO query.
"
Class {
	#name : #PSQLASTSelectIntoQuery,
	#superclass : #PSQLASTSelectQuery,
	#instVars : [
		'intoClause'
	],
	#category : #PostgreSQL-AST-SQL
}

{ #category : #visiting }
PSQLASTSelectIntoQuery >> acceptVisitor: aPSQLASTVisitor [
	^ self visitPSQLASTSelectIntoQuery: self
]

{ #category : #accessing }
PSQLASTSelectIntoQuery >> intoClause [
	^ intoClause
]

{ #category : #accessing }
PSQLASTSelectIntoQuery >> intoClause: anObject [
	intoClause := anObject
]