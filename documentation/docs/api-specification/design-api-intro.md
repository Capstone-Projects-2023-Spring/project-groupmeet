---
sidebar_position: 1
description: Our API
---

public class HomeScreen
====================================================================================================
This class is the first page the user sees upon logging in, and helps them navigate the application.

**Properties**
***firebaseDatabase - FirebaseDatabase***
* Stores a reference to the database
***firebaseAuth - FirebaseAuth***
* Stores a reference to the authenticator

**Methods**
***public HomeScreen(firebaseDatabase, firebaseAuth)***
* constructor for the class

private class _HomeScreen
=========================================================================================================
* First page that is generated when the application opens.

Properties
----------
***displayedGroups - RoundGroup List***
***observing - boolean***
***code - String***

Methods
-------
***updateDatabase(groupID)***
updates the database with user information

***showQR(context)***
Allows the user to scan or enter a QR code/manual code

***showAdd(context)***
Allows the user to add a new group

***showSettings(context)***
Allows the user to go the settings page

***selectedGroup(int group)***
Takes user to the appropriate group page depending on what they clicked.

***observeGroups()***
Allows the user to view all groups they are a part of

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

[createElement] → [StatefulElement]

Creates a [StatefulElement] to manage this widget's location in the tree.

inherited

[createState] → [State]<[CreateAccount]\>

Creates the mutable state for this widget at a given location in the tree.

override

[debugDescribeChildren] → [List]<[DiagnosticsNode]\>

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

[toStringShort] → [String]

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

[createElement] → [StatefulElement]

Creates a [StatefulElement] to manage this widget's location in the tree.

inherited

[createState] → [State]<[AccountInfo]\>

Creates the mutable state for this widget at a given location in the tree.

override

[debugDescribeChildren] → [List]<[DiagnosticsNode]\>

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

[toStringShort] → [String]

A short, textual description of this widget.

inherited
