---
sidebar_position: 1
---

# Design

**Components**

Round is an iOS/Android application that utilizes Google Firebase for the backend, and Flutter for the frontend.

**Algorithms**

Round implements a sorting algorithm to display a non-invasive view of all times a group's members are busy. This will allow them to have a visual representation of general available days/times, without any extra details such as what the event times actually contain (Round only stores the start and end times of each event). Additionally, Round has the capacity to determine the next available time for a potential meeting by using these stored event times as references.

**Class Diagrams**
**Diagram 1 - Classes Related to Calendar Creation, Display, and Integration**
```mermaid
classDiagram    
    class CalendarPage {
        <<StatefulWidget>>
        +group: Map<dynamic, dynamic>?
        +title: String
    }
    _CalendarPageState--|>CalendarPage
    class _CalendarPageState{
        -allEvents: List<Appointment>
        -getData(): Future<List<Appointment>>
        -chosenDateAddedToCalendar(begTime: DateTime, finTime: DateTime, meetingName: String)
        -_googleSignIn: GoogleSignIn
        -_currentUser: GoogleSignInAccount?
        -_handleSignIn()
        -getPrimaryCalendar()
    }
    class Appointment {
        -startTime: DateTime
        -endTime: DateTime
        -subject: String?
        -color: Color?
    }
    _CalendarPageState --|> Appointment

    class CalendarSelection {
        - bool fromSettings
        - DatabaseReference ref
        - GoogleSignInAccount? _currentUser
        - GoogleSignIn _googleSignIn
        + CalendarSelection(super.key, required this.fromSettings)
        + buttonPress(BuildContext context)
        + pressedGoogle(BuildContext context): Future<void>
        + pressedApple(BuildContext context)
        + build(BuildContext context): Widget
    }

    class Calendar {
        - GoogleSignInAccount _currentUser
        - DatabaseReference ref
        - GoogleSignIn _googleSignIn
        + Calendar(Key? key)
        + getGoogleCalendar() : Future<void>
        + _handleSignIn() : Future<void>
        + initState() : void
        + build(BuildContext) : Widget
    }
    class _CalendarState {
        + initState() : void
        - final GoogleSignIn _googleSignIn
        - Future<void> _handleSignIn() : Future<void>
        + getGoogleCalendar() : Future<void>
        - late DatabaseReference ref
        - GoogleSignInAccount? _currentUser
    }
    _CalendarState--|>Calendar
```

**Diagram 2 - Classes Related to Code Generation, Usage, and Display (both QR and String)**
```mermaid
classDiagram
    class CodeReception {
        - TextEditingController groupId
        - int one
        + openDialog()
        + updateDatabase()
        + camScanner()
        + build()
    }
    class _CodeReceptionState{
        +title
    }
    CodeReception --> _CodeReceptionState

    class CodeSharing {
        - String title
        - Future<DataSnapshot> _grabGroupId()
        + void getCode()
        + Widget build(BuildContext context)
        }
    class _CodeSharingState{
        + void getCode()
        + Widget build(BuildContext context)
    }
    CodeSharing --> _CodeSharingState

    class DisplayCode {
        -List<dynamic> groupName
        -List<dynamic> nameId
        +DisplayCode(groupName, nameId, key)
        +buildList(groupName, nameId)
        +build(BuildContext): Widget
    }

    class NewQR {
        - scanning: bool
        + scanQR(context: BuildContext): void
        + build(context: BuildContext): Widget
        - updateDatabase(groupID): void
    }

    class Display{
        -final groupName: String
        -final nameId: String
        +Display(groupName: String, nameId: String)
        +build(context: BuildContext): Widget
    }
```

