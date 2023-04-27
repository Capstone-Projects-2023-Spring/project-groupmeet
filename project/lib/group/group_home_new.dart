// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:groupmeet/home.dart';
//
// @visibleForTesting
// class GroupHomeNewState extends State<GroupHomeNew> {
//   late DatabaseReference ref;
//   RoundGroup? group;
//
//   @override
//   void initState() {
//     super.initState();
//     //ref = FirebaseDatabase.instance.ref("users/$temp");
//     ref = FirebaseDatabase.instance.ref("groups/${widget.groupID}/");
//     ref.get().then((g) {
//       Map<Object?, Object?> vals = g.value as Map<Object?, Object?>;
//
//       int color = vals['color'] as int;
//       String emoji = vals['emoji'] as String;
//       String name = vals['name'] as String;
//
//       // Group(widget.groupID, Color(color), emoji, name);
//       setState(() {
//         group = RoundGroup(widget.groupID, Color(color), emoji, name, );
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PlatformScaffold(
//       appBar: PlatformAppBar(
//         title: PlatformText(group?.name ?? "No Name"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [PlatformText("Group ID: ${group?.id ?? "No Id"}")],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [PlatformText("Group name: ${group?.name ?? "No Name"}")],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PlatformText("Group emoji: ${group?.emoji ?? "No Emoji"}"),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PlatformText("Group color: ${group?.color ?? "No color"}"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class GroupHomeNew extends StatefulWidget {
//   GroupHomeNew({Key? key, required this.groupID}) : super(key: key);
//
//   final String groupID;
//
//   @override
//   State<GroupHomeNew> createState() => GroupHomeNewState();
// }
