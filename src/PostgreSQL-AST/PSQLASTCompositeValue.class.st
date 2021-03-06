"
I represent the instantiation of a composite value. My #items list holds expressions or constants.
"
Class {
	#name : #PSQLASTCompositeValue,
	#superclass : #PSQLASTExpressionASTNode,
	#instVars : [
		'items'
	],
	#category : #'PostgreSQL-AST-SQL'
}

{ #category : #visiting }
PSQLASTCompositeValue >> acceptVisitor: aVisitor [
	^ aVisitor visitPSQLASTCompositeValue: self
]

{ #category : #printing }
PSQLASTCompositeValue >> innerPrintOn: aStream [
	aStream
		<< $(.
	self items do: [ :item |
		item innerPrintOn: aStream ] separatedBy: [ aStream << ', ' ].
	aStream
		<< $)
]

{ #category : #testing }
PSQLASTCompositeValue >> isCompositeValue [
	^ true
]

{ #category : #accessing }
PSQLASTCompositeValue >> items [
	^ items
]

{ #category : #accessing }
PSQLASTCompositeValue >> items: anObject [
	items := anObject
]
