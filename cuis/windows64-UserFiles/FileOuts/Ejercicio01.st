!classDefinition: #CombateTest category: #Ejercicio01!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/22/2024 21:00:41'!
test01
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new}.
	bando2 := {Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	self deny: bando1 first estaSano.
	self deny: bando2 first estaSano.	! !


!classDefinition: #CombatientesTest category: #Ejercicio01!
TestCase subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:37:20'!
test_01_GoliatEmpiezaSano

	| goliat |
	goliat := Combatiente new.
		
	self assert: goliat estaSano.
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:37:46'!
test_02_GoliatNoEstaSanoSiRecibeDaño

	| goliat |
	goliat := Combatiente new.

	goliat recibirDaño: 2.

	self deny: goliat estaSano.
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:38:27'!
test_03_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente new.

	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:39:17'!
test_04_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente new.
	goliat recibirDaño: 4.
	
	self deny: (goliat estaDañadoPor: 8).
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:40:00'!
test_05_GoliatPuedeRecibirDañoMultiplesVeces

	| goliat |
	goliat := Combatiente new.

	goliat recibirDaño: 4.
	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 8).
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:40:33'!
test_06_DavidPuedeAtacarAAlguien

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
	
	david atacarA: goliat.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:41:20'!
test_07_DavidPuedeAtacarEnemigosAsignados

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
		
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'SF 3/20/2024 19:44:09'!
test_08_DavidNoAtacaAUnEnemigoNoAsignado

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
		
	david atacar.
	
	self assert: goliat estaSano.
! !


!CombatientesTest methodsFor: 'tests-estrategia' stamp: 'SF 3/20/2024 19:34:11'!
test01PuedoDefinirleUnaEstrategiaADavid

	| goliat david |
	goliat := Combatiente new.
	david := Combatiente new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).! !

!CombatientesTest methodsFor: 'tests-estrategia' stamp: 'SF 3/20/2024 19:35:34'!
test02EnfocarseEnElMasSanoAtacaAlMenosDañado

	| david goliat isaac |
	david := Combatiente new.
	goliat := Combatiente new.
	goliat recibirDaño: 2.
	isaac := Combatiente new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!CombatientesTest methodsFor: 'tests-estrategia' stamp: 'SF 3/20/2024 19:36:21'!
test03EnfocarseEnElMasSanoAtacaAlMenosDañadoNoImportaElOrden

	| david goliat isaac |
	david := Combatiente new.
	goliat := Combatiente new.
	goliat recibirDaño: 2.
	isaac := Combatiente new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {isaac. goliat.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!CombatientesTest methodsFor: 'tests-estrategia' stamp: 'SF 3/20/2024 19:36:55'!
test04EnfocarseEnElMasHeridoAtacaAlMasDañado

	| david goliat isaac |
	david := Combatiente new.
	goliat := Combatiente new.
	goliat recibirDaño: 2.
	isaac := Combatiente new.
	
	david enfocarseEnElMasHerido.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (goliat estaDañadoPor: 6).! !


!classDefinition: #Combate category: #Ejercicio01!
Object subclass: #Combate
	instanceVariableNames: 'primerBando segundoBando'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

!Combate methodsFor: 'initialization' stamp: 'mg 3/22/2024 20:11:40'!
initializeEntre: bando1 y: bando2 
	
	primerBando := bando1.
	segundoBando := bando2.! !


!Combate methodsFor: 'getters' stamp: 'mg 3/22/2024 20:14:18'!
ganador
	^primerBando ! !


!Combate methodsFor: 'public' stamp: 'mg 3/22/2024 20:54:29'!
desarollar
	primerBando first atacar.
	segundoBando first atacar.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combate class' category: #Ejercicio01!
Combate class
	instanceVariableNames: ''!

!Combate class methodsFor: 'instance creation' stamp: 'mg 3/22/2024 20:53:25'!
entre: bando1 y: bando2 
	bando1 first asignarEnemigos: bando2.
	bando2 first asignarEnemigos: bando1.

	^self new initializeEntre: bando1 y: bando2 ! !


!classDefinition: #Combatiente category: #Ejercicio01!
Object subclass: #Combatiente
	instanceVariableNames: 'enemigos estrategia dañoRecibido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
atacar
	| victimaElegida |
	enemigos isEmpty ifTrue: [^self].
	victimaElegida := self elegirVictima.
	self atacarA: victimaElegida.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
atacarA: unCombatiente
	unCombatiente recibirDaño: 4.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
enfocarseEnElMasHerido
	estrategia := [:candidatos | candidatos detectMax: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
enfocarseEnElMasSano
	estrategia := [:candidatos | candidatos detectMin: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:36'!
estaSano
	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:43:20'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	self enfocarseEnElMasSano.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:46'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.! !


!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
atacar
	| victimaElegida |
	enemigos isEmpty ifTrue: [^self].
	victimaElegida := self elegirVictima.
	self atacarA: victimaElegida.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
atacarA: unCombatiente
	unCombatiente recibirDaño: 4.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: '-- all --' stamp: 'SF 3/20/2024 19:25:43'!
elegirVictima
	^estrategia value: enemigos.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
enfocarseEnElMasHerido
	estrategia := [:candidatos | candidatos detectMax: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
enfocarseEnElMasSano
	estrategia := [:candidatos | candidatos detectMin: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:36'!
estaSano
	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:43:20'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	self enfocarseEnElMasSano.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:46'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.! !