**Diagram 3 - Classes Related to Group Creation, Display, and Usage**
```mermaid
classDiagram
    class AllGroups {
        - final String title
        - final DatabaseReference ref
        - late DatabaseReference ref
        - final String? uid
        + grabGroups() : Future<List<Map>>
        - firebaseDatabase : FirebaseDatabase
        + build(context: BuildContext) : Widget
    }
    class _AllGroupsState {
        - late DatabaseReference ref = widget.ref
        + grabGroups() : Future<List<Map>>
        - firebaseDatabase : FirebaseDatabase
        + build(context: BuildContext) : Widget
    }
    AllGroups --> _AllGroupsState

    class GroupCreation {
        - final String? userID
        - final FirebaseDatabase firebaseDatabase
        - MaterialColor? selectedColor
        - MaterialColor? tempColor
        - String name
        - String emoji
        - DatabaseReference ref
        - String? uid
        + GroupCreation(super.key, required this.userID, required this.firebaseDatabase)
        + changedName(string: String): void
        + changedEmoji(string: String): void
        + buttonPress(context: BuildContext): Future<void>
        + _openDialog(title: String, content: Widget): void
        + colorTapped(): void
        - createMaterialColor(color: Color): MaterialColor
        - _GroupCreationState()
        + createState(): _GroupCreationState
    }

    class _GroupCreationState {
        + _GroupCreationState()
        + createMaterialColor(color: Color): MaterialColor
    }    
    GroupCreation --> _GroupCreationState


    class NewGroupView {
        -RoundGroup group
    }
    class _NewGroupView {
        -List<GroupMember> parsedMembers
        -List<GroupMember> rsvped
        -int smsCount
        -int snapCount
        -int discordCount
        -int instaCount
        -int fbCount
        -int calCount
        -bool isObserving
        -bool isAdmin
        -DateTime? appointment
        - int appointmentIndex = 0
        + handleCalendarRequest() : void
        + removeCurrentDate() : Future<int>
        + getEventList() : Future<List<Appointment>>
        + findNextBestDate() : Future<List<DateTime>>
        + calendar() : void
        +NewGroupView(group, super.key)
        +_NewGroupView(group)
        +Future<void> observeGroup()
        +Future<DateTime?> getFirstDate()
        +void triggerDelete()
        +State<NewGroupView> createState()
    }
    class GroupMember {
        -String uid
        -String name
        -String email
        -String? snapchat
        -String? sms
        -String? discord
        -String? instagram
        -String? facebook
        -bool? hasCalendar
        +GroupMember(uid, name, email, snapchat, sms, discord, instagram, facebook, hasCalendar)
    }

    class Appointment {
        - DateTime startTime
        - DateTime endTime
    }

    NewGroupView --> _NewGroupView
    _NewGroupView --> GroupMember
    _NewGroupView --> Appointment
```

**Diagram 4 - Classes Related to the Onboarding Process**
```mermaid
classDiagram
    class Explainer{
        -pageNo: int
        -headers: String[]
        -texts: String[]
        -images: String[]
        +buttonPress(context: BuildContext): void
        +build(context: BuildContext): Widget
    }
    class SignIn {
        + SignIn(super.key, required this.firebaseDatabase, required this.firebaseAuth)
        - final FirebaseDatabase firebaseDatabase
        - final FirebaseAuth firebaseAuth
        - String email
        - String password
        + Future<void> buttonPress(BuildContext context)
        - void signIn(BuildContext context)
        - void changedEmail(String string)
        - void changedPassword(String string)
        + Widget build(BuildContext context)
    }
    class SignUp {
        -FirebaseDatabase firebaseDatabase
        -FirebaseAuth firebaseAuth
        #String name
        #String email
        #String password
        #DatabaseReference ref
        #String? uid
        +void changedName(String string)
        +void changedEmail(String string)
        +void changedPassword(String string)
        +Future<void> buttonPress(BuildContext context)
        +void signIn(BuildContext context)
        +Widget build(BuildContext context)
    }
    class SocialOnboarding {
        -FirebaseDatabase firebaseDatabase
        -FirebaseAuth firebaseAuth
        -String insta = ""
        -String fb = ""
        -String discord = ""
        -String snap = ""
        -String sms = ""
        +void facebookChanged(String string)
        +void instagramChanged(String string)
        +void discordChanged(String string)
        +void snapChanged(String string)
        +void smsChanged(String string)
        +void buttonPress(BuildContext context)
        -DatabaseReference databaseReference
        +Widget build(BuildContext context)
    }
```
**Diagram 5 - Classes Related to User Settings**
```mermaid
classDiagram
    class About {
    - Key? key
    - final String title
    + State<About> createState()
    }

    class AboutState {
    - DatabaseReference ref
    - final GoogleSignIn _googleSignIn
    - GoogleSignInAccount? _currentUser
    + void initState()
    + Future<void> getPrimaryCalendar()
    + Widget build(BuildContext context)
    }

    About --> AboutState

    class AddEvent {
    - late DateTime start
    - late DateTime end
    - late DatabaseReference ref
    + AddEvent(Key? key, required this.title, required this.ref)
    + final String title
    + @override State<AddEvent> createState()
    }

    class _AddEventState {
    - late DateTime start
    - late DateTime end
    - late DatabaseReference ref
    + @override void initState()
    + @override Widget build(BuildContext context)
    }

    AddEvent --> _AddEventState

    class EditAccountInfo{
        +String title  
        +DatabaseReference ref
    }
    class _EditAccountInfoState{
        -String fName
        -String lName
        -String email
        -DatabaseReference ref
        -TextEditingController _firstNameController
        -TextEditingController _lastNameController
        -TextEditingController _emailController
        +void initState()
        +void getData()
        +void saveChanges()
        +Widget build(BuildContext context)
    }
    EditAccountInfo --> _EditAccountInfoState

    class _Settings {
        - String name = ""
        - String email = ""
        - String? snap
        - String? messages
        - String? discord
        - String? insta
        - String? fb
        - bool? cal
        - String newName = ""
        - String newEmail = ""
        - bool observing = false
        + void changedName(newName:String)
        + void changedEmail(newEmail:String)
        + void legacySettings()
        + void saveInfo()
        + void observeData()
        + void socialChanged(text:String)
        + Future<void> getPrimaryCalendar()
    }
    class Settings {
        -FirebaseDatabase firebaseDatabase
        -FirebaseAuth firebaseAuth
        +Settings(super.key, firebaseDatabase:FirebaseDatabase, firebaseAuth:FirebaseAuth)
        +State<StatefulWidget> createState()
    }

    Settings --> _Settings
```

