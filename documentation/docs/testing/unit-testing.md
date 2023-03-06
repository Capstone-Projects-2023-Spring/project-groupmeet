---
sidebar_position: 1
---
# Unit and Widget tests
**These will allow us to test methods that provide unique functionality to each page. Unit tests will be used for methods that stay within a single page. Widget tests will be used in tandem with unit testing due to the nature of Flutter's middleware being heavily integrated into the front end.**
## Unit Tests:
1. getQR()
  - Procedure: A new QRCode is generated
  - Test: CanCreateCode()
  - Input: QRViewController, needed to generate the code.
  - Output: a Barcode object containing the information for the QR Code.
  - Result: A QR Code will appear on the screen.

2. grabGroupId()
  - Procedure: The program is able to get the group ID for future usage.
  - Test: CanGetGroupId()
  - Input: void
  - Output: a populated groupId variable within the CodeSharingState object
  - Result: The group ID will be stored for future usage.

3. logout() **MAY BE A WIDGET TEST IN THE FUTURE**
  - Procedure: The user is able to logout of their account
  - Test: CanLogout()
  - Input: void
  - Output: The local authenticator will remove the token associated to the user
  - Result: The user is no longer logged in.

## Widget Tests:
1. login()
  - Procedure: User is able to login to their previously existing account.
  - Test: CanLogin()
  - Input: void, however credentials will be received from the TextFormField controllers on the page.
  - Output: if login credentials are correct, the page will navigate to the user home screen and a snapshot of the user will be stored in the authenticator
  - Result: User will be prompted based on the success

2. createUserProfile()
  - Procedue: User is able to make an account with an email and password
  - Test: CanCreateAccount()
  - Input: void, however credentials will be received from the TextFormField controllers on the page.
  - Output: if account information is valid, the user will be notified of successful creation
  - Result: User will be prompted based on the success
