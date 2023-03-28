---
sidebar_position: 1
---

# System Overview

# Project Abstract

This document proposes a multi-platform mobile application called "Round" that creates an environment for students and social groups to easily organize each other's schedules for availability and share contact information. In academic group projects, students will be able to easily begin communications with each other and synchronize with each other's schedules to become more successful in their academic endeavors. In social groups, friends can now easily coordinate each other's busy lives and adjust accordingly to spontaneous events. With this application, there is little need for one particular individual to take charge; the responsibility lies on the application itself.

# High Level Requirement

This application will run on a simplistic overall design, prioritizing an easy and fluent user experience above all else. Users who download our application would need to create a profile/account and add at least one social media account to it, whether it be phone number, Discord, Twitter, Instagram, Snapchat, etc. After setting up their contact information, the users will have an option to set up or sync a static calendar to show their availability. Syncing a static calendar from a product like Google Calendars will not share the specific details about each event in the calendar, just the dates/times. After these steps, the user will be set up and ready to use the application when needed for group projects or friend groups.

When the application is needed, the user will have to create an instance that generates a code – this code will be used by other participants of the event to join in. After everyone joins the instance, a universal calendar will automatically be generated that shows dates/times available for all participants. If a user did not set up a static calendar, that specific user will be asked to update their calendar. If the partially generated calendar is found to have very strict scheduling, the previously mentioned user will be asked by the application if specific times work based on the aforementioned calendar. Throughout the instance's lifecycle, users can update any spontaneous events that occur causing them to be unavailable. When this occurs, all other users will be prompted and the application will make suggestions for the next best option, or any compromises if there truly is no other time that works.

# Conceptual Design

Round's programming environment will be in Dart using the Flutter framework. This will allow the application to be developed for both iOS and Android devices simultaneously. This is to ensure that the only requirement to use our application is owning a smartphone so that the most users can be reached and assisted with Round. The application and its backend will be hosted on the cloud service, Google Firebase.

# Background

Throughout one's academic career, it has been shown time and time again that one of the most consistently troublesome procedures experienced is getting assigned a group project and getting the flow of communication going. While this particular task can be daunting on it's own, it can become an even more daunting task when there are inevitable schedule conflicts. Even outside of the academic life, these same scheduling conflicts can be found during the coordination of recreational events with friends and family. The seemingly simple task of "kicking back with the friends" risks becoming a logistical nightmare. 

In the two scenarios above, the task of trying to find a block of time that works for everyone tends to be a very daunting one. Additionally, this particular task tends to be assigned to one unlucky individual. It can be assumed with a wide margin of certainty that if one with this assignment had the ability to make a task that can seem impossible at times, possible, they would be interested in resources that would aid in this daunting assignment.

Similar products to Round include official calendars with calendar sync integration like Google Calendars, or Calendar ([https://www.calendar.com/](https://www.calendar.com/)) which has dynamic scheduling integration. However, many of the latter's features are locked behind a paywall. This creates a very unfortunate problem where paying for a "premium" feature is just not convenient enough for short-term use. Additionally, combining calendars typically tends to mean the event details are shared in some shape or form, implying that all who have their calendars integrated in a setting previously mentioned risk having other friends and associates aware of exactly what is occurring at any point in one's personal life. This is a scenario that should be avoided as much as possible, as the sharing of personal or public information should be completely at ones own discretion rather than as a necessity to set up a meeting time for a task. Round aspires to make calendar sync integration an easy and seamless process with privacy in mind.

# Required Resources

Experience with Mobile App Development would be optimal for all group members. If every member has experience with Flutter specifically, that would be the best. This application prioritizes user experience, so members should keep that in mind as well.

# Keywords

Section 704, iOS App, Android App, Google Firebase, AIO Collaboration Tool, Group Projects, Friend Group Scheduling, Contact Information Share, Code-Based, Scheduling Algorithm