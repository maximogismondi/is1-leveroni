!classDefinition: #NumeroTest category: #'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 4/12/2024 19:58:06'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 4/12/2024 19:58:17'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 4/12/2024 19:58:31'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Fraccion with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 4/12/2024 20:05:59'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'mg 4/12/2024 20:06:11'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'mg 4/12/2024 19:57:17'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := Fraccion with: one over: two.
	oneFifth := Fraccion with: one over: five.
	twoFifth := Fraccion with: two over: five.
	twoTwentyfifth := Fraccion with: two over: (Entero with: 25).
	fiveHalfs := Fraccion with: five over: two.
	! !


!classDefinition: #Numero category: #'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 19:18:42'!
* aMultiplier 
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 20:06:38'!
+ anAdders
	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 19:27:31'!
// aDivisor 
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 19:56:09'!
= anObject
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 20:09:17'!
greatestCommonDivisorWith: anEntero 
	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'mg 4/12/2024 20:05:11'!
negated
	
	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'mg 4/12/2024 19:04:33'!
isNegative
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'mg 4/12/2024 19:10:34'!
isOne
	self subclassResponsibility! !

!Numero methodsFor: 'testing' stamp: 'mg 4/12/2024 19:10:49'!
isZero
	self subclassResponsibility! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'NR 9/8/2019 21:59:58'!
printOn: aStream
	
	type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ].! !


!Numero methodsFor: 'comparing' stamp: 'NR 9/8/2019 22:00:49'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !



!classDefinition: #Entero category: #'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:21:17'!
* aMultiplier

	^self class with: value * aMultiplier integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:22:27'!
+ anAdder

	^self class with: value + anAdder integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:26:47'!
// aDivisor
	^self class with: value // aDivisor integerValue ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:49:09'!
= anObject
	^value = anObject integerValue
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 20:07:51'!
greatestCommonDivisorWith: anEntero 
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:04:43'!
isNegative
	^value < 0 ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 20:04:32'!
negated
	^self * (self class with: -1)! !


!Entero methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:07:31'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Entero methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:10:15'!
isOne
	^value = 1! !

!Entero methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:11:00'!
isZero
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numeros-Parte1-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'mg 4/12/2024 19:38:34'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: #'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:04:17'!
isNegative
	^denominator < 0! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:10:23'!
isOne
	^false! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'mg 4/12/2024 19:11:08'!
isZero
	^false! !


!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:19:54'!
* aMultiplier
	 ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator)! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:25:44'!
+ anAdder
	| newNumerator newDenominator |

	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
		
	^ self class with: newNumerator over: newDenominator .! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:27:21'!
// aDivisor
	self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:50:27'!
= anObject
	^(numerator * anObject denominator) = (denominator * anObject numerator)! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 20:09:01'!
greatestCommonDivisorWith: anEntero 
	^self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 19:07:38'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !

!Fraccion methodsFor: 'initialization' stamp: 'mg 4/12/2024 20:05:45'!
negated
	^self class  with: numerator * (Entero with: -1) over: denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numeros-Parte1-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'mg 4/12/2024 19:38:39'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator! !
