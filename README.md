[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-f4981d0f882b2a3f0472912d15f9806d57e124e0fc890972558857b51b24a6f9.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=9951177)

<div align="center">

# GroupMeet

[![Report Issue on Jira](https://img.shields.io/badge/Report%20Issues-Jira-0052CC?style=flat&logo=jira-software)](https://temple-cis-projects-in-cs.atlassian.net/jira/software/c/projects/DT/issues) [![Deploy Docs](https://github.com/ApplebaumIan/tu-cis-4398-docs-template/actions/workflows/deploy.yml/badge.svg)](https://github.com/ApplebaumIan/tu-cis-4398-docs-template/actions/workflows/deploy.yml) [![Documentation Website Link](https://img.shields.io/badge/-Documentation%20Website-brightgreen)](https://capstone-projects-2023-spring.github.io/project-groupmeet/)

</div>

## Keywords

Section 704, iOS App, Android App, AIO Collaboration Tool, Group Projects, Friend Group Scheduling, Contact Information Share, Code-Based, Scheduling Algorithm

## Project Abstract

This document proposes a multi-platform mobile application called "GroupMeet" that creates an environment for students and social groups to easily organize each other's schedules for availability and share contact information. In academic group projects, students can now easily begin communications with each other and align each other's schedules to immediately become successful in their academic endeavors. In social groups, friends can now easily coordinate each other's busy lives and adjust accordingly to spontaneous events. With this application, no particular individual must take charge; the responsibility lies on the application itself.

## High Level Requirement

This application runs on a simplistic overall design, prioritizing an easy and fluent user experience above all else. Users who download our application on the app store must create a profile/account and must add at least one social media account to it, whether it be phone number, Discord, Twitter, Instagram, Snapchat, etc. After setting up their contact information, the last thing users will have an option of doing is setting up or syncing a static calendar to show their availability. Syncing a static calendar from a product like Google Calendars will not share the specific details about each event in the calendar, just the dates/times. After these steps, the user is all set up and ready to use the application when needed for group projects or friend groups.

When the application is needed, the user will have to create an instance that generates a code – this code will be inputted by other participants of the event to join in. Upon joining/creating the group, individual users will choose at least one of their social media profiles to share with privacy in mind. After everyone joins the instance, a universal calendar will automatically be generated that shows dates/times available for all participants. If a user has not already set up a static calendar, that specific user by preference will either be asked to update their calendar, or in the presence of strict scheduling be asked by the application if specific times work based on the generated calendar. Throughout the instance's lifecycle, users can update any spontaneous events that occur causing them to be unavailable. When this occurs, all other users will be prompted and the application will make suggestions for the next best option, or any compromises if there truly is no other time that works.

## Conceptual Design

It has been decided that GroupMeet's programming environment will be in Flutter so that the application can be developed for both iOS and Android devices. This is to ensure that the only requirement to use our application is owning a smartphone so that we can reach most users. As for hosting of the application, we are trying to get physical hardware, but it is no big deal if we cannot oblige. AWS or another choice among the vast arrange of hosting services will be chosen.

## Background

Throughout my academic career, I felt that one of the most repetitively troublesome procedures that I experienced was getting assigned a group project and simply getting the flow of communication going, and especially trying to sync everyone's schedules together to ensure efficient work is done. And as my friends and I are graduating, starting their careers, or continuing their education, I feel that one of the most agonizing things is trying to align each other's schedules to simply get together once in a while. In both of these scenarios, there is always tiresome work that needs to be done overall, and usually it is shouldered on one person to take control and organize for everyone else. Just the concept of a group project being stalled from the get-go because of this, or a friend group causing unnecessary work sounds like a nuisance that can be avoided.

Similar products to GroupMeet include official calendars with calendar sync integration like Google Calendars, or Calendar ([https://www.calendar.com/](https://www.calendar.com/)) which has dynamic scheduling integration, but has a lot of its features locked behind a paywall. The problem at hand with these products though, is simply that they are not convenient enough for short-term use. Combine this with privacy issues, because a majority of users do not want to share their entire detailed calendar with other people – they would just want to share their times and nothing else attached. The only instances I have ever heard of people sharing each other's calendars is close family members, and in a professional environment where they only share their work calendar and not their personal calendar. GroupMeet aspires to make calendar sync integration an easy and seamless process with privacy in mind.

## Required Resources

Experience with Mobile App Development would be optimal for all group members. If every member has experience with Flutter specifically, that would be the best. This application prioritizes user experience, so a background in that would be great as well. If no local hardware is available immediately from any participant, AWS will most likely be the designated hosting service but hosting services are not hard to find.

## Collaborators

Athan Kim, Jerrell Lewis, Kian Azadi, Tyler Weiss, Varsha Vattappally

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
