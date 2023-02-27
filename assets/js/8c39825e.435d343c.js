"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[8525],{3905:(e,n,t)=>{t.d(n,{Zo:()=>p,kt:()=>b});var o=t(7294);function l(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function r(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);n&&(o=o.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,o)}return t}function i(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?r(Object(t),!0).forEach((function(n){l(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):r(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function s(e,n){if(null==e)return{};var t,o,l=function(e,n){if(null==e)return{};var t,o,l={},r=Object.keys(e);for(o=0;o<r.length;o++)t=r[o],n.indexOf(t)>=0||(l[t]=e[t]);return l}(e,n);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(o=0;o<r.length;o++)t=r[o],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(l[t]=e[t])}return l}var a=o.createContext({}),c=function(e){var n=o.useContext(a),t=n;return e&&(t="function"==typeof e?e(n):i(i({},n),e)),t},p=function(e){var n=c(e.components);return o.createElement(a.Provider,{value:n},e.children)},u="mdxType",m={inlineCode:"code",wrapper:function(e){var n=e.children;return o.createElement(o.Fragment,{},n)}},d=o.forwardRef((function(e,n){var t=e.components,l=e.mdxType,r=e.originalType,a=e.parentName,p=s(e,["components","mdxType","originalType","parentName"]),u=c(t),d=l,b=u["".concat(a,".").concat(d)]||u[d]||m[d]||r;return t?o.createElement(b,i(i({ref:n},p),{},{components:t})):o.createElement(b,i({ref:n},p))}));function b(e,n){var t=arguments,l=n&&n.mdxType;if("string"==typeof e||l){var r=t.length,i=new Array(r);i[0]=d;var s={};for(var a in n)hasOwnProperty.call(n,a)&&(s[a]=n[a]);s.originalType=e,s[u]="string"==typeof e?e:l,i[1]=s;for(var c=2;c<r;c++)i[c]=t[c];return o.createElement.apply(null,i)}return o.createElement.apply(null,t)}d.displayName="MDXCreateElement"},5389:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>a,contentTitle:()=>i,default:()=>u,frontMatter:()=>r,metadata:()=>s,toc:()=>c});var o=t(7462),l=(t(7294),t(3905));const r={sidebar_position:3},i="Schedule",s={unversionedId:"development-plan/schedule",id:"development-plan/schedule",title:"Schedule",description:"Milestone 1 Goals:",source:"@site/docs/development-plan/schedule.md",sourceDirName:"development-plan",slug:"/development-plan/schedule",permalink:"/project-groupmeet/docs/development-plan/schedule",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/development-plan/schedule.md",tags:[],version:"current",lastUpdatedBy:"Athan Kim",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"docsSidebar",previous:{title:"Tasks",permalink:"/project-groupmeet/docs/development-plan/tasks"},next:{title:"Development Environment",permalink:"/project-groupmeet/docs/development-plan/development-environment"}},a={},c=[],p={toc:c};function u(e){let{components:n,...t}=e;return(0,l.kt)("wrapper",(0,o.Z)({},p,t,{components:n,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"schedule"},"Schedule"),(0,l.kt)("mermaid",{value:"gantt\n    title GroupMeet Development Cycle\n    dateFormat  YYYY-MM-DD\n    excludes 2023-03-07 2023-03-08 2023-03-09 2023-03-10 2023-03-11 2023-03-12\n        section Development \n         Sprint 0: , 2023-02-08, 1w\n        section Development \n         Firebase prototype integration to app:  done, 2023-02-08, 1d\n        section Development \n         Create Account Page UI:  done, 2023-02-09, 3d\n        section Development \n         Firebase test db established:  done, 2023-02-08,4d\n        section Development \n         Generate Welcome Page:  done, 2023-02-08, 4d\n        section Development \n         Account Creation Page information:  done, 2023-02-08, 6d\n        section Development \n         Establish Google Firebase:  done, 2023-02-08, 6d\n        section Development \n         Integrate Firebase:  done, 2023-02-08, 6d\n        section Development \n         Documentation Maintenance:  done, 2023-02-08, 1w\n        section Development \n         Generate foundational app features:  done, 2023-02-08, 1w\n        section Development \n         Software Development Plan Assignment: milestone, done, 2023-02-12, 1d\n         \n        section Development \n         Sprint 1: , 2023-02-15, 2w\n        section Development \n         Design Prototype:  , 2023-02-08, 3w\n        section Development \n         Foundational social media integration:  , 2023-02-15, 2w\n        section Development \n         Group creation Development:  , 2023-02-15, 2w\n        section Development \n         Code/link sharing feature Development:  , 2023-02-15, 2w\n        section Development \n         Design Document Part 1 (Architecture) Assignment: milestone, , 2023-02-19, 1d\n        section Development \n         Design Document Part 2 (API) Assignment: milestone, , 2023-02-26, 1d\n         \n        section Development \n         Sprint 2: , 2023-03-01, 1w\n        section Development \n         Create group finalization algorithms & procedures:  , 2023-03-01, 1d\n        section Development \n         Test Procedures Document Assignment: milestone, , 2023-03-05, 1d\n        section Development \n         Spring Break (no classes held): done, 2023-03-06, 1d\n        section Development \n         Milestone Demo 1 :crit, milestone,  , 2023-03-14, 1d\n         \n        section Development \n         Sprint 3: , 2023-03-15, 2w\n        section Development \n         Establish Google Calendar sync integration:  , 2023-03-15, 1d\n        section Development \n         Milestone Demo 2 :crit, milestone,  , 2023-03-28, 1d\n         \n        section Development \n         Sprint 4: , 2023-03-29, 2w\n        section Development \n         Develop misc. features to fulfill various scenarios in user flow:  , 2023-03-29, 1d\n        section Development \n         Notification integration:  , 2023-03-29, 1d\n        section Development \n         Milestone Demo 3 :crit, milestone,  , 2023-04-11, 1d\n         \n        section Development \n         Sprint 5: , 2023-04-12, 16d\n        section Development \n         App finalizations and alloted time to integrate optional desired features:  , 2023-04-12, 1d\n        section Development \n         Final Presentation & Demo :crit, milestone,  , 2023-04-27, 1d\n        section Development \n         Test Report Document Assignment: milestone, , 2023-05-06, 1d\n        section Development \n         Final Software Release Assignment: milestone, , 2023-05-07, 1d\n        section Development \n         Final Grade Submissions \ud83c\udf93 :  , 2023-05-12, 1d\n        "}),(0,l.kt)("p",null,"Milestone 1 Goals:",(0,l.kt)("br",null),"\n","\u2002","F: Login and Account Creation",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to register new account",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to login with existing account",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to update account",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to view account information",(0,l.kt)("br",null),"\n","\u2002","F: Group creation",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: First pass of user accessing group",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: First pass of group registration ",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: First pass of group creation ",(0,l.kt)("br",null),"\n","\u2002","F: Social Media",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to view all social media accounts of all users in the groups",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to broadcast the most common platform",(0,l.kt)("br",null)),(0,l.kt)("p",null,"Milestone 2 Goals:",(0,l.kt)("br",null),"\n","\u2002","F: Calendar Integration",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to combine multiple of the same kind of calendar",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to create event on calendar",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to recognize a free time slot",(0,l.kt)("br",null),"\n","\u2002","F: Push notifications to user",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to notify users of a time",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to prompt the user if the selected time is good",(0,l.kt)("br",null),"\n","\u2002","F: Group creation",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Second pass of Milestone 1 Requirements",(0,l.kt)("br",null)),(0,l.kt)("p",null,"Milestone 3 Goals:",(0,l.kt)("br",null),"\n","\u2002","F: Calendar Integration",(0,l.kt)("br",null),"\n","\u2002","\u2002",'R: First pass of "Unforeseen events" that cause changes in scheduling',(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to integrate multiple calendars",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to find new time if first time does not work",(0,l.kt)("br",null),"\n","\u2002","F: Push notification to user",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to notify user of time being cancelled, and prompt with new time",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Second pass of user confirmations",(0,l.kt)("br",null),"\n","\u2002","F: Group creation",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Final pass",(0,l.kt)("br",null),"\n","\u2002","F: Social Media",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to generate a clipboard with all user handles of specified platform",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to send users directly to platform of interest (if they have mobile app)",(0,l.kt)("br",null)),(0,l.kt)("p",null,"Milestone 4 Goals:",(0,l.kt)("br",null),"\n","\u2002","F: Calendar Integration",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Final pass",(0,l.kt)("br",null),"\n","\u2002","F: Social Media",(0,l.kt)("br",null),"\n","\u2002","\u2002","R: Able to create group when applicable"))}u.isMDXComponent=!0}}]);