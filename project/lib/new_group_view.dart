import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:groupmeet/theme.dart';

class NewGroupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double barWidth = screenWidth - 48 - 16 - 16 - 16 - 32;

    return PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText("Group Name")),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            child: Padding(padding: EdgeInsets.fromLTRB(32, 32, 0, 16),
                child: PlatformText("Round Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)
            ),
          ),
          Container(width: screenWidth - 32,
            height: (screenWidth - 32) * (2.6/5),
            decoration: BoxDecoration(
              color: roundPurple,
              borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
              border: Border.all(color: roundPurple)
            ),
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      PlatformText("April", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: roundPurple, height: 1.3),),
                      PlatformText("14", style: TextStyle(fontSize: 96, fontWeight: FontWeight.w900, color: roundPurple, height: 1.0)),
                      PlatformText("3:30 PM", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: roundPurple, height: 0.8)),
                    ],
                  ),
                  width: (screenWidth - 64) * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                      border: Border.all(color: Colors.white)
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlatformText("7 Available", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      PlatformText("Jared Stefanowicz", style: TextStyle(fontSize: 16,)),
                      PlatformText("Adam Smith", style: TextStyle(fontSize: 16)),
                      PlatformText("Ding Liren", style: TextStyle(fontSize: 16)),
                      PlatformText("+4 Others", style: TextStyle(fontSize: 16,)),
                    ],
                  ),
                  width: (screenWidth - 64) * 0.475,
                )
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
            // TODO: Corner Radius
            child: Container(
              width: screenWidth - 64,
              child: PlatformTextButton(child:
              PlatformText("Request Another Time", style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              ),
                  color: roundPurple,
                  onPressed: () => print("test"),
              ),
            ),
          ),
          Container(
            width: screenWidth,
            child: Padding(padding: EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: PlatformText("Round Table", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), textAlign: TextAlign.left,)
            ),
          ),
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        // TODO: Image, Two Bars Overlayed?, Label
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: SizedBox(child: Image.asset("images/smsApp.png"), width: 48, height: 48,),),
                        Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                          border: Border.all(color: Colors.white),
                        ),
                          child: Align(
                            // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                            // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                            // Push to later sprint if possible
                            child: Container(width: barWidth * (7/7), height: 32,
                                decoration: BoxDecoration(
                                  color: roundPurple,
                                  borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                                  border: Border.all(color: roundPurple),
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText("7", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
                      ],
                    ),
                    SizedBox(width: screenWidth, height: 16,)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // TODO: Image, Two Bars Overlayed?, Label
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: SizedBox(child: Image.asset("images/snapchatApp.png"), width: 48, height: 48,),),
                        Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                          border: Border.all(color: Colors.white),
                        ),
                          child: Align(
                            // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                            // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                            // Push to later sprint if possible
                            child: Container(width: barWidth * (5/7), height: 32,
                                decoration: BoxDecoration(
                                  color: roundPurple,
                                  borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                                  border: Border.all(color: roundPurple),
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText("5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
                      ],
                    ),
                    SizedBox(width: screenWidth, height: 16,)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // TODO: Image, Two Bars Overlayed?, Label
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: SizedBox(child: Image.asset("images/discordApp.png"), width: 48, height: 48,),),
                        Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                          border: Border.all(color: Colors.white),
                        ),
                          child: Align(
                            // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                            // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                            // Push to later sprint if possible
                            child: Container(width: barWidth * (3/7), height: 32,
                                decoration: BoxDecoration(
                                  color: roundPurple,
                                  borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                                  border: Border.all(color: roundPurple),
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText("3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
                      ],
                    ),
                    SizedBox(width: screenWidth, height: 16,)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // TODO: Image, Two Bars Overlayed?, Label
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: SizedBox(child: Image.asset("images/instagramApp.png"), width: 48, height: 48,),),
                        Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                          border: Border.all(color: Colors.white),
                        ),
                          child: Align(
                            // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                            // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                            // Push to later sprint if possible
                            child: Container(width: barWidth * (3/7), height: 32,
                                decoration: BoxDecoration(
                                  color: roundPurple,
                                  borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                                  border: Border.all(color: roundPurple),
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText("3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
                      ],
                    ),
                    SizedBox(width: screenWidth, height: 16,)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // TODO: Image, Two Bars Overlayed?, Label
                        Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0), child: SizedBox(child: Image.asset("images/facebookApp.png"), width: 48, height: 48,),),
                        Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), width: barWidth, height: 32, decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.elliptical(48, 48)),
                          border: Border.all(color: Colors.white),
                        ),
                          child: Align(
                            // FIXME / WONTFIX: Known issue - Inside Bar UI will clip beyond bounds for small fractions
                            // Ex: 1/24. Not fixing bc it is unlikely to happen in practice (groups aren't that large)
                            // Push to later sprint if possible
                            child: Container(width: barWidth * (1/7), height: 32,
                                decoration: BoxDecoration(
                                  color: roundPurple,
                                  borderRadius: BorderRadius.all(Radius.elliptical(200000, 200000)),
                                  border: Border.all(color: roundPurple),
                                )),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0), child: PlatformText("1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),)
                      ],
                    ),
                    SizedBox(width: screenWidth, height: 16,)
                  ],
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}