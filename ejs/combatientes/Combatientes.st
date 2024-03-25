!classDefinition: #CombateTest category: #Ejercicio01!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

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
	
	combate desarollarRonda. 	combate desarollarRonda. 
	
	
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


!classDefinition: #Combate category: #Ejercicio01!
Object subclass: #Combate
	instanceVariableNames: 'primerBando segundoBando rondas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio01'!

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

!classDefinition: 'Combate class' category: #Ejercicio01!
Combate class
	instanceVariableNames: ''!

!Combate class methodsFor: 'instance creation' stamp: 'mg 3/25/2024 14:59:00'!
entre: bando1 y: bando2 
	bando1 do: [ :combatiente | combatiente  asignarEnemigos: bando2 ].
	bando2 do: [ :combatiente | combatiente  asignarEnemigos: bando1 ].
	
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

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:46:38'!
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

!Combatiente methodsFor: 'public' stamp: 'mg 3/25/2024 16:46:38'!
vidaActual
	^20 - self dañoRecibido! !
