!classDefinition: #TestMarsRover category: #MarsRover!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mg 4/26/2024 20:28:53'!
test01_xxx
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yOrientacion: $N.
	
	rover recibirComandos: ''.
	
	self assert: (rover estaEn: 0@0	).! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'mg 4/26/2024 20:32:32'!
test02_xxx
	| rover |
	
	rover := MarsRover conCoordenada: 0@0 yOrientacion: $N.
	
	rover recibirComandos: 'f'.
	
	self deny: (rover estaEn: 0@0	).! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'mg 4/26/2024 20:27:04'!
inicializarConCoordenada: unaCoordenada yOrientacion: unaOrientacion
	coordenada := unaCoordenada.
	orientacion := unaOrientacion.! !


!MarsRover methodsFor: 'public' stamp: 'mg 4/26/2024 20:35:38'!
estaEn: unaCoordenada
	^unaCoordenada = coordenada ! !

!MarsRover methodsFor: 'public' stamp: 'mg 4/26/2024 20:48:55'!
recibirComandos: comandos 
	comandos = 'f' ifTrue: [coordenada := 0@1].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'mg 4/26/2024 20:28:28'!
conCoordenada: unaCoordenada yOrientacion: unaOrientacion
	^self new inicializarConCoordenada: unaCoordenada yOrientacion: unaOrientacion 
	! !
