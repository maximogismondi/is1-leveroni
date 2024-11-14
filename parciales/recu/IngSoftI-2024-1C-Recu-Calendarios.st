!classDefinition: #GroupCalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #GroupCalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 20:52:21'!
test01_aNewGroupCalendarIsNeverBusy
	
	| groupCalendar |
	
	groupCalendar := GroupCalendar new.
	
	self deny: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:00:08'!
test02_whenGroupCalendarAddsACalendarTheGroupCalendarIsBusyDuringCalendarEvents
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	personalCalendar schedule: event.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 22:12:04'!
test03_whenAGroupCalendarAddsMultipleCalendarsTheGroupCalendarIsBusyIfAnyOfItsCalendarsIsBusy
	
	| groupCalendar aMayEvent aJuneEvent onePersonalCalendar anotherPersonalCalendar |
	
	aMayEvent := Event from: 17:00 to: 22:00 on: May/31/2024.
	aJuneEvent := Event from: 17:00 to: 22:00 on: June/7/2024.
	
	onePersonalCalendar := PersonalCalendar new.
	onePersonalCalendar schedule: aMayEvent.
	
	anotherPersonalCalendar := PersonalCalendar new.
	anotherPersonalCalendar schedule: aJuneEvent.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: onePersonalCalendar.
	groupCalendar  add: anotherPersonalCalendar.	
	
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: June/7/2024).! !

!GroupCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:00:56'!
test04_whenAGroupCalendarSchedulesAnEventEveryAddedCalendarIsBusyDuringThatEvent
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	groupCalendar schedule: event.
	
	self assert: (personalCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !


!classDefinition: #PersonalCalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #PersonalCalendarTest
	instanceVariableNames: 'calendar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:53:43'!
test01_aNewCalendarIsNeverBusy
	
	self denyCalendarWithEvents: {} isBusyFrom: 17:00 to: 22:00 on: May/31/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:53:15'!
test02_whenAFullDayEventIsScheduledCalendarIsBusyDuringThatDay
	
	| event |
	
	event := Event from: 00:00 to: 23:59 on: May/31/2024.
	
	self assertCalendarWithEvents: {event} isBusyFrom: 17:00 to: 22:00 on: May/31/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:53:18'!
test03_whenAnEventIsScheduledCalendarIsNotBusyForAPeriodThatEndsBeforeTheEventStart
	
	| event |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.

	self denyCalendarWithEvents: {event} isBusyFrom: 10:00 to: 15:00 on: May/31/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:54:09'!
test04_whenAnEventIsScheduledCalendarIsNotBusyForAPeriodThatStartsAfterTheEventEnds
	
	| event |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.

	self denyCalendarWithEvents: {event} isBusyFrom: 23:00 to: 23:30 on: May/31/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:55:19'!
test05_whenARepeatedEventIsScheduledCalendarIsBusyDuringRepeatedEventTimes
	
	| repeated_event |
	
	repeated_event := Event from: 17:00 to: 20:00 on: June/1/2024 repeatedUntil: June/5/2024 by: 2*day.
	
	self assertCalendarWithEvents: {repeated_event} isBusyFrom: 17:00 to: 22:00 on: June/3/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 22:10:51'!
test06_whenMultipleEventsAreScheduledCalendarIsBusyDuringAllEventTimes
	
	| aMayEvent aJuneEvent |
	
	aMayEvent := Event from: 17:00 to: 20:00 on: May/31/2024.
	aJuneEvent := Event from: 17:00 to: 20:00 on: June/7/2024.
	
	self assertCalendarWithEvents: {aMayEvent . aJuneEvent} isBusyFrom: 17:00 to: 22:00 on: May/31/2024.
	self assertCalendarWithEvents: {aMayEvent . aJuneEvent} isBusyFrom: 17:00 to: 22:00 on: June/7/2024.! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:35:19'!
test07_failsOnCreatingAnEventWithAnEndTimeBeforeAStartTime
		
	self
	        should: [Event from: 22:00 to: 17:00 on: May/31/2024]
	        raise: Error
	        withExceptionDo: [ :anError | self assert: Event invalidTimeRange equals: anError messageText]! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 21:35:25'!
test08_failsOnCreatingAnEventWithAnEndDateBeforeAStartDate
		
	self
	        should: [Event from: 17:00 to: 22:00 on: May/31/2024 repeatedUntil: May/30/2024 by: 1*day]
	        raise: Error
	        withExceptionDo: [ :anError | self assert: Event invalidDateRange equals: anError messageText]! !

!PersonalCalendarTest methodsFor: 'tests' stamp: 'mg 5/31/2024 22:00:11'!
test09_failsOnCheckingAvailabilityForACalendarWhenTheEndTimeIsBeforeStartTime
	
	self
	        should: [calendar isBusyFrom: 22:00 to: 17:00 on: May/31/2024]
	        raise: Error
	        withExceptionDo: [ :anError | self assert: Calendar invalidTimeRange equals: anError messageText]! !


!PersonalCalendarTest methodsFor: 'setUp' stamp: 'mg 5/31/2024 22:00:32'!
setUp

	calendar := PersonalCalendar new.! !


!PersonalCalendarTest methodsFor: 'private' stamp: 'mg 5/31/2024 22:08:37'!
schedule: aListOfEvents

	aListOfEvents do: [:anEvent | calendar schedule: anEvent]! !


!PersonalCalendarTest methodsFor: 'assertions' stamp: 'mg 5/31/2024 22:01:57'!
assertCalendarWithEvents: aListOfEvents isBusyFrom: aStartTime to: anEndTime on: aDate
	
	self schedule: aListOfEvents.
	
	self assert: (calendar isBusyFrom: aStartTime to: anEndTime on: aDate).! !

!PersonalCalendarTest methodsFor: 'assertions' stamp: 'mg 5/31/2024 22:01:57'!
denyCalendarWithEvents: aListOfEvents isBusyFrom: aStartTime to: anEndTime on: aDate
	
	self schedule: aListOfEvents.
	
	self deny: (calendar isBusyFrom: aStartTime to: anEndTime on: aDate).! !


!classDefinition: #Calendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Object subclass: #Calendar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!Calendar methodsFor: 'public' stamp: 'mg 5/31/2024 21:16:41'!
isBusyFrom: aStartTime to: anEndTime on: aDate

	self subclassResponsibility! !

!Calendar methodsFor: 'public' stamp: 'mg 5/31/2024 21:16:54'!
schedule: anEvent

	self subclassResponsibility! !


!Calendar methodsFor: 'initialization' stamp: 'mg 5/31/2024 19:41:41'!
initialize

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Calendar class' category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Calendar class
	instanceVariableNames: ''!

!Calendar class methodsFor: 'error messages' stamp: 'mg 5/31/2024 22:04:59'!
invalidTimeRange
	^'Can not check availavilty of a time period with a start time after end time'! !


!classDefinition: #GroupCalendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Calendar subclass: #GroupCalendar
	instanceVariableNames: 'calendars'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:42:11'!
add: aCalendar

	calendars add: aCalendar.! !

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 21:03:10'!
isBusyFrom: aStartTime to: anEndTime on: aDate 

	^calendars anySatisfy: [:aCalendar | aCalendar isBusyFrom: aStartTime to: anEndTime on: aDate]! !

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:42:22'!
schedule: event

	calendars do: [:aCalendar | aCalendar schedule: event]. ! !


!GroupCalendar methodsFor: 'initialization' stamp: 'mg 5/31/2024 19:42:07'!
initialize

	calendars := OrderedCollection new.! !


!classDefinition: #PersonalCalendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Calendar subclass: #PersonalCalendar
	instanceVariableNames: 'events'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 18:03:04'!
initialize
	events := OrderedCollection new.! !

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 21:40:37'!
isBusyFrom: aStartTime to: anEndTime on: aDate 

	anEndTime < aStartTime ifTrue: [self error: Calendar invalidTimeRange].

	^events anySatisfy: [ :anEvent | anEvent ovelapsFrom: aStartTime to: anEndTime on: aDate].! !

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:04:05'!
schedule: anEvent 
	events add: anEvent.! !


!classDefinition: #Event category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Object subclass: #Event
	instanceVariableNames: 'dates startTime endTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!Event methodsFor: 'initialization' stamp: 'mg 5/31/2024 18:45:52'!
initializeFrom: aStartTime to: anEndTime on: aStartDate repeatedUntil: anEndDate by: aTimeMeasure
	
	dates := aStartDate to: anEndDate by: aTimeMeasure.
	startTime := aStartTime.
	endTime := anEndTime.! !


!Event methodsFor: 'public' stamp: 'mg 5/31/2024 21:14:34'!
ovelapsFrom: aStartTime to: anEndTime on: aDate
	^(self isScheduledOn: aDate) and: 
		(self isScheduledWithin: aStartTime and: anEndTime)
	! !


!Event methodsFor: 'private' stamp: 'mg 5/31/2024 21:08:16'!
isScheduledOn: aDate

	^ dates includes: aDate! !

!Event methodsFor: 'private' stamp: 'mg 5/31/2024 21:14:16'!
isScheduledWithin: aStartTime and: anEndTime

	^ (startTime <= anEndTime) and: (aStartTime <= endTime)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Event class' category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Event class
	instanceVariableNames: ''!

!Event class methodsFor: 'instance creation' stamp: 'mg 5/31/2024 19:38:14'!
from: aStartTime to: anEndTime on: aStartDate
	^self from: aStartTime to: anEndTime on: aStartDate repeatedUntil: aStartDate by: 1*day! !

!Event class methodsFor: 'instance creation' stamp: 'mg 5/31/2024 21:31:38'!
from: aStartTime to: anEndTime on: aStartDate repeatedUntil: anEndDate by: aTimeMeasure

	anEndTime < aStartTime ifTrue: [self error: self invalidTimeRange].
	anEndDate < aStartDate ifTrue: [self error: self invalidDateRange].

	^self new initializeFrom: aStartTime to: anEndTime on: aStartDate repeatedUntil: anEndDate by: aTimeMeasure! !


!Event class methodsFor: 'error messages' stamp: 'mg 5/31/2024 21:32:51'!
invalidDateRange
	^'An event can repeat until a date before it starts'! !

!Event class methodsFor: 'error messages' stamp: 'mg 5/31/2024 21:30:49'!
invalidTimeRange
	^'An event can not start after it finishes'! !
