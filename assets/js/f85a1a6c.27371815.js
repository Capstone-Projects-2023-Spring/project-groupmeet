"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[1270],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>g});var r=n(7294);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,r,i=function(e,t){if(null==e)return{};var n,r,i={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var s=r.createContext({}),u=function(e){var t=r.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},p=function(e){var t=u(e.components);return r.createElement(s.Provider,{value:t},e.children)},c="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},m=r.forwardRef((function(e,t){var n=e.components,i=e.mdxType,a=e.originalType,s=e.parentName,p=l(e,["components","mdxType","originalType","parentName"]),c=u(n),m=i,g=c["".concat(s,".").concat(m)]||c[m]||d[m]||a;return n?r.createElement(g,o(o({ref:t},p),{},{components:n})):r.createElement(g,o({ref:t},p))}));function g(e,t){var n=arguments,i=t&&t.mdxType;if("string"==typeof e||i){var a=n.length,o=new Array(a);o[0]=m;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[c]="string"==typeof e?e:i,o[1]=l;for(var u=2;u<a;u++)o[u]=n[u];return r.createElement.apply(null,o)}return r.createElement.apply(null,n)}m.displayName="MDXCreateElement"},770:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>o,default:()=>c,frontMatter:()=>a,metadata:()=>l,toc:()=>u});var r=n(7462),i=(n(7294),n(3905));const a={sidebar_position:1},o="Unit and Widget tests",l={unversionedId:"testing/unit-testing",id:"testing/unit-testing",title:"Unit and Widget tests",description:"These will allow us to test methods that provide unique functionality to each page. Unit tests will be used for methods that stay within a single page. Widget tests will be used in tandem with unit testing due to the nature of Flutter's middleware being heavily integrated into the front end.",source:"@site/docs/testing/unit-testing.md",sourceDirName:"testing",slug:"/testing/unit-testing",permalink:"/project-groupmeet/docs/testing/unit-testing",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/testing/unit-testing.md",tags:[],version:"current",lastUpdatedBy:"vvattap",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"docsSidebar",previous:{title:"Test Procedures",permalink:"/project-groupmeet/docs/category/test-procedures"},next:{title:"Integration tests",permalink:"/project-groupmeet/docs/testing/integration-testing"}},s={},u=[{value:"Unit Tests:",id:"unit-tests",level:2},{value:"Widget Tests:",id:"widget-tests",level:2}],p={toc:u};function c(e){let{components:t,...n}=e;return(0,i.kt)("wrapper",(0,r.Z)({},p,n,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"unit-and-widget-tests"},"Unit and Widget tests"),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},"These will allow us to test methods that provide unique functionality to each page. Unit tests will be used for methods that stay within a single page. Widget tests will be used in tandem with unit testing due to the nature of Flutter's middleware being heavily integrated into the front end.")),(0,i.kt)("h2",{id:"unit-tests"},"Unit Tests:"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"getQR()")),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Procedure: A new QRCode is generated"),(0,i.kt)("li",{parentName:"ul"},"Test: CanCreateCode()"),(0,i.kt)("li",{parentName:"ul"},"Input: QRViewController, needed to generate the code."),(0,i.kt)("li",{parentName:"ul"},"Output: a Barcode object containing the information for the QR Code."),(0,i.kt)("li",{parentName:"ul"},"Result: A QR Code will appear on the screen.")),(0,i.kt)("ol",{start:2},(0,i.kt)("li",{parentName:"ol"},"grabGroupId()")),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Procedure: The program is able to get the group ID for future usage."),(0,i.kt)("li",{parentName:"ul"},"Test: CanGetGroupId()"),(0,i.kt)("li",{parentName:"ul"},"Input: void"),(0,i.kt)("li",{parentName:"ul"},"Output: a populated groupId variable within the CodeSharingState object"),(0,i.kt)("li",{parentName:"ul"},"Result: The group ID will be stored for future usage.")),(0,i.kt)("ol",{start:3},(0,i.kt)("li",{parentName:"ol"},"logout() ",(0,i.kt)("strong",{parentName:"li"},"MAY BE A WIDGET TEST IN THE FUTURE"))),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Procedure: The user is able to logout of their account"),(0,i.kt)("li",{parentName:"ul"},"Test: CanLogout()"),(0,i.kt)("li",{parentName:"ul"},"Input: void"),(0,i.kt)("li",{parentName:"ul"},"Output: The local authenticator will remove the token associated to the user"),(0,i.kt)("li",{parentName:"ul"},"Result: The user is no longer logged in.")),(0,i.kt)("h2",{id:"widget-tests"},"Widget Tests:"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"login()")),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Procedure: User is able to login to their previously existing account."),(0,i.kt)("li",{parentName:"ul"},"Test: CanLogin()"),(0,i.kt)("li",{parentName:"ul"},"Input: void, however credentials will be received from the TextFormField controllers on the page."),(0,i.kt)("li",{parentName:"ul"},"Output: if login credentials are correct, the page will navigate to the user home screen and a snapshot of the user will be stored in the authenticator"),(0,i.kt)("li",{parentName:"ul"},"Result: User will be prompted based on the success")),(0,i.kt)("ol",{start:2},(0,i.kt)("li",{parentName:"ol"},"createUserProfile()")),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},"Procedue: User is able to make an account with an email and password"),(0,i.kt)("li",{parentName:"ul"},"Test: CanCreateAccount()"),(0,i.kt)("li",{parentName:"ul"},"Input: void, however credentials will be received from the TextFormField controllers on the page."),(0,i.kt)("li",{parentName:"ul"},"Output: if account information is valid, the user will be notified of successful creation"),(0,i.kt)("li",{parentName:"ul"},"Result: User will be prompted based on the success")))}c.isMDXComponent=!0}}]);