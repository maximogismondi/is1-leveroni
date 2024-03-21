!classDefinition: #Eminencia category: #Form9!
Object subclass: #Eminencia
	instanceVariableNames: 'fechaDeNacimiento nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form9'!

!Eminencia methodsFor: '-- all --' stamp: 'mg 3/21/2024 00:05:07'!
esMayorQue: unaPersona
	| diferenciaDeEdad |
	diferenciaDeEdad := self fechaDeNacimiento distanceTo: unaPersona fechaDeNacimiento.
	^diferenciaDeEdad positive! !

!Eminencia methodsFor: '-- all --' stamp: 'mg 3/21/2024 00:15:54'!
fechaDeNacimiento
    ^fechaDeNacimiento! !

!Eminencia methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:22:03'!
inicializarCon: unNombre y: unaFechaDeNacimiento

    nombre := unNombre.
    fechaDeNacimiento := unaFechaDeNacimiento.! !

!Eminencia methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:16:44'!
initialize

    nombre := 'Alan Kay'.
    fechaDeNacimiento := May/17/1940! !


!Eminencia methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:22:03'!
inicializarCon: unNombre y: unaFechaDeNacimiento

    nombre := unNombre.
    fechaDeNacimiento := unaFechaDeNacimiento.! !

!Eminencia methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:16:44'!
initialize

    nombre := 'Alan Kay'.
    fechaDeNacimiento := May/17/1940! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Eminencia class' category: #Form9!
Eminencia class
	instanceVariableNames: ''!

!Eminencia class methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:24:47'!
llamada: unNombre nacidaEl: unaFecha

	^self new inicializarCon: unNombre y: unaFecha! !
