import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/group/all_groups.dart';
import 'package:groupmeet/theme.dart';
import 'package:groupmeet/settings/account_info.dart';
import 'package:groupmeet/onboarding/signup.dart';
import 'package:groupmeet/settings/add_event.dart';

class About extends StatefulWidget {
  const About({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<About> createState() => AboutState();
}

@visibleForTesting
class AboutState extends State<About> {
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    ref = FirebaseDatabase.instance.ref("users/$temp");
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      //
      // PlatformAlertDialog error = PlatformAlertDialog(
      //   title: PlatformText("Logout Successful!"),
      //   actions: [
      //     PlatformTextButton(child: PlatformText("Ok"),
      //       onPressed: () => Navigator.of(context).pop(),)
      //   ],);
      //
      // showPlatformDialog(context: context, builder: (context) {
      //   return error;
      // },);

      // scaffoldMessengerState.showSnackBar(
      //   const SnackBar(
      //     content: Text('Logged out successfully.'),
      //     duration: Duration(seconds: 5),
      //   ),
      // );

      Navigator.of(context).push(platformPageRoute(
          context: context, builder: (context) => SignUp()));
    } catch (e) {
      // scaffoldMessengerState.showSnackBar(
      //   SnackBar(
      //     content: Text('An error occurred while logging out: $e'),
      //     duration: const Duration(seconds: 5),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PlatformText("My Account"),
                  PlatformIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        platformPageRoute(
                            context: context,
                            builder: (context) =>
                                AccountInfo(title: "My Account", ref: ref)),
                      );
                    },
                    icon: Icon(PlatformIcons(context).accountCircle,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PlatformText("All Groups"),
                  PlatformIconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          platformPageRoute(
                              context: context,
                              builder: (context) => AllGroups(
                                  title: "Display All Groups Here", ref: ref)),
                        );
                      },
                      icon: Icon(
                        PlatformIcons(context).group,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          Column(
            children: [
              PlatformText("Add Event"),
              PlatformIconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    platformPageRoute(
                      context: context,
                      builder: (context) =>
                          AddEvent(title: "Add New Event", ref: ref),
                    ),
                  );
                },
                icon: Icon(PlatformIcons(context).add, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              PlatformElevatedButton(
                  onPressed: () => logout(),
                  color: roundPurple,
                  child: PlatformText("Logout")),
            ],
          ),
        ],
      ),
    );
  }
}
