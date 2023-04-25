import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Display extends StatelessWidget{

  final String groupName;
  final String nameId;

  Display(this.groupName, this.nameId);


  @override

  Widget build(BuildContext context){
    return SafeArea(child: PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText(groupName)),
      body:
          RepaintBoundary(
        child: Center(
            child:
            QrImage(
              data: nameId,
              size: 300,
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
          )
        )
          ),
      ));
    }
  }