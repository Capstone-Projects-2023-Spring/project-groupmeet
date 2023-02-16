"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[8525],{3905:(e,n,t)=>{t.d(n,{Zo:()=>c,kt:()=>v});var o=t(7294);function r(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function i(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);n&&(o=o.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,o)}return t}function l(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?i(Object(t),!0).forEach((function(n){r(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):i(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function s(e,n){if(null==e)return{};var t,o,r=function(e,n){if(null==e)return{};var t,o,r={},i=Object.keys(e);for(o=0;o<i.length;o++)t=i[o],n.indexOf(t)>=0||(r[t]=e[t]);return r}(e,n);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(o=0;o<i.length;o++)t=i[o],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var a=o.createContext({}),p=function(e){var n=o.useContext(a),t=n;return e&&(t="function"==typeof e?e(n):l(l({},n),e)),t},c=function(e){var n=p(e.components);return o.createElement(a.Provider,{value:n},e.children)},m="mdxType",d={inlineCode:"code",wrapper:function(e){var n=e.children;return o.createElement(o.Fragment,{},n)}},u=o.forwardRef((function(e,n){var t=e.components,r=e.mdxType,i=e.originalType,a=e.parentName,c=s(e,["components","mdxType","originalType","parentName"]),m=p(t),u=r,v=m["".concat(a,".").concat(u)]||m[u]||d[u]||i;return t?o.createElement(v,l(l({ref:n},c),{},{components:t})):o.createElement(v,l({ref:n},c))}));function v(e,n){var t=arguments,r=n&&n.mdxType;if("string"==typeof e||r){var i=t.length,l=new Array(i);l[0]=u;var s={};for(var a in n)hasOwnProperty.call(n,a)&&(s[a]=n[a]);s.originalType=e,s[m]="string"==typeof e?e:r,l[1]=s;for(var p=2;p<i;p++)l[p]=t[p];return o.createElement.apply(null,l)}return o.createElement.apply(null,t)}u.displayName="MDXCreateElement"},5389:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>a,contentTitle:()=>l,default:()=>m,frontMatter:()=>i,metadata:()=>s,toc:()=>p});var o=t(7462),r=(t(7294),t(3905));const i={sidebar_position:3},l="Schedule",s={unversionedId:"development-plan/schedule",id:"development-plan/schedule",title:"Schedule",description:"Milestone 1 Goals:",source:"@site/docs/development-plan/schedule.md",sourceDirName:"development-plan",slug:"/development-plan/schedule",permalink:"/project-groupmeet/docs/development-plan/schedule",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/development-plan/schedule.md",tags:[],version:"current",lastUpdatedBy:"KAAzadi",sidebarPosition:3,frontMatter:{sidebar_position:3},sidebar:"docsSidebar",previous:{title:"Tasks",permalink:"/project-groupmeet/docs/development-plan/tasks"},next:{title:"Development Environment",permalink:"/project-groupmeet/docs/development-plan/development-environment"}},a={},p=[],c={toc:p};function m(e){let{components:n,...t}=e;return(0,r.kt)("wrapper",(0,o.Z)({},c,t,{components:n,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"schedule"},"Schedule"),(0,r.kt)("mermaid",{value:"gantt\n    title GroupMeet Development Cycle\n    dateFormat  YYYY-MM-DD\n    excludes 2023-03-07 2023-03-08 2023-03-09 2023-03-10 2023-03-11 2023-03-12\n        section Development \n         Sprint 0: , 2023-02-08, 1w\n        section Development \n         Account Creation Page:  done, 2023-02-08, 1w\n        section Development \n         Create Account Page:  done, 2023-02-08, 1w\n        section Development \n         Documentation Maintenance:  done, 2023-02-08, 1w\n        section Development \n         Establish Google Firebase:  done, 2023-02-08, 1w\n        section Development \n         Firebase prototype integration to app:  done, 2023-02-08, 1w\n        section Development \n         Firebase test db established:  done, 2023-02-08, 1w\n        section Development \n         Generate foundational app features:  done, 2023-02-08, 1w\n        section Development \n         Generate Welcome Page:  done, 2023-02-08, 1w\n        section Development \n         Integrate Firebase:  done, 2023-02-08, 1w\n        section Development \n         Software Development Plan Assignment: milestone, done, 2023-02-12, 1d\n         \n        section Development \n         Sprint 1: , 2023-02-15, 2w\n        section Development \n         Design Prototype:  , 2023-02-08, 3w\n        section Development \n         Foundational social media integration:  , 2023-02-15, 1w\n        section Development \n         Group creation Development:  , 2023-02-15, 1d\n        section Development \n         Code/link sharing feature Development:  , 2023-02-15, 1d\n        section Development \n         Design Document Part 1 (Architecture) Assignment: milestone, , 2023-02-19, 1d\n        section Development \n         Design Document Part 2 (API) Assignment: milestone, , 2023-02-26, 1d\n         \n        section Development \n         Sprint 2: , 2023-03-01, 1w\n        section Development \n         Create group finalization algorithms & procedures:  , 2023-03-01, 1d\n        section Development \n         Test Procedures Document Assignment: milestone, , 2023-03-05, 1d\n        section Development \n         Spring Break (no classes held): done, 2023-03-06, 1d\n        section Development \n         Milestone Demo 1 :crit, milestone,  , 2023-03-14, 1d\n         \n        section Development \n         Sprint 3: , 2023-03-15, 2w\n        section Development \n         Establish Google Calendar sync integration:  , 2023-03-15, 1d\n        section Development \n         Milestone Demo 2 :crit, milestone,  , 2023-03-28, 1d\n         \n        section Development \n         Sprint 4: , 2023-03-29, 2w\n        section Development \n         Develop misc. features to fulfill various scenarios in user flow:  , 2023-03-29, 1d\n        section Development \n         Notification integration:  , 2023-03-29, 1d\n        section Development \n         Milestone Demo 3 :crit, milestone,  , 2023-04-11, 1d\n         \n        section Development \n         Sprint 5: , 2023-04-12, 16d\n        section Development \n         App finalizations and alloted time to integrate optional desired features:  , 2023-04-12, 1d\n        section Development \n         Final Presentation & Demo :crit, milestone,  , 2023-04-27, 1d\n        section Development \n         Test Report Document Assignment: milestone, , 2023-05-06, 1d\n        section Development \n         Final Software Release Assignment: milestone, , 2023-05-07, 1d\n        section Development \n         Final Grade Submissions \ud83c\udf93 :  , 2023-05-12, 1d\n        "}),(0,r.kt)("p",null,"Milestone 1 Goals:"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"First pass of prototype."),(0,r.kt)("li",{parentName:"ul"},"First pass of design awaiting feedback from UX."),(0,r.kt)("li",{parentName:"ul"},"Database able to pull and store groups.")))}m.isMDXComponent=!0}}]);