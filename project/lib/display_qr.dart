import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Display extends StatelessWidget{

  late List<dynamic> groupName;
  late List<dynamic> nameId;

  Display(this.groupName, this.nameId, {super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(child: PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText("QR Options")),
      body: buildList(groupName, nameId),
      ));
    }
  }

  ListView buildList(List<dynamic> groupName, List<dynamic> nameId){
    return ListView.builder(
      itemCount: nameId.length,
      scrollDirection: Axis.vertical,
      addAutomaticKeepAlives: true,
      itemBuilder: (_, index){
        return ListTile (
            autofocus: true,
            title: Center(child: QrImage(
              data: nameId.elementAt(index),
              version: QrVersions.auto,
              size: 300,
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            )),
            subtitle: PlatformText(groupName.elementAt(index)),

        );
      },
    );
  }


