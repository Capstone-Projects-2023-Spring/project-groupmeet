import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class RoundIntro extends StatefulWidget {
  const RoundIntro({super.key});

  @override
  State<RoundIntro> createState() => _RoundIntroState();
}



class _RoundIntroState extends State<RoundIntro> {
  @override
  Widget build(BuildContext context) {
    var check = Column(          
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 100, 50, 20),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(230, 81, 63, 219),
                radius: 65,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
              child: Text(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  "Round"),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(100, 30,100, 150),            
            child:  Text(
              "A single platform to organize and capture meeting-based team communication",
              textAlign: TextAlign.center,
            ),),
            PlatformElevatedButton(
              //  onPressed: ,
          material: (_, __) => MaterialElevatedButtonData(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24),
              // color?                  
  ),
                 ),
              cupertino: (_, __) => CupertinoElevatedButtonData(),
              child: Icon(PlatformIcons(context).forward),
              
            )
          ]);
    return PlatformScaffold(      
        body: 
        check
        
        );
  }
}
