---
sidebar_position: 1
---

# Activities

## Requirements Gathering

For the requirements gathering portion of the initial development and planning phase, members of the team researched the following:
- Compatible databases for the app to be hosted on
- Functionally similar entities such as Calendar.com, and official calendar integrations such as Microsoft Office's Calendar and Google Calendar
- Possible calendar sources that could be integrated into the app for syncing with a convenient user experience in mind

## Top-level Design

1. Establish Google Firebase for a cloud-hosted database that can host the app
2. Generate foundational app features such as welcome, account creation and login pages
3. Group creation and code/link sharing feature development
4. Create group finalization algorithm(s) and develop procedures performed at this stage
5. Establish calendar sync integration with Google Calendar
6. Develop miscellaneous features to fulfill scenarios that could occur in user flows
7. Notification integration at certain stages of user flow

## Detailed Design

1. Establish Google Firebase for a cloud-hosted database that can host the app app
    - Hosting our application on Google Firebase for login authentication and overall uptime
2. Generate foundational app features such as welcome, account creation and login pages
    - Making sure that foundational features are established and connecting pages for the user flow so that user experience is kept as a top priority throughout development.
    - Users will be able to link their social media profiles and/or contact informations to be shared later
    - Users will be able to create static profiles where they can preemptively sync their calendars or chart out their availabilities
3. Group creation and code/link sharing feature development
    - Seeking to include unique code/QR code/link share integrations for ease of use
    - Establishing user-to-user interaction and group generation so that users can sync their calendars and share contact information
4. Create group finalization algorithm(s) including static calendar generation
    - Upon group finalization, a joined calendar is generated by GroupMeet to display all available times
        - If no overlaps exist, then suggest next best options, such as two separate times or times where only one person is unavailable
5. Establish calendar sync integration with Google Calendar
    - Allow users to easily sync their GroupMeet scheduling with Google Calendar
        - GroupMeet will automatically adjust for times with privacy in mind
6. Develop miscellaneous features to fulfill scenarios that could occur in user flows
    - Account for situation where a user has to cancel the meeting due to unforseen unavailability
        - In this case, suggest the next best time
    - Account for situation where a user did not provide any availability
        - In this case, give that user a list of the available times to choose from based on the availability of the other members of the group
7. Notification integration at certain stages of user flow
    - Send notifications to users at specific times of user flow
        - For example, send notifications to users 1 day before meeting time asking for their RSVP
        - For example, send notifications to users 15 minutes before meeting time

## Test

- All tests will be done with the Flutter framework testing suite.
- Unit testing will be created to test foundational features of the application to measure for basic functionality
    - After all major development sessions conclude, functionality tests will be performed to avoid app-breaking contributions
- Widget testing will ensure each widget will work as intended in a medium-scale overview
- Integration testing will check the application on a large scale, making sure multiple widgets interact with each other as expected in given conditions.
- The team will perform tests on all calendar syncing/calendar creation features and implementations with a variety of different calendar inputs and sample groups