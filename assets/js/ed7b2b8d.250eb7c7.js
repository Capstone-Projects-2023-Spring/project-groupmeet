"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[3961],{3905:(e,t,r)=>{r.d(t,{Zo:()=>u,kt:()=>g});var n=r(7294);function a(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function i(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function o(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?i(Object(r),!0).forEach((function(t){a(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):i(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function s(e,t){if(null==e)return{};var r,n,a=function(e,t){if(null==e)return{};var r,n,a={},i=Object.keys(e);for(n=0;n<i.length;n++)r=i[n],t.indexOf(r)>=0||(a[r]=e[r]);return a}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(n=0;n<i.length;n++)r=i[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(a[r]=e[r])}return a}var c=n.createContext({}),p=function(e){var t=n.useContext(c),r=t;return e&&(r="function"==typeof e?e(t):o(o({},t),e)),r},u=function(e){var t=p(e.components);return n.createElement(c.Provider,{value:t},e.children)},l="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},m=n.forwardRef((function(e,t){var r=e.components,a=e.mdxType,i=e.originalType,c=e.parentName,u=s(e,["components","mdxType","originalType","parentName"]),l=p(r),m=a,g=l["".concat(c,".").concat(m)]||l[m]||d[m]||i;return r?n.createElement(g,o(o({ref:t},u),{},{components:r})):n.createElement(g,o({ref:t},u))}));function g(e,t){var r=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var i=r.length,o=new Array(i);o[0]=m;var s={};for(var c in t)hasOwnProperty.call(t,c)&&(s[c]=t[c]);s.originalType=e,s[l]="string"==typeof e?e:a,o[1]=s;for(var p=2;p<i;p++)o[p]=r[p];return n.createElement.apply(null,o)}return n.createElement.apply(null,r)}m.displayName="MDXCreateElement"},5531:(e,t,r)=>{r.r(t),r.d(t,{assets:()=>c,contentTitle:()=>o,default:()=>l,frontMatter:()=>i,metadata:()=>s,toc:()=>p});var n=r(7462),a=(r(7294),r(3905));const i={sidebar_position:1},o=void 0,s={unversionedId:"system-architecture/design",id:"system-architecture/design",title:"design",description:"Purpose",source:"@site/docs/system-architecture/design.md",sourceDirName:"system-architecture",slug:"/system-architecture/design",permalink:"/project-groupmeet/docs/system-architecture/design",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/system-architecture/design.md",tags:[],version:"current",lastUpdatedBy:"Varsha Vattappally",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"System Architecture",permalink:"/project-groupmeet/docs/category/system-architecture"},next:{title:"API Specification",permalink:"/project-groupmeet/docs/category/api-specification"}},c={},p=[],u={toc:p};function l(e){let{components:t,...r}=e;return(0,a.kt)("wrapper",(0,n.Z)({},u,r,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Purpose")),(0,a.kt)("p",null,"The Design Document - Part I Architecture describes the software architecture and how the requirements are mapped into the design. This document will be a combination of diagrams and text that describes what the diagrams are showing."),(0,a.kt)("p",null,(0,a.kt)("strong",{parentName:"p"},"Requirements")),(0,a.kt)("p",null,"In addition to the general requirements the Design Document - Part I Architecture will contain:"),(0,a.kt)("p",null,"A description the different components and their interfaces. For example: client, server, database."),(0,a.kt)("p",null,"For each component provide class diagrams showing the classes to be developed (or used) and their relationship."),(0,a.kt)("p",null,"Sequence diagrams showing the data flow for ",(0,a.kt)("em",{parentName:"p"},"all")," use cases.\xa0One sequence diagram corresponds to one use case and different use cases should have different corresponding sequence diagrams."),(0,a.kt)("p",null,"###Use Case 2: Event Creation"),(0,a.kt)("mermaid",{value:"sequenceDiagram\n    actor User\n    participant GroupMeet App\n    participant Firebase Authentication\n    participant Realtime Database\n    User->>+ GroupMeet App: login()\n    GroupMeet App->>+Firebase Authentication: signInWithEmailAndPassword()\n    \n    User->>+GroupMeet App: Presses button to create a new group\n    GroupMeet App --\x3e> User: prompts user for group information\n    User->>+GroupMeet App: Enters group information\n\n    GroupMeet App->>+Realtime Database : update() to group settings"}),(0,a.kt)("p",null,"Describe algorithms employed in your project, e.g. neural network paradigm, training and training data set, etc."),(0,a.kt)("p",null,"If there is a database:"),(0,a.kt)("p",null,"Entity-relation diagram."),(0,a.kt)("p",null,"Table design."),(0,a.kt)("p",null,"A check list for architecture design is attached here ",(0,a.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928870/download?wrap=1",title:"architecture_design_checklist.pdf"},"architecture","_","design","_","checklist.pdf"),"\xa0 and should be used as a guidance."))}l.isMDXComponent=!0}}]);