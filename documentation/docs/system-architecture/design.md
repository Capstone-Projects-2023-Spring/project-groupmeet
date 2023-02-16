---
sidebar_position: 1
---

**Purpose**

The Design Document - Part I Architecture describes the software architecture and how the requirements are mapped into the design. This document will be a combination of diagrams and text that describes what the diagrams are showing.

**Requirements**

In addition to the general requirements the Design Document - Part I Architecture will contain:

A description the different components and their interfaces. For example: client, server, database.

For each component provide class diagrams showing the classes to be developed (or used) and their relationship.

Sequence diagrams showing the data flow for _all_ use cases. One sequence diagram corresponds to one use case and different use cases should have different corresponding sequence diagrams.
**Use Case 1: Registration**
<!-- ```mermaid
    TODO
``` -->
**Use Case 2: Event Creation**
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
**Use Case 3: Invite Other Users**
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
**Use Case 4: Time Block Selection**
<!-- ```mermaid
    TODO
``` -->
**Use Case 5: Last Second Changes**
<!-- ```mermaid
    TODO
``` -->
**Use Case 6: Modification of Project Lifespan**
```mermaid
sequenceDiagram
    actor User
    participant System
    participant Group_Chat

    User->>System: Logs in
    User->>System: Navigates to Group Settings
    User->>System: Selects Longevity
    System->>User: Prompts user with add new, change existing, or delete current timeline options
    User->>System: Chooses Change Existing
    System->>User: Prompts user with calendar
    User->>System: User selects new timeline date
    User->>System: User saves new timeline
    System->>Group_Chat: Sends message to Group Chat with new timeline adjustments
    Group_Chat->>System: Receives message from System
    System->>User: Confirms change of timeline
```
**Use Case 7: Push Notifications and Reminders**
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

Entity-relation diagram.

Table design.

A check list for architecture design is attached here [architecture\_design\_checklist.pdf](https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1 "architecture_design_checklist.pdf")  and should be used as a guidance.
