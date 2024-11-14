!classDefinition: #CalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #CalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:56:00'!
test01_aNewCalendarIsNeverBusy
	
	| calendario |
	
	calendario := PersonalCalendar new.
	
	self deny: (calendario isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 20:18:18'!
test02_xxx
	
	| calendario event |
	
	event := Event from: 17:00 to: 20:00 on: May/31/2024.

	calendario := PersonalCalendar new.
	calendario schedule: event.
	
	self assert: (calendario isBusyFrom: 17:00 to: 23:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 20:18:23'!
test03_xxx
	
	| calendario event |
	
	event := Event from: 17:00 to: 20:00 on: May/31/2024.

	calendario := PersonalCalendar new.
	calendario schedule: event.
	
	self assert: (calendario isBusyFrom: 16:00 to: 22:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 20:16:10'!
test04_whenMultipleEventsAreScheduledCalendarIsBusyDuringAllEventTimes
	
	| calendario event1 event2 |
	
	event1 := Event from: 17:00 to: 20:00 on: May/31/2024.
	event2 := Event from: 17:00 to: 20:00 on: June/7/2024.
	
	calendario := PersonalCalendar new.
	calendario schedule: event1.
	calendario schedule: event2.
	
	self assert: (calendario isBusyFrom: 17:00 to: 22:00 on: May/31/2024).
	self assert: (calendario isBusyFrom: 17:00 to: 22:00 on: June/7/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 20:17:39'!
test05_whenARepeatedEventIsScheduledCalendarIsBusyDuringRepeatedEventTimes
	
	| calendario repeated_event |
	
	repeated_event := Event from: 17:00 to: 20:00 on: June/1/2024 repeatedUntil: June/5/2024 by: 2*day.
	
	calendario := PersonalCalendar new.
	calendario schedule: repeated_event.
	
	self assert: (calendario isBusyFrom: 17:00 to: 22:00 on: June/3/2024).! !


!classDefinition: #GroupCalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #GroupCalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:47:23'!
test01_xxx
	
	| groupCalendar |
	
	groupCalendar := GroupCalendar new.
	
	self deny: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:47:29'!
test02_xxx
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	personalCalendar schedule: event.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:47:39'!
test03_xxx
	
	| groupCalendar event1 event2 personalCalendar1 personalCalendar2 |
	
	event1 := Event from: 17:00 to: 22:00 on: May/31/2024.
	event2 := Event from: 17:00 to: 22:00 on: June/7/2024.
	
	personalCalendar1 := PersonalCalendar new.
	personalCalendar1 schedule: event1.
	
	personalCalendar2 := PersonalCalendar new.
	personalCalendar2 schedule: event2.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar1.
	groupCalendar  add: personalCalendar2.	
	
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).
	self assert: (groupCalendar isBusyFrom: 17:00 to: 22:00 on: June/7/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:47:43'!
test04_xxx
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	groupCalendar schedule: event.
	
	self assert: (personalCalendar isBusyFrom: 17:00 to: 22:00 on: May/31/2024).! !


!classDefinition: #Calendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Object subclass: #Calendar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!Calendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:47:07'!
isBusyFrom: initialTime to: endTime on: date

	self subclassResponsibility! !

!Calendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:41:31'!
schedule: event

	self subclassResponsibility! !


!Calendar methodsFor: 'initialization' stamp: 'mg 5/31/2024 19:41:41'!
initialize

	self subclassResponsibility! !


!classDefinition: #GroupCalendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Calendar subclass: #GroupCalendar
	instanceVariableNames: 'calendars'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:42:11'!
add: aCalendar

	calendars add: aCalendar.! !

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:49:46'!
isBusyFrom: initialTime to: endTime on: date 

	^calendars anySatisfy: [:aCalendar | aCalendar isBusyFrom: initialTime to: endTime on: date]! !

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

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:54:07'!
isBusyFrom: initialTime to: endTime on: date 

	^events anySatisfy: [ :anEvent | anEvent ovelapsFrom: initialTime to: endTime on: date].! !

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


!Event methodsFor: 'public' stamp: 'mg 5/31/2024 20:10:19'!
ovelapsFrom: aStartTime to: anEndTime on: aDate
	(dates includes: aDate) ifFalse:[^false].
	
	^(startTime <= anEndTime) and: (aStartTime <= endTime).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Event class' category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Event class
	instanceVariableNames: ''!

!Event class methodsFor: 'instance creation' stamp: 'mg 5/31/2024 19:38:14'!
from: aStartTime to: anEndTime on: aStartDate
	^self from: aStartTime to: anEndTime on: aStartDate repeatedUntil: aStartDate by: 1*day! !

!Event class methodsFor: 'instance creation' stamp: 'mg 5/31/2024 18:32:00'!
from: aStartTime to: anEndTime on: aStartDate repeatedUntil: anEndDate by: aTimeMeasure
	^self new initializeFrom: aStartTime to: anEndTime on: aStartDate repeatedUntil: anEndDate by: aTimeMeasure! !