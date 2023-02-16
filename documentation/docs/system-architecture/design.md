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

Use Case 2: Event Creation
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
Use Case 3: Invite Other Users
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

Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc.

If there is a database:

Entity-relation diagram.

Table design.

A check list for architecture design is attached here [architecture\_design\_checklist.pdf](https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1 "architecture_design_checklist.pdf")  and should be used as a guidance.
