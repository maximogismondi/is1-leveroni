!classDefinition: #CombateTest category: #Combatientes!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:11'!
test01_ataquesCruzados
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	self deny: bando1 first estaSano.
	self deny: bando2 first estaSano.	! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:24'!
test02_atacanTodosLosCombatientes
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano. Combatiente humano}.
	bando2 := {Combatiente humano. Combatiente humano}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	bando1 do: [ :combatiente | self deny: combatiente estaSano.	 ].
	bando2 do: [ :combatiente | self deny: combatiente estaSano.	 ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:31'!
test03_rondas
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollarRonda. 
	combate desarollarRonda. 
	
	
	self assert: (bando1 first estaDañadoPor: 8).
	self assert: (bando2 first estaDañadoPor: 8).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:36'!
test04_hastaLaMuerteCombatienteBando2
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: (bando2 first estaMuerto).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:43'!
test05_combatienteBando1ViveSiMatoAlBando2
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self deny: (bando1 first estaMuerto)! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:21:51'!
test06_combateTerminaCuandoTodosLosDeUnBandoMueren
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano. Combatiente humano}.
	bando2 := {Combatiente humano. Combatiente humano}.
	combate := Combate entre: bando1 y: bando2.

	bando1 do: [:combatiente | combatiente enfocarseEnElMasHerido ].
	
	combate desarollar . 
	
	
	bando2 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:22:01'!
test07_finalizaCuandoMuereAlgunBando
	|bando1 bando2 combate |
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano. Combatiente humano}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	bando1 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:22:07'!
test08_obtenerRondas
	|bando1 bando2 combate |
	
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: combate obtenerRondas = 5.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:22:11'!
test09_obtenerGanador
	|bando1 bando2 combate ganador |
	
	
	bando1 := {Combatiente humano}.
	bando2 := {Combatiente humano}.
	combate := Combate entre: bando1 y: bando2.
	
	ganador := combate desarollar . 
	
	
	self assert: ganador = bando1! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:22:21'!
test10_promedioVidaGanador
	|bando1 bando2 combate |
	
	
	bando1 := {Combatiente humano. Combatiente humano.}.
	bando2 := {Combatiente humano}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 	
	
	self assert: combate promedioVidaGanador = 16.! !


!classDefinition: #HostigadorTest category: #Combatientes!
TestCase subclass: #HostigadorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!HostigadorTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:22:44'!
test01_HostigadorAtacaAlMasSano

	|humano hostigador ogro |
	
	humano := Combatiente humano.
	ogro := Combatiente ogro.
	hostigador := Combatiente hostigador.
	
	hostigador asignarEnemigos: {humano. ogro }.
	
	hostigador atacar.
	
	self assert: humano estaSano.	 
	self deny: ogro estaSano. ! !

!HostigadorTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:23:08'!
test02_HostigadorAtacaAlMasSanoAlternaEstrategiaYAtacaAlMasHerido

	|humano hostigador ogro |
	
	humano := Combatiente humano.
	ogro := Combatiente ogro.
	hostigador := Combatiente hostigador.
	
	hostigador asignarEnemigos: {humano. ogro }.
	
	hostigador atacar.
	
	self assert: humano estaSano.	 
	self deny: ogro estaSano. 
	
	hostigador atacar.
		 
	self deny: humano estaSano. 
	
	
! !


!classDefinition: #HumanoTest category: #Combatientes!
TestCase subclass: #HumanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:23'!
test_01_GoliatEmpiezaSano

	| goliat |
	goliat := Combatiente humano.
		
	self assert: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:25'!
test_02_GoliatNoEstaSanoSiRecibeDaño

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 2.

	self deny: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:27'!
test_03_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:29'!
test_04_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente humano.
	goliat recibirDaño: 4.
	
	self deny: (goliat estaDañadoPor: 8).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:32'!
test_05_GoliatPuedeRecibirDañoMultiplesVeces

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 4.
	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 8).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:35'!
test_06_DavidPuedeAtacarAAlguien

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	
	david atacarA: goliat.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:39'!
test_07_DavidPuedeAtacarEnemigosAsignados

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
		
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:42'!
test_08_DavidNoAtacaAUnEnemigoNoAsignado

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
		
	david atacar.
	
	self assert: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:48'!
test_09_MuereCuandoRecibe20DeDaño

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	
	self deny: goliat estaMuerto.

	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	self assert: goliat estaMuerto.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mg 4/8/2024 16:24:56'!
test_10_NoAtacaSiEstaMuerto

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	
	goliat asignarEnemigos: {david}.
	goliat atacar.
	
	self assert: david estaSano
! !


!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mg 4/8/2024 16:23:22'!
test01PuedoDefinirleUnaEstrategiaADavid

	| goliat david |
	goliat := Combatiente humano.
	david := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mg 4/8/2024 16:24:01'!
