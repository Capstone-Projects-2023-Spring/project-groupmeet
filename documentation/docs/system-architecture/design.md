---
sidebar_position: 1
---

**Components**

GroupMeet is a iOS/Android application that utilizes Google Firebase for the backend, and Flutter for the frontend.

**Algorithms**

GroupMeet plans to implement a complex sorting algorithm to generate a static calendar to display the most convenient meetup times for our groups.

**Class Diagrams**
**Diagram 1 - Individual-Related Classes**
```mermaid
classDiagram
    class MyApp{
      -key
      +build(context)
    }

    class HomeScreen{
      +title
      +createState()
    }

    class HomeScreenState{
        +ref
        +initState()
        +logout()
        +build(context)
    }
    
    class LoginScreen{
      +createState()
    }

    class LoginScreenState{
        -_usernameController
        -_passwordController
        -_isUsernameValid
        -_isPasswordValid
        -_navigateToHomeScreen()
        -_login()
        +build(context)
    }
    
    LoginScreen-->LoginScreenState
    
    class SocialMedia{
      +title
      +databaseReference
      +createState()
    }

    class _SocialMediaState{
        +databaseReference
        +instaSelect
        +fbSelect
        +discordSelect
        +messageSelect
        +snapSelect
        +initState()
        +getData()
        +build(context)
    }
    
    SocialMedia-->_SocialMediaState
    
    class AccountInfo{
        +ref
        +title
        +createState()
    }

    class _AccountInfoState{
        +email
        +name
        +ref
        +initState()
        +getData()
        +build(context)
    }

    AccountInfo-->_AccountInfoState

    class AllGroups{
        +ref
        +title
        +createState()
    }

    class _AllGroupsState{
        +ref
        +uid
        +grabGroups()
        +build(context)
    }

    AllGroups-->_AllGroupsState

    class CodeReception{
        +title
        +createState()
    }

    class _CodeReceptionState{
        -_hash
        -_key
        -_scannedCode
        +data
        +keep
        +one
        +getQR()
        +build(context)
    }

    CodeReception-->_CodeReceptionState

    class CreateAccount{
        +title
        +createState()
    }

    class _CreateAccountState{
        -_emailController
        -_passwordController
        -_fnameController
        -_lnameController
        +ref
        +uid
        +createUserProfile()
        +build()
    }

    CreateAccount-->_CreateAccountState

    class EditAccountInfo{
        +title
        +ref
        +createState()
    }

    class _EditAccountInfoState{
        -firstNameController
        -lastNameController
        -emailController
        +email
        +fName
        +lName
        +ref
        +getData()
        +initState()
        +saveChanges()
        +build()
    }

    EditAccountInfo-->_EditAccountInfoState
    
    MyApp-->MyHomePage
    _MyHomePageState<--MyHomePage
```

**Diagram 2 - Group-related Classes**
```mermaid
classDiagram    
    class GroupCreation{
        +groupTitle
        +createState()
    }

    class _GroupCreationState{
        -_groupNameController
        -_numMembersController
        -_formKey
        +initState()
        +createGroupLinkUser()
        +build()
    }

    GroupCreation-->_GroupCreationState

    class GroupHomePage{
        +title
        +databaseReference
        +myGroup
        +createState()
    }

    class _GroupHomePageState{
        +databaseReference
        +instaCount
        +fbCount
        +discordCount
        +messagesCount
        +snapCount
        +initState()
        +leaveGroup()
        +getData()
        +grabGroupMembers()
        +build()
    }

    GroupHomePage-->_GroupHomePageState
```

**Diagram 3**
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
    User->>GroupMeet: Open application
    User->>+GroupMeet: Registers using form field
    GroupMeet->>+FirebaseAuthentication: createUserWithEmailAndPassword()
    FirebaseAuthentication->>+RealtimeDatabase: Creates a new entry
    RealtimeDatabase-->>-FirebaseAuthentication: Creation Successful
    FirebaseAuthentication-->>-GroupMeet: Account Created
    GroupMeet-->>-User: Prompts to confirm email address
    User->>+GroupMeet: Validates email address
    GroupMeet-->>-User: Confirms validation, thanks user
