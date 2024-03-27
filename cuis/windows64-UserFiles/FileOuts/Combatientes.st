!classDefinition: #CombateTest category: #Combatientes!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 15:19:25'!
test01_ataquesCruzados
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new}.
	bando2 := {Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	self deny: bando1 first estaSano.
	self deny: bando2 first estaSano.	! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 15:20:05'!
test02_atacanTodosLosCombatientes
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new. Combatiente new}.
	bando2 := {Combatiente new. Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	bando1 do: [ :combatiente | self deny: combatiente estaSano.	 ].
	bando2 do: [ :combatiente | self deny: combatiente estaSano.	 ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 15:28:21'!
test03_rondas
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new}.
	bando2 := {Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollarRonda. 
	combate desarollarRonda. 
	
	
	self assert: (bando1 first estaDañadoPor: 8).
	self assert: (bando2 first estaDañadoPor: 8).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 15:31:09'!
test04_hastaLaMuerteCombatienteBando2
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new}.
	bando2 := {Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: (bando2 first estaMuerto).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:24:36'!
test05_combatienteBando1ViveSiMatoAlBando2
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new}.
	bando2 := {Combatiente new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self deny: (bando1 first estaMuerto)! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 15:58:32'!
test06_combateTerminaCuandoTodosLosDeUnBandoMueren
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new. Combatiente new}.
	bando2 := {Combatiente new. Combatiente new}.
	combate := Combate entre: bando1 y: bando2.

	bando1 do: [:combatiente | combatiente enfocarseEnElMasHerido ].
	
	combate desarollar . 
	
	
	bando2 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:23:50'!
test07_finalizaCuandoMuereAlgunBando
	|bando1 bando2 combate |
	
	bando1 := {Combatiente new.}.
	bando2 := {Combatiente new. Combatiente new}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	bando1 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:27:54'!
test08_obtenerRondas
	|bando1 bando2 combate |
	
	
	bando1 := {Combatiente new.}.
	bando2 := {Combatiente new.}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: combate obtenerRondas = 5.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:28:59'!
test09_obtenerGanador
	|bando1 bando2 combate ganador |
	
	
	bando1 := {Combatiente new.}.
	bando2 := {Combatiente new.}.
	combate := Combate entre: bando1 y: bando2.
	
	ganador := combate desarollar . 
	
	
	self assert: ganador = bando1! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:48:17'!
test10_promedioVidaGanador
	|bando1 bando2 combate |
	
	
	bando1 := {Combatiente new. Combatiente new.}.
	bando2 := {Combatiente new. }.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 	
	
	self assert: combate promedioVidaGanador = 16.! !


!classDefinition: #CombatientesTest category: #Combatientes!
TestCase subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

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

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'mg 3/25/2024 15:35:48'!
test_09_MuereCuandoRecibe20DeDaño

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
	
	self deny: goliat estaMuerto.

	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	self assert: goliat estaMuerto.
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'mg 3/25/2024 15:36:39'!
test_10_NoAtacaSiEstaMuerto

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	
	goliat asignarEnemigos: {david}.
	goliat atacar.
	
	self assert: david estaSano
! !

!CombatientesTest methodsFor: 'tests-combatir' stamp: 'mg 3/25/2024 16:46:01'!
test_11_ObtenerVida

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
	david asignarEnemigos: {goliat}.

	2 timesRepeat: [
    		david atacar.
	].	
	self assert: (goliat vidaActual  = 12)
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

!CombatientesTest methodsFor: 'tests-estrategia' stamp: 'mg 3/25/2024 16:09:38'!
test05NoSeEnfocaSiEstaMuerto

	| david goliat |
	david := Combatiente new.
	goliat := Combatiente new.
	david asignarEnemigos: {goliat}.

	6 timesRepeat: [
    		david atacar.
	].
		
	self assert: (goliat estaDañadoPor: 20).
! !


!classDefinition: #MagoTest category: #Combatientes!
TestCase subclass: #MagoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:50:54'!
test_01_magoAtacaALos6MasSanos
	| enemigos mago |
	mago := Mago new.
	
	enemigos := Array new: 7.
	
	enemigos at: 1 put: Humano new.
	2 to: 7 do: [:i | enemigos at: i put: Ogro new].

	mago asignarEnemigos: enemigos.
	
	mago atacar.
	
	self assert: (enemigos at: 1) estaSano.
	2 to: 7 do: [:indice | self deny: (enemigos at: indice) estaSano].! !


!classDefinition: #OgroTest category: #Combatientes!
TestCase subclass: #OgroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:00:49'!
test01_hace8DeDaño
	| humano ogro |
	ogro := Ogro new.
	humano := Humano new.
	
	ogro asignarEnemigos: {humano}.
	ogro atacar.
	
	self assert: humano dañoRecibido = 8
	
	! !

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:02:45'!
test02_tiene40PuntosDeVida
	| ogro |
	ogro := Ogro new.
	
	self assert: ogro vidaActual = 40
	
	! !


!classDefinition: #Combate category: #Combatientes!
Object subclass: #Combate
	instanceVariableNames: 'primerBando segundoBando rondas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Combate methodsFor: 'initialization' stamp: 'mg 3/25/2024 16:27:39'!
initializeEntre: bando1 y: bando2 
	
	primerBando := bando1.
	segundoBando := bando2.
	
	rondas :=0! !


!Combate methodsFor: 'public' stamp: 'mg 3/25/2024 16:51:22'!
desarollar
	[ (self estaMuerto: primerBando	)	| (self estaMuerto: segundoBando)	] 
		whileFalse: [
			self desarollarRonda.
			rondas := rondas +1
		].

	^self ganador
	
	! !

!Combate methodsFor: 'public' stamp: 'mg 3/25/2024 15:02:36'!
desarollarRonda
	primerBando do: [:combatiente | combatiente atacar].
	segundoBando do: [:combatiente | combatiente atacar]
	! !

!Combate methodsFor: 'public' stamp: 'mg 3/25/2024 16:32:18'!
estaMuerto: bando

	^ bando allSatisfy: [:combatiente | combatiente estaMuerto ]! !


!Combate methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:51:58'!
ganador
	(self estaMuerto: primerBando	)
		ifTrue: [^segundoBando ].
		
	(self estaMuerto: segundoBando	)
		ifTrue: [^primerBando ]		! !

!Combate methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:26:38'!
obtenerRondas
	^rondas! !

!Combate methodsFor: 'as yet unclassified' stamp: 'mg 3/25/2024 16:53:32'!
promedioVidaGanador
	
	self ganador = nil ifTrue: [^self].
	
	^self ganador average: [:combatiente | ^combatiente  vidaActual ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combate class' category: #Combatientes!
Combate class
	instanceVariableNames: ''!

!Combate class methodsFor: 'instance creation' stamp: 'mg 3/25/2024 14:59:00'!
entre: bando1 y: bando2 
	bando1 do: [ :combatiente | combatiente  asignarEnemigos: bando2 ].
	bando2 do: [ :combatiente | combatiente  asignarEnemigos: bando1 ].
	
	^self new initializeEntre: bando1 y: bando2 ! !


!classDefinition: #Combatiente category: #Combatientes!
Object subclass: #Combatiente
	instanceVariableNames: 'enemigos estrategia dañoRecibido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:16:49'!
atacar
	| victimaElegida |
	self estaMuerto ifTrue: [^self].
	
	victimaElegida := self elegirVictima.
	(victimaElegida == nil) ifTrue: [^self].

	self atacarA: victimaElegida.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
atacarA: unCombatiente
	unCombatiente recibirDaño: 4.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:19:30'!
enfocarseEnElMasHerido
	estrategia := [:candidatos | (candidatos select: [:candidato | candidato estaMuerto not ]) 	detectMax: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:10:08'!
enfocarseEnElMasSano
	estrategia := [:candidatos | (candidatos select: [:candidato | candidato estaMuerto not ]) 	detectMin: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:48:48'!
estaMuerto
	^self vidaActual = 0. ! !

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

!Combatiente methodsFor: 'public' stamp: 'mg 3/26/2024 21:03:29'!
vidaActual
	^20 - self dañoRecibido! !


!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:16:49'!
atacar
	| victimaElegida |
	self estaMuerto ifTrue: [^self].
	
	victimaElegida := self elegirVictima.
	(victimaElegida == nil) ifTrue: [^self].

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

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:19:30'!
enfocarseEnElMasHerido
	estrategia := [:candidatos | (candidatos select: [:candidato | candidato estaMuerto not ]) 	detectMax: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:10:08'!
enfocarseEnElMasSano
	estrategia := [:candidatos | (candidatos select: [:candidato | candidato estaMuerto not ]) 	detectMin: [:combatiente | combatiente dañoRecibido]].
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:48:48'!
estaMuerto
	^self vidaActual = 0. ! !

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

!Combatiente methodsFor: 'public' stamp: 'mg 3/26/2024 21:03:29'!
vidaActual
	^20 - self dañoRecibido! !


!classDefinition: #Humano category: #Combatientes!
Combatiente subclass: #Humano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!


!classDefinition: #Mago category: #Combatientes!
Combatiente subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Mago methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:37:20'!
atacar
	| victimasElegidas |
	self estaMuerto ifTrue: [^self].
	
	victimasElegidas := self elegirVictima.
	(victimasElegidas isEmpty) ifTrue: [^self].

	victimasElegidas do: [:victimaElegida | self atacarA: victimaElegida]
! !

!Mago methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:24:48'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	self enfocarseEnLos6MasSanos.! !


!Mago methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:37:20'!
atacar
	| victimasElegidas |
	self estaMuerto ifTrue: [^self].
	
	victimasElegidas := self elegirVictima.
	(victimasElegidas isEmpty) ifTrue: [^self].

	victimasElegidas do: [:victimaElegida | self atacarA: victimaElegida]
! !

!Mago methodsFor: '-- all --' stamp: 'mg 3/26/2024 21:32:47'!
enfocarseEnLos6MasSanos
	estrategia := [:candidatos | 		(candidatos sort: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual]) first: 6.		]! !

!Mago methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:24:48'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	self enfocarseEnLos6MasSanos.! !


!classDefinition: #Ogro category: #Combatientes!
Combatiente subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Ogro methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:01:32'!
atacarA: unCombatiente
	unCombatiente recibirDaño: 8.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'mg 3/26/2024 21:03:48'!
vidaActual
	^40 - self dañoRecibido! !
