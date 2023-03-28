"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[3196],{3905:(e,t,i)=>{i.d(t,{Zo:()=>d,kt:()=>m});var n=i(7294);function a(e,t,i){return t in e?Object.defineProperty(e,t,{value:i,enumerable:!0,configurable:!0,writable:!0}):e[t]=i,e}function o(e,t){var i=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),i.push.apply(i,n)}return i}function r(e){for(var t=1;t<arguments.length;t++){var i=null!=arguments[t]?arguments[t]:{};t%2?o(Object(i),!0).forEach((function(t){a(e,t,i[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(i)):o(Object(i)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(i,t))}))}return e}function s(e,t){if(null==e)return{};var i,n,a=function(e,t){if(null==e)return{};var i,n,a={},o=Object.keys(e);for(n=0;n<o.length;n++)i=o[n],t.indexOf(i)>=0||(a[i]=e[i]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)i=o[n],t.indexOf(i)>=0||Object.prototype.propertyIsEnumerable.call(e,i)&&(a[i]=e[i])}return a}var l=n.createContext({}),c=function(e){var t=n.useContext(l),i=t;return e&&(i="function"==typeof e?e(t):r(r({},t),e)),i},d=function(e){var t=c(e.components);return n.createElement(l.Provider,{value:t},e.children)},u="mdxType",p={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},h=n.forwardRef((function(e,t){var i=e.components,a=e.mdxType,o=e.originalType,l=e.parentName,d=s(e,["components","mdxType","originalType","parentName"]),u=c(i),h=a,m=u["".concat(l,".").concat(h)]||u[h]||p[h]||o;return i?n.createElement(m,r(r({ref:t},d),{},{components:i})):n.createElement(m,r({ref:t},d))}));function m(e,t){var i=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=i.length,r=new Array(o);r[0]=h;var s={};for(var l in t)hasOwnProperty.call(t,l)&&(s[l]=t[l]);s.originalType=e,s[u]="string"==typeof e?e:a,r[1]=s;for(var c=2;c<o;c++)r[c]=i[c];return n.createElement.apply(null,r)}return n.createElement.apply(null,i)}h.displayName="MDXCreateElement"},1317:(e,t,i)=>{i.r(t),i.d(t,{assets:()=>l,contentTitle:()=>r,default:()=>u,frontMatter:()=>o,metadata:()=>s,toc:()=>c});var n=i(7462),a=(i(7294),i(3905));const o={sidebar_position:1},r="System Overview",s={unversionedId:"requirements/system-overview",id:"requirements/system-overview",title:"System Overview",description:"This document proposes a multi-platform mobile application called \"Round\" that creates an environment for students and social groups to easily organize each other's schedules for availability and share contact information. In academic group projects, students will be able to easily begin communications with each other and synchronize with each other's schedules to become more successful in their academic endeavors. In social groups, friends can now easily coordinate each other's busy lives and adjust accordingly to spontaneous events. With this application, there is little need for one particular individual to take charge; the responsibility lies on the application itself.",source:"@site/docs/requirements/system-overview.md",sourceDirName:"requirements",slug:"/requirements/system-overview",permalink:"/project-groupmeet/docs/requirements/system-overview",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/requirements/system-overview.md",tags:[],version:"current",lastUpdatedBy:"Jared Stefanowicz",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"Requirements Specification",permalink:"/project-groupmeet/docs/category/requirements-specification"},next:{title:"System Block Diagram",permalink:"/project-groupmeet/docs/requirements/system-block-diagram"}},l={},c=[],d={toc:c};function u(e){let{components:t,...i}=e;return(0,a.kt)("wrapper",(0,n.Z)({},d,i,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"system-overview"},"System Overview"),(0,a.kt)("h1",{id:"project-abstract"},"Project Abstract"),(0,a.kt)("p",null,"This document proposes a multi-platform mobile application called \"Round\" that creates an environment for students and social groups to easily organize each other's schedules for availability and share contact information. In academic group projects, students will be able to easily begin communications with each other and synchronize with each other's schedules to become more successful in their academic endeavors. In social groups, friends can now easily coordinate each other's busy lives and adjust accordingly to spontaneous events. With this application, there is little need for one particular individual to take charge; the responsibility lies on the application itself."),(0,a.kt)("h1",{id:"high-level-requirement"},"High Level Requirement"),(0,a.kt)("p",null,"This application will run on a simplistic overall design, prioritizing an easy and fluent user experience above all else. Users who download our application would need to create a profile/account and add at least one social media account to it, whether it be phone number, Discord, Twitter, Instagram, Snapchat, etc. After setting up their contact information, the users will have an option to set up or sync a static calendar to show their availability. Syncing a static calendar from a product like Google Calendars will not share the specific details about each event in the calendar, just the dates/times. After these steps, the user will be set up and ready to use the application when needed for group projects or friend groups."),(0,a.kt)("p",null,"When the application is needed, the user will have to create an instance that generates a code \u2013 this code will be used by other participants of the event to join in. After everyone joins the instance, a universal calendar will automatically be generated that shows dates/times available for all participants. If a user did not set up a static calendar, that specific user will be asked to update their calendar. If the partially generated calendar is found to have very strict scheduling, the previously mentioned user will be asked by the application if specific times work based on the aforementioned calendar. Throughout the instance's lifecycle, users can update any spontaneous events that occur causing them to be unavailable. When this occurs, all other users will be prompted and the application will make suggestions for the next best option, or any compromises if there truly is no other time that works."),(0,a.kt)("h1",{id:"conceptual-design"},"Conceptual Design"),(0,a.kt)("p",null,"Round's programming environment will be in Dart using the Flutter framework. This will allow the application to be developed for both iOS and Android devices simultaneously. This is to ensure that the only requirement to use our application is owning a smartphone so that the most users can be reached and assisted with Round. The application and its backend will be hosted on the cloud service, Google Firebase."),(0,a.kt)("h1",{id:"background"},"Background"),(0,a.kt)("p",null,"Throughout one's academic career, it has been shown time and time again that one of the most consistently troublesome procedures experienced is getting assigned a group project and getting the flow of communication going. While this particular task can be daunting on it's own, it can become an even more daunting task when there are inevitable schedule conflicts. Even outside of the academic life, these same scheduling conflicts can be found during the coordination of recreational events with friends and family. The seemingly simple task of \"kicking back with the friends\" risks becoming a logistical nightmare. "),(0,a.kt)("p",null,"In the two scenarios above, the task of trying to find a block of time that works for everyone tends to be a very daunting one. Additionally, this particular task tends to be assigned to one unlucky individual. It can be assumed with a wide margin of certainty that if one with this assignment had the ability to make a task that can seem impossible at times, possible, they would be interested in resources that would aid in this daunting assignment."),(0,a.kt)("p",null,"Similar products to Round include official calendars with calendar sync integration like Google Calendars, or Calendar (",(0,a.kt)("a",{parentName:"p",href:"https://www.calendar.com/"},"https://www.calendar.com/"),") which has dynamic scheduling integration. However, many of the latter's features are locked behind a paywall. This creates a very unfortunate problem where paying for a \"premium\" feature is just not convenient enough for short-term use. Additionally, combining calendars typically tends to mean the event details are shared in some shape or form, implying that all who have their calendars integrated in a setting previously mentioned risk having other friends and associates aware of exactly what is occurring at any point in one's personal life. This is a scenario that should be avoided as much as possible, as the sharing of personal or public information should be completely at ones own discretion rather than as a necessity to set up a meeting time for a task. Round aspires to make calendar sync integration an easy and seamless process with privacy in mind."),(0,a.kt)("h1",{id:"required-resources"},"Required Resources"),(0,a.kt)("p",null,"Experience with Mobile App Development would be optimal for all group members. If every member has experience with Flutter specifically, that would be the best. This application prioritizes user experience, so members should keep that in mind as well."),(0,a.kt)("h1",{id:"keywords"},"Keywords"),(0,a.kt)("p",null,"Section 704, iOS App, Android App, Google Firebase, AIO Collaboration Tool, Group Projects, Friend Group Scheduling, Contact Information Share, Code-Based, Scheduling Algorithm"))}u.isMDXComponent=!0}}]);