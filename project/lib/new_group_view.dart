import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/home.dart';
import 'package:groupmeet/theme.dart';
import 'package:intl/intl.dart';

class NewGroupView extends StatefulWidget {

  RoundGroup group;

  NewGroupView(this.group, {super.key});

  @override
  _NewGroupView createState() => _NewGroupView(group);
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

  GroupMember(this.uid, this.name, this.email, this.snapchat, this.sms, this.discord, this.instagram, this.facebook);
}

class _NewGroupView extends State<NewGroupView> {

  DateTime? appointment;

  List<GroupMember> parsedMembers = [];
  List<GroupMember> rsvped = [];

  int smsCount = 0;
  int snapCount = 0;
  int discordCount = 0;
  int instaCount = 0;
  int fbCount = 0;

  bool isObserving = false;

  bool isAdmin = false;

  RoundGroup group;

  _NewGroupView(this.group);

  Future<void> observeGroup() async {
    if (isObserving) {
      return;
    }

    isObserving = true;
    int completedFetches = 0;

    print("entering loop");

    isAdmin = FirebaseAuth.instance.currentUser?.uid == group.admin;

    print(isAdmin);

    for(final memberID in group.memberIDs) {
      // Get the user info as a one-time thing
      // If a user updates their info, the page will have to be reloaded
      print("getting");
      print(memberID);
      DatabaseReference memberRef = FirebaseDatabase.instance.ref("users/$memberID");
      print(memberRef);
      // Get Reads Once and does not continuously observe
      // Was considering calling once here, but that's a minor performance thing
      // Prob beyond the scope of this project
      final snapshot = await memberRef.get();

      print(snapshot);

      if(snapshot.exists) {

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

        GroupMember parsedMember = GroupMember(memberID, "${data["firstName"] as String} ${data["lastName"] as String}", data["email"] as String, data["snapchat_name"] as String?, data["messages_name"] as String?, data["discord_name"] as String?, data["instagram_name"] as String?, data["facebook_name"] as String?);

        completedFetches += 1;
        parsedMembers.add(parsedMember);

        if(completedFetches == group.memberIDs.length) {
          setState(calculateSocialCounts);
        }

      } else {
        print("Unable to load user with id: $memberID");
        print("Do they exist?");
        print("Is the internet working?");

        completedFetches += 1;

        if(completedFetches == group.memberIDs.length) {
          setState(calculateSocialCounts);
        }
      }
    }
  }

