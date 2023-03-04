"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[1996],{3905:(e,t,n)=>{n.d(t,{Zo:()=>l,kt:()=>f});var r=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function s(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var c=r.createContext({}),p=function(e){var t=r.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):s(s({},t),e)),n},l=function(e){var t=p(e.components);return r.createElement(c.Provider,{value:t},e.children)},u="mdxType",g={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,i=e.mdxType,a=e.originalType,c=e.parentName,l=o(e,["components","mdxType","originalType","parentName"]),u=p(n),d=i,f=u["".concat(c,".").concat(d)]||u[d]||g[d]||a;return n?r.createElement(f,s(s({ref:t},l),{},{components:n})):r.createElement(f,s({ref:t},l))}));function f(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var a=n.length,s=new Array(a);s[0]=d;var o={};for(var c in t)hasOwnProperty.call(t,c)&&(o[c]=t[c]);o.originalType=e,o[u]="string"==typeof e?e:i,s[1]=o;for(var p=2;p<a;p++)s[p]=n[p];return r.createElement.apply(null,s)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},2680:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>c,contentTitle:()=>s,default:()=>u,frontMatter:()=>a,metadata:()=>o,toc:()=>p});var r=n(7462),i=(n(7294),n(3905));const a={sidebar_position:2},s="Integration tests",o={unversionedId:"testing/integration-testing",id:"testing/integration-testing",title:"Integration tests",description:"Use case 1",source:"@site/docs/testing/integration-testing.md",sourceDirName:"testing",slug:"/testing/integration-testing",permalink:"/project-groupmeet/docs/testing/integration-testing",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/testing/integration-testing.md",tags:[],version:"current",lastUpdatedBy:"KAAzadi",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"docsSidebar",previous:{title:"Unit and Widget tests",permalink:"/project-groupmeet/docs/testing/unit-testing"},next:{title:"Acceptance test",permalink:"/project-groupmeet/docs/testing/acceptence-testing"}},c={},p=[],l={toc:p};function u(e){let{components:t,...n}=e;return(0,i.kt)("wrapper",(0,r.Z)({},l,n,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"integration-tests"},"Integration tests"),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 1"),"\n-Description: User is able to successfully register with GroupMeet\n-Objective: Verify that firebase is storing user-entered input\n-Expected Test Result: Entered email is available for login"),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 2"),"\n-Description: User is able to log in to the app using their newly created information\n-Objective: Verify that firebase Authentication is working\n-Expected Test Result: User is able to log in and see their home screen."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 3"),"\n-Description: User is able to create a group\n-Objective: Verify user-created groups are stored appropriately within firebase\n-Expected Test Result: Groups are created and registered to the originating user."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 4"),"\n-Description: User can invite others to joine their group\n-Objective: Verify other users can join an already existing group\n-Expected Test Result: Users are linked to a pre-existing group"),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 5"),"\n-Description: Users can manually enter in times that they are busy\n-Objective: Verify the integrated calendar can account for manually entered dates\n-Expected Test Result: Calendar can successfully account for dates that are entered in by hand."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 6"),'\n-Description: Users can cancel a meeting\n-Objective: Verify that one user cancelling a meeting is recognized by all users\n-Expected Test Result: A change to a previously good date will lead to the generation of a new "good" date.'),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 7"),"\n-Description: The lifespan of a group can be modified.\n-Objective: Verify the lifespan of a group can be actively modified to end at an earlier/later date.\n-Expected Test Result: Groups exist for as long as they are needed."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 8"),"\n-Description: Users can be notified of their upcoming meeting\n-Objective: Verify that push notifications go out to the users at the expected times\n-Expected Test Result: Users receive push notifications at expected intervals prior to the meeting start."))}u.isMDXComponent=!0}}]);