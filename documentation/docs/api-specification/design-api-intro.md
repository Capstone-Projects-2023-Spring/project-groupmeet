---
sidebar_position: 1
description: Our API
---

public class HomeScreen
====================================================================================================
This class is the first page the user sees upon logging in, and helps them navigate the application.

**Properties**  
*firebaseDatabase - FirebaseDatabase*
* Stores a reference to the database  
*firebaseAuth - FirebaseAuth*  
* Stores a reference to the authenticator  

**Methods**  
*public HomeScreen(firebaseDatabase, firebaseAuth)*  
* constructor for the class  
* **parameters** - firebaseDatabase, firebaseAuth - information needed to instantiate the class

private class _HomeScreen
=========================================================================================================
* First page that is generated when the application opens.

Properties
----------
*displayedGroups - RoundGroup List*  
*observing - boolean*  
*code - String*

Methods
-------
*updateDatabase(groupID)*  
* updates the database with user information
* **parameters** - groupID - Updates database with new information

*showQR(context)*  
* Allows the user to scan or enter a QR code/manual code
* **parameters** - context - The page the user is currently on

*showAdd(context)*  
* Allows the user to add a new group
* **parameters** - context - The page the user is currently on

*showSettings(context)*  
* Allows the user to go the settings page
* **parameters** - context - The page the user is currently on

*selectedGroup(int group)*  
* Takes user to the appropriate group page depending on what they clicked.
* **parameters** - group - The group the user clicked.

*observeGroups()*  
* Allows the user to view all groups they are a part of

public class CalendarPage
============================================================================================================
**Purpose**  
The page that allows the user to view their calendar  

**Properties**
*group: A map of dynamic and dynamic type that represents the group.*  
*title: A string representing the title of the calendar page.*  

**Methods**
*createState()*  
* Returns a state object for the CalendarPage.

private class _CalendarPage
============================================================================================================
**Properties**
*allEvents: A list of Appointment objects representing all the events in the calendar.*  
**Methods**
*getData()*  
* Asynchronously gets all the calendar events and round meetings for the members in the group.
*chosenDateAddedToCalendar(DateTime begTime, DateTime finTime, String meetingName)*  
* Asynchronously adds a new meeting to the calendar.
*_handleSignIn()*
* Asynchronously handles signing into Google.
*getPrimaryCalendar()*  
* Asynchronously retrieves the primary calendar for the current user.

AccountInfo class
=================
**Purpose**  
The page that allows the user to view their calendar  

**Properties**
*group: A map of dynamic and dynamic type that represents the group.*  
*title: A string representing the title of the calendar page.  

**Methods**
