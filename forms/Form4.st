!classDefinition: #AdeleGoldberg category: 'Form4'!
DenotativeObject subclass: #AdeleGoldberg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AdeleGoldberg class' category: 'Form4'!
AdeleGoldberg class
	instanceVariableNames: 'colegaDeTrabajo'!

!AdeleGoldberg class methodsFor: '-- all --' stamp: 'mg 3/19/2024 00:01:56'!
colegaDeTrabajo
     ^colegaDeTrabajo! !

!AdeleGoldberg class methodsFor: '-- all --' stamp: 'mg 3/18/2024 23:59:38'!
esMenorQueSuColega
    ^colegaDeTrabajo esMayorQue: self! !

!AdeleGoldberg class methodsFor: '-- all --' stamp: 'mg 3/13/2024 15:34:48'!
fechaDeNacimiento
	^July/22/1945! !

!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/19/2024 00:13:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colegaDeTrabajo := AlanKay.! !


!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/19/2024 00:13:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colegaDeTrabajo := AlanKay.! !


!classDefinition: #AlanKay category: 'Form4'!
DenotativeObject subclass: #AlanKay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanKay class' category: 'Form4'!
AlanKay class
	instanceVariableNames: ''!

!AlanKay class methodsFor: '-- all --' stamp: 'mg 3/18/2024 23:52:56'!
esMayorQue: unaPersona
	| diferenciaDeEdad |
	diferenciaDeEdad := self fechaDeNacimiento distanceTo: unaPersona fechaDeNacimiento.
	^diferenciaDeEdad positive! !

!AlanKay class methodsFor: '-- all --' stamp: 'mg 3/13/2024 15:33:37'!
fechaDeNacimiento
	^May/17/1940! !


!classDefinition: #AlanTuring category: 'Form4'!
DenotativeObject subclass: #AlanTuring
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanTuring class' category: 'Form4'!
AlanTuring class
	instanceVariableNames: ''!

!AlanTuring class methodsFor: 'info personal' stamp: 'mg 3/13/2024 15:27:14'!
fechaDeNacimiento
	^June/23/1912! !


!classDefinition: #JohnVonNeumann category: 'Form4'!
DenotativeObject subclass: #JohnVonNeumann
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JohnVonNeumann class' category: 'Form4'!
JohnVonNeumann class
	instanceVariableNames: ''!

!JohnVonNeumann class methodsFor: '-- all --' stamp: 'mg 3/13/2024 15:30:52'!
fechaDeNacimiento
	^December/28/1903! !

AdeleGoldberg initializeAfterFileIn!