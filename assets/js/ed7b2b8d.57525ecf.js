"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[3961],{3905:(e,n,t)=>{t.d(n,{Zo:()=>c,kt:()=>g});var a=t(7294);function r(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function o(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);n&&(a=a.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,a)}return t}function s(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?o(Object(t),!0).forEach((function(n){r(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function i(e,n){if(null==e)return{};var t,a,r=function(e,n){if(null==e)return{};var t,a,r={},o=Object.keys(e);for(a=0;a<o.length;a++)t=o[a],n.indexOf(t)>=0||(r[t]=e[t]);return r}(e,n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)t=o[a],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var p=a.createContext({}),u=function(e){var n=a.useContext(p),t=n;return e&&(t="function"==typeof e?e(n):s(s({},n),e)),t},c=function(e){var n=u(e.components);return a.createElement(p.Provider,{value:n},e.children)},l="mdxType",d={inlineCode:"code",wrapper:function(e){var n=e.children;return a.createElement(a.Fragment,{},n)}},m=a.forwardRef((function(e,n){var t=e.components,r=e.mdxType,o=e.originalType,p=e.parentName,c=i(e,["components","mdxType","originalType","parentName"]),l=u(t),m=r,g=l["".concat(p,".").concat(m)]||l[m]||d[m]||o;return t?a.createElement(g,s(s({ref:n},c),{},{components:t})):a.createElement(g,s({ref:n},c))}));function g(e,n){var t=arguments,r=n&&n.mdxType;if("string"==typeof e||r){var o=t.length,s=new Array(o);s[0]=m;var i={};for(var p in n)hasOwnProperty.call(n,p)&&(i[p]=n[p]);i.originalType=e,i[l]="string"==typeof e?e:r,s[1]=i;for(var u=2;u<o;u++)s[u]=t[u];return a.createElement.apply(null,s)}return a.createElement.apply(null,t)}m.displayName="MDXCreateElement"},5531:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>p,contentTitle:()=>s,default:()=>l,frontMatter:()=>o,metadata:()=>i,toc:()=>u});var a=t(7462),r=(t(7294),t(3905));const o={sidebar_position:1},s="Design",i={unversionedId:"system-architecture/design",id:"system-architecture/design",title:"Design",description:"Components",source:"@site/docs/system-architecture/design.md",sourceDirName:"system-architecture",slug:"/system-architecture/design",permalink:"/project-groupmeet/docs/system-architecture/design",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/system-architecture/design.md",tags:[],version:"current",lastUpdatedBy:"JerrellLewis",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"System Architecture",permalink:"/project-groupmeet/docs/category/system-architecture"},next:{title:"API Specification",permalink:"/project-groupmeet/docs/category/api-specification"}},p={},u=[],c={toc:u};function l(e){let{components:n,...t}=e;return(0,r.kt)("wrapper",(0,a.Z)({},c,t,{components:n,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"design"},"Design"),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Components")),(0,r.kt)("p",null,"Round is an iOS/Android application that utilizes Google Firebase for the backend, and Flutter for the frontend."),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Algorithms")),(0,r.kt)("p",null,"Round plans to implement a complex sorting algorithm to generate a static calendar to display the most convenient meetup times for our groups."),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Class Diagrams"),"\n",(0,r.kt)("strong",{parentName:"p"},"Diagram 1 - Individual-Related Classes")),(0,r.kt)("mermaid",{value:"classDiagram\n    class MyApp{\n      -key\n      +build(context)\n    }\n\n    class HomeScreen{\n      +title\n      +createState()\n    }\n\n    class HomeScreenState{\n        +ref\n        +initState()\n        +logout()\n        +build(context)\n    }\n    \n    HomeScreen --\x3e HomeScreenState\n    \n    class LoginScreen{\n      +createState()\n    }\n\n    class LoginScreenState{\n        -_usernameController\n        -_passwordController\n        -_isUsernameValid\n        -_isPasswordValid\n        -_navigateToHomeScreen()\n        -_login()\n        +build(context)\n    }\n    \n    LoginScreen--\x3eLoginScreenState\n    \n    class SocialMedia{\n      +title\n      +databaseReference\n      +createState()\n    }\n\n    class _SocialMediaState{\n        +databaseReference\n        +instaSelect\n        +fbSelect\n        +discordSelect\n        +messageSelect\n        +snapSelect\n        +initState()\n        +getData()\n        +build(context)\n    }\n    \n    SocialMedia--\x3e_SocialMediaState\n    \n    class AccountInfo{\n        +ref\n        +title\n        +createState()\n    }\n\n    class _AccountInfoState{\n        +email\n        +name\n        +ref\n        +initState()\n        +getData()\n        +build(context)\n    }\n\n    AccountInfo--\x3e_AccountInfoState\n\n    class AllGroups{\n        +ref\n        +title\n        +createState()\n    }\n\n    class _AllGroupsState{\n        +ref\n        +uid\n        +grabGroups()\n        +build(context)\n    }\n\n    AllGroups--\x3e_AllGroupsState\n\n    class CodeReception{\n        +title\n        +createState()\n    }\n\n    class _CodeReceptionState{\n        -_hash\n        -_key\n        -_scannedCode\n        +data\n        +keep\n        +one\n        +getQR()\n        +build(context)\n    }\n\n    CodeReception--\x3e_CodeReceptionState\n\n    class CreateAccount{\n        +title\n        +createState()\n    }\n\n    class _CreateAccountState{\n        -_emailController\n        -_passwordController\n        -_fnameController\n        -_lnameController\n        +ref\n        +uid\n        +createUserProfile()\n        +build()\n    }\n\n    CreateAccount--\x3e_CreateAccountState\n\n    class EditAccountInfo{\n        +title\n        +ref\n        +createState()\n    }\n\n    class _EditAccountInfoState{\n        -firstNameController\n        -lastNameController\n        -emailController\n        +email\n        +fName\n        +lName\n        +ref\n        +getData()\n        +initState()\n        +saveChanges()\n        +build()\n    }\n\n    EditAccountInfo--\x3e_EditAccountInfoState\n    \n    MyApp--\x3eMyHomePage"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Diagram 2 - Group-related Classes")),(0,r.kt)("mermaid",{value:"classDiagram    \n    class GroupCreation{\n        +groupTitle\n        +createState()\n    }\n\n    class _GroupCreationState{\n        -_groupNameController\n        -_numMembersController\n        -_formKey\n        +initState()\n        +createGroupLinkUser()\n        +build()\n    }\n\n    GroupCreation--\x3e_GroupCreationState\n\n    class GroupHomePage{\n        +title\n        +databaseReference\n        +myGroup\n        +createState()\n    }\n\n    class _GroupHomePageState{\n        +databaseReference\n        +instaCount\n        +fbCount\n        +discordCount\n        +messagesCount\n        +snapCount\n        +initState()\n        +leaveGroup()\n        +getData()\n        +grabGroupMembers()\n        +build()\n    }\n\n    GroupHomePage--\x3e_GroupHomePageState"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Diagram 3")),(0,r.kt)("mermaid",{value:'classDiagram\n    class State\n    class StatefulWidget\n    \n    class GenericPage\n    class _GenericPageState\n    \n    GenericPage --|> StatefulWidget\n    note for State "Library in Flutter"\n    note for StatefulWidget "Library in Flutter"\n    _GenericPageState --|> State\n    GenericPage --\x3e _GenericPageState'}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Sequence Diagrams"),"\n",(0,r.kt)("strong",{parentName:"p"},"Use Case 1: Registration")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    User->>Round: Open application\n    User->>+Round: Registers using form field\n    Round->>+FirebaseAuthentication: createUserWithEmailAndPassword()\n    FirebaseAuthentication->>+RealtimeDatabase: Creates a new entry\n    RealtimeDatabase--\x3e>-FirebaseAuthentication: Creation Successful\n    FirebaseAuthentication--\x3e>-Round: Account Created\n    Round--\x3e>-User: Prompts to confirm email address\n    User->>+Round: Validates email address\n    Round--\x3e>-User: Confirms validation, thanks user"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 2: Login")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    User->>Round: Open application\n    User->>+Round: Login\n    Round->>+FirebaseAuthentication: signInWithEmailAndPassword()\n    FirebaseAuthentication->>+RealtimeDatabase: Queries Database\n    RealtimeDatabase--\x3e>-FirebaseAuthentication: Query Successful\n    FirebaseAuthentication--\x3e>-Round: Account found\n    Round->>+RealtimeDatabase: Queries for any linked social media\n    RealtimeDatabase--\x3e>-Round: No results found\n    Round--\x3e>-User: Prompts user to link social media\n    User->>+Round: Validates social media accounts\n    Round->>+RealtimeDatabase: adds accounts to entry\n    RealtimeDatabase--\x3e>-Round: entry updated\n    Round--\x3e>-User: Thanks user for information"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 3: Event Creation")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    participant Round App\n    participant Firebase Authentication\n    participant Realtime Database\n\n    User->>+ Round App: login()\n    Round App->>+Firebase Authentication: signInWithEmailAndPassword()\n    User->>+Round App: Presses button to create a new group\n    Round App --\x3e> User: Prompts user for group information\n    User->>+Round App: Enters group information\n    Round App->>+Realtime Database : Update information to group settings"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 4: Invite Other Users")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor User1\n    actor User2\n    participant Round App\n    participant Realtime Database\n    \n    User1->>+Round App: Presses button to create a new group\n    Round App --\x3e> User1: Prompts user for group information\n    User1->>+Round App: Enters group information\n    Round App->>+Realtime Database : Update information to group settings\n    Round App ->>+ Round App: QR code/link/code is generated\n    User2->>+ User2: Scan the QR code and click the link\n    User2->>+ Round App: Join scheduling group"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 5: Time Block Selection")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor user\n    actor groupchat\n    actor user3\n    user--\x3e>+groupchat: Sends link for installation\n    groupchat--\x3e>+App/Play Store: brings to dowload\n    App/Play Store--\x3e>+Round App: Brings to Round App\n    Round App->>-groupchat: Prompts Users to Sign Up\n    groupchat->>+Round App: Signs up\n    Round App--\x3e>+Database: Updates Database Info\n    Round App->>+groupchat: Prompts User to Sync Google Calendar\n    groupchat->>+Round App: Confirm Syncing of Calendar\n    Round App->>+Google Calendar: Request Calendar Info\n    Google Calendar->>-Round App: Send's Calendar Info\n    Round App->>+user3: Request to Sync Calendar\n    user3->>+Round App: Denies Requests\n    Round App->>+Round App: Syncs Calendar Info\n    Round App->>+Round App: Places Participants in Group\n    Round App->>+user3: Prompts User to Selected From Static Calendar\n    user3->>+Round App: User Completes Calendar Filling Request\n    Round App->>+Round App: Finalizes Calendar\n    Round App->>+Round App: Publishes Times of Best Fitted Availability in Internalize Group"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 6: Last Second Changes")),(0,r.kt)("mermaid",{value:'sequenceDiagram\n    actor Group\n    actor UserX\n    actor UserY\n    participant Round App\n\n    Group->>Round App: All users join the group\n    Round App->>+ Round App: Static Calendar is generated with everyone\'s schedules\n    UserX->>Round App: Selects "green" time (where everyone is available), clicking on the time and proposing it\n    Round App->>Group: Sends notifications to all members, asking for time approval\n    Group->>Round App: All users approve meeting time\n    UserY->>Round App: User later realizes that they actually cannot make that time\n    UserY->>Round App: Cancels the current meeting time\n    Round App->>Group: Sends notifications to all members\n    Round App->>Group: Notification includes notice of cancellation and suggestion for next best time to meet\n'}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 7: Modification of Project Lifespan")),(0,r.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    actor UserX\n    participant System\n\n    User->>System: Logs in\n    User->>System: Navigates to Group Settings\n    User->>System: Selects Longevity\n    System->>User: Prompts user with add new, change existing, or delete current timeline options\n    User->>System: Chooses Change Existing\n    System->>User: Prompts user with calendar\n    User->>System: User selects new timeline date\n    User->>System: User saves new timeline\n    System->>UserX: Sends message to Group Chat with new timeline adjustments\n    UserX->>System: Receives message from System\n    System->>User: Confirms change of timeline"}),(0,r.kt)("p",null,(0,r.kt)("strong",{parentName:"p"},"Use Case 8: Push Notifications and Reminders")),(0,r.kt)("mermaid",{value:'sequenceDiagram\n    actor User\n    participant Round App\n    participant Message Server\n\n    Round App->>User: Receives a meeting reminder message\n    User->>Round App: Taps on the message\n    Round App->>Message Server: Fetches details about the meeting\n    Message Server->>Round App: Return details about the meeting\n    Round App->>User: Shows a pop-up message with meeting details\n    User->>Round App: Taps on the active status\n    Round App->>User: Shows a description of the status\n    User->>Round App: Clicks on the "X" button\n    Round App->>User: Closes the pop-up menu\n    User->>Round App: Returns to the app\'s home page\n    Round App->>User: Brings user back to homepage'}),(0,r.kt)("p",null,"Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc."),(0,r.kt)("p",null,"If there is a database:"),(0,r.kt)("p",null,"**Entity-relation diagram"),(0,r.kt)("mermaid",{value:"erDiagram\n    Users{\n        string uid \n        string name\n        string email    \n        Object socialMedia[]\n        string teamIds[]\n    }\n    Teams{\n        string teamId \n        string teamName\n        string teamAdmin\n        string uids[]\n    }\n    Users }|..|{ Teams: have"}),(0,r.kt)("p",null,"Table design."),(0,r.kt)("p",null,"A check list for architecture design is attached here ",(0,r.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1",title:"architecture_design_checklist.pdf"},"architecture","_","design","_","checklist.pdf"),"\xa0 and should be used as a guidance."))}l.isMDXComponent=!0}}]);