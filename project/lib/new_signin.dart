
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/home.dart';
import 'package:groupmeet/login.dart';
import 'package:groupmeet/new_calendar_selection.dart';
import 'package:groupmeet/theme.dart';

class NewSignIn extends StatelessWidget {
  NewSignIn({super.key});

  String email = "";
  String password = "";

  Future<void> buttonPress(BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText("Email and Password must not be empty!"),
        actions: [
          PlatformTextButton(child: PlatformText("Ok"),
            onPressed: () => Navigator.of(context).pop(),)
        ],);

      showPlatformDialog(context: context, builder: (context) {
        return error;
      },);

      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).push(platformPageRoute(
          context: context, builder: (context) => HomeScreen(title: "Round")));
    } catch (e) {
      String errorMessage =
          'An error occurred, please try again later.';


      // Do NOT like dart having the ! after the is!
      // Reminds me of as! in Swift which is VERY different
      if (e is! FirebaseAuthException) {
        return;
      }

      if (e.code == 'user-not-found') {
        errorMessage = 'Invalid email address.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Invalid password.';
      }

      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText(errorMessage),
        actions: [
          PlatformTextButton(child: PlatformText("Ok"),
            onPressed: () => Navigator.of(context).pop(),)
        ],);

      showPlatformDialog(context: context, builder: (context) {
        return error;
      },);

    }
  }

  void signIn(BuildContext context) {
    Navigator.of(context).pop();
  }

  void changedEmail(String string) {
    email = string.trim();
  }

  void changedPassword(String string) {
    password = string;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return PlatformScaffold(
        body: Center(
            child: Column(
              children: [
                SizedBox(width: screenWidth, height: MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
                Image.asset(
                  // TODO: Add Text Fields
                  // TODO: Add Login Link
                    "Images/RoundCircle.png", height: 160, width: screenWidth
                ),
                SizedBox(width: screenWidth, height: 8),
                PlatformText("Round the world",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                SizedBox(width: screenWidth, height: 32),

                SizedBox(width: screenWidth * (3/4), child:
                PlatformTextField(hintText: "Email", keyboardType: TextInputType.emailAddress, cursorColor: roundPurple, onChanged: (p0) => changedEmail(p0),)
                ),
                SizedBox(width: screenWidth, height: 16,),
                SizedBox(width: screenWidth * (3/4), child:
                PlatformTextField(hintText: "Password", obscureText: true, cursorColor: roundPurple, onChanged: (p0) => changedPassword(p0),)
                ),
                // TODO: Goto login which is the exact same except without name and with different photo on top
                PlatformTextButton(child: PlatformText("New to Round? Sign Up!", style: TextStyle(color: roundPurple),), onPressed: () => signIn(context)),

                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 64, width: 64, child:
                        PlatformIconButton(icon:
                        Image.asset(
                            "Images/OnboardingNext.png", height: 64, width: 64
                        ), padding: EdgeInsets.zero, onPressed: () => buttonPress(context),)),
                        SizedBox(width: screenWidth, height: 16),
                        PlatformText("© 2023 Round Corp\nFrom Philly with Love 🤍",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10)),
                        SizedBox(width: screenWidth, height: 32,)
                      ],),
                  ),
                ),
              ],

            )
        )
    );
  }
}