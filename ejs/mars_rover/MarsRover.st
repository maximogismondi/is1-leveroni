!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 16:25:43'!
test01_ComandoVacioNoHaceNada
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: ''.
	
	self assert: (rover estaEn: 0@0	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 19:22:02'!
test02_ComandoAdelanteMueveElRoverOrientadoANorte
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: 'f'.
	
	self deny: (rover estaEn: 0@0	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 20:54:34'!
test03_ComandoAdelanteMueveElRoverOrientadoASur
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $S.
	
	rover recibirComandos: 'f'.
	
	self assert: (rover estaEn: 0@-1	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 20:55:12'!
test04_ComandoAdelanteMueveElRoverOrientadoAEste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $E.
	
	rover recibirComandos: 'f'.
	
	self assert: (rover estaEn: 1@0	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 20:55:39'!
test05_ComandoAdelanteMueveElRoverOrientadoAOeste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $O.
	
	rover recibirComandos: 'f'.
	
	self assert: (rover estaEn: -1@0	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:04:16'!
test06_ComandoHaciaAtrasMueveElRoverOrientadoANorteEnDireccionOpuesta
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: 'b'.
	
	self assert: (rover estaEn: 0@-1	).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:07:09'!
test07_MultiplesComandosEjecutanMultiplesMovimientos
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: 'ff'.
	
	self assert: (rover estaEn: 0@2).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:07:16'!
test08_ComandoGirarALaIzquierdaCambiaLaOrientacionDelRoverDeNorteAOeste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: 'lf'.
	
	self assert: (rover estaEn: -1@0).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:09:01'!
test09_ComandoGirarALaIzquierdaCambiaLaOrientacionDelRoverDeOesteASur
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $O.
	
	rover recibirComandos: 'lf'.
	
	self assert: (rover estaEn: 0@-1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:09:16'!
test10_ComandoGirarALaIzquierdaCambiaLaOrientacionDelRoverDeSurAEste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $S.
	
	rover recibirComandos: 'lf'.
	
	self assert: (rover estaEn: 1@0).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:09:34'!
test11_ComandoGirarALaIzquierdaCambiaLaOrientacionDelRoverDeEsteANorte
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $E.
	
	rover recibirComandos: 'lf'.
	
	self assert: (rover estaEn: 0@1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/30/2024 09:54:26'!
test12_ComandoGirarALaDerechaCambiaLaOrientacionDelRoverDeNorteAEste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	
	rover recibirComandos: 'rf'.
	
	self assert: (rover estaEn: 1@0).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/30/2024 09:54:17'!
test13_ComandoGirarALaDerechaCambiaLaOrientacionDelRoverDeEsteASur
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $E.
	
	rover recibirComandos: 'rf'.
	
	self assert: (rover estaEn: 0@-1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/30/2024 09:54:09'!
test14_ComandoGirarALaDerechaCambiaLaOrientacionDelRoverDeSurAOeste
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $S.
	
	rover recibirComandos: 'rf'.
	
	self assert: (rover estaEn: -1@0).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/30/2024 09:54:01'!
test15_ComandoGirarALaDerechaCambiaLaOrientacionDelRoverDeOesteANorte
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $O.
	
	rover recibirComandos: 'rf'.
	
	self assert: (rover estaEn: 0@1).! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/29/2024 21:18:57'!
test16_ComandoInvalidoDevuelveError
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $N.
	self
	        should: [rover recibirComandos: 'fx']
	        raise: Error
	        withExceptionDo: [ :anError | self assert: MarsRover comandoInvalido equals: anError messageText]! !

!TestMarsRover methodsFor: 'testing' stamp: 'mc 4/30/2024 10:09:44'!
test17_ComandoInvalidoEnCardinalidadInicialDevuelveError
	| rover |
	self
	        should: [   rover := MarsRover conCoordenada: 0@0 yPuntoCardinal: $W.
				rover recibirComandos: 'fx']
	        raise: Error
	        withExceptionDo: [ :anError | self assert: PuntoCardinal errorNoRepresentable equals: anError messageText]! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'mc 4/29/2024 16:26:14'!
inicializarConCoordenada: unaCoordenada yPuntoCardinal: unPuntoCardinal
	coordenada := unaCoordenada.
	orientacion := PuntoCardinal conCardinalidad: unPuntoCardinal.! !


!MarsRover methodsFor: 'public' stamp: 'mc 4/29/2024 16:26:24'!
estaEn: unaCoordenada
	^unaCoordenada = coordenada.! !

!MarsRover methodsFor: 'public' stamp: 'mg 4/29/2024 14:26:41'!
recibirComandos: comandos 
	comandos do: [:comando | self ejecutarComando: comando].! !


!MarsRover methodsFor: 'private' stamp: 'mc 4/29/2024 16:39:09'!
ejecutarComando: comando

	| direccion |

	comando = $l ifTrue: [^orientacion := orientacion puntoCardinalIzquierdo.].
	comando = $r ifTrue: [^orientacion := orientacion puntoCardinalDerecho.].
		
	direccion := orientacion direccion.
	
	comando = $f ifTrue: [^coordenada := coordenada + direccion.].
	comando = $b ifTrue: [^coordenada := coordenada - direccion.].
	self error: self class comandoInvalido.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error descriptions' stamp: 'mg 4/29/2024 15:07:28'!
comandoInvalido
	^'Comando Invalido'! !


!MarsRover class methodsFor: 'instance creation' stamp: 'mc 4/29/2024 16:25:55'!
conCoordenada: unaCoordenada yPuntoCardinal: unPuntoCardinal
	^self new inicializarConCoordenada: unaCoordenada yPuntoCardinal: unPuntoCardinal 
	! !


!classDefinition: #PuntoCardinal category: #MarsRover!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!PuntoCardinal methodsFor: 'public' stamp: 'mg 4/29/2024 15:36:09'!
direccion

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'public' stamp: 'mg 4/29/2024 15:31:58'!
puntoCardinalDerecho

	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'public' stamp: 'mg 4/29/2024 15:32:08'!
puntoCardinalIzquierdo

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: #MarsRover!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'instance creation' stamp: 'mg 4/29/2024 15:29:55'!
conCardinalidad: unaCardinalidad
	self subclasses 
		detect: [:unaSubclass | unaSubclass representa: unaCardinalidad ]
		ifFound: [:unaSubclase | ^unaSubclase new ]
		ifNone: [self error: self errorNoRepresentable].! !

!PuntoCardinal class methodsFor: 'instance creation' stamp: 'mc 4/29/2024 21:58:37'!
representa: unaCardinalidad

	self subclassResponsibility! !


!PuntoCardinal class methodsFor: 'error descriptions' stamp: 'mg 4/29/2024 15:29:41'!
errorNoRepresentable
	^'No se puede representar un punto cardinal'! !


!classDefinition: #Este category: #MarsRover!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'public' stamp: 'mg 4/29/2024 15:36:44'!
direccion
	^1@0! !

!Este methodsFor: 'public' stamp: 'mg 4/29/2024 15:34:41'!
puntoCardinalDerecho
	^Sur new.! !

!Este methodsFor: 'public' stamp: 'mg 4/29/2024 15:34:48'!
puntoCardinalIzquierdo
	^Norte new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: #MarsRover!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'instance creation' stamp: 'mg 4/29/2024 15:24:17'!
representa: unaCardinalidad
	^unaCardinalidad = $E! !


!classDefinition: #Norte category: #MarsRover!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'public' stamp: 'mg 4/29/2024 15:37:00'!
direccion
	^0@1! !

!Norte methodsFor: 'public' stamp: 'mg 4/29/2024 15:34:36'!
puntoCardinalDerecho
	^Este new.! !

!Norte methodsFor: 'public' stamp: 'mg 4/29/2024 15:35:01'!
puntoCardinalIzquierdo
	^Oeste new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: #MarsRover!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'instance creation' stamp: 'mg 4/29/2024 15:24:52'!
representa: unaCardinalidad
	^unaCardinalidad = $N! !


!classDefinition: #Oeste category: #MarsRover!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'public' stamp: 'mg 4/29/2024 15:37:10'!
direccion
	^-1@0! !

!Oeste methodsFor: 'public' stamp: 'mg 4/29/2024 15:35:11'!
puntoCardinalDerecho
	^Norte new.! !

!Oeste methodsFor: 'public' stamp: 'mg 4/29/2024 15:35:17'!
puntoCardinalIzquierdo
	^Sur new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: #MarsRover!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'instance creation' stamp: 'mg 4/29/2024 15:24:59'!
representa: unaCardinalidad
	^unaCardinalidad = $O! !


!classDefinition: #Sur category: #MarsRover!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'public' stamp: 'mg 4/29/2024 15:37:20'!
direccion
	^0@-1! !

!Sur methodsFor: 'public' stamp: 'mg 4/29/2024 15:35:35'!
puntoCardinalDerecho
	^Oeste new.! !

!Sur methodsFor: 'public' stamp: 'mg 4/29/2024 15:35:30'!
puntoCardinalIzquierdo
	^Este new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: #MarsRover!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'instance creation' stamp: 'mg 4/29/2024 15:25:04'!
representa: unaCardinalidad
	^unaCardinalidad = $S! !
