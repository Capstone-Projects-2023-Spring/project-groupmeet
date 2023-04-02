import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/new_calendar_selection.dart';
import 'package:groupmeet/theme.dart';

import 'signin.dart';

class NewSignUp extends StatelessWidget {
  NewSignUp({super.key});

  String name = "";
  String email = "";
  String password = "";

  late DatabaseReference ref;
  String? uid;

  void changedName(String string) {
    name = string;
  }

  void changedEmail(String string) {
    email = string;
  }

  void changedPassword(String string) {
    password = string;
  }

  Future<void> buttonPress(BuildContext context) async {
    if (password.isEmpty ||
        email.trim().isEmpty ||
        name.trim().isEmpty ||
        name.split(" ").length < 2) {
      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText(
            'Please enter a full first and last name, email, and password'),
        actions: [
          PlatformTextButton(
            child: PlatformText("Ok",
                selectionColor: roundPurple,
                style: const TextStyle(color: roundPurple)),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );

      showPlatformDialog(
        context: context,
        builder: (context) {
          return error;
        },
      );
      return;
    }

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    )
        .then((authResult) {
      uid = authResult.user?.uid;
      ref = FirebaseDatabase.instance.ref("users/$uid/");
      ref.set({
        "email": email,
        "firstName": name.split(" ").first,
        "lastName":
            name.split(" ").getRange(1, name.split(" ").length).join(" "),
        "discord": false,
        "facebook": false,
        "instagram": false,
        "messages": false,
        "snapchat": false,
      });

      Navigator.of(context).push(
        platformPageRoute(
            context: context, builder: (_) => NewCalendarSelection()),
      );
    }).catchError((e) {
      String errorText =
          "An unknown error occurred. To try again or not to try";
      print(e);
      if (e is! FirebaseAuthException) {
        PlatformAlertDialog error = PlatformAlertDialog(
          title: PlatformText("Whoops!"),
          content: PlatformText(errorText),
          actions: [
            PlatformTextButton(
              child: PlatformText("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );

        showPlatformDialog(
          context: context,
          builder: (context) {
            return error;
          },
        );

        return;
      }
      if (e.code == 'weak-password') {
        errorText = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorText =
            'An account already exists for that email. Please sign in fellow Rounder';
      }

      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText(errorText),
        actions: [
          PlatformTextButton(
            child: PlatformText("Ok"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );

      showPlatformDialog(
        context: context,
        builder: (context) {
          return error;
        },
      );
    });
  }

  void signIn(BuildContext context) {
    Navigator.of(context).push(
        platformPageRoute(context: context, builder: (context) => NewSignIn()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
            width: screenWidth,
            height:
                MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
        Image.asset(
          "images/AddPhoto.png",
          height: 160,
          width: screenWidth,
          isAntiAlias: true,
        ),
        SizedBox(width: screenWidth, height: 8),
        PlatformText("Be Round or\nbe square",
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        SizedBox(width: screenWidth, height: 32),

        SizedBox(
            width: screenWidth * (3 / 4),
            child: PlatformTextField(
              hintText: "Name",
              autofocus: true,
              cursorColor: roundPurple,
              onChanged: (p0) => changedName(p0),
              material: (_, __) => MaterialTextFieldData(
                  decoration: const InputDecoration(
                      focusColor: roundPurple, hoverColor: roundPurple)),
            )),
        SizedBox(
          width: screenWidth,
          height: 16,
        ),
        SizedBox(
            width: screenWidth * (3 / 4),
            child: PlatformTextField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              cursorColor: roundPurple,
              onChanged: (p0) => changedEmail(p0),
            )),
        SizedBox(
          width: screenWidth,
          height: 16,
        ),
        SizedBox(
            width: screenWidth * (3 / 4),
            child: PlatformTextField(
              hintText: "Password",
              obscureText: true,
              cursorColor: roundPurple,
              onChanged: (p0) => changedPassword(p0),
            )),

        // TODO: Goto login which is the exact same except without name and with different photo on top
        PlatformTextButton(
            child: PlatformText("Been Round? Sign In!",
                style: const TextStyle(color: roundPurple)),
            onPressed: () => signIn(context)),

        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: 64,
                    width: 64,
                    child: PlatformIconButton(
                      icon: Image.asset(
                        "images/OnboardingNext.png",
                        height: 64,
                        width: 64,
                        isAntiAlias: true,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () => buttonPress(context),
                    )),
                SizedBox(width: screenWidth, height: 16),
                PlatformText("© 2023 Round Corp\nFrom Philly with Love 🤍",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10)),
                SizedBox(
                  width: screenWidth,
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
