import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupmeet/calendar/link_calendar.dart';
import 'package:groupmeet/onboarding/signup.dart';

import 'package:groupmeet/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:googleapis/calendar/v3.dart' as google_api;
import 'package:googleapis_auth/googleapis_auth.dart' as auth show AuthClient;
import 'package:date_utils/date_utils.dart' as utils;

class Settings extends StatefulWidget {
  const Settings(
      {super.key, required this.firebaseDatabase, required this.firebaseAuth});

  final FirebaseDatabase firebaseDatabase;
  final FirebaseAuth firebaseAuth;
  @override
  State<StatefulWidget> createState() => _Settings();
}

class _Settings extends State<Settings> {
  String name = "";
  String email = "";

  String? snap;
  String? messages;
  String? discord;
  String? insta;
  String? fb;
  bool? cal;

  String newName = "";
  String newEmail = "";

  bool observing = false;

  void changedName(String newName) {
    this.newName = newName;
  }

  void changedEmail(String newEmail) {
    this.newEmail = newEmail;
  }

  void legacySettings() {}

  void saveInfo() {
    Navigator.of(context).pop();

    String? userID = widget.firebaseAuth.currentUser?.uid;

    if (userID == null) {
      print("Null User ID");
      return;
    }

    widget.firebaseDatabase.ref("users/$userID/email").set(newEmail);

    String firstName = newName.split(" ").first;
    String lastName =
        newName.split(" ").getRange(1, newName.split(" ").length).join(" ");

    widget.firebaseDatabase.ref("users/$userID/firstName").set(firstName);
    widget.firebaseDatabase.ref("users/$userID/lastName").set(lastName);

    print(newEmail);
    print(firstName);
    print(lastName);

    setState(() {
      name = newName;
      email = newEmail;
    });
  }

  void observeData() {
    if (observing) {
      return;
    }

    String? userID = widget.firebaseAuth.currentUser?.uid;

    if (userID == null) {
      print("Current user is null");

      print(userID);
      print(userID);
      return;
    }

    DatabaseReference userRef = widget.firebaseDatabase.ref("users/$userID");

    userRef.onValue.listen((event) {
      if (event.snapshot.value == null) {
        print("null snapshot");
        return;
      }

      print(event.snapshot.value);
      print(event.snapshot.value.runtimeType);

      Map<Object?, Object?> data =
          event.snapshot.value as Map<Object?, Object?>;

      print(data["firstName"] as String);
      print(data["lastName"] as String);
      print(data["email"] as String);

      print(data["messages_name"] as String?);
      print(data["discord_name"] as String?);
      print(data["facebook_name"] as String?);
      print(data["instagram_name"] as String?);
      print(data["snapchat_name"] as String?);
      print(data["has_calendar"] as bool?);

      setState(() {
        name = "${data["firstName"] as String} ${data["lastName"] as String}";
        email = data["email"] as String;

        messages = data["messages_name"] as String?;
        discord = data["discord_name"] as String?;
        fb = data["facebook_name"] as String?;
        insta = data["instagram_name"] as String?;
        snap = data["snapchat_name"] as String?;
        cal = data['has_calendar'] as bool?;

        newEmail = email;
        newName = newName;
      });
    });

    observing = true;
  }

