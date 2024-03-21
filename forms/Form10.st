!classDefinition: #Eminencia category: 'Form10'!
Object subclass: #Eminencia
	instanceVariableNames: 'fechaDeNacimiento nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form10'!

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

!classDefinition: 'Eminencia class' category: 'Form10'!
Eminencia class
	instanceVariableNames: ''!

!Eminencia class methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:24:47'!
llamada: unNombre nacidaEl: unaFecha

	^self new inicializarCon: unNombre y: unaFecha! !


!classDefinition: #Vehículo category: 'Form10'!
Object subclass: #Vehículo
	instanceVariableNames: 'combustible'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form10'!

!Vehículo methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:45:07'!
cantidadDeRuedas
	self subclassResponsibility! !

!Vehículo methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:42:19'!
cargarCombustible: cantidadCombustibleACargar
	combustible := cantidadCombustibleACargar ! !


!classDefinition: #Auto category: 'Form10'!
Vehículo subclass: #Auto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form10'!

!Auto methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:38:45'!
abrirBaúl! !

!Auto methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:38:55'!
cantidadDeRuedas
	^4! !


!classDefinition: #Moto category: 'Form10'!
Vehículo subclass: #Moto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form10'!

!Moto methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:39:30'!
abrirBaúl! !

!Moto methodsFor: 'as yet unclassified' stamp: 'mg 3/21/2024 00:39:33'!
cantidadDeRuedas
	^2! !
