---
sidebar_position: 2
---
# Integration tests

**Use case 1**
-Description: User is able to successfully register with GroupMeet
-Objective: Verify that firebase is storing user-entered input
-Expected Test Result: Entered email is available for login

**Use case 2**
-Description: User is able to log in to the app using their newly created information
-Objective: Verify that firebase Authentication is working
-Expected Test Result: User is able to log in and see their home screen.

**Use case 3**
-Description: User is able to create a group
-Objective: Verify user-created groups are stored appropriately within firebase
-Expected Test Result: Groups are created and registered to the originating user.

**Use case 4**
-Description: User can invite others to joine their group
-Objective: Verify other users can join an already existing group
-Expected Test Result: Users are linked to a pre-existing group

**Use case 5**
-Description: Users can manually enter in times that they are busy
-Objective: Verify the integrated calendar can account for manually entered dates
-Expected Test Result: Calendar can successfully account for dates that are entered in by hand.

**Use case 6**
-Description: Users can cancel a meeting
-Objective: Verify that one user cancelling a meeting is recognized by all users
-Expected Test Result: A change to a previously good date will lead to the generation of a new "good" date.

**Use case 7**
-Description: The lifespan of a group can be modified.
-Objective: Verify the lifespan of a group can be actively modified to end at an earlier/later date.
-Expected Test Result: Groups exist for as long as they are needed.

**Use case 8**
-Description: Users can be notified of their upcoming meeting
-Objective: Verify that push notifications go out to the users at the expected times
-Expected Test Result: Users receive push notifications at expected intervals prior to the meeting start.
