---
sidebar_position: 3
---

# Schedule

```mermaid
gantt
    title GroupMeet Development Cycle
    dateFormat  YYYY-MM-DD
    excludes 2023-03-07 2023-03-08 2023-03-09 2023-03-10 2023-03-11 2023-03-12
        section Development 
         Sprint 0: , 2023-02-08, 1w
        section Development 
         Firebase prototype integration to app:  done, 2023-02-08, 1d
        section Development 
         Create Account Page UI:  done, 2023-02-09, 3d
        section Development 
         Firebase test db established:  done, 2023-02-08,4d
        section Development 
         Generate Welcome Page:  done, 2023-02-08, 4d
        section Development 
         Account Creation Page information:  done, 2023-02-08, 6d
        section Development 
         Establish Google Firebase:  done, 2023-02-08, 6d
        section Development 
         Integrate Firebase:  done, 2023-02-08, 6d
        section Development 
         Documentation Maintenance:  done, 2023-02-08, 1w
        section Development 
         Generate foundational app features:  done, 2023-02-08, 1w
        section Development 
         Software Development Plan Assignment: milestone, done, 2023-02-12, 1d
         
        section Development 
         Sprint 1: , 2023-02-15, 2w
        section Development 
         Design Prototype:  , 2023-02-08, 3w
        section Development 
         Foundational social media integration:  , 2023-02-15, 2w
        section Development 
         Group creation Development:  , 2023-02-15, 2w
        section Development 
         Code/link sharing feature Development:  , 2023-02-15, 2w
        section Development 
         Design Document Part 1 (Architecture) Assignment: milestone, , 2023-02-19, 1d
        section Development 
         Design Document Part 2 (API) Assignment: milestone, , 2023-02-26, 1d
         
        section Development 
         Sprint 2: , 2023-03-01, 1w
        section Development 
         Create group finalization algorithms & procedures:  , 2023-03-01, 1d
        section Development 
         Test Procedures Document Assignment: milestone, , 2023-03-05, 1d
        section Development 
         Spring Break (no classes held): done, 2023-03-06, 1d
        section Development 
         Milestone Demo 1 :crit, milestone,  , 2023-03-14, 1d
         
        section Development 
         Sprint 3: , 2023-03-15, 2w
        section Development 
         Establish Google Calendar sync integration:  , 2023-03-15, 1d
        section Development 
         Milestone Demo 2 :crit, milestone,  , 2023-03-28, 1d
         
        section Development 
         Sprint 4: , 2023-03-29, 2w
        section Development 
         Develop misc. features to fulfill various scenarios in user flow:  , 2023-03-29, 1d
        section Development 
         Notification integration:  , 2023-03-29, 1d
        section Development 
         Milestone Demo 3 :crit, milestone,  , 2023-04-11, 1d
         
        section Development 
         Sprint 5: , 2023-04-12, 16d
        section Development 
         App finalizations and alloted time to integrate optional desired features:  , 2023-04-12, 1d
        section Development 
         Final Presentation & Demo :crit, milestone,  , 2023-04-27, 1d
        section Development 
         Test Report Document Assignment: milestone, , 2023-05-06, 1d
        section Development 
         Final Software Release Assignment: milestone, , 2023-05-07, 1d
        section Development 
         Final Grade Submissions ???? :  , 2023-05-12, 1d
        
```
## Milestone 1 Deliverables:
- F1: Account Management
    - R1: User is able to register new account.
    - R2: User is able to login with an existing account.
    - R3: User is able to update their account name, profile image, and email address.
    - R4: User is able to view their account information.
    - R5: User can list all social media platforms they want to use.
- F2: Group creation
    - R1. Team creator is presented with a QR Code to invite group members.
    - R2. Team member is presented with a QR scanner to join their group.
    - R3. Users can see a list of all of their group members.
    - R4. Users can see a list of their groups.
- F3: Social Media
    - R1: User is able to broadcast the most common/prefered platform of the group

## Milestone 2 Deliverables:
- F4: Group Availability Functionality
    - R1: Upon creation of a group, the user is able to enter dates in which they are free for a group meetings.
    - R2: Group members are presented with a list of available time slots in which they could meet on a certain day.
- F5: Calendar Integration
    - R1: A user is able to import their events from calendar services iCal, Google Calendar, and Outlook from at least one calendar source.
    - R2: Able to combine multiple of the same kind of calendar
    - R3: The system should be able to add a calendar event to their associated calendar on the users behalf.
    - R4: The team should be presented with a group calendar in which they can create events.
- F6: Push notifications to user
    - R1: The system is able to notify users of an upcoming meeting.


## Milestone 3 Deliverables:
- F7: Calendar Integration
    - R1: A user can input a last minute change to their calendar, which is able to cancel an already existing time slot to meet up.
    - R2: A user can import their events from more than one calendar.
    - R3: Able to find new time if first time does not work
- F8: Push notification to user
    - R1: Able to notify user of time being cancelled, and prompt with new time
    - R2: User is notified that previous time slot was cancelled, and a new one has been found.
- F9: Social Media
    - R1: The system will create a group chat based on the groups preferred messaging platform selection.
    - R2: if the group selects a messaging service that cannot be automatically generated, the application will to generate a list of the groups, user names and copy them to the group organizer's clipboard.
    - R3: The user will be deeplinked/redirected to the groups prefered messaging platform. 
