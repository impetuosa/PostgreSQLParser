"
I am a direction used in a MOVE cursor statement.
"
Class {
	#name : #PSQLPlpgSQLASTCursorMoveDirection,
	#superclass : #PSQLPlpgSQLASTNode,
	#instVars : [
		'name',
		'count'
	],
	#category : #'PostgreSQL-AST-PlpgSQL'
}

{ #category : #visiting }
PSQLPlpgSQLASTCursorMoveDirection >> acceptVisitor: aVisitor [
	^ aVisitor visitPSQLPlpgSQLASTCursorMoveDirection: self
]

{ #category : #accessing }
PSQLPlpgSQLASTCursorMoveDirection >> count [
	^ count
]

{ #category : #accessing }
PSQLPlpgSQLASTCursorMoveDirection >> count: anObject [
	count := anObject
]

{ #category : #testing }
PSQLPlpgSQLASTCursorMoveDirection >> hasCount [
	^ self count isNotNil
]

{ #category : #testing }
PSQLPlpgSQLASTCursorMoveDirection >> isCountAll [
	^ self count isString and: [ self count asUppercase = 'ALL' ]
]

{ #category : #testing }
PSQLPlpgSQLASTCursorMoveDirection >> isCursorMoveDirection [
	^ true
]

{ #category : #accessing }
PSQLPlpgSQLASTCursorMoveDirection >> name [
	^ name
]

{ #category : #accessing }
PSQLPlpgSQLASTCursorMoveDirection >> name: anObject [
	name := anObject
]