```
**Use Case 2: Login**
```mermaid
sequenceDiagram
    actor User
    User->>GroupMeet: Open application
    User->>+GroupMeet: Login
    GroupMeet->>+FirebaseAuthentication: signInWithEmailAndPassword()
    FirebaseAuthentication->>+RealtimeDatabase: Queries Database
    RealtimeDatabase-->>-FirebaseAuthentication: Query Successful
    FirebaseAuthentication-->>-GroupMeet: Account found
    GroupMeet->>+RealtimeDatabase: Queries for any linked social media
    RealtimeDatabase-->>-GroupMeet: No results found
    GroupMeet-->>-User: Prompts user to link social media
    User->>+GroupMeet: Validates social media accounts
    GroupMeet->>+RealtimeDatabase: adds accounts to entry
    RealtimeDatabase-->>-GroupMeet: entry updated
    GroupMeet-->>-User: Thanks user for information
```
**Use Case 3: Event Creation**
```mermaid
sequenceDiagram
    actor User
    participant GroupMeet App
    participant Firebase Authentication
    participant Realtime Database

    User->>+ GroupMeet App: login()
    GroupMeet App->>+Firebase Authentication: signInWithEmailAndPassword()
    User->>+GroupMeet App: Presses button to create a new group
    GroupMeet App -->> User: Prompts user for group information
    User->>+GroupMeet App: Enters group information
    GroupMeet App->>+Realtime Database : Update information to group settings
```
**Use Case 4: Invite Other Users**
```mermaid
sequenceDiagram
    actor User1
    actor User2
    participant GroupMeet App
    participant Realtime Database
    
    User1->>+GroupMeet App: Presses button to create a new group
    GroupMeet App -->> User1: Prompts user for group information
    User1->>+GroupMeet App: Enters group information
    GroupMeet App->>+Realtime Database : Update information to group settings
    GroupMeet App ->>+ GroupMeet App: QR code/link/code is generated
    User2->>+ User2: Scan the QR code and click the link
    User2->>+ GroupMeet App: Join scheduling group
```
**Use Case 5: Time Block Selection**
```mermaid
sequenceDiagram
    actor user
    actor groupchat
    actor user3
    user-->>+groupchat: Sends link for installation
    groupchat-->>+App/Play Store: brings to dowload
    App/Play Store-->>+GroupMeet App: Brings to GroupMeet App
    GroupMeet App->>-groupchat: Prompts Users to Sign Up
    groupchat->>+GroupMeet App: Signs up
    GroupMeet App-->>+Database: Updates Database Info
    GroupMeet App->>+groupchat: Prompts User to Sync Google Calendar
    groupchat->>+GroupMeet App: Confirm Syncing of Calendar
    GroupMeet App->>+Google Calendar: Request Calendar Info
    Google Calendar->>-GroupMeet App: Send's Calendar Info
    GroupMeet App->>+user3: Request to Sync Calendar
    user3->>+GroupMeet App: Denies Requests
    GroupMeet App->>+GroupMeet App: Syncs Calendar Info
    GroupMeet App->>+GroupMeet App: Places Participants in Group
    GroupMeet App->>+user3: Prompts User to Selected From Static Calendar
    user3->>+GroupMeet App: User Completes Calendar Filling Request
    GroupMeet App->>+GroupMeet App: Finalizes Calendar
    GroupMeet App->>+GroupMeet App: Publishes Times of Best Fitted Availability in Internalize Group
``` 
**Use Case 6: Last Second Changes**
```mermaid
sequenceDiagram
    actor Group
    actor UserX
    actor UserY
    participant GroupMeet App

    Group->>GroupMeet App: All users join the group
    GroupMeet App->>+ GroupMeet App: Static Calendar is generated with everyone's schedules
    UserX->>GroupMeet App: Selects "green" time (where everyone is available), clicking on the time and proposing it
    GroupMeet App->>Group: Sends notifications to all members, asking for time approval
    Group->>GroupMeet App: All users approve meeting time
    UserY->>GroupMeet App: User later realizes that they actually cannot make that time
    UserY->>GroupMeet App: Cancels the current meeting time
    GroupMeet App->>Group: Sends notifications to all members
    GroupMeet App->>Group: Notification includes notice of cancellation and suggestion for next best time to meet

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
    participant GroupMeet App
    participant Message Server

    GroupMeet App->>User: Receives a meeting reminder message
    User->>GroupMeet App: Taps on the message
    GroupMeet App->>Message Server: Fetches details about the meeting
    Message Server->>GroupMeet App: Return details about the meeting
    GroupMeet App->>User: Shows a pop-up message with meeting details
    User->>GroupMeet App: Taps on the active status
    GroupMeet App->>User: Shows a description of the status
    User->>GroupMeet App: Clicks on the "X" button
    GroupMeet App->>User: Closes the pop-up menu
    User->>GroupMeet App: Returns to the app's home page
    GroupMeet App->>User: Brings user back to homepage
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
