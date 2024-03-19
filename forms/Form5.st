!classDefinition: #AdeleGoldberg category: 'Form5'!
DenotativeObject subclass: #AdeleGoldberg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form5'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AdeleGoldberg class' category: 'Form5'!
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

!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/19/2024 00:39:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colegaDeTrabajo := AlanKay.! !


!AdeleGoldberg class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/19/2024 00:39:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colegaDeTrabajo := AlanKay.! !


!classDefinition: #AlanKay category: 'Form5'!
DenotativeObject subclass: #AlanKay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form5'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanKay class' category: 'Form5'!
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


!classDefinition: #AlanTuring category: 'Form5'!
DenotativeObject subclass: #AlanTuring
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form5'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanTuring class' category: 'Form5'!
AlanTuring class
	instanceVariableNames: ''!

!AlanTuring class methodsFor: 'info personal' stamp: 'mg 3/13/2024 15:27:14'!
fechaDeNacimiento
	^June/23/1912! !


!AlanTuring class methodsFor: '-- all --' stamp: 'mg 3/19/2024 00:32:37'!
doesNotUnderstand: aMessage
	^'No entiendo lo que me decis con ', aMessage asString! !

!AlanTuring class methodsFor: 'info personal' stamp: 'mg 3/13/2024 15:27:14'!
fechaDeNacimiento
	^June/23/1912! !


!classDefinition: #JohnVonNeumann category: 'Form5'!
DenotativeObject subclass: #JohnVonNeumann
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Form5'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JohnVonNeumann class' category: 'Form5'!
JohnVonNeumann class
	instanceVariableNames: ''!

!JohnVonNeumann class methodsFor: '-- all --' stamp: 'mg 3/13/2024 15:30:52'!
fechaDeNacimiento
	^December/28/1903! !

AdeleGoldberg initializeAfterFileIn!