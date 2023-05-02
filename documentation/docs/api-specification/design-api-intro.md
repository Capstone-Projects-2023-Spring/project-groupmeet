---
sidebar_position: 1
description: Our API
---

public class HomeScreen
====================================================================================================
This class is the first page the user sees upon logging in, and helps them navigate the application.

**Properties**  
*firebaseDatabas: Stores a reference to the database  
*firebaseAuth: Stores a reference to the authenticator  

**Methods**  
*public HomeScreen(firebaseDatabase, firebaseAuth)*  
* constructor for the class  
* **parameters** - firebaseDatabase, firebaseAuth - information needed to instantiate the class

private class _HomeScreen
=========================================================================================================
* First page that is generated when the application opens.

**Properties**
*displayedGroups: List that contains all groups the user is in.*  
*observing: boolean to state whether the state is currently observing*  
*code: String that contains the code fo the user.*

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
* Returns a state object for AllGroups.

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
* Returns a state object for GroupCreation.

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
  
public class GroupHomePage
====================================================================================================
**Purpose**  
Displays all information for the group to the user.

**Properties**  
*title: String that contains title of the page*  
*databaseReference - reference to the database to get all related information*  
*myGroup - a Map of dynamic, dynamic that contains any additional information about the group.*   

**Methods**  
*createState()*  
* Returns a state object for GroupHomePage.

private class _HomeScreen
=========================================================================================================
**Properties**
*databaseReference - reference to the database to get all related information*  
*instaCount - Number of users using Instagram*  
*fbCount - Number of users using Facebook*  
  *discordCount - Number of users using Discore*  
  *messagesCount - Number of users using Texting*  
  *snapCount - Number of users using Snapchat*  
  
  *instaHandles - List of all group member instagram information*
  *fbHandles - List of all group member Facebook information*  
  *discordHandles - List of all group member Discord information*  
  *messagesHandles - List of all group member Texting information*  
  *snapHandles - List of all group member Snapchat information*  
  
  *chosenPlatform - platform with the most usage*  
  *chosenHandles - List of all group member chosen information*  

**Methods**  
*grabGroupMembers()*  
* Asynchronously pulls data from the database
* **Returns** - List of all group members  

*leaveGroup()*  
* Allows the user to leave the group*  

*getData()*  
* Asynchronously pulls data from the database  
* **Returns** - HashMap of all group information  

*getHandles()*  
* Asynchronously pulls data from the database
*  **Returns** - HashMap of all social media information  

*getEventList()*  
* Asynchronously pulls data from the database
*  **Returns** - HashMap of all events from the users  

*FindNextBestDate()*  
* Asynchronously pulls data from the database
*  **Returns** - First available date available to all group members.  
  
*GetFirstDate()*  
* Asynchronously pulls data from the database
*  **Returns** - Date of the first available time for all users to meet.  

*RemoveCurrentDate()*  
* Asynchronously pulls data from the database
*  **Returns** - 1 if the method was successful, -1 if unsuccessful.  
  
*getQr()*  
* Creates a QR code to be used.  
  
public class GroupMember
============================================================================================================
**Purpose**  
The page that allows the user to create a new page.

**Properties**  
*uid: The user's database ID*  
*name: The user's name*  
  *email: The user's name*  
  *snapchat: The user's snapchat*  
  *discord: The user's discord*
  *sms: The user's sms number*  
  *instagram: The user's instagram*  
  *facebook: The user's facebook*  
  *hasCalendar: A boolean showing whether the member has integrated their calendar.*  
  
public class GroupView
============================================================================================================
**Purpose**  
The page that allows the user to view their group.

**Properties**  
*group: The associated Round Group*  

**Methods**  
*createState()*  
* Returns a state object for GroupView.

private class _GroupView
============================================================================================================
**Properties**  
  *appointment: Current time of the next meeting*  
  *parsedMembers: A list containing all current member information*  
  *rsvped: A list of members who have confirmed.*  
  *snapCount: number of snapchat users*  
  *smsCount: number of texting users*
  *discordCount: number of discord users*
  *instacount: number of instagram users*  
  *fbCount: number of facebook users*  
  *calCount: number of users with integrated calendars*  
  *isObserving: whether the user is a member*  
  *isAdmin: whether the user is the creator of the group*  
  *group: the associate Round group.*  

**Methods**  
*GetFirstDate()*  
* Asynchronously pulls data from the database
*  **Returns** - Date of the first available time for all users to meet.  
  
