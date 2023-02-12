---
sidebar_position: 2
---

# Tasks

1. Establish Google Firebase for a cloud-hosted database that we can host our app on
    - Create GroupMeet Firebase account and generate project(s)
2. Generate foundational app features such as welcome, account creation and login pages
    - Establish project in Flutter
    - Create welcome page
    - Create account creation page
    - Establish foundational social media integration/contact information input
    - Hook up welcome page to Firebase
    - Create account page
3. Group creation and code/link sharing feature development
    - Create group link generation/group join option after user has created an account
    - Establish group creation feature
    - Establish QR code/link/unique code creation
    - Establish code sharing integration
4. Create group finalization algorithm(s) including static calendar generation
    - After all criteria are met (all users join group, users sync calendars or deny)
    - Establish algorithm(s) and functions that generate joined calendar based on every user's overlapping availability
5. Establish calendar sync integration with Google Calendar
    - Establish ability for users to sync their Google Calendars
        - GroupMeet only takes times to account for availability and privacy
6. Develop miscellaneous features to fulfill scenarios that could occur in user flows
    - Develop feature to account for users who have to cancel meeting due to unforseen unavailability
        - GroupMeet cancels current meeting, takes joined calendar and schedules the next best time as a suggestion
            - Users then consent to new time
    - Develop feature to account for situation where a user did not provide any availability
        - GroupMeet outputs to that specific user a list of all overlapping availabilities in which the user easily selects times available to them
7. Notification integration at certain stages of user flow
    - Develop integrations so that GroupMeet sends notifications to users at specific times of user flow
        - Accounting for real-time notifications and internal timers to do so