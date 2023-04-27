import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {
  late TextEditingController groupId;

  @override
  void initState() {
    super.initState();
    groupId = TextEditingController();
  }

  @override
  void dispose() {
    groupId.dispose();
    super.dispose();
  }

  int one = 0;

  Future openDialog() =>
      showPlatformDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: const Text('Enter Group Code Below'),
                content: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: 'Enter here......'),
                  controller: groupId,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("Cancel")
                  ),
                  TextButton(
                    //updatesDatabase use for onPressed
                      onPressed: updateDatabase,
                      child: const Text('Join Group')),
                ],

              ));

  //Connect with the move of QR code


  void updateDatabase() async {
    int count = 0;
    int count_2 = 0;
    String? userEx = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groups').get();
    DatabaseReference ref2 =
    FirebaseDatabase.instance.ref("groups/${groupId.text}");
    final snapshot2 = await ref2.child('name').get();
    DatabaseReference userRef = FirebaseDatabase.instance.ref(
        "users/$userEx/groupIds");
    DatabaseReference userRef2 =
    FirebaseDatabase.instance.ref("groups/${groupId.text}/members");
    Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
    if (snapshot.key != null) {
      for (var keys in type.entries) {
        if (keys.key.toString().contains(groupId.text) &&
            groupId.text.isNotEmpty) {
          count = 1;
          final snapshot1 = await ref.child('users/$userEx/groupIds').get();
          if (snapshot1.exists) {
            Map<dynamic, dynamic> type1 = snapshot1.value as Map<
                dynamic,
                dynamic>;
            for (var keys2 in type1.entries) {
              count_2++;
              if (keys2.key.toString().contains(groupId.text)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have already joined this group. Please enter another Code.")));
                break;
              } else {
                if (type1.entries.length == count_2) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Adding to group ${snapshot2.value} ....")));
                  userRef.update({groupId.text: true});
                  userRef2.update({userEx: true});
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You're now added to ${snapshot2.value}!")));
                  Navigator.of(context).pop(false);
                  break;
                }
              }
            }
          } else {
            userRef.update({groupId.text: true});
            userRef2.update({userEx: true});
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You've now been added to the group -> ${snapshot2
                .value}!")));
            Navigator.of(context).pop(false);
            break;
          }
        }
      }
      if (count.isEven) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The codes assigned doesn't match any groups that exit. Please try again!")));
        Navigator.of(context).pop(false);
      }
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No groups exist! Please create a new group!")));
    }
  }

  void camScanner() async {
    // get the app to ask for permissions and get the barcode to show and then link to updateDatabase()
    try {
      var id_ob = (await FlutterBarcodeScanner.scanBarcode(
          "#513BDB", 'Cancel', true,
          ScanMode.QR));
      groupId.text = id_ob;
      updateDatabase();
    } on PlatformException {
       print("Failed to scan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PlatformScaffold(
        appBar: PlatformAppBar(title: PlatformText("Joining Group Options"),),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformTextButton(
              onPressed: openDialog,
              child:
              PlatformText('Join Group Via Code'),),
            PlatformTextButton(
                onPressed: camScanner,
                child: PlatformText("Scan QR Code"),),
          ],
        ),
        ),
      ));
  }
}
