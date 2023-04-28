import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/onboarding/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class Explainer extends StatelessWidget {
  Explainer({super.key, required this.pageNo});

  final int pageNo;

  var headers = ["Round", "Around", "Round Table"];

  var texts = [
    "A single platform to organize and spark team-based communication",
    "Sync entire team’s calendars for auto generated meeting times selected to optimize flow and minimize disruption",
    "Sync team communication preferences from multiple apps to know what everyone's talking on"
  ];

  var images = [
    "images/RoundCircle.png",
    "images/Round3Circles.png",
    "images/RoundTable.png"
  ];

  void buttonPress(BuildContext context) {
    // Push page with next page No
    // setState(() {
    int nextPage = pageNo + 1;

    if (nextPage == 3) {
      Navigator.of(context).push(platformPageRoute(
          context: context, builder: (context) => SignUp(firebaseAuth: FirebaseAuth.instance, firebaseDatabase: FirebaseDatabase.instance,)));
      return;
    }

    Navigator.of(context).push(platformPageRoute(
        context: context,
        builder: (context) => Explainer(
              pageNo: nextPage,
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageHeight = pageNo == 2 ? 242 : 160;

    return PlatformScaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
            width: screenWidth,
            height:
                MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
        Image.asset(
          images[pageNo],
          height: imageHeight,
          width: screenWidth,
          isAntiAlias: true,
        ),
        SizedBox(width: screenWidth, height: 8),
        PlatformText(headers[pageNo],
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
        SizedBox(width: screenWidth, height: 32),
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth / 8, vertical: 0),
            child: PlatformText(
              texts[pageNo],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )),
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
