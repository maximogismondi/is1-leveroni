!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/5/2024 18:07:07'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self 
		assertValue: [customerBook addCustomerNamed: 'John Lennon'.]  
		takeLessThan: 50 * millisecond! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/5/2024 18:07:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self 
		assertValue: [customerBook removeCustomerNamed: paulMcCartney.] 
		takeLessThan: 100 * millisecond
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/5/2024 18:28:50'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self 
		whenValuing: [customerBook addCustomerNamed: '']
		on: Error
		assertValue: {
			[:anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.].
			[:anError | customerBook isEmpty]
		}! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/5/2024 18:29:04'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self 
		whenValuing: [customerBook removeCustomerNamed: 'Paul McCartney'.]
		on: NotFound
		assertValue: {
			[:anError | customerBook numberOfCustomers = 1].
			[:anError | customerBook includesCustomerNamed: johnLennon ]
		} ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/8/2024 15:06:39'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self
		assert: customerBook
		includesActive: {}
		includesSuspended: {paulMcCartney}
		notIncludes: {}
		
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/8/2024 15:06:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self
		assert: customerBook
		includesActive: {}
		includesSuspended: {}
		notIncludes: {paulMcCartney}
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/8/2024 15:10:27'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self 
		whenValuing: [customerBook suspendCustomerNamed: 'Ringo Starr'.] 
		on: CantSuspend
		assertValue: {
			[:anError | customerBook numberOfCustomers = 1].
			[:anError | customerBook includesCustomerNamed: johnLennon]
		}
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mg 4/5/2024 18:28:24'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self 
		whenValuing: [customerBook suspendCustomerNamed: johnLennon.]
		on: CantSuspend
		assertValue:  {
			[:anError | customerBook numberOfCustomers = 1].
			[:anError | customerBook includesCustomerNamed: johnLennon]
		}! !


!CustomerBookTest methodsFor: 'private' stamp: 'mg 4/8/2024 15:06:39'!
assert: aCustomerBook includesActive: aCollectionOfActiveCustomers includesSuspended: aCollectionOfSuspendedCustomers notIncludes: aCollectionOfDeletedCustomers

	self assert: (aCollectionOfActiveCustomers size = aCustomerBook numberOfActiveCustomers).
	self assert: (aCollectionOfSuspendedCustomers size = aCustomerBook numberOfSuspendedCustomers).
	self assert: (aCollectionOfActiveCustomers size + aCollectionOfSuspendedCustomers size = aCustomerBook numberOfCustomers).

	aCollectionOfActiveCustomers do: [:aCustomer |
		self assert: (aCustomerBook includesCustomerNamed: aCustomer)
	].

	aCollectionOfSuspendedCustomers do: [:aCustomer |
		self assert: (aCustomerBook includesCustomerNamed: aCustomer)
	].

	aCollectionOfDeletedCustomers do: [:aCustomer |
		self deny: (aCustomerBook includesCustomerNamed: aCustomer)
	].! !

!CustomerBookTest methodsFor: 'private' stamp: 'mg 4/5/2024 18:12:31'!
assertValue: aBlock takeLessThan: aTimeLimit
	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.	
	aBlock value.	
	millisecondsAfterRunning := Time millisecondClockValue.
		
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aTimeLimit.! !

!CustomerBookTest methodsFor: 'private' stamp: 'mg 4/5/2024 18:27:57'!
whenValuing: aBlock on: anErrorType assertValue: aCollectionOfBlocks 

	[aBlock value. self fail]
		on: anErrorType 
		do: [:anError | 
			aCollectionOfBlocks do: [:block |
				self assert: (block value: anError)
			]
		]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mg 4/8/2024 15:24:31'!
removeCustomerNamed: aName 
	(self remove: aName from: active)	 ifTrue: [^aName].
	(self remove: aName from: suspended)	 ifTrue: [^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'private' stamp: 'mg 4/8/2024 15:26:29'!
remove: aName from: aCollectionOfCustomers

	1 to: aCollectionOfCustomers size do: 
	[ :index |
		aName = (aCollectionOfCustomers at: index)
			ifTrue: [
				aCollectionOfCustomers removeAt: index.
				^ true.
			] 
	].

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