test02EnfocarseEnElMasSanoAtacaAlMenosDañado

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mg 4/8/2024 16:24:10'!
test03EnfocarseEnElMasSanoAtacaAlMenosDañadoNoImportaElOrden

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {isaac. goliat.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mg 4/8/2024 16:24:16'!
test04EnfocarseEnElMasHeridoAtacaAlMasDañado

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasHerido.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (goliat estaDañadoPor: 6).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mg 4/8/2024 16:24:20'!
test05NoSeEnfocaSiEstaMuerto

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	david asignarEnemigos: {goliat}.

	6 timesRepeat: [ david atacar].
		
	self assert: (goliat estaDañadoPor: 20).
! !


!classDefinition: #MagoTest category: #Combatientes!
TestCase subclass: #MagoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:26:23'!
test_01_magoAtacaALos6MasSanos
	
	| enemigos mago |
	mago := Combatiente mago.
	
	enemigos := Array new: 7.
	
	enemigos at: 1 put: Combatiente humano.
	2 to: 7 do: [:indice | enemigos at: indice put: Combatiente ogro].

	mago asignarEnemigos: enemigos.
	
	mago atacar.
	
	self assert: (enemigos at: 1) estaSano.
	2 to: 7 do: [:indice | self deny: (enemigos at: indice) estaSano].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:34:55'!
test_02_magoAtacaALos6MasSanosPor2DeVida
	| enemigos mago |
	mago := Combatiente mago.
	
	enemigos := Array new: 6.
	1 to: 6 do: [:indice | enemigos at: indice put: Combatiente humano].
	
	mago asignarEnemigos: enemigos.
	mago atacar.
	
	1 to: 6 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 2)].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:34:22'!
test_03_magoAtacaALos5Sobrevivientes
	| enemigos mago |
	mago := Combatiente mago.
	
	enemigos := Array new: 5.
	1 to: 5 do: [:indice | enemigos at: indice put: Combatiente humano].
	
	mago asignarEnemigos: enemigos.
	mago atacar.
	
	1 to: 5 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 2)].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:26:10'!
test_04_magoNoAtacaPorqueEstanTodosSusEnemigosMuertos
	| enemigos mago |
	mago := Combatiente mago.
	
	enemigos := {Combatiente humano. Combatiente humano}.
	
	mago asignarEnemigos: enemigos.
	11 timesRepeat:[mago atacar].
	
	1 to: 2 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 20)].! !


!classDefinition: #OgroTest category: #Combatientes!
TestCase subclass: #OgroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:25:20'!
test01_hace8DeDaño
	| humano ogro |
	ogro := Combatiente ogro.
	humano := Combatiente humano.
	
	ogro asignarEnemigos: {humano}.
	ogro atacar.
	
	self assert: (humano  estaDañadoPor: 8).
	
	
	! !

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mg 4/8/2024 16:25:31'!
test02_tiene40PuntosDeVida
	
	| ogro humano |
	
	ogro := Combatiente ogro.
	humano := Combatiente humano.
	
	humano asignarEnemigos: {ogro}.
	ogro asignarEnemigos: {humano}.
	
	9 timesRepeat: [humano atacar].
	ogro atacar.
	
	humano atacar.
	ogro atacar.
	
	self assert: (humano estaDañadoPor: 8).
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
	instanceVariableNames: 'enemigos estrategia dañoRecibido vidaActual dañoAProvocar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/8/2024 16:46:13'!
atacar
	| victimasElegidas |
	self estaMuerto ifTrue: [^self].
	
	victimasElegidas := self elegirVictimas.
	(victimasElegidas isEmpty) ifTrue: [^self].

	victimasElegidas do: [:victimaElegida | self atacarA: victimaElegida]! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/8/2024 16:46:13'!
elegirVictimas
	^estrategia value: enemigos.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:32'!
estaMuerto
	^vidaActual = 0. ! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:41'!
estaSano
	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:47:56'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.
	vidaActual := vidaActual - unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:12'!
vidaActual
	^vidaActual. ! !


!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/8/2024 16:46:13'!
atacar
	| victimasElegidas |
	self estaMuerto ifTrue: [^self].
	
	victimasElegidas := self elegirVictimas.
	(victimasElegidas isEmpty) ifTrue: [^self].

	victimasElegidas do: [:victimaElegida | self atacarA: victimaElegida]! !

!Combatiente methodsFor: 'private' stamp: 'mc 4/4/2024 12:17:18'!
atacarA: unCombatiente
	unCombatiente recibirDaño: dañoAProvocar.! !

!Combatiente methodsFor: 'private' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/8/2024 16:46:13'!
elegirVictimas
	^estrategia value: enemigos.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:32'!
estaMuerto
	^vidaActual = 0. ! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:41'!
estaSano
	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'private' stamp: 'mg 4/8/2024 16:03:45'!
estrategiaInicial
	self subclassResponsibility ! !