*observeGroup()*  
* Determines whether the current viewer is an admin.  
  
*triggerDelete()*  
* Asynchronous method that deletes the group.  
  
*popMain()*  
* returns to the previous page.  
  
*leaveGroup()*  
* Asynchronously removes the user from the group  
  
*calculateSocialCounts()*  
* Tabulates how many people are using each platform  
  
*profileTap(int index)*  
* determines which profile was selected
*  **Returns** - Integer showing which platform was tapped.  
  
*socialTap()*  
* determines which social was tapped.
*  **Returns** - Integer showing which social media information to display.  
  
*_openDialog(String title, Widget content)*  
* Creates a popup for the user.
* **Parameters** title, content - information needed to create the dialogue

*socialWidget(String name, int count, BuildContext context)*  
* Creates a Widget for the specified social media
* **Parameters** name, count, context - information needed to create the widget.
*  **Returns** - A widget displaying the appropriate social media information.  
  
*handleCalendarRequest()*  
* Asynchronously handles requests regarding the calendar

*RemoveCurrentDate()*  
* Asynchronously pulls data from the database
*  **Returns** - 1 if the method was successful, -1 if unsuccessful.  
  
*getEventList()*  
* Asynchronously pulls data from the database
*  **Returns** - HashMap of all events from the users  

*FindNextBestDate()*  
* Asynchronously pulls data from the database
*  **Returns** - First available date available to all group members.  
  
*calendar()*  
* Asynchronously pulls data from the database
  
*share()*  
* displays the group information for others to use.  
  
*showRSVPList()*  
* displays all users expected to make the meeting.  
  
public class Explainer
============================================================================================================
**Purpose**  
The page that briefly explains Round to the user.

**Properties**  
*pageNo: int that contains information about the user's device*  
*headers: array of headers used throughout*  
  *texts: array of text used throughout*  

**Methods**  
*buttonPress(BuildContext context)*  
* Observer to see if a button is pressed.
* **Parameters** context - current page information for the user.  

*createState()*  
* Returns a state object for GroupView.  
  
public class SignIn
============================================================================================================
**Purpose**  
The page that allows the user to sign in with an existing account.

**Properties**  
*firebaseDatabase: Database information for the user.*  
*firebaseAuth: Authenticator for the user.*  
  *email: the user's email.*  
  *password: the user's password.*  

**Methods**  
*buttonPress(BuildContext context)*  
* Observer to see if a button is pressed.
* **Parameters** context - current page information for the user.  
  
*SignIn(BuildContext context)*  
* Uses credentials to sign the user in.
* **Parameters** context - current page information for the user.  
  
*changedEmail(String string)*  
* Recognizes whether a new email is used.
* **Parameters** string - new string to be used.  

*changedPassword(String string)*  
* Recognizes whether a new password is used.
* **Parameters** string - new string to be used.  

*createState()*  
* Returns a state object for GroupView.  
  
public class SignUp
============================================================================================================
**Purpose**  
The page that allows the user to sign Up with an existing account.

**Properties**  
*firebaseDatabase: Database information for the user.*  
*firebaseAuth: Authenticator for the user.*  
  *name: the user's name.*  
  *email: the user's email.*  
  *password: the user's password.*  
  *ref: A database reference to store the newly created data.*  
  *uid: the user's uid.*  

**Methods**  
*buttonPress(BuildContext context)*  
* Observer to see if a button is pressed.
* **Parameters** context - current page information for the user.  
  
*SignIn(BuildContext context)*  
* Uses credentials to sign the user in.
* **Parameters** context - current page information for the user.  
  
*changedName(String string)*  
* Recognizes whether a new name is used.
* **Parameters** string - new string to be used.  
  
*changedEmail(String string)*  
* Recognizes whether a new email is used.
* **Parameters** string - new string to be used.  

*changedPassword(String string)*  
* Recognizes whether a new password is used.
* **Parameters** string - new string to be used.  

*createState()*  
* Returns a state object for GroupView.  
  
public class Social Onboarding
============================================================================================================
**Purpose**  
The page that allows the user to enter their desired social media information.

**Properties**  
*firebaseDatabase: Database information for the user.*  
*firebaseAuth: Authenticator for the user.*  
  *insta: the user's instagram.*  
  *fb: the user's facebook.*  
  *discord: the user's discord.*  
  *snap: the user's snapchat.*  
  *sms: the user's sms number.*  

