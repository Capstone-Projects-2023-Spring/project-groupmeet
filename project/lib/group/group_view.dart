import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/home.dart';
import 'package:groupmeet/theme.dart';
import 'package:intl/intl.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:groupmeet/calendar/calendar.dart';

class GroupView extends StatefulWidget {
  RoundGroup group;

  GroupView(this.group, {super.key});

  @override
  _GroupView createState() => _GroupView(group);
}

class GroupMember {
  String uid;
  String name;
  String email;

  String? snapchat;
  String? sms;
  String? discord;
  String? instagram;
  String? facebook;
  bool? hasCalendar;

  GroupMember(this.uid, this.name, this.email, this.snapchat, this.sms,
      this.discord, this.instagram, this.facebook, this.hasCalendar);
}

class _GroupView extends State<GroupView> {
  DateTime? appointment;

  List<GroupMember> parsedMembers = [];
  List<GroupMember> rsvped = [];

  int smsCount = 0;
  int snapCount = 0;
  int discordCount = 0;
  int instaCount = 0;
  int fbCount = 0;
  int calCount = 0;

  bool isObserving = false;

  bool isAdmin = false;

  RoundGroup group;

  _GroupView(this.group);

  Future<DateTime?> getFirstDate() async {
    final times = await FirebaseDatabase.instance
        .ref("groups/${group.id}/proposedDates")
        .once();

    if (times.snapshot.value != null) {
      List<dynamic> dates = times.snapshot.value as List<dynamic>;
      return DateTime.parse(dates[0]);
    }

    return null;
  }

  Future<void> observeGroup() async {
    if (isObserving) {
      return;
    }

    isObserving = true;
    int completedFetches = 0;

    print("entering loop");

    isAdmin = FirebaseAuth.instance.currentUser?.uid == group.admin;
    print("First Date ");
    appointment = await getFirstDate();

    print(isAdmin);

    for (final memberID in group.memberIDs) {
      print("getting");
      print(memberID);
      DatabaseReference memberRef =
          FirebaseDatabase.instance.ref("users/$memberID");
      print(memberRef);

      final snapshot = await memberRef.get();

      print(snapshot);

      if (snapshot.exists) {
        Map<Object?, Object?> data = snapshot.value as Map<Object?, Object?>;

        print(data);

        print(data["firstName"] as String);
        print(data["lastName"] as String);
        print(data["email"] as String);

        print(data["messages_name"] as String?);
        print(data["discord_name"] as String?);
        print(data["facebook_name"] as String?);
        print(data["instagram_name"] as String?);
        print(data["snapchat_name"] as String?);
        print(data["has_calendar"] as bool?);

        GroupMember parsedMember = GroupMember(
            memberID,
            "${data["firstName"] as String} ${data["lastName"] as String}",
            data["email"] as String,
            data["snapchat_name"] as String?,
            data["messages_name"] as String?,
            data["discord_name"] as String?,
            data["instagram_name"] as String?,
            data["facebook_name"] as String?,
            data["has_calendar"] as bool?);

        completedFetches += 1;
        parsedMembers.add(parsedMember);

        if (completedFetches == group.memberIDs.length) {
          setState(calculateSocialCounts);
        }
      } else {
        print("Unable to load user with id: $memberID");
        print("Do they exist?");
        print("Is the internet working?");

        completedFetches += 1;

        if (completedFetches == group.memberIDs.length) {
          setState(calculateSocialCounts);
        }
      }
    }
  }

