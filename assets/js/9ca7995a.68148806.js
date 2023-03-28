"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[1996],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>b});var r=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function s(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function a(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?s(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):s(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},s=Object.keys(e);for(r=0;r<s.length;r++)n=s[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(e);for(r=0;r<s.length;r++)n=s[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var l=r.createContext({}),c=function(e){var t=r.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):a(a({},t),e)),n},u=function(e){var t=c(e.components);return r.createElement(l.Provider,{value:t},e.children)},p="mdxType",g={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,i=e.mdxType,s=e.originalType,l=e.parentName,u=o(e,["components","mdxType","originalType","parentName"]),p=c(n),d=i,b=p["".concat(l,".").concat(d)]||p[d]||g[d]||s;return n?r.createElement(b,a(a({ref:t},u),{},{components:n})):r.createElement(b,a({ref:t},u))}));function b(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var s=n.length,a=new Array(s);a[0]=d;var o={};for(var l in t)hasOwnProperty.call(t,l)&&(o[l]=t[l]);o.originalType=e,o[p]="string"==typeof e?e:i,a[1]=o;for(var c=2;c<s;c++)a[c]=n[c];return r.createElement.apply(null,a)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},2680:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>a,default:()=>p,frontMatter:()=>s,metadata:()=>o,toc:()=>c});var r=n(7462),i=(n(7294),n(3905));const s={sidebar_position:2},a="Integration tests",o={unversionedId:"testing/integration-testing",id:"testing/integration-testing",title:"Integration tests",description:"Use case 1",source:"@site/docs/testing/integration-testing.md",sourceDirName:"testing",slug:"/testing/integration-testing",permalink:"/project-groupmeet/docs/testing/integration-testing",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/testing/integration-testing.md",tags:[],version:"current",lastUpdatedBy:"tweiss9",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"docsSidebar",previous:{title:"Unit and Widget tests",permalink:"/project-groupmeet/docs/testing/unit-testing"},next:{title:"Acceptance test",permalink:"/project-groupmeet/docs/testing/acceptence-testing"}},l={},c=[],u={toc:c};function p(e){let{components:t,...n}=e;return(0,i.kt)("wrapper",(0,r.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"integration-tests"},"Integration tests"),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 1"),(0,i.kt)("br",null),"\n-Description: User is able to successfully register with GroupMeet",(0,i.kt)("br",null),"\n-Objective: Verify that firebase is storing user-entered input",(0,i.kt)("br",null),"\n-Expected Test Result: Entered email is available for login",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 2"),(0,i.kt)("br",null),"\n-Description: User is able to log in to the app using their newly created information",(0,i.kt)("br",null),"\n-Objective: Verify that firebase Authentication is working",(0,i.kt)("br",null),"\n-Expected Test Result: User is able to log in and see their home screen.",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 3"),(0,i.kt)("br",null),"\n-Description: User is able to create a group",(0,i.kt)("br",null),"\n-Objective: Verify user-created groups are stored appropriately within firebase",(0,i.kt)("br",null),"\n-Expected Test Result: Groups are created and registered to the originating user.",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 4"),(0,i.kt)("br",null),"\n-Description: User can invite others to joine their group",(0,i.kt)("br",null),"\n-Objective: Verify other users can join an already existing group",(0,i.kt)("br",null),"\n-Expected Test Result: Users are linked to a pre-existing group",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 5"),(0,i.kt)("br",null),"\n-Description: Users can manually enter in times that they are busy",(0,i.kt)("br",null),"\n-Objective: Verify the integrated calendar can account for manually entered dates",(0,i.kt)("br",null),"\n-Expected Test Result: Calendar can successfully account for dates that are entered in by hand.",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 6"),(0,i.kt)("br",null),"\n-Description: Users can cancel a meeting",(0,i.kt)("br",null),"\n-Objective: Verify that one user cancelling a meeting is recognized by all users",(0,i.kt)("br",null),'\n-Expected Test Result: A change to a previously good date will lead to the generation of a new "good" date.',(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 7"),(0,i.kt)("br",null),"\n-Description: The lifespan of a group can be modified.",(0,i.kt)("br",null),"\n-Objective: Verify the lifespan of a group can be actively modified to end at an earlier/later date.",(0,i.kt)("br",null),"\n-Expected Test Result: Groups exist for as long as they are needed.",(0,i.kt)("br",null)),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"Use case 8"),(0,i.kt)("br",null),"\n-Description: Users can be notified of their upcoming meeting",(0,i.kt)("br",null),"\n-Objective: Verify that push notifications go out to the users at the expected times",(0,i.kt)("br",null),"\n-Expected Test Result: Users receive push notifications at expected intervals prior to the meeting start.",(0,i.kt)("br",null)))}p.isMDXComponent=!0}}]);