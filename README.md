[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-f4981d0f882b2a3f0472912d15f9806d57e124e0fc890972558857b51b24a6f9.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=9951177)

<div align="center">

# GroupMeet

[![Report Issue on Jira](https://img.shields.io/badge/Report%20Issues-Jira-0052CC?style=flat&logo=jira-software)](https://temple-cis-projects-in-cs.atlassian.net/jira/software/c/projects/DT/issues) [![Deploy Docs](https://github.com/ApplebaumIan/tu-cis-4398-docs-template/actions/workflows/deploy.yml/badge.svg)](https://github.com/ApplebaumIan/tu-cis-4398-docs-template/actions/workflows/deploy.yml) [![Documentation Website Link](https://img.shields.io/badge/-Documentation%20Website-brightgreen)](https://capstone-projects-2023-spring.github.io/project-groupmeet/)

</div>

<h2> Keywords </h2>

Section 704, iOS App, Android App, AIO Collaboration Tool, Group Projects, Friend Group Scheduling, Contact Information Share, Code-Based, Scheduling Algorithm

<h2> Project Abstract </h2>

This document proposes a multi-platform mobile application called "GroupMeet" that creates an environment for students and social groups to easily organize each other's schedules for availability and share contact information. In academic group projects, students will be able to easily begin communications with each other and synchronize with each other's schedules to become more successful in their academic endeavors. In social groups, friends can now easily coordinate each other's busy lives and adjust accordingly to spontaneous events. With this application, there is little need for one particular individual to take charge; the responsibility lies on the application itself.

<h2> High Level Requirement </h2>

This application will run on a simplistic overall design, prioritizing an easy and fluent user experience above all else. Users who download our application on the app store would need to create a profile/account and add at least one social media account to it, whether it be phone number, Discord, Twitter, Instagram, Snapchat, etc. After setting up their contact information, the users will have an option to set up or sync a static calendar to show their availability. Syncing a static calendar from a product like Google Calendars will not share the specific details about each event in the calendar, just the dates/times. After these steps, the user will be set up and ready to use the application when needed for group projects or friend groups.

When the application is needed, the user will have to create an instance that generates a code – this code will be used by other participants of the event to join in. Upon joining/creating the group, individual users will choose at least one of their social media profiles to share with privacy in mind. After everyone joins the instance, a universal calendar will automatically be generated that shows dates/times available for all participants. If a user did not set up a static calendar, that specific user will be asked to update their calendar. If the partially generated calendar is found to have very strict scheduling, the previously mentioned user will be asked by the application if specific times work based on the aforementioned calendar. Throughout the instance's lifecycle, users can update any spontaneous events that occur causing them to be unavailable. When this occurs, all other users will be prompted and the application will make suggestions for the next best option, or any compromises if there truly is no other time that works.

<h2> Conceptual Design </h2>

IGroupMeet's programming environment will be in Dart using the Flutter framework. This will allow the application to be developed for both iOS and Android devices simultaneously. This is to ensure that the only requirement to use our application is owning a smartphone so that the most users can be reached and assisted with GroupMeet. As for hosting of the application, there is currently an attempt to acquire the necessary physical hardware, however this is a situation that can be circumnavigated. The backend will be utilizing a known cloud service such as AWS or Firebase.

<h2> Background </h2>

Throughout one's academic career, it has been shown time and time again that one of the most consistently troublesome procedures experienced is getting assigned a group project and getting the flow of communication going. While this particular task can be daunting on it's own, it can become an even more daunting task when there are inevitable schedule conflicts. Even outside of the academic life, these same scheduling conflicts can be found during the coordination of recreational events with friends and family. The seemingly simple task of "kicking back with the friends" risks becoming a logistical nightmare. 

In the two scenarios above, the task of trying to find a block of time that works for everyone tends to be a very daunting one. Additionally, this particular task tends to be assigned to one unlucky individual. It can be assumed with a wide margin of certainty that if one with this assignment had the ability to make a task that can seem impossible at times, possible, they would be interested in resources that would aid in this daunting assignment.

Similar products to GroupMeet include official calendars with calendar sync integration like Google Calendars, or Calendar ([https://www.calendar.com/](https://www.calendar.com/)) which has dynamic scheduling integration. However, many of the latter's features are locked behind a paywall. This creates a very unfortunate problem where paying for a "premium" feature is just not convenient enough for short-term use. Additionally, combining calendars typically tends to mean the event details are shared in some shape or form, implying that all who have their calendars integrated in a setting previously mentioned risk having other friends and associates aware of exactly what is occurring at any point in one's personal life. This is a scenario that should be avoided as much as possible, as the sharing of personal or public information should be completely at ones own discretion rather than as a necessity to set up a meeting time for a task. GroupMeet aspires to make calendar sync integration an easy and seamless process with privacy in mind.

<h2> Required Resources </h2>

Experience with Mobile App Development would be optimal for all group members. If every member has experience with Flutter specifically, that would be the best. This application prioritizes user experience, so members should keep that in mind as well. If no local hardware is available immediately from any participant, a cloud service like AWS or Firebase will most likely be the designated hosting service.

<h2> Collaborators </h2>

Athan Kim, Jerrell Lewis, Jared Stefanowicz, Kian Azadi, Tyler Weiss, Varsha Vattappally

<h2> Running The Project </h2>

Download The Required Packages:<br/>
Android Studios - https://developer.android.com/studio?gclid=Cj0KCQjwtsCgBhDEARIsAE7RYh3GLldIaM0FTlhDIounMzKd5c-MJrDKD7v7xqhQNtEqvpgtDDfMWqMaAjDNEALw_wcB&gclsrc=aw.ds<br/>
Flutter SDK - https://docs.flutter.dev/get-started/install?gclid=Cj0KCQjwtsCgBhDEARIsAE7RYh2nAMF4Wf0BBWiHCr23FdQzAFEU5jo0ZYbOUzh4WztsIqaX2AsCFkoaAimtEALw_wcB&gclsrc=aw.ds<br/>

Prepare the IDE:<br/>
<p>
-Open Android Studios, and under the plugins section install the Dart and Flutter plug-ins.<br/>
-Create an android studios emulator using the following instructions: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select the Device Manager (this tends to be on the top right, and has a small phone icon with a droid logo on the bottom right)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select "Create Device", and then choose a phone and System of your choice (Recommend system image of 29+)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select "Finish", and then press the play button on the device manager to start running your emulator.<br/>
-Download the most recent release of this project, and open the "project" directory in Android Studios<br/>
-Once it is running, you should be able to select the Run button in Android Studios, and it should play on your emulator!<br/>
</p>


<!-- [//]: # ( readme: collaborators -start )
<table>
<tr>
    <td align="center">
        <a href="https://github.com/ApplebaumIan">
            <img src="https://avatars.githubusercontent.com/u/9451941?v=4" width="100;" alt="ApplebaumIan"/>
            <br />
            <sub><b>Ian Tyler Applebaum</b></sub>
        </a>
    </td>
    <td align="center">
        <a href="https://github.com/leighflagg">
            <img src="https://avatars.githubusercontent.com/u/77810293?v=4" width="100;" alt="leighflagg"/>
            <br />
            <sub><b>Null</b></sub>
        </a>
    </td></tr>
</table>

[//]: # ( readme: collaborators -end ) -->
