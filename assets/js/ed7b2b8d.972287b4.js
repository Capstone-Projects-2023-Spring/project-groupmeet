"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[3961],{3905:(e,t,r)=>{r.d(t,{Zo:()=>u,kt:()=>g});var n=r(7294);function s(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function a(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function o(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?a(Object(r),!0).forEach((function(t){s(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):a(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function i(e,t){if(null==e)return{};var r,n,s=function(e,t){if(null==e)return{};var r,n,s={},a=Object.keys(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||(s[r]=e[r]);return s}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(s[r]=e[r])}return s}var p=n.createContext({}),c=function(e){var t=n.useContext(p),r=t;return e&&(r="function"==typeof e?e(t):o(o({},t),e)),r},u=function(e){var t=c(e.components);return n.createElement(p.Provider,{value:t},e.children)},l="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},d=n.forwardRef((function(e,t){var r=e.components,s=e.mdxType,a=e.originalType,p=e.parentName,u=i(e,["components","mdxType","originalType","parentName"]),l=c(r),d=s,g=l["".concat(p,".").concat(d)]||l[d]||m[d]||a;return r?n.createElement(g,o(o({ref:t},u),{},{components:r})):n.createElement(g,o({ref:t},u))}));function g(e,t){var r=arguments,s=t&&t.mdxType;if("string"==typeof e||s){var a=r.length,o=new Array(a);o[0]=d;var i={};for(var p in t)hasOwnProperty.call(t,p)&&(i[p]=t[p]);i.originalType=e,i[l]="string"==typeof e?e:s,o[1]=i;for(var c=2;c<a;c++)o[c]=r[c];return n.createElement.apply(null,o)}return n.createElement.apply(null,r)}d.displayName="MDXCreateElement"},5531:(e,t,r)=>{r.r(t),r.d(t,{assets:()=>p,contentTitle:()=>o,default:()=>l,frontMatter:()=>a,metadata:()=>i,toc:()=>c});var n=r(7462),s=(r(7294),r(3905));const a={sidebar_position:1},o=void 0,i={unversionedId:"system-architecture/design",id:"system-architecture/design",title:"design",description:"Purpose",source:"@site/docs/system-architecture/design.md",sourceDirName:"system-architecture",slug:"/system-architecture/design",permalink:"/project-groupmeet/docs/system-architecture/design",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/system-architecture/design.md",tags:[],version:"current",lastUpdatedBy:"Athan Kim",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"System Architecture",permalink:"/project-groupmeet/docs/category/system-architecture"},next:{title:"API Specification",permalink:"/project-groupmeet/docs/category/api-specification"}},p={},c=[],u={toc:c};function l(e){let{components:t,...r}=e;return(0,s.kt)("wrapper",(0,n.Z)({},u,r,{components:t,mdxType:"MDXLayout"}),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Purpose")),(0,s.kt)("p",null,"The Design Document - Part I Architecture describes the software architecture and how the requirements are mapped into the design. This document will be a combination of diagrams and text that describes what the diagrams are showing."),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Requirements")),(0,s.kt)("p",null,"In addition to the general requirements the Design Document - Part I Architecture will contain:"),(0,s.kt)("p",null,"A description the different components and their interfaces. For example: client, server, database."),(0,s.kt)("p",null,"For each component provide class diagrams showing the classes to be developed (or used) and their relationship."),(0,s.kt)("p",null,"Sequence diagrams showing the data flow for ",(0,s.kt)("em",{parentName:"p"},"all")," use cases.\xa0One sequence diagram corresponds to one use case and different use cases should have different corresponding sequence diagrams.\n",(0,s.kt)("strong",{parentName:"p"},"Use Case 1: Registration")),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 2: Event Creation")),(0,s.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    participant GroupMeet App\n    participant Firebase Authentication\n    participant Realtime Database\n\n    User->>+ GroupMeet App: login()\n    GroupMeet App->>+Firebase Authentication: signInWithEmailAndPassword()\n    User->>+GroupMeet App: Presses button to create a new group\n    GroupMeet App --\x3e> User: Prompts user for group information\n    User->>+GroupMeet App: Enters group information\n    GroupMeet App->>+Realtime Database : Update information to group settings"}),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 3: Invite Other Users")),(0,s.kt)("mermaid",{value:"sequenceDiagram\n    actor User1\n    actor User2\n    participant GroupMeet App\n    participant Realtime Database\n    \n    User1->>+GroupMeet App: Presses button to create a new group\n    GroupMeet App --\x3e> User1: Prompts user for group information\n    User1->>+GroupMeet App: Enters group information\n    GroupMeet App->>+Realtime Database : Update information to group settings\n    GroupMeet App ->>+ GroupMeet App: QR code/link/code is generated\n    User2->>+ User2: Scan the QR code and click the link\n    User2->>+ GroupMeet App: Join scheduling group"}),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 4: Time Block Selection")),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 5: Last Second Changes")),(0,s.kt)("mermaid",{value:'sequenceDiagram\n    actor Group\n    actor UserX\n    actor UserY\n    participant GroupMeet App\n\n    Group->>GroupMeet App: All users join the group\n    GroupMeet App->>+ GroupMeet App: Static Calendar is generated with everyone\'s schedules\n    UserX->>GroupMeet App: Selects "green" time (where everyone is available), clicking on the time and proposing it\n    GroupMeet App->>Group: Sends notifications to all members, asking for time approval\n    Group->>GroupMeet App: All users approve meeting time\n    UserY->>GroupMeet App: User later realizes that they actually cannot make that time\n    UserY->>GroupMeet App: Cancels the current meeting time\n    GroupMeet App->>Group: Sends notifications to all members\n    GroupMeet App->>Group: Notification includes notice of cancellation and suggestion for next best time to meet\n'}),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 6: Modification of Project Lifespan")),(0,s.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    actor UserX\n    participant System\n\n    User->>System: Logs in\n    User->>System: Navigates to Group Settings\n    User->>System: Selects Longevity\n    System->>User: Prompts user with add new, change existing, or delete current timeline options\n    User->>System: Chooses Change Existing\n    System->>User: Prompts user with calendar\n    User->>System: User selects new timeline date\n    User->>System: User saves new timeline\n    System->>UserX: Sends message to Group Chat with new timeline adjustments\n    UserX->>System: Receives message from System\n    System->>User: Confirms change of timeline"}),(0,s.kt)("p",null,(0,s.kt)("strong",{parentName:"p"},"Use Case 7: Push Notifications and Reminders")),(0,s.kt)("mermaid",{value:'sequenceDiagram\n    actor User\n    participant GroupMeet App\n    participant Message Server\n\n    GroupMeet App->>User: Receives a meeting reminder message\n    User->>GroupMeet App: Taps on the message\n    GroupMeet App->>Message Server: Fetches details about the meeting\n    Message Server->>GroupMeet App: Return details about the meeting\n    GroupMeet App->>User: Shows a pop-up message with meeting details\n    User->>GroupMeet App: Taps on the active status\n    GroupMeet App->>User: Shows a description of the status\n    User->>GroupMeet App: Clicks on the "X" button\n    GroupMeet App->>User: Closes the pop-up menu\n    User->>GroupMeet App: Returns to the app\'s home page\n    GroupMeet App->>User: Brings user back to homepage'}),(0,s.kt)("p",null,"Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc."),(0,s.kt)("p",null,"If there is a database:"),(0,s.kt)("p",null,"Entity-relation diagram."),(0,s.kt)("p",null,"Table design."),(0,s.kt)("p",null,"A check list for architecture design is attached here ",(0,s.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1",title:"architecture_design_checklist.pdf"},"architecture","_","design","_","checklist.pdf"),"\xa0 and should be used as a guidance."))}l.isMDXComponent=!0}}]);