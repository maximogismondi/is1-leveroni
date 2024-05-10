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

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:49'!
test05APotfolioWithMultiplesReceptiveAccountsDontFindRegisteredReceptiveAccountTransactions

	| portfolio account1 account2 deposit |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio register: account1.

	deposit := Deposit  register: 100 * peso on: account2.
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:43'!
test06APotfolioWithMultiplesReceptiveAccountsFindRegisteredReceptiveAccountTransactions

	| portfolio account1 account2 account3 deposit |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio register: account1.
	portfolio register: account2.
	portfolio register: account3.
	
	deposit := Deposit  register: 100 * peso on: account2.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:32'!
test07APotfolioAReceptiveAccountsListAllReceptiveAccountTransactions

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	deposit := Deposit  register: 100 * peso on: account.
	
	self assert: portfolio transactions first equals: deposit.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:22'!
test08APortfolioCannotRegisterAReceptiveAccountTwice

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	self should: [portfolio register: account]
	raise: Error 
	withExceptionDo:  [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:15'!
test09APotfolioMultiplesReceptiveAccountsListAllReceptiveAccountsTransactions

	| portfolio account1 account2 deposit1 deposit2  deposits |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio register: account1.
	portfolio register: account2.
	
	deposit1 := Deposit  register: 100 * peso on: account1.
	deposit2 := Deposit  register: 100 * peso on: account2.
	
	deposits := OrderedCollection new.
	deposits add: deposit1.
	deposits add: deposit2.
	
	self assert: portfolio transactions equals: deposits.! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:07'!
test10APortfolioCannotRegisterAReceptiveAccountRegisteredInRegisteredPorfolio

	| portfolio1 portfolio2 account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio2 register: account.
	portfolio1 register: portfolio2.

	self should: [portfolio1 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:43:02'!
test11APortfolioCannotRegisterAPortfolioTwice

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.

	portfolio1 register: portfolio2.

	self should: [portfolio1 register: portfolio2]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:42:56'!
test12APortfolioCannotRegisterAnAlreadyRegisteredReceptiveAccountInHierarchy

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

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:42:32'!
test13APortfolioCannotRegisterItSelf

	| portfolio |
	
	portfolio := Portfolio new.

	self should: [portfolio register: portfolio]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:42:25'!
test14APortfolioCannotRegisterItsParentPortfolio

	| portfolio1 portfolio2 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
		
	portfolio2 register: portfolio1.

	self should: [portfolio1 register: portfolio2]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:42:21'!
test15APortfolioCannotRegisterAnAlrealdyRegisteredReceptiveAccountInParentPortfolio

	| portfolio1 portfolio2 account|
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
		
	portfolio1 register: account.
	portfolio1 register: portfolio2.
	
	self should: [portfolio2 register: account]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText  equals:  Portfolio duplicateAccount].! !

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:42:15'!
test16APortfolioCannotRegisterAnAlrealdyRegisteredReceptiveAccounInFullHierarchy

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

!PortfolioTest methodsFor: 'testing' stamp: 'mc 5/7/2024 19:41:47'!
test17APortfolioCannotRegisterAPortfolioIfBothIncludesTheSameAccountInItsHierarchy

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mc 5/10/2024 01:23:26'!
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


!classDefinition: #ReportTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReportTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:02:03'!
test01ReceptiveAccountWithoutInterAccountTransactionsHasZeroPesosTransferNet
	
	| account |
	
	account := ReceptiveAccount new.
	
	Deposit  register: 100 * peso on: account.
	
	self assert: (ReportTransferNet with: account) equals: 0 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:21:55'!
test02ReceptiveAccountWithATransferDepositModifiesPositivelyTheTransferNet
	
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1  to: account2  for: 100 * peso.
	
	self assert: (ReportTransferNet with: account2) equals: 100 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:23:39'!
test03ReceptiveAccountWithATransferWithdrawModifiesNegativelyTheTransferNet
	
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1  to: account2  for: 100 * peso.
	
	self assert: (ReportTransferNet with: account1) equals: -100 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:23:59'!
test04ReceptiveAccountWithManyTransferTransactionsAffectsTheTransferNet
	
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1  to: account2  for: 100 * peso.
	Transference from: account2  to: account1  for: 100 * peso.
	
	self assert: (ReportTransferNet with: account1) equals: 0 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:19:47'!
test05PortfolioWithoutInterAccountTransactionHasZeroPesosTrasnferNet
	
	| portfolio |

	portfolio := Portfolio new.	
	self assert: (ReportTransferNet with: portfolio) equals: 0 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:24:33'!
test06PortolfioWithAReceptiveAccountWithATransferDepositModifiesPositivelyTheTransferNet
	
	| account1 account2 portfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1 to: account2  for: 100 * peso. 
	
	portfolio register: account2.

	self assert: (ReportTransferNet with: portfolio) equals: 100 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:25:11'!
test07PortolfioWithMultiplesReceptiveAccountAffectsTheTransferNet
	
	| account1 account2 portfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1 to: account2  for: 100 * peso. 
	
	portfolio register: account1.
	portfolio register: account2.
	
	self assert: (ReportTransferNet with: portfolio) equals: 0 * peso.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:47:12'!
test08ReceptiveAccountWithoutTransactionsDoNotHasImpactOnAccountSummary
	
	| account summary |
	
	account := ReceptiveAccount new.
	
	summary := OrderedCollection new.
	summary add: 'Balance = 0 pesos'.
	
	self assert: (ReportAccountSummary with: account) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:51:31'!
test09WhenReceptiveAccountRegisterDepositTransactionItImpactsOnAccountSummary
	
	| account summary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Balance = 100 pesos'.
	
	self assert: (ReportAccountSummary with: account) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:55:40'!
test10WhenReceptiveAccountRegisterManyDepositsTransactionsTheympactsOnAccountSummary
	
	| account summary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Deposit register: 100 * peso on: account.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Balance = 200 pesos'.
	
	self assert: (ReportAccountSummary with: account) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:52:04'!
test11WhenReceptiveAccountRegisterWithdrawTransactionItImpactsOnAccountSummary
	
	| account summary |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 100 * peso on: account.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Extracción por 100 pesos'.
	summary add: 'Balance = 0 pesos'.
	
	self assert: (ReportAccountSummary with: account) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:52:40'!
test12WhenReceptiveAccountRegisterTransferWithdrawTransactionItImpactsOnAccountSummary
	
	| account1 account2 summary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Transference from: account1 to: account2 for: 100 * peso.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Salida por transferencia de 100 pesos'.
	summary add: 'Balance = 0 pesos'.
	
	self assert: (ReportAccountSummary with: account1) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mc 5/8/2024 00:53:09'!
test13WhenReceptiveAccountRegisterTransferDepositTransactionItImpactsOnAccountSummary
	
	| account1 account2 summary |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account2.
	Transference from: account2 to: account1 for: 100 * peso.
	
	summary := OrderedCollection new.
	
	summary add: 'Entrada por transferencia de 100 pesos'.
	summary add: 'Balance = 100 pesos'.
	
	self assert: (ReportAccountSummary with: account1) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mg 5/8/2024 16:31:38'!
test14PortfolioWithoutAccountsDoNotHasImpactOnAccountSummary
	
	| portfolio summary |
	
	portfolio := Portfolio new.
	
	summary := OrderedCollection new.
	
	summary add: 'Balance = 0 pesos'.
	
	self assert: (ReportAccountSummary with: portfolio) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:51:08'!
test15WhenReceptiveAccountInPortfolioRegisterTransactionItImpactsOnAccountSummary
	
	| portfolio account summary |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio register: account.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Balance = 100 pesos'.
	
	self assert: (ReportAccountSummary with: portfolio) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:50:57'!
test16WhenReceptiveAccountInPortfolioRegisterManyTransactionsItImpactsOnAccountSummary
	
	| portfolio summary account1 account2 |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 100 * peso on: account2.
		
	portfolio register: account1.
	portfolio register: account2.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Balance = 200 pesos'.
	
	self assert: (ReportAccountSummary with: portfolio) equals: summary.
	! !

!ReportTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:52:20'!
test17WhenReceptiveAccountInPortfolioHierarchyRegisterTransactionItImpactsOnAccountSummary
	
	| portfolio1 portfolio2 summary account |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
		
	portfolio1 register: account.
	portfolio2 register: portfolio1.
	
	summary := OrderedCollection new.
	
	summary add: 'Depósito por 100 pesos'.
	summary add: 'Balance = 100 pesos'.
	
	self assert: (ReportAccountSummary with: portfolio2) equals: summary.
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

!TransferenceTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:46:05'!
test01TransferenceExtractMoneyFromOriginAccount

	Deposit register: 100 * peso on: senderAccountTest .
	
	Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: senderAccountTest balance equals: 0 * peso.
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'mg 5/9/2024 15:46:20'!
test02TransferenceDepositMoneyToDestinyAccount
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: receiverAccountTest balance equals: 100 * peso.
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'mc 5/10/2024 01:23:26'!
test03TransferenceKnowsTheValueOfInterAccountOperation

	| transaction |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	
	self assert: transaction value equals: 100 * peso.! !

!TransferenceTest methodsFor: 'testing' stamp: 'mg 5/10/2024 09:44:09'!
test04TransferenceWithdrawKnowsHisCounterpart

	| transaction transferDeposit transferWithdraw |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	transferWithdraw := transaction withdrawLeg.
	transferDeposit := transaction depositLeg.
	
	self assert: transferWithdraw counterpart equals: transferDeposit.! !

!TransferenceTest methodsFor: 'testing' stamp: 'mg 5/10/2024 09:44:18'!
test05TransferenceDepositKnowsHisCounterpart

	| transaction transferDeposit transferWithdraw |
	
	Deposit register: 100 * peso on: senderAccountTest .
	
	transaction := Transference from: senderAccountTest to: receiverAccountTest for: 100 * peso.
	transferWithdraw := transaction withdrawLeg.
	transferDeposit := transaction depositLeg.
	
	self assert: transferDeposit counterpart equals: transferWithdraw.! !


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

!Account methodsFor: 'private' stamp: 'mc 5/10/2024 00:20:33'!
registerTo: aPortfolio

	self subclassResponsibility! !


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


!Portfolio methodsFor: 'private' stamp: 'mc 5/7/2024 19:44:52'!
alreadyInHierarchy: anAccount

	parentPortfolio ifNotNil: [^(parentPortfolio alreadyInHierarchy: anAccount)].
	
	^self alreadyPresent: anAccount.! !

!Portfolio methodsFor: 'private' stamp: 'mc 5/10/2024 00:24:13'!
alreadyPresent: anAccount
	
	anAccount = self ifTrue: [^true].
	
	^(accounts anySatisfy: [:account | account alreadyPresent: anAccount]) or: 
		(accounts anySatisfy: [:account | anAccount alreadyPresent: account]).! !

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

!Portfolio methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:25:12'!
transactions
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [:anAccount | transactions addAll: anAccount transactions].
	
	^transactions. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message' stamp: 'mc 5/3/2024 19:09:44'!
duplicateAccount

	^'This account already exist'! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'mc 5/10/2024 00:25:25'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'mg 5/6/2024 12:05:17'!
alreadyPresent: anAccount
	
	^anAccount = self.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'mc 5/10/2024 00:20:47'!
registerTo: aPortfolio
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:26:35'!
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:26:55'!
transactions 

	^ transactions copy.! !


!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:00:27'!
acceptRequestFromReport: aReport

	self subclassResponsibility! !

!AccountTransaction methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:34:22'!
impactOnBalance: aBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'main protocol' stamp: 'mc 5/10/2024 01:23:26'!
value

	^value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'mc 5/10/2024 00:27:34'!
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

!Deposit methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:03:51'!
acceptRequestFromReport: aReport

	aReport reportDeposit: self! !

!Deposit methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:35:04'!
impactOnBalance: aBalance

	^aBalance + value.! !


!classDefinition: #InterAccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #InterAccountTransaction
	instanceVariableNames: 'counterpartLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!InterAccountTransaction methodsFor: 'initialization' stamp: 'mc 5/10/2024 01:11:35'!
initializeCounterpartLeg: aLeg

	counterpartLeg := aLeg.! !


!InterAccountTransaction methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:00:53'!
acceptRequestFromReport: aReport

	self subclassResponsibility! !

!InterAccountTransaction methodsFor: 'main protocol' stamp: 'mc 5/10/2024 01:11:24'!
counterpart

	^counterpartLeg.! !

!InterAccountTransaction methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:34:22'!
impactOnBalance: aBalance

	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: #'ServiciosFinancieros-Ejercicio'!
InterAccountTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:04:45'!
acceptRequestFromReport: aReport

	aReport reportTransferDeposit: self! !

!TransferDeposit methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:35:51'!
impactOnBalance: aBalance

	^aBalance + value! !


!classDefinition: #TransferWithdraw category: #'ServiciosFinancieros-Ejercicio'!
InterAccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'public' stamp: 'mc 5/10/2024 00:04:37'!
acceptRequestFromReport: aReport

	aReport reportTransferWithdraw: self! !

!TransferWithdraw methodsFor: 'public' stamp: 'mg 5/6/2024 12:35:41'!
impactOnBalance: aBalance

	^aBalance - value ! !


!classDefinition: #Withdraw category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'rightLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'main protocol' stamp: 'mc 5/10/2024 00:04:25'!
acceptRequestFromReport: aReport

	aReport reportWithdraw: self! !

!Withdraw methodsFor: 'main protocol' stamp: 'mg 5/6/2024 12:35:16'!
impactOnBalance: aBalance
	
	^ aBalance - value.! !


!classDefinition: #Report category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Report methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:05:19'!
reportDeposit: aDeposit

	self subclassResponsibility! !

!Report methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:05:42'!
reportTransferDeposit: aTransferDeposit

	self subclassResponsibility! !

!Report methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:06:07'!
reportTransferWithdraw: aTransferWithdraw

	self subclassResponsibility! !

!Report methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:06:03'!
reportWithdraw: aWithdraw

	self subclassResponsibility! !


!Report methodsFor: 'accessing' stamp: 'mc 5/10/2024 01:23:26'!
value

	self subclassResponsibility! !


!Report methodsFor: 'initialization' stamp: 'mc 5/10/2024 00:59:41'!
initializeWith: anAccount

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: #'ServiciosFinancieros-Ejercicio'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'creation' stamp: 'mc 5/10/2024 01:23:26'!
with: anAccount
	
	^(self new initializeWith: anAccount) value.
	
! !


!classDefinition: #ReportAccountSummary category: #'ServiciosFinancieros-Ejercicio'!
Report subclass: #ReportAccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReportAccountSummary methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportDeposit: aDeposit

	summary add: ('Depósito por {1} pesos' format: {aDeposit value amount}).! !

!ReportAccountSummary methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportTransferDeposit: aTransferDeposit

	summary add: ('Entrada por transferencia de {1} pesos' format: {aTransferDeposit value amount}). ! !

!ReportAccountSummary methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportTransferWithdraw: aTransferWithdraw

	summary add: ('Salida por transferencia de {1} pesos' format: {aTransferWithdraw value amount}). ! !

!ReportAccountSummary methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportWithdraw: aWithdraw

	summary add: ('Extracción por {1} pesos' format: {aWithdraw value amount}).! !


!ReportAccountSummary methodsFor: 'initialization' stamp: 'mc 5/10/2024 00:59:57'!
initializeWith: anAccount

	account := anAccount.
	summary := OrderedCollection new.! !


!ReportAccountSummary methodsFor: 'private' stamp: 'mc 5/10/2024 00:57:04'!
balanceResult: aBalance
	
	summary add:('Balance = {1} pesos' format: {aBalance amount}).
	! !


!ReportAccountSummary methodsFor: 'accessing' stamp: 'mc 5/10/2024 01:23:26'!
value
	
	account transactions do: [:aTransaction | aTransaction acceptRequestFromReport: self].
	self balanceResult: account balance.
	
	^summary. 
! !


!classDefinition: #ReportTransferNet category: #'ServiciosFinancieros-Ejercicio'!
Report subclass: #ReportTransferNet
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReportTransferNet methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:19:14'!
reportDeposit: aDeposit
	! !

!ReportTransferNet methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportTransferDeposit: aTransferDeposit

	transferNet := transferNet + aTransferDeposit value! !

!ReportTransferNet methodsFor: 'dd-report' stamp: 'mc 5/10/2024 01:23:26'!
reportTransferWithdraw: aTransferWithdraw

	transferNet := transferNet - aTransferWithdraw value! !

!ReportTransferNet methodsFor: 'dd-report' stamp: 'mc 5/10/2024 00:19:24'!
reportWithdraw: aWithdraw
	! !


!ReportTransferNet methodsFor: 'initialization' stamp: 'mc 5/10/2024 01:00:20'!
initializeWith: anAccount

	account := anAccount.
	transferNet := 0 * peso.! !


!ReportTransferNet methodsFor: 'accessing' stamp: 'mc 5/10/2024 01:23:26'!
value
	
	account transactions do: [:aTransaction | aTransaction acceptRequestFromReport: self].
	^transferNet ! !


!classDefinition: #Transference category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'public' stamp: 'mc 5/10/2024 01:14:05'!
depositLeg

	^depositLeg! !

!Transference methodsFor: 'public' stamp: 'mc 5/10/2024 01:23:36'!
value

	^value.! !

!Transference methodsFor: 'public' stamp: 'mc 5/10/2024 01:13:59'!
withdrawLeg

	^withdrawLeg.! !


!Transference methodsFor: 'initialization' stamp: 'mc 5/10/2024 01:21:54'!
initializeWithValue: aValue withSender: aSenderAccount withReceiver: aReceiverAccount 

	withdrawLeg := TransferWithdraw register: aValue  on: aSenderAccount.
	depositLeg := TransferDeposit register: aValue  on: aReceiverAccount.
	value := aValue.
	
	withdrawLeg initializeCounterpartLeg: depositLeg.
	depositLeg initializeCounterpartLeg: withdrawLeg.	

	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: #'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'mc 5/10/2024 01:22:21'!
from: aSenderAccount to: aReceiverAccount for: aValue 

	^self new initializeWithValue: aValue withSender: aSenderAccount withReceiver: aReceiverAccount  ! !
