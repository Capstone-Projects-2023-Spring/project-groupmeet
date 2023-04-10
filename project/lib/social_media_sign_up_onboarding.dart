import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'create_account_old.dart';
import 'home.dart';
import 'socials.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocialMediaOnboarding extends StatefulWidget {
  const SocialMediaOnboarding({super.key});

  @override
  State<SocialMediaOnboarding> createState() => _SocialMediaOnboardingState();
}

class _SocialMediaOnboardingState extends State<SocialMediaOnboarding> {
  late bool instaSelect;
  late bool fbSelect;
  late bool discordSelect;
  late bool messagesSelect;
  late bool snapSelect;

  @override
  void initState() {
    super.initState();
    instaSelect = false;
    fbSelect = false;
    discordSelect = false;
    messagesSelect = false;
    snapSelect = false;
  }

  @override
  Widget build(BuildContext context) {
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$temp");
    return DismissKeyboard(
        child: PlatformScaffold(
            body: Center(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
                child: Material(
                  borderRadius: BorderRadius.circular(65),
                  elevation: 2,
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(230, 81, 63, 219),
                    radius: 75,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
              child: Text(style: TextStyle(fontSize: 40), "Get Around"),
            ),
            const Text(
                style: TextStyle(fontSize: 15),
                "Link third-party accounts to be used "),
            const Text("with Round (optional)"),
            SocialMedia(databaseReference: ref),
            PlatformElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  platformPageRoute(
                      context: context, builder: (_) => const HomeScreen()),
                );
              },
              material: (_, __) => MaterialElevatedButtonData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    width: 5.0,
                    color: Color.fromARGB(255, 89, 4, 106),
                  ),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(24),
                ),
              ),
              cupertino: (_, __) => CupertinoElevatedButtonData(),
              child: Icon(color: Colors.black, PlatformIcons(context).forward),
            )
          ]),
    )));
  }
}
