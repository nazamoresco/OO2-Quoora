'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 27 March 2020 at 4:36:49.210265 pm'!
Object subclass: #PostEscrito
	instanceVariableNames: 'texto likes disLikes fechaYHora autor'
	classVariableNames: ''
	package: 'Quoora'!

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 14:13'!
esMiAutor: a
	^(autor=a)! !

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 15:02'!
votar: v sinRestriccion: u
v ifTrue: [ likes at: u put: DateAndTime now. ]
ifFalse: [ disLikes at: u put: DateAndTime now. ].! !

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 16:33'!
puntaje
^self subclassResponsibility .
	! !

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 15:38'!
dondeVoto: u
	(likes keys includes: u) ifTrue: [ ^true ].
	(disLikes keys includes: u) ifTrue: [ ^false ].
	^nil! !

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 14:27'!
puntajeLikes
^likes size - disLikes size
! !

!PostEscrito methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 15:26'!
eliminarVoto: p de: u
p ifTrue: [ likes removeKey: u ]
ifFalse: [ disLikes removeKey: u ].! !


!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
disLikes
	^ disLikes! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
fechaYHora
	^ fechaYHora! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
autor
	^ autor! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
likes
	^ likes! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
texto: anObject
	texto := anObject! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
texto
	^ texto! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 16:35'!
votar: v deUsuario: u
|pos|
pos:= self dondeVoto: u.
(v = pos) ifFalse: 
[ (pos notNil) ifTrue: [self eliminarVoto: pos de: u].
	self votar: v sinRestriccion: u
	 ]
! !

!PostEscrito methodsFor: 'accessing' stamp: 'franBeb 3/27/2020 12:28'!
autor: anObject
	autor := anObject! !


!PostEscrito methodsFor: 'initalize' stamp: 'franBeb 3/27/2020 12:45'!
initialize
likes:= Dictionary new.
disLikes:= Dictionary new.
fechaYHora:= DateAndTime now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PostEscrito class
	instanceVariableNames: ''!

!PostEscrito class methodsFor: 'as yet unclassified' stamp: 'franBeb 3/27/2020 12:44'!
texto: t autor: a
				|obj|
	obj:= self new.
	obj texto: t; autor:a.
	^obj
! !