  void triggerDelete() async {
    print("Poof!");

    PlatformAlertDialog confirmation = PlatformAlertDialog(
      title: PlatformText("Are you sure?"),
      content: PlatformText("This cannot be undone!"),
      actions: [
        PlatformTextButton(
          child: PlatformText("Cancel", selectionColor: roundRed),
          onPressed: () => Navigator.of(context).pop(),
        ),
        PlatformTextButton(
          child: PlatformText("Delete", selectionColor: roundRed),
          onPressed: () {
            Navigator.pop(context);

            // Remove each member from group
            for(var user in parsedMembers) {
              FirebaseDatabase.instance.ref("user/${user.uid}/groupIds/${group.id}").remove();
            }
            // Delete Group
            FirebaseDatabase.instance.ref("groups/${group.id}").remove();

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

  void calculateSocialCounts() {
    instaCount = 0;
    fbCount = 0;
    discordCount = 0;
    smsCount = 0;
    snapCount = 0;

    for (var member in parsedMembers) {

      if(member.instagram != null) {
        instaCount += 1;
      }

      if(member.discord != null) {
        discordCount += 1;
      }

      if(member.sms != null) {
        smsCount += 1;
      }

      if(member.facebook != null) {
        fbCount += 1;
      }

      if(member.snapchat != null) {
        snapCount += 1;
      }
    }
  }

  void profileTap(int index) {


    String infoString = "";
    GroupMember member = parsedMembers[index];

    if(member.sms != null) {
      infoString += "Phone\n${member.sms}\n";
    }

    if(member.instagram != null) {
      infoString += "\nInstagram\n${member.instagram}\n";
    }

    if(member.snapchat != null) {
      infoString += "\nSnapchat\n${member.snapchat}\n";
    }

    if(member.discord != null) {
      infoString += "\nDiscord\n${member.discord}\n";
    }

    if(member.facebook != null) {
      infoString += "\nFacebook\n${member.facebook}\n";
    }

    _openDialog(member.name, PlatformText(infoString, textAlign: TextAlign.center,));
  }

  void socialTap(String source) {

    // Switch on each source, if selected count == 0, do nothing
    int selectedCount;

    switch(source) {
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

    // Sry for some of the garbage architectural decisions in this file resulting in this terrible function
    // It could be rewritten but there's a deadline - technical debt + I need to sleep
    // If selected Source > 0, display popup with list of names
    switch(source) {
      case "sms":
        for(var member in parsedMembers) {
          infoString += "${member.sms}, ";
        }
        break;
      case "facebook":
        for(var member in parsedMembers) {
          infoString += "${member.facebook}, ";
        }
        break;
      case "snapchat":
        for(var member in parsedMembers) {
          infoString += "${member.snapchat}, ";
        }
        break;
      case "discord":
        for(var member in parsedMembers) {
          infoString += "${member.discord}, ";
        }
        break;
      case "instagram":
        for(var member in parsedMembers) {
          infoString += "${member.instagram}, ";
        }
        break;
      default:
        return;
    }

    // Lmao no built in capitalize string function in dart
    _openDialog("${source[0].toUpperCase()}${source.substring(1).toLowerCase()}", PlatformText(infoString.substring(0, infoString.length-2)));
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
              child: PlatformText('Dismiss', selectionColor: roundPurple, style: TextStyle(color: roundPurple)),
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
            GestureDetector(child: Padding(padding: EdgeInsets.fromLTRB(32, 0, 16, 0), child: SizedBox(child: Image.asset("images/$name" + "App.png"), width: 48, height: 48,),), onTap: () => socialTap(name)),
            Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
              border: Border.all(color: Colors.white),
            ),
              child: Align(
                // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                // Push to later sprint if possible
                child: Container(width: barWidth * (count/parsedMembers.length), height: 32,
                    decoration: BoxDecoration(
                      color: roundPurple,
                      borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                      border: Border.all(color: roundPurple),
                    )),
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText(count.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
          ],
        ),
        SizedBox(width: screenWidth, height: 16,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    observeGroup();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Maps the image/social provider strings to their counts
    Map<String, int> socialCountWidgets = {
      "sms": smsCount,
      "snapchat": snapCount,
      "discord": discordCount,
      "instagram": instaCount,
      "facebook": fbCount
    };

    // Sorts the map by their values
    var sortedEntries = socialCountWidgets.entries.toList()..sort((e1, e2) {
      var diff = e2.value.compareTo(e1.value);
      if (diff == 0) diff = e2.key.compareTo(e1.key);
      return diff;
    });
    
    for (var entry in sortedEntries) {
      socialCountWidgets..remove(entry.key)..[entry.key] = entry.value;
    }

    List<Widget> socialWidgets = [];

    // add the relevant widgets in sorted order
    for(var key in socialCountWidgets.keys) {
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
        child: Padding(padding: EdgeInsets.fromLTRB(32, 32, 0, appointment != null ? 16 : 0),
            child: PlatformText("Round Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)
        ),
      )
    ];

    if(appointment != null) {

      String infoString = "";
      int index = 0;


      for(var member in rsvped) {
        infoString += member.name + "\n";
        index += 1;

        // Only add first 4 names
        if(index == 4) {
          break;
        }
      }

      if(infoString.isEmpty) {
        infoString = "Sync your calendar in Settings to confirm availability.";
      } else {
        if(rsvped.length > 4) {
            infoString += "+${rsvped.length - 4} More";
        }
      }


      mainWidgets.add(
          Container(width: screenWidth - 32,
            height: (screenWidth - 32) * (2.6/5),
            decoration: BoxDecoration(
                color: roundPurple,
                borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                border: Border.all(color: roundPurple)
            ),
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      PlatformText(new DateFormat.MMMM().format(appointment!).toString(), style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: roundPurple, height: 1.3),),
                      PlatformText(new DateFormat.d().format(appointment!).toString(), style: TextStyle(fontSize: 96, fontWeight: FontWeight.w900, color: roundPurple, height: 1.0)),
                      PlatformText(new DateFormat.jm().format(appointment!).toString(), style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: roundPurple, height: 0.8)),
                    ],
                  ),
                  width: (screenWidth - 64) * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                      border: Border.all(color: Colors.white)
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlatformText(rsvped.length.toString() + " Available", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        PlatformText(infoString, style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
                      ],
                    ),
                    onTap: showRSVPList,
                  ),
                  width: (screenWidth - 64) * 0.475,
                )
              ],
            ),
          )
      );
    }

    mainWidgets.add(
      Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
        child: Container(
          width: screenWidth - 64,
          child: PlatformTextButton(child:
          PlatformText(appointment != null ? "Request Another Time" : "Generate a New Round Up", style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
            color: roundPurple,
            onPressed: handleCalendarRequest,
          ),
        ),
      ),
    );

    mainWidgets.add(
      Container(
        width: screenWidth,
        child: Padding(padding: EdgeInsets.fromLTRB(32 , 0, 0, 16),
            child: PlatformText("Round Table", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)
        ),
      ),
    );

    mainWidgets.add(socialContainer);

    mainWidgets.add(SizedBox(
      width: screenWidth,
      child: Padding(padding: EdgeInsets.fromLTRB(32, 16, 0, appointment != null ? 16 : 0),
          child: PlatformText("Rounders (" + parsedMembers.length.toString()  + ")", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)
      ),
    ));

    mainWidgets.add(
      GridView.count(crossAxisCount: 1, childAspectRatio: screenHeight / 128, shrinkWrap: true, children: List.generate(parsedMembers.length, (index) {
        return Padding(padding: EdgeInsets.fromLTRB(32, 16, 32, 0), child:
          Row(
            children: [
              PlatformText(parsedMembers[index].name, style: TextStyle(fontSize: 20),),
              Expanded(flex: 1,
                child: Align(alignment: Alignment.centerRight,
                    child: PlatformTextButton(child: PlatformText("View Profile"), padding: EdgeInsets.fromLTRB(16, 0, 16, 0), color: roundPurple, onPressed: () => profileTap(index),),
                  )
                ,)
            ],
          )
        );
      }),),
    );

    mainWidgets.add(SizedBox(width: screenWidth, height: 16,));

    if (isAdmin) {
      mainWidgets.add(
          PlatformTextButton(child: PlatformText("Delete Circle", selectionColor: roundRed), onPressed: triggerDelete,)
      );
    }

    mainWidgets.add(SizedBox(width: screenWidth, height: 16,));

    return PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText(group.emoji + " " + group.name, style: TextStyle(color: Colors.black)), backgroundColor: group.color,),
      body: SingleChildScrollView(
        child: Column(
          children: mainWidgets,
        ),
      )
    );
  }

  void handleCalendarRequest() {
    appointment = DateTime.now();
    setState(() {});
  }

  void showRSVPList() {

    if (rsvped.isEmpty) {
      return;
    }

    String infoString = "";

    for (var member in rsvped) {
      infoString += member.name + ", ";
    }

    _openDialog("Available Rounders", PlatformText(infoString.substring(0, infoString.length-2)));
  }
}