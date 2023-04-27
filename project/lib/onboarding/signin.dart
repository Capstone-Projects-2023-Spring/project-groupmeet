import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/theme.dart';
import 'package:groupmeet/home.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key, required this.firebaseDatabase, required this.firebaseAuth});
  final FirebaseDatabase firebaseDatabase;
  final FirebaseAuth firebaseAuth;
  String email = "";
  String password = "";

  Future<void> buttonPress(BuildContext context) async {
    
    if (email.isEmpty || password.isEmpty) {
      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText("Email and Password must not be empty!"),
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
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).push(platformPageRoute(
          context: context, builder: (context) => HomeScreen(firebaseDatabase: firebaseDatabase, firebaseAuth: firebaseAuth,)));
    } catch (e) {
      String errorMessage = 'An error occurred, please try again later.';

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
        body: GestureDetector(child: Center(
            child: Column(
              children: [
                SizedBox(
                    width: screenWidth,
                    height:
                    MediaQuery.of(context).viewPadding.top + 0.08 * screenHeight),
                Image.asset(
                  "images/RoundCircle.png",
                  height: 160,
                  width: screenWidth,
                  isAntiAlias: true,
                ),
                SizedBox(width: screenWidth, height: 8),
                PlatformText("Round the world",
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                SizedBox(width: screenWidth, height: 32),
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
                PlatformTextButton(
                    child: PlatformText(
                      "New to Round? Sign Up!",
                      style: const TextStyle(color: roundPurple),
                    ),
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
            )),
        onTap: () => FocusScope.of(context).unfocus()));
  }
}
