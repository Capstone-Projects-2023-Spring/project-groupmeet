"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[3961],{3905:(e,t,n)=>{n.d(t,{Zo:()=>c,kt:()=>g});var r=n(7294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function s(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function i(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var p=r.createContext({}),u=function(e){var t=r.useContext(p),n=t;return e&&(n="function"==typeof e?e(t):s(s({},t),e)),n},c=function(e){var t=u(e.components);return r.createElement(p.Provider,{value:t},e.children)},l="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,a=e.mdxType,o=e.originalType,p=e.parentName,c=i(e,["components","mdxType","originalType","parentName"]),l=u(n),d=a,g=l["".concat(p,".").concat(d)]||l[d]||m[d]||o;return n?r.createElement(g,s(s({ref:t},c),{},{components:n})):r.createElement(g,s({ref:t},c))}));function g(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=n.length,s=new Array(o);s[0]=d;var i={};for(var p in t)hasOwnProperty.call(t,p)&&(i[p]=t[p]);i.originalType=e,i[l]="string"==typeof e?e:a,s[1]=i;for(var u=2;u<o;u++)s[u]=n[u];return r.createElement.apply(null,s)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},5531:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>p,contentTitle:()=>s,default:()=>l,frontMatter:()=>o,metadata:()=>i,toc:()=>u});var r=n(7462),a=(n(7294),n(3905));const o={sidebar_position:1},s=void 0,i={unversionedId:"system-architecture/design",id:"system-architecture/design",title:"design",description:"Components",source:"@site/docs/system-architecture/design.md",sourceDirName:"system-architecture",slug:"/system-architecture/design",permalink:"/project-groupmeet/docs/system-architecture/design",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/system-architecture/design.md",tags:[],version:"current",lastUpdatedBy:"sebb0h",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"System Architecture",permalink:"/project-groupmeet/docs/category/system-architecture"},next:{title:"API Specification",permalink:"/project-groupmeet/docs/category/api-specification"}},p={},u=[],c={toc:u};function l(e){let{components:t,...n}=e;return(0,a.kt)("wrapper",(0,r.Z)({},c,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Components")),(0,a.kt)("p",null,"GroupMeet is a iOS/Android application that utilizes Google Firebase for the backend, and Flutter for the frontend."),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Algorithms")),(0,a.kt)("p",null,"GroupMeet plans to implement a complex sorting algorithm to generate a static calendar to display the most convenient meetup times for our groups."),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Class Diagrams"),"\n",(0,a.kt)("strong",{parentName:"p"},"Diagram 1 - Individual-Related Classes")),(0,a.kt)("mermaid",{value:"classDiagram\n    class MyApp{\n      -key\n      +build(context)\n    }\n\n    class HomeScreen{\n      +title\n      +createState()\n    }\n\n    class HomeScreenState{\n        +ref\n        +initState()\n        +logout()\n        +build(context)\n    }\n    \n    HomeScreen --\x3e HomeScreenState\n    \n    class LoginScreen{\n      +createState()\n    }\n\n    class LoginScreenState{\n        -_usernameController\n        -_passwordController\n        -_isUsernameValid\n        -_isPasswordValid\n        -_navigateToHomeScreen()\n        -_login()\n        +build(context)\n    }\n    \n    LoginScreen--\x3eLoginScreenState\n    \n    class SocialMedia{\n      +title\n      +databaseReference\n      +createState()\n    }\n\n    class _SocialMediaState{\n        +databaseReference\n        +instaSelect\n        +fbSelect\n        +discordSelect\n        +messageSelect\n        +snapSelect\n        +initState()\n        +getData()\n        +build(context)\n    }\n    \n    SocialMedia--\x3e_SocialMediaState\n    \n    class AccountInfo{\n        +ref\n        +title\n        +createState()\n    }\n\n    class _AccountInfoState{\n        +email\n        +name\n        +ref\n        +initState()\n        +getData()\n        +build(context)\n    }\n\n    AccountInfo--\x3e_AccountInfoState\n\n    class AllGroups{\n        +ref\n        +title\n        +createState()\n    }\n\n    class _AllGroupsState{\n        +ref\n        +uid\n        +grabGroups()\n        +build(context)\n    }\n\n    AllGroups--\x3e_AllGroupsState\n\n    class CodeReception{\n        +title\n        +createState()\n    }\n\n    class _CodeReceptionState{\n        -_hash\n        -_key\n        -_scannedCode\n        +data\n        +keep\n        +one\n        +getQR()\n        +build(context)\n    }\n\n    CodeReception--\x3e_CodeReceptionState\n\n    class CreateAccount{\n        +title\n        +createState()\n    }\n\n    class _CreateAccountState{\n        -_emailController\n        -_passwordController\n        -_fnameController\n        -_lnameController\n        +ref\n        +uid\n        +createUserProfile()\n        +build()\n    }\n\n    CreateAccount--\x3e_CreateAccountState\n\n    class EditAccountInfo{\n        +title\n        +ref\n        +createState()\n    }\n\n    class _EditAccountInfoState{\n        -firstNameController\n        -lastNameController\n        -emailController\n        +email\n        +fName\n        +lName\n        +ref\n        +getData()\n        +initState()\n        +saveChanges()\n        +build()\n    }\n\n    EditAccountInfo--\x3e_EditAccountInfoState\n    \n    MyApp--\x3eMyHomePage"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Diagram 2 - Group-related Classes")),(0,a.kt)("mermaid",{value:"classDiagram    \n    class GroupCreation{\n        +groupTitle\n        +createState()\n    }\n\n    class _GroupCreationState{\n        -_groupNameController\n        -_numMembersController\n        -_formKey\n        +initState()\n        +createGroupLinkUser()\n        +build()\n    }\n\n    GroupCreation--\x3e_GroupCreationState\n\n    class GroupHomePage{\n        +title\n        +databaseReference\n        +myGroup\n        +createState()\n    }\n\n    class _GroupHomePageState{\n        +databaseReference\n        +instaCount\n        +fbCount\n        +discordCount\n        +messagesCount\n        +snapCount\n        +initState()\n        +leaveGroup()\n        +getData()\n        +grabGroupMembers()\n        +build()\n    }\n\n    GroupHomePage--\x3e_GroupHomePageState"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Diagram 3")),(0,a.kt)("mermaid",{value:'classDiagram\n    class State\n    class StatefulWidget\n    \n    class GenericPage\n    class _GenericPageState\n    \n    GenericPage --|> StatefulWidget\n    note for State "Library in Flutter"\n    note for StatefulWidget "Library in Flutter"\n    _GenericPageState --|> State\n    GenericPage --\x3e _GenericPageState'}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Sequence Diagrams"),"\n",(0,a.kt)("strong",{parentName:"p"},"Use Case 1: Registration")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    User->>GroupMeet: Open application\n    User->>+GroupMeet: Registers using form field\n    GroupMeet->>+FirebaseAuthentication: createUserWithEmailAndPassword()\n    FirebaseAuthentication->>+RealtimeDatabase: Creates a new entry\n    RealtimeDatabase--\x3e>-FirebaseAuthentication: Creation Successful\n    FirebaseAuthentication--\x3e>-GroupMeet: Account Created\n    GroupMeet--\x3e>-User: Prompts to confirm email address\n    User->>+GroupMeet: Validates email address\n    GroupMeet--\x3e>-User: Confirms validation, thanks user"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 2: Login")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    User->>GroupMeet: Open application\n    User->>+GroupMeet: Login\n    GroupMeet->>+FirebaseAuthentication: signInWithEmailAndPassword()\n    FirebaseAuthentication->>+RealtimeDatabase: Queries Database\n    RealtimeDatabase--\x3e>-FirebaseAuthentication: Query Successful\n    FirebaseAuthentication--\x3e>-GroupMeet: Account found\n    GroupMeet->>+RealtimeDatabase: Queries for any linked social media\n    RealtimeDatabase--\x3e>-GroupMeet: No results found\n    GroupMeet--\x3e>-User: Prompts user to link social media\n    User->>+GroupMeet: Validates social media accounts\n    GroupMeet->>+RealtimeDatabase: adds accounts to entry\n    RealtimeDatabase--\x3e>-GroupMeet: entry updated\n    GroupMeet--\x3e>-User: Thanks user for information"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 3: Event Creation")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    participant GroupMeet App\n    participant Firebase Authentication\n    participant Realtime Database\n\n    User->>+ GroupMeet App: login()\n    GroupMeet App->>+Firebase Authentication: signInWithEmailAndPassword()\n    User->>+GroupMeet App: Presses button to create a new group\n    GroupMeet App --\x3e> User: Prompts user for group information\n    User->>+GroupMeet App: Enters group information\n    GroupMeet App->>+Realtime Database : Update information to group settings"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 4: Invite Other Users")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User1\n    actor User2\n    participant GroupMeet App\n    participant Realtime Database\n    \n    User1->>+GroupMeet App: Presses button to create a new group\n    GroupMeet App --\x3e> User1: Prompts user for group information\n    User1->>+GroupMeet App: Enters group information\n    GroupMeet App->>+Realtime Database : Update information to group settings\n    GroupMeet App ->>+ GroupMeet App: QR code/link/code is generated\n    User2->>+ User2: Scan the QR code and click the link\n    User2->>+ GroupMeet App: Join scheduling group"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 5: Time Block Selection")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor user\n    actor groupchat\n    actor user3\n    user--\x3e>+groupchat: Sends link for installation\n    groupchat--\x3e>+App/Play Store: brings to dowload\n    App/Play Store--\x3e>+GroupMeet App: Brings to GroupMeet App\n    GroupMeet App->>-groupchat: Prompts Users to Sign Up\n    groupchat->>+GroupMeet App: Signs up\n    GroupMeet App--\x3e>+Database: Updates Database Info\n    GroupMeet App->>+groupchat: Prompts User to Sync Google Calendar\n    groupchat->>+GroupMeet App: Confirm Syncing of Calendar\n    GroupMeet App->>+Google Calendar: Request Calendar Info\n    Google Calendar->>-GroupMeet App: Send's Calendar Info\n    GroupMeet App->>+user3: Request to Sync Calendar\n    user3->>+GroupMeet App: Denies Requests\n    GroupMeet App->>+GroupMeet App: Syncs Calendar Info\n    GroupMeet App->>+GroupMeet App: Places Participants in Group\n    GroupMeet App->>+user3: Prompts User to Selected From Static Calendar\n    user3->>+GroupMeet App: User Completes Calendar Filling Request\n    GroupMeet App->>+GroupMeet App: Finalizes Calendar\n    GroupMeet App->>+GroupMeet App: Publishes Times of Best Fitted Availability in Internalize Group"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 6: Last Second Changes")),(0,a.kt)("mermaid",{value:'sequenceDiagram\n    actor Group\n    actor UserX\n    actor UserY\n    participant GroupMeet App\n\n    Group->>GroupMeet App: All users join the group\n    GroupMeet App->>+ GroupMeet App: Static Calendar is generated with everyone\'s schedules\n    UserX->>GroupMeet App: Selects "green" time (where everyone is available), clicking on the time and proposing it\n    GroupMeet App->>Group: Sends notifications to all members, asking for time approval\n    Group->>GroupMeet App: All users approve meeting time\n    UserY->>GroupMeet App: User later realizes that they actually cannot make that time\n    UserY->>GroupMeet App: Cancels the current meeting time\n    GroupMeet App->>Group: Sends notifications to all members\n    GroupMeet App->>Group: Notification includes notice of cancellation and suggestion for next best time to meet\n'}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 7: Modification of Project Lifespan")),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    actor UserX\n    participant System\n\n    User->>System: Logs in\n    User->>System: Navigates to Group Settings\n    User->>System: Selects Longevity\n    System->>User: Prompts user with add new, change existing, or delete current timeline options\n    User->>System: Chooses Change Existing\n    System->>User: Prompts user with calendar\n    User->>System: User selects new timeline date\n    User->>System: User saves new timeline\n    System->>UserX: Sends message to Group Chat with new timeline adjustments\n    UserX->>System: Receives message from System\n    System->>User: Confirms change of timeline"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Use Case 8: Push Notifications and Reminders")),(0,a.kt)("mermaid",{value:'sequenceDiagram\n    actor User\n    participant GroupMeet App\n    participant Message Server\n\n    GroupMeet App->>User: Receives a meeting reminder message\n    User->>GroupMeet App: Taps on the message\n    GroupMeet App->>Message Server: Fetches details about the meeting\n    Message Server->>GroupMeet App: Return details about the meeting\n    GroupMeet App->>User: Shows a pop-up message with meeting details\n    User->>GroupMeet App: Taps on the active status\n    GroupMeet App->>User: Shows a description of the status\n    User->>GroupMeet App: Clicks on the "X" button\n    GroupMeet App->>User: Closes the pop-up menu\n    User->>GroupMeet App: Returns to the app\'s home page\n    GroupMeet App->>User: Brings user back to homepage'}),(0,a.kt)("p",null,"Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc."),(0,a.kt)("p",null,"If there is a database:"),(0,a.kt)("p",null,"**Entity-relation diagram"),(0,a.kt)("mermaid",{value:"erDiagram\n    Users{\n        string uid \n        string name\n        string email    \n        Object socialMedia[]\n        string teamIds[]\n    }\n    Teams{\n        string teamId \n        string teamName\n        string teamAdmin\n        string uids[]\n    }\n    Users }|..|{ Teams: have"}),(0,a.kt)("p",null,"Table design."),(0,a.kt)("p",null,"A check list for architecture design is attached here ",(0,a.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1",title:"architecture_design_checklist.pdf"},"architecture","_","design","_","checklist.pdf"),"\xa0 and should be used as a guidance."))}l.isMDXComponent=!0}}]);