import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/group/group_creation.dart';
import 'package:groupmeet/new_group_view.dart';
import 'package:groupmeet/settings/settings.dart';
import 'package:groupmeet/theme.dart';

import 'code/new_qr.dart';

class RoundGroup {
  String id;
  Color color;
  String emoji;
  String name;
  String admin;
  List<String> memberIDs;

  RoundGroup(this.id, this.color, this.emoji, this.name, this.admin, this.memberIDs);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.firebaseDatabase, required this.firebaseAuth});

  final FirebaseDatabase firebaseDatabase;
  final FirebaseAuth firebaseAuth;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<RoundGroup> displayedGroups = [];

  bool observing = false;
  String code = "";

  void updateDatabase(groupID) async {
    int count = 0;
    int count_2 = 0;
    String? userEx = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groups').get();
    DatabaseReference ref2 =
    FirebaseDatabase.instance.ref("groups/${groupID}");
    // final snapshot2 = await ref2.child('name').get();
    DatabaseReference userRef = FirebaseDatabase.instance.ref(
        "users/$userEx/groupIds");
    DatabaseReference userRef2 =
    FirebaseDatabase.instance.ref("groups/${groupID}/members");
    Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
    if (snapshot.key != null) {
      for (var keys in type.entries) {
        if (keys.key.toString().contains(groupID) &&
            groupID.isNotEmpty) {
          count = 1;
          final snapshot1 = await ref.child('users/$userEx/groupIds').get();
          if (snapshot1.exists) {
            Map<dynamic, dynamic> type1 = snapshot1.value as Map<
                dynamic,
                dynamic>;
            for (var keys2 in type1.entries) {
              count_2++;
              if (keys2.key.toString().contains(groupID)) {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have already joined this group. Please enter another Code.")));
                break;
              } else {
                if (type1.entries.length == count_2) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Adding to group ${snapshot2.value} ....")));
                  userRef.update({groupID: true});
                  userRef2.update({userEx: true});
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You're now added to ${snapshot2.value}!")));
                  // Navigator.of(context).pop(false);
                  break;
                }
              }
            }
          } else {
            userRef.update({groupID: true});
            userRef2.update({userEx: true});
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You've now been added to the group -> ${snapshot2
            //     .value}!")));
            // Navigator.of(context).pop(false);
            break;
          }
        }
      }
      if (count.isEven) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The codes assigned doesn't match any groups that exit. Please try again!")));
        // Navigator.of(context).pop(false);
      }
    }
    else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No groups exist! Please create a new group!")));
    }
  }

  // TODO: Cross-Platform working QR Screen
  void showQR(context) {

    showAdaptiveActionSheet(
      context: context,
      androidBorderRadius: 30,
      isDismissible: true,
      bottomSheetColor: roundPurple,
      actions: <BottomSheetAction>[
        BottomSheetAction(title: PlatformText('Enter ID'), onPressed: (context) {
          PlatformAlertDialog error = PlatformAlertDialog(
            title: PlatformText("Enter Group ID"),
            content: PlatformText(
                'The Group ID or QR Code can be found by selecting a group and tapping the share icon in the top right'),
            actions: [
              PlatformTextField(onChanged: (newString) => code = newString),
              PlatformTextButton(
                child: PlatformText("Cancel",
                    selectionColor: roundPurple,
                    style: const TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              PlatformTextButton(
                child: PlatformText("Ok",
                    selectionColor: roundPurple,
                    style: const TextStyle(color: roundPurple)),
                onPressed: () {

                  if(code.isEmpty) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    return;
                  }
                  updateDatabase(code);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );

          showPlatformDialog(
            context: context,
            builder: (context) {
              return error;
            },
          );
        }),
        BottomSheetAction(title: PlatformText('Scan QR'), onPressed: (context) {
          Navigator.of(context).push(
            platformPageRoute(
                context: context,
                builder: (context) => NewQR()),
          );
        }),
      ],
      cancelAction: CancelAction(title: PlatformText('Cancel', style: TextStyle(color: Colors.white),)),// onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  void showAdd(context) {
    String? userID = widget.firebaseAuth.currentUser?.uid;
    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => GroupCreation(
                userID: userID,
                firebaseDatabase: widget.firebaseDatabase,
              )),
    );
  }

  void showSettings(context) {
    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => Settings(
                firebaseAuth: widget.firebaseAuth,
                firebaseDatabase: widget.firebaseDatabase,
              )),
    );
  }

  void selectedGroup(int group) {
    RoundGroup selectedGroup = displayedGroups[group];
    print("Tapped group $group");

    Navigator.of(context).push(
      platformPageRoute(
          context: context,
          builder: (context) => NewGroupView(selectedGroup)),
    );

  }

  void observeGroups() {
    if (observing) {
      return;
    }

    String? userID = widget.firebaseAuth.currentUser?.uid;
    if (userID == null) {
      // TODO: Alert saying not logged in yet?
      print("Not logged in");
    }

    widget.firebaseDatabase
        .ref("users/${userID!}/groupIds")
        .onValue
        .listen((event) async {
      // FirebaseDatabase.instance.ref("users/${userID!}/groupIds").get().then((event) => {

      if (event.snapshot.value == null) {
        return;
      }

      Iterable<Object?> groups =
          (event.snapshot.value as Map<Object?, Object?>).keys;

      List<RoundGroup> newGroups = [];

      for (Object? groupID in groups) {
        String groupIDCasted = groupID as String;
        final groupInfo =
            await widget.firebaseDatabase.ref("groups/$groupIDCasted/").get();

        if (!groupInfo.exists) {
          continue;
        }

        Map<Object?, Object?> vals = groupInfo.value as Map<Object?, Object?>;

        int color = vals['color'] as int;
        String emoji = vals['emoji'] as String;
        String name = vals['name'] as String;
        String admin = vals['admin'] as String;
        Map<Object?, Object?> members = vals['members'] as Map<Object?, Object?>;

        List<String> memberIDs = [];

        for(var member in members.keys) {
          memberIDs.add(member as String);
        }

        print(memberIDs);
        print(color);
        print(emoji);
        print(name);

        newGroups.add(RoundGroup(groupIDCasted, Color(color), emoji, name, admin, memberIDs));
      }

      setState(() => displayedGroups = newGroups);
    });

    observing = true;
  }

  @override
  Widget build(BuildContext context) {
    observeGroups();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight - (0.18 * screenHeight),
            child: GridView.count(
                childAspectRatio: (screenWidth / 2 - 32) / (148),
                padding: EdgeInsets.only(
                    top: 48 + MediaQuery.of(context).viewPadding.top + 8 + 8),
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                children: List.generate(displayedGroups.length, (index) {
                  return GestureDetector(
                    onTap: () => selectedGroup(index),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  displayedGroups[index].color,
                                  BlendMode.srcIn),
                              child: Image.asset("images/GroupRound.png",
                                  width: 120, height: 120, isAntiAlias: true),
                            ),
                            PlatformText(displayedGroups[index].emoji,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: PlatformText(
                            displayedGroups[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                })),
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                  width: screenWidth,
                  height: MediaQuery.of(context).viewPadding.top + 8),
              Image.asset('images/WordMark-Dark.png',
                  width: screenWidth, height: 48),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            "images/BarEclipse.png",
            width: screenWidth,
            fit: BoxFit.fill,
            height: 0.20 * screenHeight,
            isAntiAlias: true,
          ),
        ),
        Positioned(
          width: screenWidth - 32,
          height: 0.20 * screenHeight - 16,
          left: 16,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    key: Key("navigatetoCodeReceptionPageButton"),
                    icon: Image.asset("images/RoundQR.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showQR(context),
                  )),
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    key: const Key("navigatetoGroupCreationPageButton"),
                    icon: Image.asset("images/RoundPlus.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showAdd(context),
                  )),
              SizedBox(
                  height: 120,
                  width: 120,
                  child: PlatformIconButton(
                    key: Key("navigatetoSettingsPageButton"),
                    icon: Image.asset("images/RoundSettings.png",
                        width: 120, height: 120, isAntiAlias: true),
                    padding: EdgeInsets.zero,
                    onPressed: () => showSettings(context),
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}