!Combatiente methodsFor: 'initialization' stamp: 'mg 4/8/2024 16:02:06'!
inicializarConVida: vidaInicial yDaño: dañoInicial
	enemigos := #().
	dañoRecibido := 0.
	
	vidaActual := vidaInicial.
	dañoAProvocar := dañoInicial.
	
	estrategia := self estrategiaInicial.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:47:56'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.
	vidaActual := vidaActual - unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'mg 4/5/2024 08:48:12'!
vidaActual
	^vidaActual. ! !


!Combatiente methodsFor: 'private' stamp: 'mc 4/4/2024 12:17:18'!
atacarA: unCombatiente
	unCombatiente recibirDaño: dañoAProvocar.! !

!Combatiente methodsFor: 'private' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'private' stamp: 'mg 4/8/2024 16:03:45'!
estrategiaInicial
	self subclassResponsibility ! !


!Combatiente methodsFor: 'initialization' stamp: 'mg 4/8/2024 16:02:06'!
inicializarConVida: vidaInicial yDaño: dañoInicial
	enemigos := #().
	dañoRecibido := 0.
	
	vidaActual := vidaInicial.
	dañoAProvocar := dañoInicial.
	
	estrategia := self estrategiaInicial.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: #Combatientes!
Combatiente class
	instanceVariableNames: 'daño vida'!

!Combatiente class methodsFor: 'instance creation' stamp: 'mg 4/8/2024 16:03:11'!
hostigador
	^Hostigador new inicializarConVida: 20 yDaño: 4! !

!Combatiente class methodsFor: 'instance creation' stamp: 'mg 4/8/2024 16:02:49'!
humano
	^CombatienteConEstrategiaVariable new inicializarConVida: 20 yDaño: 4! !

!Combatiente class methodsFor: 'instance creation' stamp: 'mg 4/8/2024 16:27:13'!
mago
	^Mago new inicializarConVida: 20 yDaño: 2! !

!Combatiente class methodsFor: 'instance creation' stamp: 'mg 4/8/2024 16:27:08'!
ogro
	^CombatienteConEstrategiaVariable new inicializarConVida: 40 yDaño: 8! !


!Combatiente class methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:30:28'!
estragiaEnfocarseEnLosMasHeridos: unNumeroDeCombatientes
	^ [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual < candidatos2 vidaActual].
		
		candidatosOrdenados firstAvailable: unNumeroDeCombatientes
	].! !

!Combatiente class methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:30:31'!
estragiaEnfocarseEnLosMasSanos: unNumeroDeCombatientes
	^ [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual].
		
		candidatosOrdenados firstAvailable: unNumeroDeCombatientes
	].! !


!classDefinition: #CombatienteConEstrategiaVariable category: #Combatientes!
Combatiente subclass: #CombatienteConEstrategiaVariable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!CombatienteConEstrategiaVariable methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:29:05'!
enfocarseEnElMasHerido

	estrategia := Combatiente estragiaEnfocarseEnLosMasHeridos: 1.! !

!CombatienteConEstrategiaVariable methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:28:55'!
enfocarseEnElMasSano

	estrategia := Combatiente estragiaEnfocarseEnLosMasSanos: 1.
! !


!CombatienteConEstrategiaVariable methodsFor: 'initialization' stamp: 'mg 4/8/2024 16:28:28'!
estrategiaInicial
	^Combatiente estragiaEnfocarseEnLosMasSanos: 1.! !


!classDefinition: #Hostigador category: #Combatientes!
Combatiente subclass: #Hostigador
	instanceVariableNames: 'estrategiaActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Hostigador methodsFor: 'strategy' stamp: 'mg 4/5/2024 08:50:37'!
alternarEnfoque

	(estrategiaActual  =  #atacarAlMasSano)
		ifTrue: [self enfocarseEnElMasHerido.]
		ifFalse:  [self enfocarseEnElMasSano.].
	! !

!Hostigador methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:13:55'!
enfocarseEnElMasHerido

	estrategiaActual := #atacarAlMasHerido.
	
	estrategia := Combatiente estragiaEnfocarseEnLosMasHeridos: 1! !

!Hostigador methodsFor: 'strategy' stamp: 'mg 4/8/2024 16:15:33'!
enfocarseEnElMasSano

	estrategiaActual := #atacarAlMasSano.
	
	estrategia := Combatiente estragiaEnfocarseEnLosMasSanos: 1! !


!Hostigador methodsFor: 'public' stamp: 'mc 4/4/2024 16:25:07'!
atacar
	super atacar.
	self alternarEnfoque.

! !


!Hostigador methodsFor: 'initialization' stamp: 'mg 4/8/2024 16:41:50'!
estrategiaInicial
	estrategiaActual := #atacarAlMasSano.
	^Combatiente estragiaEnfocarseEnLosMasSanos: 1.! !


!classDefinition: #Mago category: #Combatientes!
Combatiente subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Mago methodsFor: 'initialization' stamp: 'mg 4/8/2024 16:31:11'!
estrategiaInicial
	^Combatiente estragiaEnfocarseEnLosMasSanos: 6.! !
