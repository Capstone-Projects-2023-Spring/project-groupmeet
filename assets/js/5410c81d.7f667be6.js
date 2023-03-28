"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[6654],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>f});var a=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function r(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,i=function(e,t){if(null==e)return{};var n,a,i={},o=Object.keys(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var s=a.createContext({}),c=function(e){var t=a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):r(r({},t),e)),n},u=function(e){var t=c(e.components);return a.createElement(s.Provider,{value:t},e.children)},p="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},h=a.forwardRef((function(e,t){var n=e.components,i=e.mdxType,o=e.originalType,s=e.parentName,u=l(e,["components","mdxType","originalType","parentName"]),p=c(n),h=i,f=p["".concat(s,".").concat(h)]||p[h]||d[h]||o;return n?a.createElement(f,r(r({ref:t},u),{},{components:n})):a.createElement(f,r({ref:t},u))}));function f(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var o=n.length,r=new Array(o);r[0]=h;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[p]="string"==typeof e?e:i,r[1]=l;for(var c=2;c<o;c++)r[c]=n[c];return a.createElement.apply(null,r)}return a.createElement.apply(null,n)}h.displayName="MDXCreateElement"},3144:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>r,default:()=>p,frontMatter:()=>o,metadata:()=>l,toc:()=>c});var a=n(7462),i=(n(7294),n(3905));const o={sidebar_position:1},r="Activities",l={unversionedId:"development-plan/activities",id:"development-plan/activities",title:"Activities",description:"Requirements Gathering",source:"@site/docs/development-plan/activities.md",sourceDirName:"development-plan",slug:"/development-plan/activities",permalink:"/project-groupmeet/docs/development-plan/activities",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/development-plan/activities.md",tags:[],version:"current",lastUpdatedBy:"Jared Stefanowicz",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"Software Development Plan",permalink:"/project-groupmeet/docs/category/software-development-plan"},next:{title:"Tasks",permalink:"/project-groupmeet/docs/development-plan/tasks"}},s={},c=[{value:"Requirements Gathering",id:"requirements-gathering",level:2},{value:"Top-level Design",id:"top-level-design",level:2},{value:"Detailed Design",id:"detailed-design",level:2},{value:"Test",id:"test",level:2}],u={toc:c};function p(e){let{components:t,...n}=e;return(0,i.kt)("wrapper",(0,a.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"activities"},"Activities"),(0,i.kt)("h2",{id:"requirements-gathering"},"Requirements Gathering"),(0,i.kt)("p",null,"The functional and non-functional requirements were gathered based on several factors, most notably the developers' experience of group projects and personal gatherings. This led to the foundational goal of Round, which is to provide a straightforward and effective solution. Research was done on alternatives, however most involved sharing all explicit details of each other's calendars, something which is not wanted in the majority of situations. This led to the realization of one of Round's defining features: a calendar that highlights availabilities, similar to those seen in Google Calendar and Microsoft Office Calendar, but without sharing any of those explicit details. The storage of this information, as well as the individual users, quickly created the need to research a backend resource, to which Firebase was found to be a great option."),(0,i.kt)("p",null,"Another item of focus is the ability for Round to determine the best platform to facilitate group communication. The research done for this is the review of all popular social media outlets to determine ways to effectively store accounts the users may have. Additional research was done with each of the platforms to determine whether groups can be created on the user's behalf. These features allow Round to determine the best platform for the users to continue their discussion, ensuring the group can communicate in an environment they are already comfortable with."),(0,i.kt)("p",null,"User experience requirements will be gathered off of prototypes of the application that allows for feedback through testing and hands-on testing, directing the future iterations of the application's appearance and experience in a natural and fluid manner. These changes will be recorded through Jira ticketing and other resources, such as Google Forms, as needed, to ensure ease for the user is a top priority throughout development."),(0,i.kt)("h2",{id:"top-level-design"},"Top-level Design"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"Establish Google Firebase for a cloud-hosted database that can host the app"),(0,i.kt)("li",{parentName:"ol"},"Generate foundational app features such as welcome, account creation and login pages"),(0,i.kt)("li",{parentName:"ol"},"Group creation and code/link sharing feature development"),(0,i.kt)("li",{parentName:"ol"},"Create group finalization algorithm(s) and develop procedures performed at this stage"),(0,i.kt)("li",{parentName:"ol"},"Establish calendar sync integration with Google Calendar"),(0,i.kt)("li",{parentName:"ol"},"Develop miscellaneous features to fulfill scenarios that could occur in user flows"),(0,i.kt)("li",{parentName:"ol"},"Notification integration at certain stages of user flow")),(0,i.kt)("h2",{id:"detailed-design"},"Detailed Design"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"Establish Google Firebase for a cloud-hosted database that can host the app app",(0,i.kt)("br",null),"\n1.1 Hosting our application on Google Firebase for login authentication and overall uptime",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Generate foundational app features such as welcome, account creation and login pages",(0,i.kt)("br",null),"\n2.1 Making sure that foundational features are established and connecting pages for the user flow so that user experience is kept as a top priority throughout development.",(0,i.kt)("br",null),"\n2.2 Users will be able to link their social media profiles and/or contact informations to be shared later",(0,i.kt)("br",null),"\n2.3 Users will be able to create static profiles where they can preemptively sync their calendars or chart out their availabilities",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Group creation and code/link sharing feature development",(0,i.kt)("br",null),"\n3.1 Seeking to include unique code/QR code/link share integrations for ease of use",(0,i.kt)("br",null),"\n3.2 Establishing user-to-user interaction and group generation so that users can sync their calendars and share contact information",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Create group finalization algorithm(s) including static calendar generation",(0,i.kt)("br",null),"\n4.1 Upon group finalization, a joined calendar is generated by Round to display all available times",(0,i.kt)("br",null),"\n4.2 If no overlaps exist, then suggest next best options, such as two separate times or times where only one person is unavailable",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Establish calendar sync integration with Google Calendar",(0,i.kt)("br",null),"\n5.1 Allow users to easily sync their Round scheduling with Google Calendar",(0,i.kt)("br",null),"\n5.2 Round will automatically adjust for times with privacy in mind",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Develop miscellaneous features to fulfill scenarios that could occur in user flows",(0,i.kt)("br",null),"\n6.1 Account for situation where a user has to cancel the meeting due to unforseen unavailability",(0,i.kt)("br",null),"\n6.2 In this case, suggest the next best time",(0,i.kt)("br",null),"\n6.3 Account for situation where a user did not provide any availability",(0,i.kt)("br",null),"\n6.4 In this case, give that user a list of the available times to choose from based on the availability of the other members of the group",(0,i.kt)("br",null)," "),(0,i.kt)("li",{parentName:"ol"},"Notification integration at certain stages of user flow",(0,i.kt)("br",null),"\n7.1 Send notifications to users at specific times of user flow",(0,i.kt)("br",null),"\n7.2 For example, send notifications to users 1 day before meeting time asking for their RSVP",(0,i.kt)("br",null),"\n7.3 For example, send notifications to users 15 minutes before meeting time",(0,i.kt)("br",null)," ")),(0,i.kt)("h2",{id:"test"},"Test"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"All tests will be done with the Flutter framework testing suite using the flutter_test package."),(0,i.kt)("li",{parentName:"ul"},"Unit testing will be created to test foundational features of the application to measure for basic functionality",(0,i.kt)("ul",{parentName:"li"},(0,i.kt)("li",{parentName:"ul"},"After all major development sessions conclude, functionality tests will be performed to avoid app-breaking contributions"))),(0,i.kt)("li",{parentName:"ul"},"Widget testing will ensure each widget will work as intended in a medium-scale overview"),(0,i.kt)("li",{parentName:"ul"},"Integration testing will check the application on a large scale, making sure multiple widgets interact with each other as expected in given conditions."),(0,i.kt)("li",{parentName:"ul"},"The team will perform tests on all calendar syncing/calendar creation features and implementations with a variety of different calendar inputs and sample groups")))}p.isMDXComponent=!0}}]);