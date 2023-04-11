import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DisplayCode extends StatelessWidget{

  late List<dynamic> groupName;
  late List<dynamic> nameId;

  DisplayCode(this.groupName, this.nameId, {super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(child: PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText("Code Options")),
      body: buildList(groupName, nameId),
    ));
  }
}

ListView buildList(List<dynamic> groupName, List<dynamic> nameId){
  PlatformText("You can copy Group Codes below to share with other members!");
  return ListView.builder(
    itemCount: nameId.length,
    scrollDirection: Axis.vertical,
    addAutomaticKeepAlives: true,
    itemBuilder: (_, index){
      return ListTile (
        autofocus: true,
        //leading: Icon(groupIcon.elementAt(index)),  -> to be added after
        title: PlatformText(groupName.elementAt(index)),
        subtitle: PlatformText("Copy code here -> ${nameId.elementAt(index)}"),
      );
    },
  );
}


