import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/theme.dart';
import 'package:groupmeet/onboarding/signin.dart';
import 'package:groupmeet/home.dart';

class GroupCreation extends StatefulWidget {
  
  const GroupCreation({super.key, required  this.userID, required this.firebaseDatabase });
  final String? userID;
  final FirebaseDatabase firebaseDatabase;

  @override
  GroupCreationState createState() => GroupCreationState();
}

class GroupCreationState extends State<GroupCreation> {

  GroupCreationState() {
    selectedColor = createMaterialColor(roundPurple);
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  MaterialColor? selectedColor;
  MaterialColor? tempColor;

  String name = "";
  String emoji = "";

  late DatabaseReference ref;
  String? uid;

  void changedName(String string) {
    name = string;
  }

  void changedEmoji(String string) {
    emoji = string;
  }

  Future<void> buttonPress(BuildContext context) async {  
    if(name.trim().isEmpty || emoji.trim().characters.length != 1) {
      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText(
            'Please enter a group name and 1 character emoji. You may optionally select a non-default color'),
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

    // TODO: Create Group in Firebase and Dismiss
    // TODO: Load User Groups to home screen :)
    // TODO: Then Accept Screen, Viewing, and Settings
    
    if (widget.userID == null) {

      PlatformAlertDialog error = PlatformAlertDialog(
        title: PlatformText("Whoops!"),
        content: PlatformText(
            'You are not logged in. Log back in or check your internet connection'),
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

    final DatabaseReference groupRef =
    widget.firebaseDatabase.ref().child('groups').push();

    await groupRef.set({
      'name': name.trim(),
      'emoji': emoji.trim(),
      'admin': widget.userID,
      'members': {widget.userID: true},
      'color': selectedColor!.shade500.value
    });

    await widget.firebaseDatabase
        .ref("users/${widget.userID}/groupIds/${groupRef.key}").set(true);

    Navigator.of(context).pop();      
  }    
  

  // do widget testing for the page below
  // check to make sure the signIn page - title shows up
  // but is it even being called right now?
  void signIn(BuildContext context) {
    Navigator.of(context).push(
        platformPageRoute(context: context, builder: (context) => SignIn()));
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
              child: PlatformText('Cancel', selectionColor: roundPurple),
            ),
            TextButton(
              child: PlatformText('Submit', selectionColor: roundPurple),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => selectedColor = tempColor);
              },
            ),
          ],
        );
      },
    );
  }

  void colorTapped() {
    _openDialog(
      "Color Picker",
        MaterialColorPicker(
          selectedColor: selectedColor,
          colors: [
            createMaterialColor(roundPurple),
            createMaterialColor(roundWhite),
            createMaterialColor(roundRed),
            createMaterialColor(roundOrange),
            createMaterialColor(roundYellow),
            createMaterialColor(roundBlue),
            createMaterialColor(roundPink),
            createMaterialColor(roundLightPurple),
            createMaterialColor(roundGreen),
            createMaterialColor(roundSilver),
            createMaterialColor(roundForest),
            createMaterialColor(roundTeal)
          ],
          allowShades: false,
          onMainColorChange: (color) => setState(() => tempColor = color as MaterialColor?),

        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    CircleColor colorCircle = CircleColor(color: selectedColor!.shade500, circleSize: 32,);

    return PlatformScaffold(
        appBar: PlatformAppBar(title: PlatformText("New Circle")),
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
                PlatformText("Get Around",
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                SizedBox(width: screenWidth, height: 32),

                SizedBox(
                    width: screenWidth * (3 / 4),
                    child: PlatformTextField(
                      hintText: "Group Name",
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
                Row(
                  children: [
                    SizedBox(width: screenWidth / 8),
                    SizedBox(
                        width: screenWidth * (3 / 8),
                        child: PlatformTextField(
                          hintText: "Emoji",
                          keyboardType: TextInputType.text,
                          cursorColor: roundPurple,
                          onChanged: (p0) => changedEmoji(p0),
                        )),
                        SizedBox(width: screenWidth / 16,),
                        PlatformText("Color", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(width: screenWidth / 16,),
                        GestureDetector(
                          key: const Key('colorChooserGestureDetector'),
                          child: colorCircle,
                          onTap: () => colorTapped(),
                        )
                  ],
                ),

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
