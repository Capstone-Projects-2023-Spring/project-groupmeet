"use strict";(self.webpackChunktu_cis_4398_docs_template=self.webpackChunktu_cis_4398_docs_template||[]).push([[7349],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>g});var i=n(7294);function l(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function r(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);t&&(i=i.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,i)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?r(Object(n),!0).forEach((function(t){l(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):r(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function a(e,t){if(null==e)return{};var n,i,l=function(e,t){if(null==e)return{};var n,i,l={},r=Object.keys(e);for(i=0;i<r.length;i++)n=r[i],t.indexOf(n)>=0||(l[n]=e[n]);return l}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(i=0;i<r.length;i++)n=r[i],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(l[n]=e[n])}return l}var s=i.createContext({}),p=function(e){var t=i.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},u=function(e){var t=p(e.components);return i.createElement(s.Provider,{value:t},e.children)},d="mdxType",c={inlineCode:"code",wrapper:function(e){var t=e.children;return i.createElement(i.Fragment,{},t)}},h=i.forwardRef((function(e,t){var n=e.components,l=e.mdxType,r=e.originalType,s=e.parentName,u=a(e,["components","mdxType","originalType","parentName"]),d=p(n),h=l,g=d["".concat(s,".").concat(h)]||d[h]||c[h]||r;return n?i.createElement(g,o(o({ref:t},u),{},{components:n})):i.createElement(g,o({ref:t},u))}));function g(e,t){var n=arguments,l=t&&t.mdxType;if("string"==typeof e||l){var r=n.length,o=new Array(r);o[0]=h;var a={};for(var s in t)hasOwnProperty.call(t,s)&&(a[s]=t[s]);a.originalType=e,a[d]="string"==typeof e?e:l,o[1]=a;for(var p=2;p<r;p++)o[p]=n[p];return i.createElement.apply(null,o)}return i.createElement.apply(null,n)}h.displayName="MDXCreateElement"},8614:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>s,contentTitle:()=>o,default:()=>d,frontMatter:()=>r,metadata:()=>a,toc:()=>p});var i=n(7462),l=(n(7294),n(3905));const r={sidebar_position:1,description:"Our API"},o="Design Document - Part II API",a={unversionedId:"api-specification/design-api-intro",id:"api-specification/design-api-intro",title:"Design Document - Part II API",description:"Our API",source:"@site/docs/api-specification/design-api-intro.md",sourceDirName:"api-specification",slug:"/api-specification/design-api-intro",permalink:"/project-groupmeet/docs/api-specification/design-api-intro",draft:!1,editUrl:"https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/edit/main/documentation/docs/api-specification/design-api-intro.md",tags:[],version:"current",lastUpdatedBy:"Varsha Vattappally",sidebarPosition:1,frontMatter:{sidebar_position:1,description:"Our API"},sidebar:"docsSidebar",previous:{title:"API Specification",permalink:"/project-groupmeet/docs/category/api-specification"},next:{title:"API 1 - Swagger Petstore",permalink:"/project-groupmeet/docs/api-specification/openapi-spec"}},s={},p=[{value:"Constructors",id:"constructors",level:2},{value:"Properties",id:"properties",level:2},{value:"Methods",id:"methods",level:2},{value:"Constructors",id:"constructors-1",level:2},{value:"Properties",id:"properties-1",level:2},{value:"Methods",id:"methods-1",level:2},{value:"Constructors",id:"constructors-2",level:2},{value:"Properties",id:"properties-2",level:2},{value:"Methods",id:"methods-2",level:2},{value:"Constructors",id:"constructors-3",level:2},{value:"Properties",id:"properties-3",level:2},{value:"Methods",id:"methods-3",level:2}],u={toc:p};function d(e){let{components:t,...n}=e;return(0,l.kt)("wrapper",(0,i.Z)({},u,n,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"design-document---part-ii-api"},"Design Document - Part II API"),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Purpose")),(0,l.kt)("p",null,"This Design Document gives the complete design of the software implementation. This information should be in structured comments (e.g. Javadoc) in the source files. We encourage the use of a documentation generation tool to generate a draft of your API that you can augment to include the following details."),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Requirements")),(0,l.kt)("p",null,"In addition to the general documentation requirements the Design Document - Part II API will contain:"),(0,l.kt)("p",null,"General review of the software architecture for each module specified in Design Document - Part I Architecture. Please include your class diagram as an important reference."),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"For each class define the data fields, methods.")),(0,l.kt)("p",null,"The purpose of the class."),(0,l.kt)("p",null,"The purpose of each data field."),(0,l.kt)("p",null,"The purpose of each method"),(0,l.kt)("p",null,"Pre-conditions if any."),(0,l.kt)("p",null,"Post-conditions if any."),(0,l.kt)("p",null,"Parameters and data types"),(0,l.kt)("p",null,"Return value and output variables"),(0,l.kt)("p",null,"Exceptions thrown","*"," (PLEASE see note below for details)."),(0,l.kt)("p",null,"An example of an auto-generated and then augmented API specification is here (",(0,l.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928898?wrap=1",title:"Fiscal Design Document 2_API.docx"},"Fiscal Design Document 2","_","API.docx")," )"),(0,l.kt)("p",null,"This group developed their API documentation by hand (",(0,l.kt)("a",{parentName:"p",href:"https://templeu.instructure.com/courses/106563/files/16928899?wrap=1",title:"Design Document Part 2 API-1_MovieMatch.docx"},"Design Document Part 2 API-1","_","MovieMatch.docx")," )"),(0,l.kt)("p",null,"*",'At the top level, or where appropriate, all exceptions should be caught and an error message that is meaningful to the user generated. It is not OK to say ("xxxx has encountered a problem and will now close (OK?)". Error messages and recovery procedures should be documented in the User\u2019s Manual.'),(0,l.kt)("h1",{id:"myapp-class"},"MyApp class"),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Purpose"),"\nTo start the application and create the home page."),(0,l.kt)("p",null,"Inheritance"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"[Object]"),(0,l.kt)("li",{parentName:"ul"},"[DiagnosticableTree]"),(0,l.kt)("li",{parentName:"ul"},"[Widget]"),(0,l.kt)("li",{parentName:"ul"},"[StatelessWidget]"),(0,l.kt)("li",{parentName:"ul"},"MyApp")),(0,l.kt)("h2",{id:"constructors"},"Constructors"),(0,l.kt)("p",null,"[MyApp]","({","[Key]","? key})"),(0,l.kt)("p",null,"const"),(0,l.kt)("h2",{id:"properties"},"Properties"),(0,l.kt)("p",null,"[hashCode]"," \u2192 ","[int]"),(0,l.kt)("p",null,"The hash code for this object."),(0,l.kt)("p",null,"@","[nonVirtual]",", read-only, inherited"),(0,l.kt)("p",null,"[key]"," \u2192 ","[Key]","?"),(0,l.kt)("p",null,"Controls how one widget replaces another widget in the tree."),(0,l.kt)("p",null,"final, inherited"),(0,l.kt)("p",null,"[runtimeType]"," \u2192 ","[Type]"),(0,l.kt)("p",null,"A representation of the runtime type of the object."),(0,l.kt)("p",null,"read-only, inherited"),(0,l.kt)("h2",{id:"methods"},"Methods"),(0,l.kt)("p",null,"[build]","(","[BuildContext]"," context) \u2192 ","[Widget]"),(0,l.kt)("p",null,"Describes the part of the user interface represented by this widget."),(0,l.kt)("p",null,"override"),(0,l.kt)("p",null,"[createElement]"," \u2192 ","[StatelessElement]"),(0,l.kt)("p",null,"Creates a ","[StatelessElement]"," to manage this widget's location in the tree."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[debugDescribeChildren]"," \u2192 ","[List]","<","[DiagnosticsNode]",">"),(0,l.kt)("p",null,"Returns a list of ",(0,l.kt)("inlineCode",{parentName:"p"},"DiagnosticsNode")," objects describing this node's children."),(0,l.kt)("p",null,"@","[protected]",", inherited"),(0,l.kt)("p",null,"[debugFillProperties]","(","[DiagnosticPropertiesBuilder]"," properties) \u2192 void"),(0,l.kt)("p",null,"Add additional properties associated with the node."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[noSuchMethod]","(","[Invocation]"," invocation) \u2192 dynamic"),(0,l.kt)("p",null,"Invoked when a non-existent method or property is accessed."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toDiagnosticsNode]","({","[String]","? name, ","[DiagnosticsTreeStyle]","? style}) \u2192 ","[DiagnosticsNode]"),(0,l.kt)("p",null,"Returns a debug representation of the object that is used by debugging tools and by ","[DiagnosticsNode.toStringDeep]","."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toString]","({","[DiagnosticLevel]"," minLevel = DiagnosticLevel.info}) \u2192 ","[String]"),(0,l.kt)("p",null,"A string representation of this object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringDeep]","({","[String]"," prefixLineOne = '', ","[String]","? prefixOtherLines, ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a string representation of this node and its descendants."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShallow]","({","[String]"," joiner = ', ', ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a one-line detailed description of the object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShort]"," \u2192 ","[String]"),(0,l.kt)("p",null,"A short, textual description of this widget."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("h1",{id:"myhomepage-class"},"MyHomePage class"),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Purpose"),"\nFirst page that is generated when the application opens."),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Inheritance")),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"[Object]"),(0,l.kt)("li",{parentName:"ul"},"[DiagnosticableTree]"),(0,l.kt)("li",{parentName:"ul"},"[Widget]"),(0,l.kt)("li",{parentName:"ul"},"[StatefulWidget]"),(0,l.kt)("li",{parentName:"ul"},"MyHomePage")),(0,l.kt)("h2",{id:"constructors-1"},"Constructors"),(0,l.kt)("p",null,"[MyHomePage]","? key, required ","[String]"," title})"),(0,l.kt)("p",null,"const"),(0,l.kt)("h2",{id:"properties-1"},"Properties"),(0,l.kt)("p",null,"[hashCode]"," \u2192 ","[int]"),(0,l.kt)("p",null,"The hash code for this object."),(0,l.kt)("p",null,"@","[nonVirtual]",", read-only, inherited"),(0,l.kt)("p",null,"[key]"," \u2192 ","[Key]","?"),(0,l.kt)("p",null,"Controls how one widget replaces another widget in the tree."),(0,l.kt)("p",null,"final, inherited"),(0,l.kt)("p",null,"[runtimeType]"," \u2192 ","[Type]"),(0,l.kt)("p",null,"A representation of the runtime type of the object."),(0,l.kt)("p",null,"read-only, inherited"),(0,l.kt)("p",null,"[title]"," \u2192 ","[String]"),(0,l.kt)("p",null,"final"),(0,l.kt)("h2",{id:"methods-1"},"Methods"),(0,l.kt)("p",null,"[createElement]"," \u2192 ","[StatefulElement]"),(0,l.kt)("p",null,"Creates a ","[StatefulElement]"," to manage this widget's location in the tree."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[createState]"," \u2192 ","[State]","<","[MyHomePage]",">"),(0,l.kt)("p",null,"Creates the mutable state for this widget at a given location in the tree."),(0,l.kt)("p",null,"override"),(0,l.kt)("p",null,"[debugDescribeChildren]"," \u2192 ","[List]","<","[DiagnosticsNode]",">"),(0,l.kt)("p",null,"Returns a list of ",(0,l.kt)("inlineCode",{parentName:"p"},"DiagnosticsNode")," objects describing this node's children."),(0,l.kt)("p",null,"@","[protected]",", inherited"),(0,l.kt)("p",null,"[debugFillProperties]","(","[DiagnosticPropertiesBuilder]"," properties) \u2192 void"),(0,l.kt)("p",null,"Add additional properties associated with the node."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[noSuchMethod]","(","[Invocation]"," invocation) \u2192 dynamic"),(0,l.kt)("p",null,"Invoked when a non-existent method or property is accessed."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toDiagnosticsNode]","({","[String]","? name, ","[DiagnosticsTreeStyle]","? style}) \u2192 ","[DiagnosticsNode]"),(0,l.kt)("p",null,"Returns a debug representation of the object that is used by debugging tools and by ","[DiagnosticsNode.toStringDeep]","."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toString]","({","[DiagnosticLevel]"," minLevel = DiagnosticLevel.info}) \u2192 ","[String]"),(0,l.kt)("p",null,"A string representation of this object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringDeep]","({","[String]"," prefixLineOne = '', ","[String]","? prefixOtherLines, ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a string representation of this node and its descendants."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShallow]","({","[String]"," joiner = ', ', ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a one-line detailed description of the object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShort]"," \u2192 ","[String]"),(0,l.kt)("p",null,"A short, textual description of this widget."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("h1",{id:"createaccount-class"},"CreateAccount class"),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Purpose"),"\nThe page that allows the user to register a new account."),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Inheritance")),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"[Object]"),(0,l.kt)("li",{parentName:"ul"},"[DiagnosticableTree]"),(0,l.kt)("li",{parentName:"ul"},"[Widget]"),(0,l.kt)("li",{parentName:"ul"},"[StatefulWidget]"),(0,l.kt)("li",{parentName:"ul"},"CreateAccount")),(0,l.kt)("h2",{id:"constructors-2"},"Constructors"),(0,l.kt)("p",null,"[CreateAccount]","({","[Key]","? key, required ","[String]"," title})"),(0,l.kt)("p",null,"const"),(0,l.kt)("h2",{id:"properties-2"},"Properties"),(0,l.kt)("p",null,"[hashCode]"," \u2192 ","[int]"),(0,l.kt)("p",null,"The hash code for this object."),(0,l.kt)("p",null,"@","[nonVirtual]",", read-only, inherited"),(0,l.kt)("p",null,"[key]"," \u2192 ","[Key]","?"),(0,l.kt)("p",null,"Controls how one widget replaces another widget in the tree."),(0,l.kt)("p",null,"final, inherited"),(0,l.kt)("p",null,"[runtimeType]"," \u2192 ","[Type]"),(0,l.kt)("p",null,"A representation of the runtime type of the object."),(0,l.kt)("p",null,"read-only, inherited"),(0,l.kt)("p",null,"[title]"," \u2192 ","[String]"),(0,l.kt)("p",null,"final"),(0,l.kt)("h2",{id:"methods-2"},"Methods"),(0,l.kt)("p",null,"[createElement]"," \u2192 ","[StatefulElement]"),(0,l.kt)("p",null,"Creates a ","[StatefulElement]"," to manage this widget's location in the tree."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[createState]"," \u2192 ","[State]","<","[CreateAccount]",">"),(0,l.kt)("p",null,"Creates the mutable state for this widget at a given location in the tree."),(0,l.kt)("p",null,"override"),(0,l.kt)("p",null,"[debugDescribeChildren]"," \u2192 ","[List]","<","[DiagnosticsNode]",">"),(0,l.kt)("p",null,"Returns a list of ",(0,l.kt)("inlineCode",{parentName:"p"},"DiagnosticsNode")," objects describing this node's children."),(0,l.kt)("p",null,"@","[protected]",", inherited"),(0,l.kt)("p",null,"[debugFillProperties]","(","[DiagnosticPropertiesBuilder]"," properties) \u2192 void"),(0,l.kt)("p",null,"Add additional properties associated with the node."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[noSuchMethod]","(","[Invocation]"," invocation) \u2192 dynamic"),(0,l.kt)("p",null,"Invoked when a non-existent method or property is accessed."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toDiagnosticsNode]","({","[String]","? name, ","[DiagnosticsTreeStyle]","? style}) \u2192 ","[DiagnosticsNode]"),(0,l.kt)("p",null,"Returns a debug representation of the object that is used by debugging tools and by ","[DiagnosticsNode.toStringDeep]","."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toString]","({","[DiagnosticLevel]"," minLevel = DiagnosticLevel.info}) \u2192 ","[String]"),(0,l.kt)("p",null,"A string representation of this object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringDeep]","({","[String]"," prefixLineOne = '', ","[String]","? prefixOtherLines, ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a string representation of this node and its descendants."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShallow]","({","[String]"," joiner = ', ', ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a one-line detailed description of the object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShort]"," \u2192 ","[String]"),(0,l.kt)("p",null,"A short, textual description of this widget."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("h1",{id:"accountinfo-class"},"AccountInfo class"),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Purpose"),"\nPage that allows the user to display their current information."),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"Inheritance")),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"[Object]"),(0,l.kt)("li",{parentName:"ul"},"[DiagnosticableTree]"),(0,l.kt)("li",{parentName:"ul"},"[Widget]"),(0,l.kt)("li",{parentName:"ul"},"[StatefulWidget]"),(0,l.kt)("li",{parentName:"ul"},"AccountInfo")),(0,l.kt)("h2",{id:"constructors-3"},"Constructors"),(0,l.kt)("p",null,"[AccountInfo]","({","[Key]","? key, required ","[String]"," title})"),(0,l.kt)("p",null,"const"),(0,l.kt)("h2",{id:"properties-3"},"Properties"),(0,l.kt)("p",null,"[hashCode]"," \u2192 ","[int]"),(0,l.kt)("p",null,"The hash code for this object."),(0,l.kt)("p",null,"@","[nonVirtual]",", read-only, inherited"),(0,l.kt)("p",null,"[key]"," \u2192 ","[Key]","?"),(0,l.kt)("p",null,"Controls how one widget replaces another widget in the tree."),(0,l.kt)("p",null,"final, inherited"),(0,l.kt)("p",null,"[runtimeType]"," \u2192 ","[Type]"),(0,l.kt)("p",null,"A representation of the runtime type of the object."),(0,l.kt)("p",null,"read-only, inherited"),(0,l.kt)("p",null,"[title]"," \u2192 ","[String]"),(0,l.kt)("p",null,"final"),(0,l.kt)("h2",{id:"methods-3"},"Methods"),(0,l.kt)("p",null,"[createElement]"," \u2192 ","[StatefulElement]"),(0,l.kt)("p",null,"Creates a ","[StatefulElement]"," to manage this widget's location in the tree."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[createState]"," \u2192 ","[State]","<","[AccountInfo]",">"),(0,l.kt)("p",null,"Creates the mutable state for this widget at a given location in the tree."),(0,l.kt)("p",null,"override"),(0,l.kt)("p",null,"[debugDescribeChildren]"," \u2192 ","[List]","<","[DiagnosticsNode]",">"),(0,l.kt)("p",null,"Returns a list of ",(0,l.kt)("inlineCode",{parentName:"p"},"DiagnosticsNode")," objects describing this node's children."),(0,l.kt)("p",null,"@","[protected]",", inherited"),(0,l.kt)("p",null,"[debugFillProperties]","(","[DiagnosticPropertiesBuilder]"," properties) \u2192 void"),(0,l.kt)("p",null,"Add additional properties associated with the node."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[noSuchMethod]","(","[Invocation]"," invocation) \u2192 dynamic"),(0,l.kt)("p",null,"Invoked when a non-existent method or property is accessed."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toDiagnosticsNode]","({","[String]","? name, ","[DiagnosticsTreeStyle]","? style}) \u2192 ","[DiagnosticsNode]"),(0,l.kt)("p",null,"Returns a debug representation of the object that is used by debugging tools and by ","[DiagnosticsNode.toStringDeep]","."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toString]","({","[DiagnosticLevel]"," minLevel = DiagnosticLevel.info}) \u2192 ","[String]"),(0,l.kt)("p",null,"A string representation of this object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringDeep]","({","[String]"," prefixLineOne = '', ","[String]","? prefixOtherLines, ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a string representation of this node and its descendants."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShallow]","({","[String]"," joiner = ', ', ","[DiagnosticLevel]"," minLevel = DiagnosticLevel.debug}) \u2192 ","[String]"),(0,l.kt)("p",null,"Returns a one-line detailed description of the object."),(0,l.kt)("p",null,"inherited"),(0,l.kt)("p",null,"[toStringShort]"," \u2192 ","[String]"),(0,l.kt)("p",null,"A short, textual description of this widget."),(0,l.kt)("p",null,"inherited"))}d.isMDXComponent=!0}}]);