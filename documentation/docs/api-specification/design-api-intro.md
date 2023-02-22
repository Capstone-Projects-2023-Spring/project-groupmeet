---
sidebar_position: 1
description: What should be in this section.
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


    MyApp class - main library - Dart API      

 

1.  [groupmeet](../index.html)
2.  [main](../main/main-library.html)
3.  MyApp class

MyApp

MyApp class [Null safety](https://dart.dev/null-safety "Supports the null safety language feature.")
====================================================================================================

Inheritance

*   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
*   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
*   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
*   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
*   MyApp

Constructors
------------

[MyApp](../main/MyApp/MyApp.html)({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key})

const

Properties
----------

[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html) → [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.

@[nonVirtual](https://pub.dev/documentation/meta/1.8.0/meta/nonVirtual-constant.html), read-only, inherited

[key](https://api.flutter.dev/flutter/widgets/Widget/key.html) → [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?

Controls how one widget replaces another widget in the tree.

final, inherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) → [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.

read-only, inherited

Methods
-------

[build](../main/MyApp/build.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) → [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)

Describes the part of the user interface represented by this widget.

override

[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)() → [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)

Creates a [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html) to manage this widget's location in the tree.

inherited

[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)() → [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)\>

Returns a list of `DiagnosticsNode` objects describing this node's children.

@[protected](https://pub.dev/documentation/meta/1.8.0/meta/protected-constant.html), inherited

[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)([DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html) properties) → void

Add additional properties associated with the node.

inherited

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) → dynamic

Invoked when a non-existent method or property is accessed.

inherited

[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, [DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)? style}) → [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)

Returns a debug representation of the object that is used by debugging tools and by [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).

inherited

[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)({[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.info}) → [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

A string representation of this object.

inherited

[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) prefixLineOne = '', [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? prefixOtherLines, [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug}) → [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Returns a string representation of this node and its descendants.

inherited

[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) joiner = ', ', [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug}) → [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Returns a one-line detailed description of the object.

inherited

[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)() → [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

A short, textual description of this widget.

inherited

Operators
---------

[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) → [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

The equality operator.

@[nonVirtual](https://pub.dev/documentation/meta/1.8.0/meta/nonVirtual-constant.html), inherited

1.  [groupmeet](../index.html)
2.  [main](../main/main-library.html)
3.  MyApp class

##### main library

1.  [Classes](../main/main-library.html#classes)
2.  [MyApp](../main/MyApp-class.html)
3.  [MyHomePage](../main/MyHomePage-class.html)
4.  [Functions](../main/main-library.html#functions)
5.  [main](../main/main.html)

1.  [Constructors](../main/MyApp-class.html#constructors)
2.  [MyApp](../main/MyApp/MyApp.html)
3.  [Properties](../main/MyApp-class.html#instance-properties)
4.  [hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)
5.  [key](https://api.flutter.dev/flutter/widgets/Widget/key.html)
6.  [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
7.  [Methods](../main/MyApp-class.html#instance-methods)
8.  [build](../main/MyApp/build.html)
9.  [createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)
10.  [debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)
11.  [debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)
12.  [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)
13.  [toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)
14.  [toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)
15.  [toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)
16.  [toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)
17.  [toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)
18.  [Operators](../main/MyApp-class.html#operators)
19.  [operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)

groupmeet 1.0.0+1
