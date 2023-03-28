"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[4033],{3905:(e,t,a)=>{a.d(t,{Zo:()=>c,kt:()=>f});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function o(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function i(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?o(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):o(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function l(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},o=Object.keys(e);for(n=0;n<o.length;n++)a=o[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)a=o[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var s=n.createContext({}),p=function(e){var t=n.useContext(s),a=t;return e&&(a="function"==typeof e?e(t):i(i({},t),e)),a},c=function(e){var t=p(e.components);return n.createElement(s.Provider,{value:t},e.children)},u="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},d=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,o=e.originalType,s=e.parentName,c=l(e,["components","mdxType","originalType","parentName"]),u=p(a),d=r,f=u["".concat(s,".").concat(d)]||u[d]||m[d]||o;return a?n.createElement(f,i(i({ref:t},c),{},{components:a})):n.createElement(f,i({ref:t},c))}));function f(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var o=a.length,i=new Array(o);i[0]=d;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[u]="string"==typeof e?e:r,i[1]=l;for(var p=2;p<o;p++)i[p]=a[p];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}d.displayName="MDXCreateElement"},9801:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>s,contentTitle:()=>i,default:()=>u,frontMatter:()=>o,metadata:()=>l,toc:()=>p});var n=a(7462),r=(a(7294),a(3905));const o={sidebar_position:2},i="Tasks",l={unversionedId:"development-plan/tasks",id:"development-plan/tasks",title:"Tasks",description:"1. Establish Google Firebase for a cloud-hosted database that the app can be hosted on",source:"@site/docs/development-plan/tasks.md",sourceDirName:"development-plan",slug:"/development-plan/tasks",permalink:"/project-groupmeet/docs/development-plan/tasks",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/development-plan/tasks.md",tags:[],version:"current",lastUpdatedBy:"Varsha Vattappally",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"docsSidebar",previous:{title:"Activities",permalink:"/project-groupmeet/docs/development-plan/activities"},next:{title:"Schedule",permalink:"/project-groupmeet/docs/development-plan/schedule"}},s={},p=[],c={toc:p};function u(e){let{components:t,...a}=e;return(0,r.kt)("wrapper",(0,n.Z)({},c,a,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"tasks"},"Tasks"),(0,r.kt)("ol",null,(0,r.kt)("li",{parentName:"ol"},"Establish Google Firebase for a cloud-hosted database that the app can be hosted on",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Create GroupMeet Firebase account and generate project(s)"))),(0,r.kt)("li",{parentName:"ol"},"Generate foundational app features such as welcome, account creation and login pages",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Establish project in Flutter"),(0,r.kt)("li",{parentName:"ul"},"Create welcome page"),(0,r.kt)("li",{parentName:"ul"},"Create account creation page"),(0,r.kt)("li",{parentName:"ul"},"Establish foundational social media integration/contact information input"),(0,r.kt)("li",{parentName:"ul"},"Hook up welcome page to Firebase"),(0,r.kt)("li",{parentName:"ul"},"Create account page"))),(0,r.kt)("li",{parentName:"ol"},"Group creation and code/link sharing feature development",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Create group link generation/group join option after user has created an account"),(0,r.kt)("li",{parentName:"ul"},"Establish group creation feature"),(0,r.kt)("li",{parentName:"ul"},"Establish QR code/link/unique code creation"),(0,r.kt)("li",{parentName:"ul"},"Establish code sharing integration"))),(0,r.kt)("li",{parentName:"ol"},"Create group finalization algorithm(s) including static calendar generation",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"After all criteria are met (all users join group, users sync calendars or deny)"),(0,r.kt)("li",{parentName:"ul"},"Establish algorithm(s) and functions that generate joined calendar based on every user's overlapping availability"))),(0,r.kt)("li",{parentName:"ol"},"Establish calendar sync integration with Google Calendar",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Establish ability for users to sync their Google Calendars",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"GroupMeet only takes times to account for availability and privacy"))))),(0,r.kt)("li",{parentName:"ol"},"Develop miscellaneous features to fulfill scenarios that could occur in user flows",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Develop feature to account for users who have to cancel meeting due to unforseen unavailability",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"GroupMeet cancels current meeting, takes joined calendar and schedules the next best time as a suggestion",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Users then consent to new time"))))),(0,r.kt)("li",{parentName:"ul"},"Develop feature to account for situation where a user did not provide any availability",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"GroupMeet outputs to that specific user a list of all overlapping availabilities in which the user easily selects times available to them"))))),(0,r.kt)("li",{parentName:"ol"},"Notification integration at certain stages of user flow",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Develop integrations so that GroupMeet sends notifications to users at specific times of user flow",(0,r.kt)("ul",{parentName:"li"},(0,r.kt)("li",{parentName:"ul"},"Accounting for real-time notifications and internal timers to do so")))))))}u.isMDXComponent=!0}}]);