**Diagram 6 - Classes Related to the User's Individual Homepage and Usage**
```mermaid

```

**Diagram 7 - Dependencies Between all Classes seen in Diagrams 1-6**
```mermaid

```

**Diagram 8 - General Relationship Between State, StatefulWidget, and the way classes utilize them.**
```mermaid
classDiagram
    class State
    class StatefulWidget
    
    class GenericPage
    class _GenericPageState
    
    GenericPage --|> StatefulWidget
    note for State "Library in Flutter"
    note for StatefulWidget "Library in Flutter"
    _GenericPageState --|> State
    GenericPage --> _GenericPageState
```

**Sequence Diagrams**
**Use Case 1: Registration**
```mermaid
sequenceDiagram
    actor User
    User->>Round: Open application
    User->>+Round: Registers using form field
    Round->>+FirebaseAuthentication: createUserWithEmailAndPassword()
    FirebaseAuthentication->>+RealtimeDatabase: Creates a new entry
    RealtimeDatabase-->>-FirebaseAuthentication: Creation Successful
    FirebaseAuthentication-->>-Round: Account Created
    Round-->>-User: Prompts to confirm email address
    User->>+Round: Validates email address
    Round-->>-User: Confirms validation, thanks user
```
**Use Case 2: Login**
```mermaid
sequenceDiagram
    actor User
    User->>Round: Open application
    User->>+Round: Login
    Round->>+FirebaseAuthentication: signInWithEmailAndPassword()
    FirebaseAuthentication->>+RealtimeDatabase: Queries Database
    RealtimeDatabase-->>-FirebaseAuthentication: Query Successful
    FirebaseAuthentication-->>-Round: Account found
    Round->>+RealtimeDatabase: Queries for any linked social media
    RealtimeDatabase-->>-Round: No results found
    Round-->>-User: Prompts user to link social media
    User->>+Round: Validates social media accounts
    Round->>+RealtimeDatabase: adds accounts to entry
    RealtimeDatabase-->>-Round: entry updated
    Round-->>-User: Thanks user for information
```
**Use Case 3: Event Creation**
```mermaid
sequenceDiagram
    actor User
    participant Round App
    participant Firebase Authentication
    participant Realtime Database

    User->>+ Round App: login()
    Round App->>+Firebase Authentication: signInWithEmailAndPassword()
    User->>+Round App: Presses button to create a new group
    Round App -->> User: Prompts user for group information
    User->>+Round App: Enters group information
    Round App->>+Realtime Database : Update information to group settings
```
**Use Case 4: Invite Other Users**
```mermaid
sequenceDiagram
    actor User1
    actor User2
    participant Round App
    participant Realtime Database
    
    User1->>+Round App: Presses button to create a new group
    Round App -->> User1: Prompts user for group information
    User1->>+Round App: Enters group information
    Round App->>+Realtime Database : Update information to group settings
    Round App ->>+ Round App: QR code/link/code is generated
    User2->>+ User2: Scan the QR code and click the link
    User2->>+ Round App: Join scheduling group
```
**Use Case 5: Time Block Selection**
```mermaid
sequenceDiagram
    actor user
    actor groupchat
    actor user3
    user-->>+groupchat: Sends link for installation
    groupchat-->>+App/Play Store: brings to dowload
    App/Play Store-->>+Round App: Brings to Round App
    Round App->>-groupchat: Prompts Users to Sign Up
    groupchat->>+Round App: Signs up
    Round App-->>+Database: Updates Database Info
    Round App->>+groupchat: Prompts User to Sync Google Calendar
    groupchat->>+Round App: Confirm Syncing of Calendar
    Round App->>+Google Calendar: Request Calendar Info
    Google Calendar->>-Round App: Send's Calendar Info
    Round App->>+user3: Request to Sync Calendar
    user3->>+Round App: Denies Requests
    Round App->>+Round App: Syncs Calendar Info
    Round App->>+Round App: Places Participants in Group
    Round App->>+user3: Prompts User to Selected From Static Calendar
    user3->>+Round App: User Completes Calendar Filling Request
    Round App->>+Round App: Finalizes Calendar
    Round App->>+Round App: Publishes Times of Best Fitted Availability in Internalize Group
``` 
**Use Case 6: Last Second Changes**
```mermaid
sequenceDiagram
    actor Group
    actor UserX
    actor UserY
    participant Round App

    Group->>Round App: All users join the group
    Round App->>+ Round App: Static Calendar is generated with everyone's schedules
    UserX->>Round App: Selects "green" time (where everyone is available), clicking on the time and proposing it
    Round App->>Group: Sends notifications to all members, asking for time approval
    Group->>Round App: All users approve meeting time
    UserY->>Round App: User later realizes that they actually cannot make that time
    UserY->>Round App: Cancels the current meeting time
    Round App->>Group: Sends notifications to all members
    Round App->>Group: Notification includes notice of cancellation and suggestion for next best time to meet

```
**Use Case 7: Modification of Project Lifespan**
```mermaid
sequenceDiagram
    actor User
    actor UserX
    participant System

    User->>System: Logs in
    User->>System: Navigates to Group Settings
    User->>System: Selects Longevity
    System->>User: Prompts user with add new, change existing, or delete current timeline options
    User->>System: Chooses Change Existing
    System->>User: Prompts user with calendar
    User->>System: User selects new timeline date
    User->>System: User saves new timeline
    System->>UserX: Sends message to Group Chat with new timeline adjustments
    UserX->>System: Receives message from System
    System->>User: Confirms change of timeline
```
**Use Case 8: Push Notifications and Reminders**
```mermaid
sequenceDiagram
    actor User
    participant Round App
    participant Message Server

    Round App->>User: Receives a meeting reminder message
    User->>Round App: Taps on the message
    Round App->>Message Server: Fetches details about the meeting
    Message Server->>Round App: Return details about the meeting
    Round App->>User: Shows a pop-up message with meeting details
    User->>Round App: Taps on the active status
    Round App->>User: Shows a description of the status
    User->>Round App: Clicks on the "X" button
    Round App->>User: Closes the pop-up menu
    User->>Round App: Returns to the app's home page
    Round App->>User: Brings user back to homepage
```
Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc.

If there is a database:

**Entity-relation diagram
```mermaid
erDiagram
    Users{
        string uid 
        string name
        string email    
        Object socialMedia[]
        string teamIds[]
    }
    Teams{
        string teamId 
        string teamName
        string teamAdmin
        string uids[]
    }
    Users }|..|{ Teams: have
   ```

Table design.

A check list for architecture design is attached here [architecture\_design\_checklist.pdf](https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1 "architecture_design_checklist.pdf")  and should be used as a guidance.
