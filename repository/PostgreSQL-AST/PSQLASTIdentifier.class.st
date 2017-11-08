"
I am an identifier.
"
Class {
	#name : #PSQLASTIdentifier,
	#superclass : #PSQLASTNode,
	#instVars : [
		'identifier'
	],
	#category : 'PostgreSQL-AST-Nodes'
}

{ #category : #accessing }
PSQLASTIdentifier >> identifier [
	^ identifier
]

{ #category : #accessing }
PSQLASTIdentifier >> identifier: anObject [
	identifier := anObject
]