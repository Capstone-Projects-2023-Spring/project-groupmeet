import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'social_media_sign_up_onboarding.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
@override 
Widget build(BuildContext context) {
    return PlatformScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 0,50, 20),
            child: Material(
              borderRadius: BorderRadius.circular(65),
              elevation: 2,
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(230, 81, 63, 219),
                radius: 75,
              ),
            )),
           const Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
           child:
            Text(
              style: TextStyle(fontSize: 40),
              "Round Up"),
           ),
        const Text(
            style: TextStyle(fontSize: 15),
            "Link third-party calendars to be used "),
        const Text("with Round (optional)"),
        Padding(padding: const EdgeInsets.fromLTRB(50, 50, 50, 150),
        child:  
        PlatformElevatedButton(
          onPressed: () {
            print("sign in to google and grab google events");
          },
          material: (context, platform) => MaterialElevatedButtonData(
              style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            fixedSize: const Size(125, 10),
            backgroundColor: const Color.fromARGB(255, 38, 61, 80),
          )),
          child: const Text(style: TextStyle(color: Colors.blue), "Google"),
        ),        
        ),        
        PlatformElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              platformPageRoute(
                  context: context,
                  builder: (_) => const SocialMediaOnboarding()),
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
              child: Icon(color: Colors.black,
                PlatformIcons(context).forward),              
            )
      ]),
    ));
  }
}
