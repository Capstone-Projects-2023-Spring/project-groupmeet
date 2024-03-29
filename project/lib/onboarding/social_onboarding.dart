import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/home.dart';

class SocialOnboarding extends StatelessWidget {
  SocialOnboarding(
      {super.key, required this.firebaseDatabase, required this.firebaseAuth});
  final FirebaseDatabase firebaseDatabase;
  final FirebaseAuth firebaseAuth;
  String insta = "";
  String fb = "";
  String discord = "";
  String snap = "";
  String sms = "";

  void facebookChanged(String string) {
    fb = string;
  }

  void instagramChanged(String string) {
    insta = string;
  }

  void discordChanged(String string) {
    discord = string;
  }

  void snapChanged(String string) {
    snap = string;
  }

  void smsChanged(String string) {
    sms = string;
  }

  void buttonPress(BuildContext context) {
    String? ig = insta.trim();
    if (ig.isEmpty) {
      ig = null;
    }

    String? face = fb.trim();
    if (face.isEmpty) {
      face = null;
    }

    String? sn = snap.trim();
    if (sn.isEmpty) {
      sn = null;
    }

    String? smes = sms.trim();
    if (smes.isEmpty) {
      smes = null;
    }

    String? disc = discord.trim();
    if (disc.isEmpty) {
      disc = null;
    }

    databaseReference.update({
      'instagram': insta.isNotEmpty,
      'facebook': fb.isNotEmpty,
      'discord': discord.isNotEmpty,
      'messages': sms.isNotEmpty,
      'snapchat': snap.isNotEmpty,
      'instagram_name': ig,
      'facebook_name': face,
      'discord_name': disc,
      'snapchat_name': sn,
      'messages_name': smes
    });
    Navigator.of(context).push(platformPageRoute(
        context: context,
        builder: (context) => HomeScreen(
              firebaseDatabase: firebaseDatabase,
              firebaseAuth: firebaseAuth,
            )));
  }

  late DatabaseReference databaseReference;

  @override
  Widget build(BuildContext context) {
    String temp = firebaseAuth.currentUser?.uid ?? "";
    databaseReference = firebaseDatabase.ref("users/$temp");

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var scaleConst = 0.08;

    if (Platform.isAndroid) {
      scaleConst = 0;
    }

    return PlatformScaffold(
        body: GestureDetector(
      child: Center(
          child: Column(
        children: [
          SizedBox(
              width: screenWidth,
              height: MediaQuery.of(context).viewPadding.top +
                  scaleConst * screenHeight),
          Image.asset(
            "images/Round3Circles.png",
            height: 160,
            width: screenWidth,
            isAntiAlias: true,
          ),
          SizedBox(width: screenWidth, height: 8),
          PlatformText("Get Around",
              style:
                  const TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
          SizedBox(width: screenWidth, height: 32),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 8, vertical: 0),
              child: PlatformText(
                "Save third-party usernames to be used with Round (optional)",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )),
          const SizedBox(height: 32),
          SizedBox(
              width: screenWidth * (3 / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("images/sms.png",
                        height: 32, width: 32, isAntiAlias: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      flex: 8,
                      child: PlatformTextField(
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        onChanged: (p0) => smsChanged(p0),
                      ))
                ],
              )),
          const SizedBox(height: 16),
          SizedBox(
              width: screenWidth * (3 / 4),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        "images/instagram.png",
                        height: 32,
                        width: 32,
                        isAntiAlias: true,
                      )),
                  const SizedBox(width: 8),
                  Expanded(
                      flex: 8,
                      child: PlatformTextField(
                          hintText: "Instagram",
                          onChanged: (p0) => instagramChanged(p0)))
                ],
              )),
          const SizedBox(height: 16),
          SizedBox(
              width: screenWidth * (3 / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "images/snapchat.png",
                      height: 32,
                      width: 32,
                      isAntiAlias: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      flex: 8,
                      child: PlatformTextField(
                          hintText: "Snapchat",
                          onChanged: (p0) => snapChanged(p0)))
                ],
              )),
          const SizedBox(height: 16),
          SizedBox(
              width: screenWidth * (3 / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("images/discord.png",
                        height: 32, width: 32, isAntiAlias: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      flex: 8,
                      child: PlatformTextField(
                          hintText: "Discord",
                          onChanged: (p0) => discordChanged(p0)))
                ],
              )),
          const SizedBox(height: 16),
          SizedBox(
              width: screenWidth * (3 / 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("images/facebook.png",
                        height: 32, width: 32, isAntiAlias: true),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      flex: 8,
                      child: PlatformTextField(
                          hintText: "Facebook",
                          onChanged: (p0) => facebookChanged(p0)))
                ],
              )),
          const SizedBox(height: 16),
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
                          "images/OnboardingClap.png",
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
      )),
      onTap: () => FocusScope.of(context).unfocus(),
    ));
  }
}
