!classDefinition: #CombatientesTest category: 'Clase02'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'Clase02'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: '-- all --' stamp: 'mg 3/15/2024 18:37:43'!
test_01_GoliatEstaSano
	Goliat sanar.
	Assert isFalse: Goliat estaDañado.! !

!CombatientesTest class methodsFor: '-- all --' stamp: 'mg 3/15/2024 18:38:02'!
test_02_GoliatEstaDañado
	Goliat recibirDaño.
	Assert isTrue: Goliat estaDañado.
! !

!CombatientesTest class methodsFor: '-- all --' stamp: 'mg 3/15/2024 18:38:12'!
test_03_GoliatEstaDañadoCuandoCorresponde
	Goliat recibirDaño .
	Assert isTrue: Goliat estaDañado .
	Goliat sanar.
	Assert isFalse: Goliat estaDañado .! !

!CombatientesTest class methodsFor: '-- all --' stamp: 'mg 3/15/2024 18:45:14'!
test_04_DavidPuedeAtacarAGoliat
	David atacarA: Goliat.
	Assert isTrue: Goliat estaDañado .! !

!CombatientesTest class methodsFor: '-- all --' stamp: 'mg 3/15/2024 19:07:17'!
test_05_DavidAtaca
	
	|enemigos|
	enemigos := {Goliat}.
	
	David asignarEnemigos: enemigos.
	David atacar.
	Assert isTrue: Goliat estaDañado.
	
	! !


!classDefinition: #David category: 'Clase02'!
DenotativeObject subclass: #David
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'David class' category: 'Clase02'!
David class
	instanceVariableNames: 'enemigos'!

!David class methodsFor: 'public' stamp: 'mg 3/15/2024 18:55:16'!
asignarEnemigos: conjuntoDeEnemigos
	enemigos := conjuntoDeEnemigos.! !

!David class methodsFor: 'public' stamp: 'mg 3/15/2024 19:06:38'!
atacar
	|enemigos_sanos|
	enemigos_sanos := enemigos select: [:enemigo | enemigo estaDañado not].
	
	enemigos_sanos isEmpty ifFalse: [
		enemigos_sanos first recibirDaño.
    	].! !

!David class methodsFor: 'public' stamp: 'mg 3/15/2024 18:45:37'!
atacarA: enemigo 
	enemigo recibirDaño.! !


!David class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/18/2024 23:36:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	enemigos := ((Array new: 1) at: 1 put: Goliat; yourself).! !


!classDefinition: #Goliat category: 'Clase02'!
DenotativeObject subclass: #Goliat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Clase02'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Goliat class' category: 'Clase02'!
Goliat class
	instanceVariableNames: 'dañado'!

!Goliat class methodsFor: 'public' stamp: 'mg 3/15/2024 18:23:52'!
estaDañado
	^dañado ! !

!Goliat class methodsFor: 'public' stamp: 'mg 3/15/2024 18:31:22'!
recibirDaño
	dañado := true.! !

!Goliat class methodsFor: 'public' stamp: 'mg 3/15/2024 18:22:14'!
sanar
	dañado := false! !


!Goliat class methodsFor: '--** private fileout/in **--' stamp: 'mg 3/18/2024 23:36:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	dañado := true.! !

David initializeAfterFileIn!
Goliat initializeAfterFileIn!