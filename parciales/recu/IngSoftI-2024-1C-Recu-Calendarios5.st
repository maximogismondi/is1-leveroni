!classDefinition: #CalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #CalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test01_aNewCalendarIsAlwaysAvailable
	
	| calendario |
	
	calendario := PersonalCalendar new.
	
	self assert: (calendario isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test02_whenAnEventIsAddedIsNotAvaliableIfTheStartTimeColapsing
	
	| calendario event |
	
	event := Event from: 17:00 to: 20:00 on: May/31/2024.

	calendario := PersonalCalendar new.
	calendario schedule: event.
	
	self deny: (calendario isAvailableFrom: 17:00 to: 23:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test03_whenAnEventIsAddedIsNotAvaliableIfTheEndTimeColapsing
	
	| calendario event |
	
	event := Event from: 17:00 to: 20:00 on: May/31/2024.

	calendario := PersonalCalendar new.
	calendario schedule: event.
	
	self deny: (calendario isAvailableFrom: 16:00 to: 22:00 on: May/31/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test04_whenAddingMultipleEventsAllRangesAreNotAvailable
	
	| calendario event1 event2 |
	
	event1 := Event from: 17:00 to: 20:00 on: May/31/2024.
	event2 := Event from: 17:00 to: 20:00 on: June/7/2024.
	
	calendario := PersonalCalendar new.
	calendario schedule: event1.
	calendario schedule: event2.
	
	self deny: (calendario isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).
	self deny: (calendario isAvailableFrom: 17:00 to: 22:00 on: June/7/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test05_xxx
	
	| calendario repeated_event |
	
	repeated_event := Event from: 17:00 to: 20:00 on: June/1/2024 repeatedUntil: June/5/2024 by: 2*day.
	
	calendario := PersonalCalendar new.
	calendario schedule: repeated_event.
	
	self deny: (calendario isAvailableFrom: 17:00 to: 22:00 on: June/3/2024).! !

!CalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test06_xxx_notNecesary
	
	| calendario repeated_event |
	
	repeated_event := Event from: 17:00 to: 20:00 on: June/1/2024 repeatedUntil: FixedGregorianDate theEndOfTime by: 2*day.
	
	calendario := PersonalCalendar new.
	calendario schedule: repeated_event.
	
	self deny: (calendario isAvailableFrom: 17:00 to: 22:00 on: June/3/2024).! !


!classDefinition: #GroupCalendarTest category: #'IngSoftI-2024-1C-Recu-Calendarios'!
TestCase subclass: #GroupCalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:04:22'!
test01_xxx
	
	| groupCalendar |
	
	groupCalendar := GroupCalendar new.
	
	self assert: (groupCalendar isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test02_xxx
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	personalCalendar schedule: event.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	self deny: (groupCalendar isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
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
	
	self deny: (groupCalendar isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).
	self deny: (groupCalendar isAvailableFrom: 17:00 to: 22:00 on: June/7/2024).! !

!GroupCalendarTest methodsFor: 'as yet unclassified' stamp: 'mg 5/31/2024 19:38:30'!
test04_xxx
	
	| groupCalendar event personalCalendar |
	
	event := Event from: 17:00 to: 22:00 on: May/31/2024.
	
	personalCalendar := PersonalCalendar new.
	
	groupCalendar := GroupCalendar new.
	groupCalendar  add: personalCalendar.
	
	groupCalendar schedule: event.
	
	self deny: (personalCalendar isAvailableFrom: 17:00 to: 22:00 on: May/31/2024).! !


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


!Event methodsFor: 'public' stamp: 'mg 5/31/2024 19:16:36'!
ovelapFrom: aStartTime to: anEndTime on: aDate
	(dates includes: aDate) ifFalse:[^false].
	
	(startTime >= aStartTime) ifTrue:[^true].
	(endTime <= anEndTime ) ifTrue:[^true].
	
	^false.! !

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


!classDefinition: #GroupCalendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Object subclass: #GroupCalendar
	instanceVariableNames: 'calendars'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:17:39'!
add: aCalendar
	calendars add: aCalendar.! !

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:19:12'!
isAvailableFrom: initialTime to: endTime on: date 
	calendars do: [:aCalendar | (aCalendar isAvailableFrom: initialTime to: endTime on: date) ifFalse: [^false]].
	
	^true.! !

!GroupCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:21:25'!
schedule: event 
	calendars do: [:aCalendar | aCalendar schedule: event]. ! !


!GroupCalendar methodsFor: 'initialization' stamp: 'mg 5/31/2024 19:17:19'!
initialize
	calendars := OrderedCollection new.! !


!classDefinition: #PersonalCalendar category: #'IngSoftI-2024-1C-Recu-Calendarios'!
Object subclass: #PersonalCalendar
	instanceVariableNames: 'events'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Recu-Calendarios'!

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 18:03:04'!
initialize
	events := OrderedCollection new.! !

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 18:44:59'!
isAvailableFrom: initialTime to: endTime on: date 
	events do: [ :anEvent | (anEvent ovelapFrom: initialTime to: endTime on: date )ifTrue: [^false] ].

	^true! !

!PersonalCalendar methodsFor: 'public' stamp: 'mg 5/31/2024 19:04:05'!
schedule: anEvent 
	events add: anEvent.! !
