---
sidebar_position: 1
description: Our API
---

Design Document - Part II API
=============================

**Purpose**

This Design Document gives the complete design of the software implementation. This information should be in structured comments (e.g. Javadoc) in the source files. We encourage the use of a documentation generation tool to generate a draft of your API that you can augment to include the following details.

**Requirements**

In addition to the general documentation requirements the Design Document - Part II API will contain:

General review of the software architecture for each module specified in Design Document - Part I Architecture. Please include your class diagram as an important reference.

**For each class define the data fields, methods.**

The purpose of the class.

The purpose of each data field.

The purpose of each method

Pre-conditions if any.

Post-conditions if any.

Parameters and data types

Return value and output variables

Exceptions thrown\* (PLEASE see note below for details).

An example of an auto-generated and then augmented API specification is here ([Fiscal Design Document 2\_API.docx](https://templeu.instructure.com/courses/106563/files/16928898?wrap=1 "Fiscal Design Document 2_API.docx") )

This group developed their API documentation by hand ([Design Document Part 2 API-1\_MovieMatch.docx](https://templeu.instructure.com/courses/106563/files/16928899?wrap=1 "Design Document Part 2 API-1_MovieMatch.docx") )

\*At the top level, or where appropriate, all exceptions should be caught and an error message that is meaningful to the user generated. It is not OK to say ("xxxx has encountered a problem and will now close (OK?)". Error messages and recovery procedures should be documented in the User’s Manual.

MyApp class
====================================================================================================

**Purpose**
To start the application and create the home page.

Inheritance

*   [Object]
*   [DiagnosticableTree]
*   [Widget]
*   [StatelessWidget]
*   MyApp

Constructors
------------

[MyApp]({[Key]? key})

const

Properties
----------

[hashCode] → [int]

The hash code for this object.

@[nonVirtual], read-only, inherited

[key] → [Key]?

Controls how one widget replaces another widget in the tree.

final, inherited

[runtimeType] → [Type]

A representation of the runtime type of the object.

read-only, inherited

Methods
-------

[build]([BuildContext] context) → [Widget]

Describes the part of the user interface represented by this widget.

override

[createElement]() → [StatelessElement]

Creates a [StatelessElement] to manage this widget's location in the tree.

inherited

[debugDescribeChildren]() → [List]<[DiagnosticsNode]\>

Returns a list of `DiagnosticsNode` objects describing this node's children.

@[protected], inherited

[debugFillProperties]([DiagnosticPropertiesBuilder] properties) → void

Add additional properties associated with the node.

inherited

[noSuchMethod]([Invocation] invocation) → dynamic

Invoked when a non-existent method or property is accessed.

inherited

[toDiagnosticsNode]({[String]? name, [DiagnosticsTreeStyle]? style}) → [DiagnosticsNode]

Returns a debug representation of the object that is used by debugging tools and by [DiagnosticsNode.toStringDeep].

inherited

[toString]({[DiagnosticLevel] minLevel = DiagnosticLevel.info}) → [String]

A string representation of this object.

inherited

[toStringDeep]({[String] prefixLineOne = '', [String]? prefixOtherLines, [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a string representation of this node and its descendants.

inherited

[toStringShallow]({[String] joiner = ', ', [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a one-line detailed description of the object.

inherited

[toStringShort]() → [String]

A short, textual description of this widget.

inherited

MyHomePage class
=========================================================================================================

**Purpose**
First page that is generated when the application opens.

**Inheritance**

*   [Object]
*   [DiagnosticableTree]
*   [Widget]
*   [StatefulWidget]
*   MyHomePage

Constructors
------------

[MyHomePage]? key, required [String] title})

const

Properties
----------

[hashCode] → [int]

The hash code for this object.

@[nonVirtual], read-only, inherited

[key] → [Key]?

Controls how one widget replaces another widget in the tree.

final, inherited

[runtimeType] → [Type]

A representation of the runtime type of the object.

read-only, inherited

[title] → [String]

final

Methods
-------

[createElement]() → [StatefulElement]

Creates a [StatefulElement] to manage this widget's location in the tree.

inherited

[createState]() → [State]<[MyHomePage]\>

Creates the mutable state for this widget at a given location in the tree.

override

[debugDescribeChildren]() → [List]<[DiagnosticsNode]\>

Returns a list of `DiagnosticsNode` objects describing this node's children.

@[protected], inherited

[debugFillProperties]([DiagnosticPropertiesBuilder] properties) → void

Add additional properties associated with the node.

inherited

[noSuchMethod]([Invocation] invocation) → dynamic

Invoked when a non-existent method or property is accessed.

inherited

[toDiagnosticsNode]({[String]? name, [DiagnosticsTreeStyle]? style}) → [DiagnosticsNode]

Returns a debug representation of the object that is used by debugging tools and by [DiagnosticsNode.toStringDeep].

inherited

[toString]({[DiagnosticLevel] minLevel = DiagnosticLevel.info}) → [String]

A string representation of this object.

inherited

[toStringDeep]({[String] prefixLineOne = '', [String]? prefixOtherLines, [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a string representation of this node and its descendants.

inherited

[toStringShallow]({[String] joiner = ', ', [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a one-line detailed description of the object.

inherited

[toStringShort]() → [String]

A short, textual description of this widget.

inherited

CreateAccount class
============================================================================================================
**Purpose**
The page that allows the user to register a new account.

**Inheritance**

*   [Object]
*   [DiagnosticableTree]
*   [Widget]
*   [StatefulWidget]
*   CreateAccount

Constructors
------------

[CreateAccount]({[Key]? key, required [String] title})

const

Properties
----------

[hashCode] → [int]

The hash code for this object.

@[nonVirtual], read-only, inherited

[key] → [Key]?

Controls how one widget replaces another widget in the tree.

final, inherited

[runtimeType] → [Type]

A representation of the runtime type of the object.

read-only, inherited

[title] → [String]

final

Methods
-------

[createElement]() → [StatefulElement]

Creates a [StatefulElement] to manage this widget's location in the tree.

inherited

[createState]() → [State]<[CreateAccount]\>

Creates the mutable state for this widget at a given location in the tree.

override

[debugDescribeChildren]() → [List]<[DiagnosticsNode]\>

Returns a list of `DiagnosticsNode` objects describing this node's children.

@[protected], inherited

[debugFillProperties]([DiagnosticPropertiesBuilder] properties) → void

Add additional properties associated with the node.

inherited

[noSuchMethod]([Invocation] invocation) → dynamic

Invoked when a non-existent method or property is accessed.

inherited

[toDiagnosticsNode]({[String]? name, [DiagnosticsTreeStyle]? style}) → [DiagnosticsNode]

Returns a debug representation of the object that is used by debugging tools and by [DiagnosticsNode.toStringDeep].

inherited

[toString]({[DiagnosticLevel] minLevel = DiagnosticLevel.info}) → [String]

A string representation of this object.

inherited

[toStringDeep]({[String] prefixLineOne = '', [String]? prefixOtherLines, [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a string representation of this node and its descendants.

inherited

[toStringShallow]({[String] joiner = ', ', [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a one-line detailed description of the object.

inherited

[toStringShort]() → [String]

A short, textual description of this widget.

inherited

AccountInfo class
=================
**Purpose**
Page that allows the user to display their current information.

**Inheritance**

*   [Object]
*   [DiagnosticableTree]
*   [Widget]
*   [StatefulWidget]
*   AccountInfo

Constructors
------------

[AccountInfo]({[Key]? key, required [String] title})

const

Properties
----------

[hashCode] → [int]

The hash code for this object.

@[nonVirtual], read-only, inherited

[key] → [Key]?

Controls how one widget replaces another widget in the tree.

final, inherited

[runtimeType] → [Type]

A representation of the runtime type of the object.

read-only, inherited

[title] → [String]

final

Methods
-------

[createElement]() → [StatefulElement]

Creates a [StatefulElement] to manage this widget's location in the tree.

inherited

[createState]() → [State]<[AccountInfo]\>

Creates the mutable state for this widget at a given location in the tree.

override

[debugDescribeChildren]() → [List]<[DiagnosticsNode]\>

Returns a list of `DiagnosticsNode` objects describing this node's children.

@[protected], inherited

[debugFillProperties]([DiagnosticPropertiesBuilder] properties) → void

Add additional properties associated with the node.

inherited

[noSuchMethod]([Invocation] invocation) → dynamic

Invoked when a non-existent method or property is accessed.

inherited

[toDiagnosticsNode]({[String]? name, [DiagnosticsTreeStyle]? style}) → [DiagnosticsNode]

Returns a debug representation of the object that is used by debugging tools and by [DiagnosticsNode.toStringDeep].

inherited

[toString]({[DiagnosticLevel] minLevel = DiagnosticLevel.info}) → [String]

A string representation of this object.

inherited

[toStringDeep]({[String] prefixLineOne = '', [String]? prefixOtherLines, [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a string representation of this node and its descendants.

inherited

[toStringShallow]({[String] joiner = ', ', [DiagnosticLevel] minLevel = DiagnosticLevel.debug}) → [String]

Returns a one-line detailed description of the object.

inherited

[toStringShort]() → [String]

A short, textual description of this widget.

inherited
