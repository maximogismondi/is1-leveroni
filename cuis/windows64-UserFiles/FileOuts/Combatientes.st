!classDefinition: #CombateTest category: #Combatientes!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:29:41'!
test01_ataquesCruzados
	|bando1 bando2 combate |
	
	bando1 := {Humano new}.
	bando2 := {Humano new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	self deny: bando1 first estaSano.
	self deny: bando2 first estaSano.	! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:29:50'!
test02_atacanTodosLosCombatientes
	|bando1 bando2 combate |
	
	bando1 := {Humano new. Humano new}.
	bando2 := {Humano new. Humano new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar.
	
	bando1 do: [ :combatiente | self deny: combatiente estaSano.	 ].
	bando2 do: [ :combatiente | self deny: combatiente estaSano.	 ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:29:56'!
test03_rondas
	|bando1 bando2 combate |
	
	bando1 := {Humano new}.
	bando2 := {Humano new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollarRonda. 
	combate desarollarRonda. 
	
	
	self assert: (bando1 first estaDañadoPor: 8).
	self assert: (bando2 first estaDañadoPor: 8).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:02'!
test04_hastaLaMuerteCombatienteBando2
	|bando1 bando2 combate |
	
	bando1 := {Humano new}.
	bando2 := {Humano new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: (bando2 first estaMuerto).! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:07'!
test05_combatienteBando1ViveSiMatoAlBando2
	|bando1 bando2 combate |
	
	bando1 := {Humano new}.
	bando2 := {Humano new}.
	
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self deny: (bando1 first estaMuerto)! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:18'!
test06_combateTerminaCuandoTodosLosDeUnBandoMueren
	|bando1 bando2 combate |
	
	bando1 := {Humano new. Humano new}.
	bando2 := {Humano new. Humano new}.
	combate := Combate entre: bando1 y: bando2.

	bando1 do: [:combatiente | combatiente enfocarseEnElMasHerido ].
	
	combate desarollar . 
	
	
	bando2 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:30'!
test07_finalizaCuandoMuereAlgunBando
	|bando1 bando2 combate |
	
	bando1 := {Humano new.}.
	bando2 := {Humano new. Humano new}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	bando1 do: [:combatiente | self assert: combatiente estaMuerto ].! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:38'!
test08_obtenerRondas
	|bando1 bando2 combate |
	
	
	bando1 := {Humano new.}.
	bando2 := {Humano new.}.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 
	
	
	self assert: combate obtenerRondas = 5.! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:30:59'!
test09_obtenerGanador
	|bando1 bando2 combate ganador |
	
	
	bando1 := {Humano new.}.
	bando2 := {Humano new.}.
	combate := Combate entre: bando1 y: bando2.
	
	ganador := combate desarollar . 
	
	
	self assert: ganador = bando1! !

!CombateTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:31:07'!
test10_promedioVidaGanador
	|bando1 bando2 combate |
	
	
	bando1 := {Humano new. Humano new.}.
	bando2 := {Humano new. }.
	combate := Combate entre: bando1 y: bando2.
	
	combate desarollar . 	
	
	self assert: combate promedioVidaGanador = 16.! !


!classDefinition: #HostigadorTest category: #Combatientes!
TestCase subclass: #HostigadorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!HostigadorTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 15:47:18'!
test01_HostigadorAtacaAlMasSano

	|humano hostigador ogro |
	
	humano := Humano new.
	ogro := Ogro new.
	hostigador := Hostigador new.
	
	hostigador asignarEnemigos: {humano. ogro }.
	
	hostigador atacar.
	
	self assert: humano estaSano.	 
	self deny: ogro estaSano. ! !

!HostigadorTest methodsFor: 'as yet unclassified' stamp: 'mc 4/3/2024 16:36:15'!
test02_HostigadorAtacaAlMasSanoAlternaEstrategiaYAtacaAlMasHerido

	|humano hostigador ogro |
	
	humano := Humano new.
	ogro := Ogro new.
	hostigador := Hostigador new.
	
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

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:01'!
test_01_GoliatEmpiezaSano

	| goliat |
	goliat := Humano new.
		
	self assert: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:05'!
test_02_GoliatNoEstaSanoSiRecibeDaño

	| goliat |
	goliat := Humano new.

	goliat recibirDaño: 2.

	self deny: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:12'!
test_03_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Humano new.

	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:16'!
test_04_CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Humano new.
	goliat recibirDaño: 4.
	
	self deny: (goliat estaDañadoPor: 8).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:21'!
test_05_GoliatPuedeRecibirDañoMultiplesVeces

	| goliat |
	goliat := Humano new.

	goliat recibirDaño: 4.
	goliat recibirDaño: 4.
	
	self assert: (goliat estaDañadoPor: 8).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:27'!
test_06_DavidPuedeAtacarAAlguien

	| david goliat |
	david := Humano new.
	goliat := Humano new.
	
	david atacarA: goliat.
	
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:33'!
test_07_DavidPuedeAtacarEnemigosAsignados

	| david goliat |
	david := Humano new.
	goliat := Humano new.
		
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:38'!
test_08_DavidNoAtacaAUnEnemigoNoAsignado

	| david goliat |
	david := Humano new.
	goliat := Humano new.
		
	david atacar.
	
	self assert: goliat estaSano.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:41'!
test_09_MuereCuandoRecibe20DeDaño

	| david goliat |
	david := Humano new.
	goliat := Humano new.
	
	self deny: goliat estaMuerto.

	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	self assert: goliat estaMuerto.
! !

!HumanoTest methodsFor: 'tests-combatir' stamp: 'mc 4/3/2024 15:24:47'!
test_10_NoAtacaSiEstaMuerto

	| david goliat |
	david := Humano new.
	goliat := Humano new.
	david asignarEnemigos: {goliat}.

	5 timesRepeat: [
    		david atacar.
	].
	
	goliat asignarEnemigos: {david}.
	goliat atacar.
	
	self assert: david estaSano
! !


!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mc 4/3/2024 15:23:24'!
test01PuedoDefinirleUnaEstrategiaADavid

	| goliat david |
	goliat := Humano new.
	david := Humano new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mc 4/3/2024 15:23:34'!
test02EnfocarseEnElMasSanoAtacaAlMenosDañado

	| david goliat isaac |
	david := Humano new.
	goliat := Humano new.
	goliat recibirDaño: 2.
	isaac := Humano new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mc 4/3/2024 15:23:40'!
test03EnfocarseEnElMasSanoAtacaAlMenosDañadoNoImportaElOrden

	| david goliat isaac |
	david := Humano new.
	goliat := Humano new.
	goliat recibirDaño: 2.
	isaac := Humano new.
	
	david enfocarseEnElMasSano.
	david asignarEnemigos: {isaac. goliat.}.
	david atacar.
	
	self assert: (isaac estaDañadoPor: 4).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mc 4/3/2024 15:23:49'!
test04EnfocarseEnElMasHeridoAtacaAlMasDañado

	| david goliat isaac |
	david := Humano new.
	goliat := Humano new.
	goliat recibirDaño: 2.
	isaac := Humano new.
	
	david enfocarseEnElMasHerido.
	david asignarEnemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (goliat estaDañadoPor: 6).! !

!HumanoTest methodsFor: 'tests-estrategia' stamp: 'mc 4/4/2024 12:42:04'!
test05NoSeEnfocaSiEstaMuerto

	| david goliat |
	david := Humano new.
	goliat := Humano new.
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

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 12:43:14'!
test_01_magoAtacaALos6MasSanos
	
	| enemigos mago |
	mago := Mago new.
	
	enemigos := Array new: 7.
	
	enemigos at: 1 put: Humano new.
	2 to: 7 do: [:indice | enemigos at: indice put: Ogro new].

	mago asignarEnemigos: enemigos.
	
	mago atacar.
	
	self assert: (enemigos at: 1) estaSano.
	2 to: 7 do: [:indice | self deny: (enemigos at: indice) estaSano].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 12:43:26'!
test_02_magoAtacaALos6MasSanosPor2DeVida
	| enemigos mago |
	mago := Mago new.
	
	enemigos := Array new: 6.
	1 to: 6 do: [:indice | enemigos at: indice put: Ogro new].
	
	mago asignarEnemigos: enemigos.
	mago atacar.
	
	1 to: 6 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 2)].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 16:37:43'!
test_03_magoAtacaALos5Sobrevivientes
	| enemigos mago |
	mago := Mago new.
	
	enemigos := Array new: 5.
	1 to: 5 do: [:indice | enemigos at: indice put: Ogro new].
	
	mago asignarEnemigos: enemigos.
	mago atacar.
	
	1 to: 5 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 2)].! !

!MagoTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 17:00:17'!
test_04_magoNoAtacaPorqueEstanTodosSusEnemigosMuertos
	| enemigos mago |
	mago := Mago new.
	
	enemigos := {Humano new. Humano new}.
	
	mago asignarEnemigos: enemigos.
	11 timesRepeat:[mago atacar].
	
	1 to: 2 do: [:indice | self assert: ((enemigos at: indice) estaDañadoPor: 20)].! !


!classDefinition: #OgroTest category: #Combatientes!
TestCase subclass: #OgroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 11:58:53'!
test01_hace8DeDaño
	| humano ogro |
	ogro := Ogro new.
	humano := Humano new.
	
	ogro asignarEnemigos: {humano}.
	ogro atacar.
	
	self assert: (humano  estaDañadoPor: 8).
	
	
	! !

!OgroTest methodsFor: 'as yet unclassified' stamp: 'mc 4/4/2024 11:59:02'!
test02_tiene40PuntosDeVida
	
	| ogro humano |
	
	ogro := Ogro new.
	humano := Humano new.
	
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

!Combatiente methodsFor: 'comparing' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'comparing' stamp: 'mg 4/5/2024 08:48:32'!
estaMuerto
	^vidaActual = 0. ! !

!Combatiente methodsFor: 'comparing' stamp: 'mg 4/5/2024 08:48:41'!
estaSano
	^dañoRecibido = 0.! !


!Combatiente methodsFor: 'accessing' stamp: 'SF 3/20/2024 19:25:43'!
asignarEnemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'accessing' stamp: 'mg 4/5/2024 08:47:56'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.
	vidaActual := vidaActual - unaCantidadDeDaño.! !


!Combatiente methodsFor: 'private' stamp: 'mc 4/4/2024 12:17:18'!
atacarA: unCombatiente
	unCombatiente recibirDaño: dañoAProvocar.! !

!Combatiente methodsFor: 'private' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'private' stamp: 'mg 4/5/2024 08:48:12'!
vidaActual
	^vidaActual. ! !


!Combatiente methodsFor: 'public' stamp: 'mc 4/4/2024 16:20:08'!
atacar
	| victimasElegidas |
	self estaMuerto ifTrue: [^self].
	
	victimasElegidas := self elegirVictima.
	(victimasElegidas isEmpty) ifTrue: [^self].

	victimasElegidas do: [:victimaElegida | self atacarA: victimaElegida]! !

!Combatiente methodsFor: 'public' stamp: 'mc 4/3/2024 16:30:11'!
elegirVictima
	^estrategia value: enemigos.
! !


!Combatiente methodsFor: 'initialization' stamp: 'mc 4/4/2024 16:49:20'!
initialize
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: #Combatientes!
Combatiente class
	instanceVariableNames: 'daño vida'!


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

!Hostigador methodsFor: 'strategy' stamp: 'mg 4/5/2024 09:35:45'!
enfocarseEnElMasHerido
	estrategiaActual := #atacarAlMasHerido.
	
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual < candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
					
! !

!Hostigador methodsFor: 'strategy' stamp: 'mg 4/5/2024 09:35:36'!
enfocarseEnElMasSano
	estrategiaActual := #atacarAlMasSano.
	
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
! !


!Hostigador methodsFor: 'public' stamp: 'mc 4/4/2024 16:25:07'!
atacar
	super atacar.
	self alternarEnfoque.

! !


!Hostigador methodsFor: 'initialization' stamp: 'mg 4/5/2024 08:49:12'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	vidaActual := 20.
	dañoAProvocar := 4.
	self enfocarseEnElMasSano. 

! !


!classDefinition: #Humano category: #Combatientes!
Combatiente subclass: #Humano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Humano methodsFor: 'initialization' stamp: 'mg 4/5/2024 08:49:05'!
initialize
	enemigos := #().
	dañoRecibido := 0.
	vidaActual := 20.
	dañoAProvocar := 4.
	self enfocarseEnElMasSano.! !



!Humano methodsFor: 'public' stamp: 'mg 4/5/2024 09:36:54'!
enfocarseEnElMasHerido	
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual < candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
! !

!Humano methodsFor: 'public' stamp: 'mg 4/5/2024 09:36:51'!
enfocarseEnElMasSano
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
				
				! !


!classDefinition: #Mago category: #Combatientes!
Combatiente subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Mago methodsFor: 'initialization' stamp: 'mg 4/5/2024 08:49:02'!
initialize
	enemigos := #().
	dañoRecibido := 0. 
	vidaActual := 20.	
	dañoAProvocar := 2.
	self enfocarseEnLos6MasSanos.! !


!Mago methodsFor: 'strategy' stamp: 'mg 4/5/2024 09:35:54'!
enfocarseEnLos6MasSanos
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual].
		
		candidatosVivos size < 6 
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 6]		
	].
		! !


!classDefinition: #Ogro category: #Combatientes!
Combatiente subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Combatientes'!

!Ogro methodsFor: 'public' stamp: 'mg 4/5/2024 09:37:20'!
enfocarseEnElMasHerido
	
		estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual < candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
! !

!Ogro methodsFor: 'public' stamp: 'mg 4/5/2024 09:37:25'!
enfocarseEnElMasSano
	estrategia := [:candidatos |  	
		| candidatosVivos candidatosOrdenados |
		
		candidatosVivos := candidatos select: [:candidato | candidato estaMuerto not ].
		candidatosOrdenados := candidatosVivos sorted: [:candidatos1 :candidatos2 | candidatos1 vidaActual > candidatos2 vidaActual].
		
		candidatosVivos isEmpty
			ifTrue: [candidatosOrdenados] 
			ifFalse: [candidatosOrdenados first: 1]		
	].
				
! !



!Ogro methodsFor: 'initialization' stamp: 'mg 4/5/2024 08:48:58'!
initialize
	enemigos := #().
	dañoRecibido := 0. 
	vidaActual := 40.
	dañoAProvocar := 8.
	self enfocarseEnElMasSano.! !