  void socialChanged(String text) {
    newSocial = text;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[google_api.CalendarApi.calendarScope],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getPrimaryCalendar() async {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {});
    });

    await _handleSignIn();

    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    if (client == null) {
      print("null client");
      return;
    }

    final google_api.CalendarApi calendarApi = google_api.CalendarApi(client);
    DateTime end = utils.DateUtils.lastDayOfMonth(DateTime.now());
    DateTime start = utils.DateUtils.firstDayOfMonth(DateTime.now());
    final google_api.Events calEvents = await calendarApi.events
        .list("primary", timeMax: end.toUtc(), timeMin: start.toUtc());

    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return;
    }

    late DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    List<google_api.Event> eventItems = calEvents.items!;

    List<List<String?>> events = [];
    for (var element in eventItems) {
      List<String?> temp = [
        element.start!.date.toString(),
        element.start!.dateTime.toString(),
        element.end!.date.toString(),
        element.end!.dateTime.toString()
      ];
      print(temp);
      events.add(temp);
    }
    await ref.update({"calendarEvents": events});
  }

  void saveSocial(String media) {
    Navigator.of(context).pop();

    String? userID = widget.firebaseAuth.currentUser?.uid;

    if (userID == null) {
      print("Null User ID");
      return;
    }

    String saveLocation;

    switch (media) {
      case "snap":
        saveLocation = "snapchat_name";
        snap = newSocial;
        setState(() {
          snapOpacity = 0.0;
        });
        break;
      case "sms":
        saveLocation = "messages_name";
        messages = newSocial;
        setState(() {
          smsOpacity = 0.0;
        });
        break;
      case "discord":
        saveLocation = "discord_name";
        discord = newSocial;
        setState(() {
          discordOpacity = 0.0;
        });
        break;
      case "insta":
        saveLocation = "instagram_name";
        insta = newSocial;
        setState(() {
          instaOpacity = 0.0;
        });
        break;
      case "fb":
        saveLocation = "facebook_name";
        fb = newSocial;
        setState(() {
          fbOpacity = 0.0;
        });
        break;
      default:
        print("Error");
        return;
    }

    String? ns = newSocial?.trim();

    if (ns!.isEmpty) {
      ns = null;
    }

    print("users/$userID/$saveLocation");
    print(newSocial);
    widget.firebaseDatabase.ref("users/$userID/$saveLocation").set(ns);
  }

  String? newSocial;

  void selectedSocial(String social) {
    if (social == "calendar") {
      if (cal == null) {
        Navigator.of(context).push(platformPageRoute(
            context: context, builder: (context) => LinkCalendar()));
        return;
      }

      PlatformAlertDialog confirmation = PlatformAlertDialog(
        title: PlatformText("Are you sure?"),
        content: PlatformText(
            "Syncing your Google calendar will remove any manually added events"),
        actions: [
          PlatformTextButton(
            child: PlatformText("Cancel",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          PlatformTextButton(
              child: PlatformText("Sync",
                  selectionColor: roundRed, style: const TextStyle(color: roundRed)),
              onPressed: () {
                Navigator.pop(context);

                getPrimaryCalendar();

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

      return;
    }

    String hintString;

    switch (social) {
      case "snap":
        hintString = "Snapchat";
        newSocial = snap;
        break;
      case "sms":
        hintString = "Phone Number";
        newSocial = messages;
        break;
      case "discord":
        hintString = "Discord";
        newSocial = discord;
        break;
      case "insta":
        hintString = "Instagram";
        newSocial = insta;
        break;
      case "fb":
        hintString = "Facebook";
        newSocial = fb;
        break;
      default:
        hintString = "";
        newSocial = "";
    }

    PlatformAlertDialog error = PlatformAlertDialog(
      title: PlatformText("Edit " + hintString),
      content: Column(
        children: [
          PlatformTextField(
            key: const Key("newSocialEditPlatformAlertKey"),
            cursorColor: roundPurple,
            hintText: hintString,
            controller: TextEditingController(text: newSocial),
            onChanged: (p0) => socialChanged(p0),
          ),
        ],
      ),
      actions: [
        PlatformTextButton(
          key: const Key("cancelNewSocialTapKey"),
          child: PlatformText("Cancel",
              selectionColor: roundPurple,
              style: const TextStyle(color: Colors.white)),
          onPressed: () {
            newEmail = email;
            newName = newName;
            Navigator.of(context).pop();
          },
        ),
        PlatformTextButton(
          key: const Key("saveNewSocialTapKey"),
          child: PlatformText("Save",
              selectionColor: roundPurple,
              style: const TextStyle(color: Colors.white)),
          onPressed: () => saveSocial(social),
        )
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) {
        return error;
      },
    );
  }

  void handleCal(BuildContext context) {}

  void editProfile() {
    PlatformAlertDialog error = PlatformAlertDialog(
      title: PlatformText("Edit Profile"),
      content: Column(
        children: [
          PlatformTextField(
            key: const Key("editNameArea"),
            cursorColor: roundPurple,
            hintText: "Name",
            controller: TextEditingController(text: name),
            onChanged: (p0) => changedName(p0),
          ),
          PlatformTextField(
            key: const Key("editEmailArea"),
            cursorColor: roundPurple,
            hintText: "Email",
            controller: TextEditingController(text: email),
            onChanged: (p0) => changedEmail(p0),
          ),
        ],
      ),
      actions: [
        PlatformTextButton(
          child: PlatformText("Cancel",
              selectionColor: roundPurple,
              style: const TextStyle(color: Colors.white)),
          onPressed: () {
            newEmail = email;
            newName = newName;
            Navigator.of(context).pop();
          },
        ),
        PlatformTextButton(
          child: PlatformText("Save",
              selectionColor: roundPurple,
              style: const TextStyle(color: Colors.white)),
          onPressed: () => saveInfo(),
        )
      ],
    );

    showPlatformDialog(
      context: context,
      builder: (context) {
        return error;
      },
    );
  }

  void about(BuildContext context) async {
    Uri aboutURL = Uri.parse(
        "https://github.com/Capstone-Projects-2023-Spring/project-groupmeet");

    await launchUrl(aboutURL, mode: LaunchMode.externalApplication);
  }

  void signOut(BuildContext context) async {
    try {
      await widget.firebaseAuth.signOut();
      Navigator.of(context).push(platformPageRoute(
          context: context,
          builder: (context) => SignUp(
                firebaseAuth: FirebaseAuth.instance,
                firebaseDatabase: FirebaseDatabase.instance,
              )));
    } catch (e) {
      print(e);
    }
  }

  double opaqueValue = 0.4;

  late double smsOpacity;
  late double snapOpacity;
  late double discordOpacity;
  late double fbOpacity;
  late double instaOpacity;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double smsOpacity = messages == null ? opaqueValue : 0.0;
    double snapOpacity = snap == null ? opaqueValue : 0.0;
    double discordOpacity = discord == null ? opaqueValue : 0.0;
    double fbOpacity = fb == null ? opaqueValue : 0.0;
    double instaOpacity = insta == null ? opaqueValue : 0.0;
    double calOpacity = cal == null ? opaqueValue : 0.0;

    observeData();

    return PlatformScaffold(
        appBar: PlatformAppBar(title: PlatformText("Settings")),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: screenWidth - 32,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1C1C1E)),
                color: const Color(0xFF1C1C1E),
                borderRadius: const BorderRadius.all(Radius.circular(160)),
              ),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                          width: screenWidth * (2 / 3),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: (screenWidth * (2 / 3)) - 32,
                                  child: PlatformText(name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(
                                width: (screenWidth * (2 / 3)) - 32,
                                child: PlatformText(email,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey)),
                              ),
                            ],
                          ))),
                  Center(
                    child: PlatformIconButton(
                        key: const Key("editProfileButtonKey"),
                        icon: Icon(
                          PlatformIcons(context).edit,
                          color: roundPurple,
                        ),
                        onPressed: editProfile),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 0, 0),
            child: PlatformText("Linked Socials",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: screenWidth - 32,
              height: 2 * ((screenWidth - 32 - 64) / 3),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1C1C1E)),
                color: const Color(0xFF1C1C1E),
                borderRadius: const BorderRadius.all(Radius.elliptical(32, 32)),
              ),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 16,
                          children: [
                            GestureDetector(
                              key: const Key("smsAppGestureKey"),
                              child: ColorFiltered(
                                key: const Key("smsAppOpacityKey"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(smsOpacity),
                                    BlendMode.srcATop),
                                child: SizedBox(
                                    child: Image.asset(
                                  "images/smsApp.png",
                                )),
                              ),
                              onTap: () => selectedSocial("sms"),
                            ),
                            GestureDetector(
                              key: const Key("snapAppGestureKey"),
                              child: ColorFiltered(
                                key: const Key("snapAppOpacityKey"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(snapOpacity),
                                    BlendMode.srcATop),
                                child: SizedBox(
                                    child: Image.asset(
                                  "images/snapchatApp.png",
                                )),
                              ),
                              onTap: () => selectedSocial("snap"),
                            ),
                            GestureDetector(
                              key: const Key("discordAppGestureKey"),
                              child: ColorFiltered(
                                key: const Key("discordAppOpacityKey"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(discordOpacity),
                                    BlendMode.srcATop),
                                child: SizedBox(
                                    child: Image.asset(
                                  "images/discordApp.png",
                                )),
                              ),
                              onTap: () => selectedSocial("discord"),
                            ),
                            GestureDetector(
                                key: const Key("instagramAppGestureKey"),
                                child: ColorFiltered(
                                  key: const Key("instagramAppOpacityKey"),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(instaOpacity),
                                      BlendMode.srcATop),
                                  child: SizedBox(
                                      child: Image.asset(
                                    "images/instagramApp.png",
                                  )),
                                ),
                                onTap: () => selectedSocial("insta")),
                            GestureDetector(
                              key: const Key("facebookAppGestureKey"),
                              child: ColorFiltered(
                                key: const Key("facebookAppOpacityKey"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(fbOpacity),
                                    BlendMode.srcATop),
                                child: SizedBox(
                                    child: Image.asset(
                                  "images/facebookApp.png",
                                )),
                              ),
                              onTap: () => selectedSocial("fb"),
                            ),
                            GestureDetector(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(calOpacity),
                                    BlendMode.srcATop),
                                child: SizedBox(
                                    child: Image.asset(
                                  "images/calendarApp.png",
                                )),
                              ),
                              onTap: () => selectedSocial("calendar"),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: screenWidth - 32,
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1C1C1E)),
                  color: const Color(0xFF1C1C1E),
                  borderRadius: const BorderRadius.all(Radius.circular(160)),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                            width: (screenWidth) * (2 / 3),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: ((screenWidth) * (2 / 3)) - 32,
                                    child: PlatformText("About",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ))),
                    Center(
                      child: PlatformIconButton(
                          icon: Icon(
                        PlatformIcons(context).rightChevron,
                        color: Colors.white,
                      )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () => about(context),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              key: const Key("signOutSettingsGestureDetectorKey"),
              child: Container(
                width: screenWidth - 32,
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1C1C1E)),
                  color: const Color(0xFF1C1C1E),
                  borderRadius: const BorderRadius.all(Radius.circular(160)),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                            width: (screenWidth) * (2 / 3),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: ((screenWidth) * (2 / 3)) - 32,
                                    child: PlatformText("Sign Out",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: roundRed,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500))),
                              ],
                            )))
                  ],
                ),
              ),
              onTap: () => signOut(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: PlatformText("© 2023 Round Corp\nFrom Philly with Love 🤍",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10)),
          )
        ]));
  }
}
