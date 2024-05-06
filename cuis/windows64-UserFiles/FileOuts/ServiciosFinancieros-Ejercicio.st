!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:37:32'!
test01AnEmptyPortfolioHas0PesosBalance

	| portfolio |
	
	portfolio := Portfolio new.
	self assert: portfolio balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:37:36'!
test02APotfolioWithAReceptiveAccountCalculateBalance

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	Deposit  register: 100 * peso on: account.
	
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:37:39'!
test03APotfolioWithMultipleReceptiveAccountsCalculateBalance

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio register: account1.
	portfolio register: account2.
	
	Deposit  register: 100 * peso on: account1.
	Deposit  register: 100 * peso on: account2.
	
	self assert: portfolio balance equals: 200 * peso.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:37:43'!
test04APotfolioWithAReceptiveAccountFindRegisteredReceptiveAccountTransactions

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	deposit := Deposit  register: 100 * peso on: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:37:48'!
test05APotfolioAReceptiveAccountsListAllReceptiveAccountTransactions

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	deposit := Deposit  register: 100 * peso on: account.
	
	self assert: portfolio transactions first equals: deposit.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:38:15'!
test06APortfolioCannotRegisterAReceptiveAccountTwice

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	self should: [portfolio register: account]
	raise: Error 
	withExceptionDo:  [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:39:59'!
test07APortfolioCannotRegisterAReceptiveAccountRegisteredInRegisteredPorfolio

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio2 register: account.
	portfolio1 register: portfolio2.

	self should: [portfolio1 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:40:50'!
test08APortfolioCannotRegisterAPortfolioTwice

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.

	portfolio1 register: portfolio2.

	self should: [portfolio1 register: portfolio2]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:41:33'!
test09APortfolioCannotRegisterAnAlreadyRegisteredReceptiveAccountInHierarchy

	| portfolio1 portfolio2 portfolio3 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio3 register: account.
	portfolio2 register:  portfolio3.
	portfolio1 register: portfolio2.

	self should: [portfolio1 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:42:53'!
test10APortfolioCannotRegisterItSelf

	| portfolio |
	
	portfolio := Portfolio new.

	self should: [portfolio register: portfolio]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:44:26'!
test11APortfolioCannotRegisterItsParentPortfolio

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
		
	portfolio2 register: portfolio1.

	self should: [portfolio1 register: portfolio2]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:46:24'!
test12APortfolioCannotRegisterAnAlrealdyRegisteredReceptiveAccountInParentPortfolio

	| portfolio1 portfolio2 account|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
		
	portfolio1 register: account.
	portfolio1 register: portfolio2.
	
	self should: [portfolio2 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:47:27'!
test13APortfolioCannotRegisterAnAlrealdyRegisteredReceptiveAccounInFullHierarchy

	| portfolio1 portfolio2 portfolio3 account|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account := ReceptiveAccount new.
		
	portfolio1 register: account.
	portfolio1 register: portfolio2.
	portfolio2 register: portfolio3.
	
	self should: [portfolio3 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mg 5/6/2024 12:53:07'!
test14APortfolioCannotRegisterAPortfolioIfBothIncludesTheSameAccountInItsHierarchy

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
		
	portfolio1 register: account.
	portfolio2 register: account.
	
	self should: [portfolio2 register: portfolio1]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio duplicateAccount].! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JS 4/30/2024 13:50:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: account transactions includes: deposit.
! !


!classDefinition: #TransferenceTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'senderAccountTest receiverAccountTest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 17:47:18'!
setUp

	senderAccountTest := ReceptiveAccount new.
	receiverAccountTest := ReceptiveAccount new.! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 10:59:52'!
test01_transferenceExtractMoneyFromOriginAccount

	Deposit register: 100 * peso on: senderAccountTest .
	
	Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: senderAccountTest balance equals: 0 * peso.
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 11:00:00'!
test02_transferenceDepositMoneyToDestinyAccount
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: receiverAccountTest balance equals: 100 * peso.
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 10:45:06'!
test03_transferenceKnowsTheValueOfInterAccountOperation

	| transaction |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: transaction value equals: 100 * peso.! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 11:01:53'!
test04_transferenceWithdrawKnowsHisCounterParty

	| transaction transferDeposit transferWithdraw |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	transferWithdraw := transaction senderLeg.
	transferDeposit := transaction receiverLeg.
	
	self assert: transferWithdraw counterparty equals: transferDeposit.! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/3/2024 11:01:46'!
test05_transferenceDepositKnowsHisCounterParty

	| transaction transferDeposit transferWithdraw |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	transferWithdraw := transaction senderLeg.
	transferDeposit := transaction receiverLeg.
	
	self assert: transferDeposit counterparty equals: transferWithdraw.! !


!classDefinition: #Account category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:53:07'!
balance

	self subclassResponsibility! !

!Account methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:53:22'!
hasRegistered: aTransaction

	self subclassResponsibility! !

!Account methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:54:31'!
register: anAccount

	self subclassResponsibility! !

!Account methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:54:52'!
transactions

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'mg 5/6/2024 12:08:51'!
alreadyPresent: anAccount

	self subclassResponsibility.! !

!Account methodsFor: 'private' stamp: 'mg 5/6/2024 12:55:14'!
registerTo: aPortfolio
	^self! !


!Account methodsFor: 'initialization' stamp: 'mg 5/6/2024 11:57:17'!
initialize

	self subclassResponsibility! !


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parentPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'mg 5/6/2024 11:01:47'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'private' stamp: 'mg 5/6/2024 12:05:17'!
alreadyInHierarchy: anAccount

	parentPortfolio ifNotNil: [(parentPortfolio alreadyInHierarchy: anAccount) ifTrue: [^true]].
	
	^self alreadyPresent: anAccount.! !

!Portfolio methodsFor: 'private' stamp: 'mg 5/6/2024 12:08:42'!
alreadyPresent: anAccount
	
	anAccount = self ifTrue: [^true].
	
	(accounts anySatisfy: [:account | account alreadyPresent: anAccount]) ifTrue: [^true].
	(accounts anySatisfy: [:account | anAccount alreadyPresent: account]) ifTrue: [^true].
	 
	^false! !

!Portfolio methodsFor: 'private' stamp: 'mg 5/6/2024 11:10:31'!
registerTo: aPortfolio
	
	parentPortfolio := aPortfolio.! !


!Portfolio methodsFor: 'main protocol' stamp: 'mc 5/3/2024 18:00:37'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'mc 5/3/2024 18:09:49'!
hasRegistered: aTransaction 

	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:56:23'!
register: anAccount 
	
	(self alreadyInHierarchy: anAccount) ifTrue: [self error:  self class duplicateAccount].
	
	accounts add: anAccount.
	anAccount registerTo: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'mg 5/6/2024 11:54:46'!
transactions
	
	|  transactions |
	
	transactions := accounts collect: [:anAccount | anAccount transactions].
	^transactions flatten. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'mc 5/3/2024 19:09:44'!
duplicateAccount

	^'This account already exist'! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'mc 5/3/2024 17:46:49'!
initialize
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'mg 5/6/2024 12:05:17'!
alreadyPresent: anAccount
	
	^anAccount = self.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:36:37'!
balance

	| balance |
	
	balance  := 	0.
	
	transactions do: [ :aTransaction | balance := aTransaction impactOnBalance: balance].
	
	^balance! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'mg 5/6/2024 12:34:22'!
impactOnBalance: aBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'mc 5/2/2024 18:37:00'!
value 

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'mc 5/2/2024 18:36:46'!
initializeFor: aValue
	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'mc 5/2/2024 18:42:35'!
for: aValue
	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'leftLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'value' stamp: 'mg 5/6/2024 12:35:04'!
impactOnBalance: aBalance

	^aBalance + value.! !

!Deposit methodsFor: 'value' stamp: 'mc 4/30/2024 20:34:49'!
value
	^ value! !


!classDefinition: #InterAccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #InterAccountTransaction
	instanceVariableNames: 'counterpartyLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!InterAccountTransaction methodsFor: 'initialization' stamp: 'mc 5/3/2024 17:27:56'!
initializeCounterpartyLeg: aLeg

	counterpartyLeg := aLeg.! !


!InterAccountTransaction methodsFor: 'public' stamp: 'mc 5/3/2024 10:47:26'!
counterparty

	^counterpartyLeg.! !

!InterAccountTransaction methodsFor: 'public' stamp: 'mg 5/6/2024 12:34:22'!
impactOnBalance: aBalance

	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: #'ServiciosFinancieros-Ejercicio'!
InterAccountTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'public' stamp: 'mg 5/6/2024 12:35:51'!
impactOnBalance: aBalance

	^aBalance + value! !


!classDefinition: #TransferWithdraw category: #'ServiciosFinancieros-Ejercicio'!
InterAccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'public' stamp: 'mg 5/6/2024 12:35:41'!
impactOnBalance: aBalance

	^aBalance - value ! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'rightLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'value' stamp: 'mg 5/6/2024 12:35:16'!
impactOnBalance: aBalance
	
	^ aBalance - value.! !

!Withdraw methodsFor: 'value' stamp: 'mc 5/2/2024 18:07:33'!
value

	^ value .! !


!classDefinition: #Transference category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value senderLeg receiverLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'public' stamp: 'mc 5/3/2024 10:34:57'!
receiverLeg

	^receiverLeg! !

!Transference methodsFor: 'public' stamp: 'mc 5/3/2024 10:35:10'!
senderLeg

	^senderLeg.! !

!Transference methodsFor: 'public' stamp: 'mc 4/30/2024 21:05:55'!
value

	^value.! !


!Transference methodsFor: 'initialization' stamp: 'mc 5/3/2024 17:27:56'!
initializeWithOriginLeg: aSenderLeg andDestinyLeg: aReceiverLeg withValue: aValue 

	
	senderLeg :=TransferWithdraw register: aValue  on: aSenderLeg.
	receiverLeg := TransferDeposit register: aValue  on: aReceiverLeg.
	value := aValue.
	
	senderLeg initializeCounterpartyLeg: receiverLeg .
	receiverLeg initializeCounterpartyLeg: senderLeg .	

	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: #'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'mc 5/3/2024 10:42:47'!
from: senderAccount to: receiverAccount for: aValue 
	
	^self new initializeWithOriginLeg: senderAccount andDestinyLeg: receiverAccount withValue: aValue. ! !
