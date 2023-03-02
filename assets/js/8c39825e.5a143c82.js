"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[8525],{3905:(e,t,n)=>{n.d(t,{Zo:()=>m,kt:()=>v});var o=n(7294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);t&&(o=o.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,o)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function r(e,t){if(null==e)return{};var n,o,a=function(e,t){if(null==e)return{};var n,o,a={},i=Object.keys(e);for(o=0;o<i.length;o++)n=i[o],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(o=0;o<i.length;o++)n=i[o],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var s=o.createContext({}),p=function(e){var t=o.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},m=function(e){var t=p(e.components);return o.createElement(s.Provider,{value:t},e.children)},c="mdxType",u={inlineCode:"code",wrapper:function(e){var t=e.children;return o.createElement(o.Fragment,{},t)}},d=o.forwardRef((function(e,t){var n=e.components,a=e.mdxType,i=e.originalType,s=e.parentName,m=r(e,["components","mdxType","originalType","parentName"]),c=p(n),d=a,v=c["".concat(s,".").concat(d)]||c[d]||u[d]||i;return n?o.createElement(v,l(l({ref:t},m),{},{components:n})):o.createElement(v,l({ref:t},m))}));function v(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var i=n.length,l=new Array(i);l[0]=d;var r={};for(var s in t)hasOwnProperty.call(t,s)&&(r[s]=t[s]);r.originalType=e,r[c]="string"==typeof e?e:a,l[1]=r;for(var p=2;p<i;p++)l[p]=n[p];return o.createElement.apply(null,l)}return o.createElement.apply(null,n)}d.displayName="MDXCreateElement"},5389:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>l,default:()=>c,frontMatter:()=>i,metadata:()=>r,toc:()=>p});var o=n(7462),a=(n(7294),n(3905));const i={sidebar_position:3},l="Schedule",r={unversionedId:"development-plan/schedule",id:"development-plan/schedule",title:"Schedule",description:"Milestone 1 Deliverables:",source:"@site/docs/development-plan/schedule.md",sourceDirName:"development-plan",slug:"/development-plan/schedule",permalink:"/project-groupmeet/docs/development-plan/schedule",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/development-plan/schedule.md",tags:[],version:"current",lastUpdatedBy:"Tyler Weiss",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"docsSidebar",previous:{title:"Tasks",permalink:"/project-groupmeet/docs/development-plan/tasks"},next:{title:"Development Environment",permalink:"/project-groupmeet/docs/development-plan/development-environment"}},s={},p=[{value:"Milestone 1 Deliverables:",id:"milestone-1-deliverables",level:2},{value:"Milestone 2 Deliverables:",id:"milestone-2-deliverables",level:2},{value:"Milestone 3 Deliverables:",id:"milestone-3-deliverables",level:2}],m={toc:p};function c(e){let{components:t,...n}=e;return(0,a.kt)("wrapper",(0,o.Z)({},m,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"schedule"},"Schedule"),(0,a.kt)("mermaid",{value:"gantt\n    title GroupMeet Development Cycle\n    dateFormat  YYYY-MM-DD\n    excludes 2023-03-07 2023-03-08 2023-03-09 2023-03-10 2023-03-11 2023-03-12\n        section Development \n         Sprint 0: , 2023-02-08, 1w\n        section Development \n         Firebase prototype integration to app:  done, 2023-02-08, 1d\n        section Development \n         Create Account Page UI:  done, 2023-02-09, 3d\n        section Development \n         Firebase test db established:  done, 2023-02-08,4d\n        section Development \n         Generate Welcome Page:  done, 2023-02-08, 4d\n        section Development \n         Account Creation Page information:  done, 2023-02-08, 6d\n        section Development \n         Establish Google Firebase:  done, 2023-02-08, 6d\n        section Development \n         Integrate Firebase:  done, 2023-02-08, 6d\n        section Development \n         Documentation Maintenance:  done, 2023-02-08, 1w\n        section Development \n         Generate foundational app features:  done, 2023-02-08, 1w\n        section Development \n         Software Development Plan Assignment: milestone, done, 2023-02-12, 1d\n         \n        section Development \n         Sprint 1: , 2023-02-15, 2w\n        section Development \n         Design Prototype:  , 2023-02-08, 3w\n        section Development \n         Foundational social media integration:  , 2023-02-15, 2w\n        section Development \n         Group creation Development:  , 2023-02-15, 2w\n        section Development \n         Code/link sharing feature Development:  , 2023-02-15, 2w\n        section Development \n         Design Document Part 1 (Architecture) Assignment: milestone, , 2023-02-19, 1d\n        section Development \n         Design Document Part 2 (API) Assignment: milestone, , 2023-02-26, 1d\n         \n        section Development \n         Sprint 2: , 2023-03-01, 1w\n        section Development \n         Create group finalization algorithms & procedures:  , 2023-03-01, 1d\n        section Development \n         Test Procedures Document Assignment: milestone, , 2023-03-05, 1d\n        section Development \n         Spring Break (no classes held): done, 2023-03-06, 1d\n        section Development \n         Milestone Demo 1 :crit, milestone,  , 2023-03-14, 1d\n         \n        section Development \n         Sprint 3: , 2023-03-15, 2w\n        section Development \n         Establish Google Calendar sync integration:  , 2023-03-15, 1d\n        section Development \n         Milestone Demo 2 :crit, milestone,  , 2023-03-28, 1d\n         \n        section Development \n         Sprint 4: , 2023-03-29, 2w\n        section Development \n         Develop misc. features to fulfill various scenarios in user flow:  , 2023-03-29, 1d\n        section Development \n         Notification integration:  , 2023-03-29, 1d\n        section Development \n         Milestone Demo 3 :crit, milestone,  , 2023-04-11, 1d\n         \n        section Development \n         Sprint 5: , 2023-04-12, 16d\n        section Development \n         App finalizations and alloted time to integrate optional desired features:  , 2023-04-12, 1d\n        section Development \n         Final Presentation & Demo :crit, milestone,  , 2023-04-27, 1d\n        section Development \n         Test Report Document Assignment: milestone, , 2023-05-06, 1d\n        section Development \n         Final Software Release Assignment: milestone, , 2023-05-07, 1d\n        section Development \n         Final Grade Submissions \ud83c\udf93 :  , 2023-05-12, 1d\n        "}),(0,a.kt)("h2",{id:"milestone-1-deliverables"},"Milestone 1 Deliverables:"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"F1: Account Management",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: User is able to register new account."),(0,a.kt)("li",{parentName:"ul"},"R2: User is able to login with an existing account."),(0,a.kt)("li",{parentName:"ul"},"R3: User is able to update their account name, profile image, and email address."),(0,a.kt)("li",{parentName:"ul"},"R4: User is able to view their account information."),(0,a.kt)("li",{parentName:"ul"},"R5: User can list all social media platforms they want to use."))),(0,a.kt)("li",{parentName:"ul"},"F2: Group creation",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1. Team creator is presented with a QR Code to invite group members."),(0,a.kt)("li",{parentName:"ul"},"R2. Team member is presented with a QR scanner to join their group."),(0,a.kt)("li",{parentName:"ul"},"R3. Users can see a list of all of their group members."),(0,a.kt)("li",{parentName:"ul"},"R4. Users can see a list of their groups."))),(0,a.kt)("li",{parentName:"ul"},"F3: Social Media",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: User is able to broadcast the most common/prefered platform of the group")))),(0,a.kt)("h2",{id:"milestone-2-deliverables"},"Milestone 2 Deliverables:"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"F4: Group Availability Functionality",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: Upon creation of a group, the user is able to enter dates in which they are free for a group meetings."),(0,a.kt)("li",{parentName:"ul"},"R2: Group members are presented with a list of available time slots in which they could meet on a certain day."))),(0,a.kt)("li",{parentName:"ul"},"F5: Calendar Integration",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: A user is able to import their events from calendar services iCal, Google Calendar, and Outlook from at least one calendar source."),(0,a.kt)("li",{parentName:"ul"},"R2: Able to combine multiple of the same kind of calendar"),(0,a.kt)("li",{parentName:"ul"},"R3: The system should be able to add a calendar event to their associated calendar on the users behalf."),(0,a.kt)("li",{parentName:"ul"},"R4: The team should be presented with a group calendar in which they can create events."))),(0,a.kt)("li",{parentName:"ul"},"F6: Push notifications to user",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: The system is able to notify users of an upcoming meeting.")))),(0,a.kt)("h2",{id:"milestone-3-deliverables"},"Milestone 3 Deliverables:"),(0,a.kt)("ul",null,(0,a.kt)("li",{parentName:"ul"},"F7: Calendar Integration",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: A user can input a last minute change to their calendar, which is able to cancel an already existing time slot to meet up."),(0,a.kt)("li",{parentName:"ul"},"R2: A user can import their events from more than one calendar."),(0,a.kt)("li",{parentName:"ul"},"R3: Able to find new time if first time does not work"))),(0,a.kt)("li",{parentName:"ul"},"F8: Push notification to user",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: Able to notify user of time being cancelled, and prompt with new time"),(0,a.kt)("li",{parentName:"ul"},"R2: User is notified that previous time slot was cancelled, and a new one has been found."))),(0,a.kt)("li",{parentName:"ul"},"F9: Social Media",(0,a.kt)("ul",{parentName:"li"},(0,a.kt)("li",{parentName:"ul"},"R1: The system will create a group chat based on the groups preferred messaging platform selection."),(0,a.kt)("li",{parentName:"ul"},"R2: if the group selects a messaging service that cannot be automatically generated, the application will to generate a list of the groups, user names and copy them to the group organizer's clipboard."),(0,a.kt)("li",{parentName:"ul"},"R3: The user will be deeplinked/redirected to the groups prefered messaging platform.")))))}c.isMDXComponent=!0}}]);