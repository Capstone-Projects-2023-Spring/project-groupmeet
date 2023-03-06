---
sidebar_position: 2
---
# Integration tests

**Use case 1**<br/>
-Description: User is able to successfully register with GroupMeet<br/>
-Objective: Verify that firebase is storing user-entered input<br/>
-Expected Test Result: Entered email is available for login<br/>

**Use case 2**<br/>
-Description: User is able to log in to the app using their newly created information<br/>
-Objective: Verify that firebase Authentication is working<br/>
-Expected Test Result: User is able to log in and see their home screen.<br/>

**Use case 3**<br/>
-Description: User is able to create a group<br/>
-Objective: Verify user-created groups are stored appropriately within firebase<br/>
-Expected Test Result: Groups are created and registered to the originating user.<br/>

**Use case 4**<br/>
-Description: User can invite others to joine their group<br/>
-Objective: Verify other users can join an already existing group<br/>
-Expected Test Result: Users are linked to a pre-existing group<br/>

**Use case 5**<br/>
-Description: Users can manually enter in times that they are busy<br/>
-Objective: Verify the integrated calendar can account for manually entered dates<br/>
-Expected Test Result: Calendar can successfully account for dates that are entered in by hand.<br/>

**Use case 6**<br/>
-Description: Users can cancel a meeting<br/>
-Objective: Verify that one user cancelling a meeting is recognized by all users<br/>
-Expected Test Result: A change to a previously good date will lead to the generation of a new "good" date.<br/>

**Use case 7**<br/>
-Description: The lifespan of a group can be modified.<br/>
-Objective: Verify the lifespan of a group can be actively modified to end at an earlier/later date.<br/>
-Expected Test Result: Groups exist for as long as they are needed.<br/>

**Use case 8**<br/>
-Description: Users can be notified of their upcoming meeting<br/>
-Objective: Verify that push notifications go out to the users at the expected times<br/>
-Expected Test Result: Users receive push notifications at expected intervals prior to the meeting start.<br/>
