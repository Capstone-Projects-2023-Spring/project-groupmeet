import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'create_account.dart';

class RoundIntro extends StatefulWidget {
  const RoundIntro({super.key});

  @override
  State<RoundIntro> createState() => _RoundIntroState();
}



class _RoundIntroState extends State<RoundIntro> {
  @override
  Widget build(BuildContext context) {
    var firstPage = Column(          
          children: [
             Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 20),
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
              child: Text(
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  "Round"),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(100, 0,100, 200),            
            child:  Text(
              "A single platform to organize and capture meeting-based team communication",
              textAlign: TextAlign.center,
            ),),
            PlatformElevatedButton(
               onPressed: () {
                Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (_) =>                        
                        const CreateAccount(),
                  ),
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
          ]);


    return PlatformScaffold(      
        body: 
        firstPage
        
        );
  }
}
