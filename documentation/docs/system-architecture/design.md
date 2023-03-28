---
sidebar_position: 1
---

# Design

**Components**

Round is an iOS/Android application that utilizes Google Firebase for the backend, and Flutter for the frontend.

**Algorithms**

Round plans to implement a complex sorting algorithm to generate a static calendar to display the most convenient meetup times for our groups.

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
    
    HomeScreen --> HomeScreenState
    
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
