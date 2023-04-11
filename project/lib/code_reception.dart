import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {
  late TextEditingController groupId;
  final GlobalKey _key = GlobalKey();
  Barcode? _scannedCode;

  void getQR(QRViewController qrcontroller) {
    qrcontroller.scannedDataStream.listen((event) {
      setState(() {
        _scannedCode = event;
      });
    });
  }

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

  String keep = "";
  int one = 0;

  Future openDialog() =>
      showPlatformDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Enter Group Code Below'),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: 'Enter here......'),
                  // Commented out bc it causes the build to fail
                  // controller: group_id,
                ),
                actions: [
                  TextButton(
                      onPressed: ()=> Navigator.of(context).pop(false),
                      child: Text("Cancel")
                  ),
                  TextButton(
                      //updatesDatabase use for onPressed
                      onPressed: updateDatabase,
                      child: Text('Join Group')),
                ],

              ));

  void updateDatabase() async {
    int count = 0;
    int count_2 = 0;
    String? userEx = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groups').get();
    DatabaseReference ref2 =
        FirebaseDatabase.instance.ref("groups/${groupId.text}");
    final snapshot2 = await ref2.child('name').get();
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref("users/$userEx/groupIds");
    DatabaseReference userRef2 =
        FirebaseDatabase.instance.ref("groups/${groupId.text}/members");

    Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
    print("here");
    if (snapshot.key != null) {
      for (var keys in type.entries) {
        if (keys.key.toString().contains(groupId.text) &&
            groupId.text.isNotEmpty) {
          count = 1;
          final snapshot1 = await ref.child('users/$userEx/groupIds').get();
          if (snapshot1.exists) {
            Map<dynamic, dynamic> type1 =
                snapshot1.value as Map<dynamic, dynamic>;
            for (var keys2 in type1.entries) {
              count_2++;
              if (keys2.key.toString().contains(groupId.text)) {
                Fluttertoast.showToast(
                    msg:
                        "You have already joined this group. Please enter another Code.",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 4,
                    backgroundColor: Colors.grey,
                    fontSize: 15);
                break;
              } else {
                if (type1.entries.length == count_2) {
                  Fluttertoast.showToast(
                      msg: "Adding to group ${snapshot2.value} ....",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 4,
                      backgroundColor: Colors.grey,
                      fontSize: 15);
                  userRef.update({groupId.text: true});
                  userRef2.update({userEx: true});
                  Fluttertoast.showToast(
                      msg: "You're now added to ${snapshot2.value}!",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 4,
                      backgroundColor: Colors.grey,
                      fontSize: 15);
                  Navigator.of(context).pop(false);
                  break;
                }
              }
            }
          } else {
            userRef.update({groupId.text: true});
            userRef2.update({userEx: true});
            Fluttertoast.showToast(
                msg:
                    "You've now been added to the group -> ${snapshot2.value}!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 4,
                backgroundColor: Colors.grey,
                fontSize: 15);
            Navigator.of(context).pop(false);
            break;
          }
        }
      }
      if (count.isEven) {
        //We're gonna write
        Fluttertoast.showToast(
            msg:
                "The codes assigned doesn't match any groups that exit. Please try again!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.grey,
            fontSize: 15);
        Navigator.of(context).pop(false);
      }
    } else {
      Fluttertoast.showToast(
          msg: "No groups exist! Please create a new group!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.grey,
          fontSize: 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText("Joining Group Options")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (one == 1)
            SizedBox(
              height: 370,
              width: 370,
              child: QRView(
                key: _key,
                onQRViewCreated: getQR,
              ),
            ),
          Center(
            //Change _scannedCode!.code to a link to the group
            child: (_scannedCode != null) ? PlatformText('${_scannedCode!.code}') : const Text(""),
          ),
          PlatformTextButton(
            onPressed: openDialog,
            child: PlatformText('Join Group Via Code'),),
          PlatformTextButton(onPressed: () async{
            setState(() {
              one = 1;
            });
          }, child:
              PlatformText("Scan QR Code")),
          ],
      ),
    ));
  }
}