**Methods**  
*buttonPress(BuildContext context)*  
* Observer to see if a button is pressed.
* **Parameters** context - current page information for the user.  
  
*facebookChanged(String string)*  
* Recognizes whether a new facebook is used.
* **Parameters** string - new string to be used.  
  
*instagramChanged(String string)*  
* Recognizes whether a new instagram is used.
* **Parameters** string - new string to be used.  

*snapChanged(String string)*  
* Recognizes whether a new snapchat is used.
* **Parameters** string - new string to be used. 
  
*discordChanged(String string)*  
* Recognizes whether a new discord is used.
* **Parameters** string - new string to be used.  
  
*smsChanged(String string)*  
* Recognizes whether a new sms number is used.
* **Parameters** string - new string to be used.  

*createState()*  
* Returns a state object for GroupView.  

public class About
============================================================================================================
**Purpose**  
The page that displays information about Round.

**Properties**  
*title: The title of the page*  

**Methods**  
*createState()*  
* Returns a state object for AllGroups.

public class AboutState
============================================================================================================
**Properties**  
*_googleSignIn: Signs in to Google Calendar for the user.*  
*ref: A Database reference that refers to the user's currently stored events.*  

**Methods**  
*getPrimaryCalendar()*  
* Obtains all events from the user's Google Calendar, and then stores them in the database.  
  
public class EditAccountInfo
============================================================================================================
**Purpose**  
The page that allows the user to edit their account information.

**Properties**  
*title: The name of the page.*  
*ref: A Database reference that refers to the user's currently stored events.*  

**Methods**  
*createState()*  
* Returns a state object for AllGroups.

private class _EditAccountInfoState
============================================================================================================
**Properties**  
*fname: The user's first name*  
  *lname: The user's last name*  
  *email: The user's first email*  
*ref: A Database reference that refers to the user's currently stored events.*  
  *_firstNameController: The text controller that reads the user's first name*  
  *_lastNameController: The text controller that reads the user's last name*  
  *_emailController: The text controller that reads the user's email*  

**Methods**  
*getData()*  
* Asynchronous call that obtains user information from the database to be edited  
  
*saveChanges()*  
* Asynchronous call that stores user information to the database.  
  
public class Settings
============================================================================================================
**Purpose**  
The page that allows the user to edit their settings.

**Properties**  
*firebaseDatabase: Database information for the user.*  
*firebaseAuth: Authenticator for the user.*  

**Methods**  
*createState()*  
* Returns a state object for AllGroups.

private class _EditAccountInfoState
============================================================================================================
**Properties**  
*name: The user's name*  
  *email: The user's first email*  
  *snap: The user's snapchat*  
  *discord: The user's discord*
  *messages: The user's sms number*  
  *isnta: The user's instagram*  
  *fb: The user's facebook*  
  *cal: A boolean showing whether the member has integrated their calendar.* 
  *newName: The user's update name*  
  *newEmail: The user's updated email*  
  *observing: A boolean to determine whether the user viewing the page.*  
*ref: A Database reference that refers to the user's currently stored events.*  
  *_firstNameController: The text controller that reads the user's first name*  
  *_lastNameController: The text controller that reads the user's last name*  
  *_emailController: The text controller that reads the user's email*  

**Methods**  
*changedName(String string)*  
* Recognizes whether a new name is used.
* **Parameters** string - new string to be used.  
  
*changedEmail(String string)*  
* Recognizes whether a new email is used.
* **Parameters** string - new string to be used.  
  
*saveInfo()*  
* Asynchronous call that stores user information to the database.  
  
*ObserveData()*  
* Handles whether the user is an observer or not.  
  
*_handleSignIn()*
* Asynchronously handles signing into Google.

*getPrimaryCalendar()*  
* Asynchronously retrieves the primary calendar for the current user.  
  
*saveSocial(String media)*  
* Saves the social information to the appropriate platform.  
* **Parameters** media - The handle being saved.
  
*selectedSocial(String social)*  
* handles the currently selected social media platform.  
* **Parameters** media - The handle being handled.  
  
*_handleCal(BuildContext context)*
* handles GoogleCalendar information.  
* **parameters** context - The current page the user is looking at.  
  
*editProfile()*
* Allows the user to edit their profile.  
  
*about(BuildContext context)*
* Asynchronously shows the user Round's information.  
  * **parameters** context - The current page the user is looking at.  
  
*signOut()*
* Asynchronously signs the user out of their account.
  * **parameters** context - The current page the user is looking at.  