  void triggerDelete() async {
    print(isAdmin);

    if (isAdmin) {
      print("Poof!");

      PlatformAlertDialog confirmation = PlatformAlertDialog(
        title: PlatformText("Are you sure?"),
        content: PlatformText("This cannot be undone!"),
        actions: [
          PlatformTextButton(
            child: PlatformText("Cancel",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          PlatformTextButton(
              child: PlatformText("Delete",
                  selectionColor: roundRed, style: TextStyle(color: roundRed)),
              onPressed: () {
                print("Deleting...");

                for (var user in parsedMembers) {
                  print("users/${user.uid}/groupIds/${group.id}");
                  FirebaseDatabase.instance
                      .ref("users/${user.uid}/groupIds/${group.id}")
                      .set(null);
                }

                print("groups/${group.id}");
                FirebaseDatabase.instance.ref("groups/${group.id}").set(null);

                popMain();
              })
        ],
      );

      showPlatformDialog(
        context: context,
        builder: (context) {
          return confirmation;
        },
      );
    } else {
      PlatformAlertDialog confirmation = PlatformAlertDialog(
        title: PlatformText("Are you sure?"),
        actions: [
          PlatformTextButton(
            child: PlatformText("Cancel",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          PlatformTextButton(
              child: PlatformText("Leave",
                  selectionColor: roundRed, style: TextStyle(color: roundRed)),
              onPressed: () {
                Navigator.pop(context);

                leaveGroup();

                Navigator.pop(context);
              })
        ],
      );

      showPlatformDialog(
        context: context,
        builder: (context) {
          return confirmation;
        },
      );
    }
  }

  void popMain() {
    Navigator.of(context).pop();
  }

  Future<void> leaveGroup() async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref("users/$uid/groupIds/${group.id}");

    userRef.remove();

    DatabaseReference groupRef =
        FirebaseDatabase.instance.ref("groups/${group.id}/members/$uid");

    groupRef.remove();
  }

  void calculateSocialCounts() {
    instaCount = 0;
    fbCount = 0;
    discordCount = 0;
    smsCount = 0;
    snapCount = 0;
    calCount = 0;

    for (var member in parsedMembers) {
      if (member.instagram != null) {
        instaCount += 1;
      }

      if (member.discord != null) {
        discordCount += 1;
      }

      if (member.sms != null) {
        smsCount += 1;
      }

      if (member.facebook != null) {
        fbCount += 1;
      }

      if (member.snapchat != null) {
        snapCount += 1;
      }

      if (member.hasCalendar != null) {
        calCount += 1;
        rsvped.add(member);
      }
    }
  }

  void profileTap(int index) {
    String infoString = "";
    GroupMember member = parsedMembers[index];

    if (member.sms != null) {
      infoString += "Phone\n${member.sms}\n";
    }

    if (member.instagram != null) {
      infoString += "\nInstagram\n${member.instagram}\n";
    }

    if (member.snapchat != null) {
      infoString += "\nSnapchat\n${member.snapchat}\n";
    }

    if (member.discord != null) {
      infoString += "\nDiscord\n${member.discord}\n";
    }

    if (member.facebook != null) {
      infoString += "\nFacebook\n${member.facebook}\n";
    }

    _openDialog(
        member.name,
        PlatformText(
          infoString,
          textAlign: TextAlign.center,
        ));
  }

  void socialTap(String source) {
    int selectedCount;

    switch (source) {
      case "sms":
        selectedCount = smsCount;
        break;
      case "facebook":
        selectedCount = fbCount;
        break;
      case "snapchat":
        selectedCount = snapCount;
        break;
      case "discord":
        selectedCount = discordCount;
        break;
      case "instagram":
        selectedCount = instaCount;
        break;
      default:
        selectedCount = 0;
    }

    if (selectedCount == 0) {
      return;
    }

    String infoString = "";

    switch (source) {
      case "sms":
        for (var member in parsedMembers) {
          infoString += "${member.sms}, ";
        }
        break;
      case "facebook":
        for (var member in parsedMembers) {
          infoString += "${member.facebook}, ";
        }
        break;
      case "snapchat":
        for (var member in parsedMembers) {
          infoString += "${member.snapchat}, ";
        }
        break;
      case "discord":
        for (var member in parsedMembers) {
          infoString += "${member.discord}, ";
        }
        break;
      case "instagram":
        for (var member in parsedMembers) {
          infoString += "${member.instagram}, ";
        }
        break;
      default:
        return;
    }

    _openDialog(
        "${source[0].toUpperCase()}${source.substring(1).toLowerCase()}",
        PlatformText(infoString.substring(0, infoString.length - 2)));
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: PlatformText(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: PlatformText('Dismiss',
                  selectionColor: roundPurple,
                  style: TextStyle(color: roundPurple)),
            ),
          ],
        );
      },
    );
  }

  Widget socialWidget(String name, int count, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barWidth = screenWidth - 48 - 16 - 16 - 32 - 32;

    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
                  child: SizedBox(
                    child: Image.asset("images/$name" + "App.png"),
                    width: 48,
                    height: 48,
                  ),
                ),
                onTap: () => socialTap(name)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: barWidth,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                border: Border.all(color: Colors.white),
              ),
              child: Align(
                child: Container(
                    width: barWidth * (count / parsedMembers.length),
                    height: 32,
                    decoration: BoxDecoration(
                      color: roundPurple,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(200000, 200000)),
                      border: Border.all(color: roundPurple),
                    )),
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: PlatformText(
                count.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          ],
        ),
        SizedBox(
          width: screenWidth,
          height: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    observeGroup();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Map<String, int> socialCountWidgets = {
      "sms": smsCount,
      "snapchat": snapCount,
      "discord": discordCount,
      "instagram": instaCount,
      "facebook": fbCount
    };

    var sortedEntries = socialCountWidgets.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });

    for (var entry in sortedEntries) {
      socialCountWidgets
        ..remove(entry.key)
        ..[entry.key] = entry.value;
    }

    List<Widget> socialWidgets = [];

    for (var key in socialCountWidgets.keys) {
      socialWidgets.add(socialWidget(key, socialCountWidgets[key]!, context));
    }

    Widget socialContainer = Container(
      child: Column(
        children: socialWidgets,
      ),
    );

    List<Widget> mainWidgets = [
      SizedBox(
        width: screenWidth,
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(32, 32, 0, appointment != null ? 16 : 0),
            child: PlatformText(
              "Round Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )),
      )
    ];

    if (appointment != null) {
      String infoString = "";
      int index = 0;

      for (var member in rsvped) {
        infoString += member.name + "\n";
        index += 1;

        if (index == 4) {
          break;
        }
      }

      if (infoString.isEmpty) {
        infoString = "Sync your calendar in Settings to confirm availability.";
      } else {
        if (rsvped.length > 4) {
          infoString += "+${rsvped.length - 4} More";
        }
      }

      mainWidgets.add(Container(
        width: screenWidth - 32,
        height: (screenWidth - 32) * (2.6 / 5),
        decoration: BoxDecoration(
            color: roundPurple,
            borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
            border: Border.all(color: roundPurple)),
        child: Row(
          children: [
            Container(
              child: Column(
                children: [
                  PlatformText(
                    new DateFormat.MMMM().format(appointment!).toString(),
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: roundPurple,
                        height: 1.3),
                  ),
                  PlatformText(
                      new DateFormat.d().format(appointment!).toString(),
                      style: TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.w900,
                          color: roundPurple,
                          height: 1.0)),
                  PlatformText(
                      new DateFormat.jm().format(appointment!).toString(),
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: roundPurple,
                          height: 0.8)),
                ],
              ),
              width: (screenWidth - 64) * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                  border: Border.all(color: Colors.white)),
            ),
            Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlatformText(rsvped.length.toString() + " Confirmed",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    PlatformText(infoString,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center),
                  ],
                ),
                onTap: showRSVPList,
              ),
              width: (screenWidth - 64) * 0.475,
            )
          ],
        ),
      ));
    }

    mainWidgets.add(
      Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
        child: Container(
          width: screenWidth - 64,
          child: PlatformTextButton(
            child: PlatformText(
                appointment != null
                    ? "Request Another Time"
                    : "Generate a New Round Up",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            color: roundPurple,
            onPressed: handleCalendarRequest,
          ),
        ),
      ),
    );

    mainWidgets.add(
      Container(
        width: screenWidth,
        child: Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 0, 16),
            child: PlatformText(
              "Round Table",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )),
      ),
    );

    mainWidgets.add(socialContainer);

    mainWidgets.add(SizedBox(
      width: screenWidth,
      child: Padding(
          padding: EdgeInsets.fromLTRB(32, 16, 0, appointment != null ? 16 : 0),
          child: PlatformText(
            "Rounders (" + parsedMembers.length.toString() + ")",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          )),
    ));

    mainWidgets.add(
      GridView.count(
        crossAxisCount: 1,
        childAspectRatio: screenHeight / 128,
        shrinkWrap: true,
        children: List.generate(parsedMembers.length, (index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
              child: Row(
                children: [
                  PlatformText(
                    parsedMembers[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: PlatformTextButton(
                        child: PlatformText(
                          "View Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        color: roundPurple,
                        onPressed: () => profileTap(index),
                      ),
                    ),
                  )
                ],
              ));
        }),
      ),
    );

    mainWidgets.add(SizedBox(
      width: screenWidth,
      height: 16,
    ));

    mainWidgets.add(PlatformTextButton(
      child: PlatformText(isAdmin ? "Delete Circle" : "Leave Group",
          style: TextStyle(color: Colors.white), selectionColor: Colors.white),
      onPressed: triggerDelete,
      color: roundRed,
    ));

    mainWidgets.add(SizedBox(
      width: screenWidth,
      height: 16,
    ));

    return PlatformScaffold(
        appBar: PlatformAppBar(
            title: PlatformText(group.emoji + " " + group.name,
                style: TextStyle(color: Colors.black)),
            backgroundColor: group.color,
            trailingActions: [
              Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
                child: GestureDetector(
                  child: Icon(PlatformIcons(context).book, color: Colors.black),
                  onTap: () => calendar(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: GestureDetector(
                  child:
                      Icon(PlatformIcons(context).share, color: Colors.black),
                  onTap: () => share(),
                ),
              )
            ],
            material: (context, platform) => MaterialAppBarData(
                iconTheme: IconThemeData(color: Colors.black))),
        body: SingleChildScrollView(
          child: Column(
            children: mainWidgets,
          ),
        ));
  }

  int appointmentIndex = 0;

  void handleCalendarRequest() async {
    print(appointment);
    if (appointment == null) {
      await findNextBestDate();
      appointment = await getFirstDate();

      setState(() {});
      return;
    }

    print(await removeCurrentDate());
    appointment = await getFirstDate();

    print(appointment);

    setState(() {});
  }

  Future<int> removeCurrentDate() async {
    final times = await FirebaseDatabase.instance
        .ref("groups/${group.id}/proposedDates")
        .once();
    if (times.snapshot.value == null) {
      return -1;
    }
    List<dynamic> dates = times.snapshot.value as List<dynamic>;

    Map<String, Object> newDates = {};
    for (int i = 1; i < dates.length; i++) {
      newDates[(i - 1).toString()] = dates[i].toString();
    }
    DatabaseReference groupRef =
        FirebaseDatabase.instance.ref("groups/${group.id}/proposedDates");
    groupRef.set(newDates);

    return 1;
  }

  Future<List<Appointment>> getEventList() async {
    List<Appointment> allEvents = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");

    for (var memberId in group.memberIDs) {
      print("member id is");
      print(memberId);
      print(ref.child(memberId + "/calendarEvents").path);
      final memberSnapshot =
          await ref.child(memberId + "/calendarEvents").get();
      if (memberSnapshot.value == null) {
        continue;
      }
      print("value");
      print(memberSnapshot.value);

      if (memberSnapshot.value is! List) {
        continue;
      }

      for (var event in memberSnapshot.value as List) {
        var tempStart;
        var tempEnd;
        event[0] == "null" ? tempStart = event[1] : tempStart = event[0];
        event[2] == "null" ? tempEnd = event[3] : tempEnd = event[2];

        allEvents.add(Appointment(
            startTime: DateTime.parse(tempStart),
            endTime: DateTime.parse(tempEnd)));
      }
    }

    return allEvents;
  }

  Future<List<DateTime>> findNextBestDate() async {
    List<Appointment> allEvents = await getEventList();
    List<DateTime> daysToPropose = [];

    allEvents.sort(
      (a, b) => a.startTime.compareTo(b.startTime),
    );

    DateTime toMeet = DateTime.now().add(const Duration(days: 1));
    toMeet = DateTime(toMeet.year, toMeet.month, toMeet.day, 9);
    for (int i = 0; i < 5; i++) {
      for (var eachEvent in allEvents) {
        DateTime eventStartDate = DateTime(eachEvent.startTime.year,
            eachEvent.startTime.month, eachEvent.startTime.day);
        DateTime eventEndDate = DateTime(eachEvent.endTime.year,
            eachEvent.endTime.month, eachEvent.endTime.day);
        if (toMeet.isAtSameMomentAs(eventStartDate) ||
            toMeet.isAtSameMomentAs(eventEndDate)) {
          toMeet = toMeet.add(const Duration(days: 1));
        }
      }

      daysToPropose.add(toMeet);
      toMeet = toMeet.add(const Duration(days: 1));
    }

    DateTime dateToPropose;
    for (int i = 0; i < allEvents.length - 1; i++) {
      if (allEvents[i].isAllDay) {
        i++;
      } else {
        if (allEvents[i + 1].startTime.difference(allEvents[i].endTime) >
            const Duration(hours: 1)) {
          dateToPropose = allEvents[i].endTime.add(const Duration(minutes: 20));

          if (dateToPropose.hour < 22 && dateToPropose.hour > 9) {
            daysToPropose.add(dateToPropose);
          }
        }
      }
    }

    print("daysToPropose: $daysToPropose");
    daysToPropose.sort();

    Map<String, Object> dates = {};
    int counter = 0;
    for (var item in daysToPropose) {
      dates[counter.toString()] = item.toString();
      counter++;
    }
    DatabaseReference groupRef =
        FirebaseDatabase.instance.ref("groups/${group.id}/proposedDates");
    groupRef.update(dates);

    return daysToPropose;
  }

  void calendar() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref("groups/${group.id}").get();

    Navigator.of(context).push(platformPageRoute(
        context: context,
        builder: (context) => CalendarPage(
              title: "Manual Calendar & Sync",
              group: snapshot.value as Map<dynamic, dynamic>?,
            )));
  }

  void share() {
    showAdaptiveActionSheet(
      context: context,
      androidBorderRadius: 30,
      isDismissible: true,
      bottomSheetColor: roundPurple,
      actions: <BottomSheetAction>[
        BottomSheetAction(
            title: PlatformText('Copy ID',
                style: const TextStyle(color: Colors.white)),
            onPressed: (context) {
              Clipboard.setData(ClipboardData(text: group.id));
              Navigator.of(context).pop();
            }),
        BottomSheetAction(
            title: PlatformText('Display QR',
                style: const TextStyle(color: Colors.white)),
            onPressed: (context) {
              Navigator.of(context).pop();

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Container(
                            width: MediaQuery.of(context).size.width * (2 / 3),
                            height: MediaQuery.of(context).size.width * (2 / 3),
                            alignment: AlignmentDirectional.center,
                            child: QrImage(
                              data: group.id,
                              version: QrVersions.auto,
                              size: MediaQuery.of(context).size.width * (2 / 3),
                              foregroundColor: Colors.white,
                              backgroundColor: roundPurple,
                            )));
                  });
            }),
      ],
      cancelAction: CancelAction(
          title: PlatformText(
        'Cancel',
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  void showRSVPList() {
    if (rsvped.isEmpty) {
      return;
    }

    String infoString = "";

    for (var member in rsvped) {
      infoString += member.name + ", ";
    }

    _openDialog("Available Rounders",
        PlatformText(infoString.substring(0, infoString.length - 2)));
  }
}
