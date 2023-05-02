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

**Properties**
*displayedGroups - RoundGroup List*  
*observing - boolean*  
*code - String*

**Methods**  
*updateDatabase(groupID)*  
* updates the database with user information
* **parameters** - groupID - Updates database with new information

*showQR(context)*  
* Allows the user to scan or enter a QR code/manual code
* **parameters** - context - The page the user is currently on

*showAdd(context)*  
* Allows the user to add a new group  
* * **parameters** - context - The page the user is currently on

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
*title: A string representing the title of the page.*  

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
* **Parameters** begTime, finTime, meetingName - Adds the appropriate information to the page's calendar.

*_handleSignIn()*
* Asynchronously handles signing into Google.

*getPrimaryCalendar()*  
* Asynchronously retrieves the primary calendar for the current user.

public class LinkCalendar
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

public class CodeReception
============================================================================================================
**Purpose**  
The page that allows the user to receive a QR code and handle it

**Properties**  
*title: A string representing the title of the page.*  

**Methods**  
*createState()*  
* Returns a state object for CodeReception.

private class _CodeReceptionState
============================================================================================================
**Properties**  
*groupId: TextEditingController that reads the incoming group information* 

**Methods**  
*updateDatabase()*  
* Asynchronously updates the database with the incoming group information.  

*camSanner()*
* Allows for access to the camera to read the QR code and update the database accordingly.  

public class CodeSharing
============================================================================================================
**Purpose**  
The page that allows the user to share a QR code to others

**Properties**  
*title: A string representing the title of the page.*  

**Methods**  
*createState()*  
* Returns a state object for CodeSharing.

private class _CodeSharingState
============================================================================================================
**Properties**  

**Methods**  
*getCode()*  
* Asynchronously obtains the code from the database to be used.  

public class DisplayCode
============================================================================================================
**Purpose**  
The page that allows the user to display the code for others to utilize

**Properties**  
*groupName: A dynamic list that contains the group names.*  
*nameId: A dynamic list that contains the ID names.*  

**Methods**
*buildList(List<dynamic> groupName, List<dynamic> nameId)*  
* Creates the group code in a presentable manner for the user to see it
* **parameters** groupName, nameId - Lists that allow for the QR code to be created.
* **returns** a Widget to be used to display the QR code  

public class Display
============================================================================================================
**Purpose**  
The page that allows the user to display the code for others to utilize

**Properties**  
*groupName: A dynamic list that contains the group names.*  
*nameId: A dynamic list that contains the ID names.*  

**Methods**  

public class Qr
============================================================================================================
**Purpose**  
Allows for the scanning of the QR code

**Properties**  
*scanning: A boolean that determines whether the code is being scanned.*  

**Methods**  
*scanQR(Buildcontext context)*  
* Scans the QR code given the current state of the application.  

public class AddEvent
============================================================================================================
**Purpose**  
The page that allows the user to share a QR code to others

**Properties**  
*title: A string representing the title of the page.*  
*ref: a Database reference that refers to the user's currently stored events.*  

**Methods**  
*createState()*  
* Returns a state object for AddEvent.

private class _AddEventState
============================================================================================================
**Properties**  
*start: the start date of the custom event*  
*end: The end date of the custome event*  
*ref: a Database reference that refers to the user's currently stored events.*  

**Methods**  
  
public class AllGroups
============================================================================================================
**Purpose**  
The page that displays all groups to the user.

**Properties**  
*uid: The user's database ID*  
*ref: A Database reference that refers to the user's currently stored events.*  

**Methods**  
*createState()*  
* Returns a state object for AddEvent.

private class _AllGroupsState
============================================================================================================
**Properties**  
*uid: The user's database ID*  
*ref: A Database reference that refers to the user's currently stored events.*  

**Methods**  
*grabGroups()*  
* Obtains and returns the groups for the user from the database to be displayed to the user
* **Returns** a Future List of Maps that contain all groups and their pertinent information.

public class GroupCreation
============================================================================================================
**Purpose**  
The page that allows the user to create a new page.

**Properties**  
*userID: The user's database ID*  
*firebaseDatabase: A Database reference that refers to the user's currently stored events.*  

**Methods**  
*createState()*  
* Returns a state object for AddEvent.

private class _GroupCreationState
============================================================================================================
**Properties**  

**Methods**  
*createMaterialColor(Color color)*  
* Creates the color material to be used when displaying the group
* **Parameters** color - The color chosen by the user.
* **Returns** A MaterialColor object that contains the information needed to display the color in the future.  
  
*buttonPress(BuildContext context)*  
* **Parameters** context - The page seen by the user.
* An Asynchronous method that creates the group when the user pressed the button.  
  
*_openDialog(String title, Widget content)*  
* Creates a popup for the user to navigate.  
* **Parameters** title, content - The information needed to create the information in the popup.  
  
*colorTapped()*  
* Indicates which color code was selected by the user  
  
