import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//New Pull Request

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {
  late TextEditingController group_id;
  final GlobalKey _key = GlobalKey();
  Barcode? _scannedCode;

  void getQR(QRViewController qrcontroller){
    qrcontroller.scannedDataStream.listen((event) {
      setState(() {
        _scannedCode = event;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    group_id = TextEditingController();
  }

  @override
  void dispose() {
    group_id.dispose();
    super.dispose();
  }

  String _data = "";
  final String _hash = DateTime.now().toString().hashCode.toString();
  String keep = "";
  int one = 0;

  Future openDialog() =>
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Enter Group Code Below'),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: 'Enter here......'),
                  controller: group_id,
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

  void updateDatabase () async {
    int count = 0;
    int count_2 = 0;
    String? user_ex = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groups').get();
    DatabaseReference ref2 = FirebaseDatabase.instance.ref("groups/${group_id.text}");
    final snapshot2 = await ref2.child('name').get();
    DatabaseReference userRef = FirebaseDatabase.instance.ref("users/$user_ex/groupIds");
    DatabaseReference userRef2 = FirebaseDatabase.instance.ref("groups/${group_id.text}/members");
    Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
    if (snapshot.key != null) {
      for (var keys in type.entries) {
        if (keys.key.toString().contains(group_id.text) && group_id.text.isNotEmpty) {
          count = 1;
          final snapshot1 = await ref.child('users/$user_ex/groupIds').get();
          if (snapshot1.exists) {
            Map<dynamic, dynamic> type1 = snapshot1.value as Map<dynamic, dynamic>;
            for (var keys2 in type1.entries) {
              count_2++;
              if (keys2.key.toString().contains(group_id.text)) {
                Fluttertoast.showToast(
                    msg: "You have already joined this group. Please enter another Code.",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 4,
                    backgroundColor: Colors.grey,
                    fontSize: 15);
                break;
              }
              else {
                if (type1.entries.length == count_2){
                  Fluttertoast.showToast(
                      msg: "Adding to group ${snapshot2.value} ....",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 4,
                      backgroundColor: Colors.grey,
                      fontSize: 15);
                  userRef.update({group_id.text: true});
                  userRef2.update({user_ex: true});
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
          }
          else {
            userRef.update({group_id.text: true});
            userRef2.update({user_ex: true});
            Fluttertoast.showToast(msg: "You've now been added to the group -> ${snapshot2.value}!",
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
      if (count.isEven){
        //We're gonna write
        Fluttertoast.showToast(msg: "The codes assigned doesn't match any groups that exit. Please try again!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.grey,
            fontSize: 15);
        Navigator.of(context).pop(false);
      }
    }
    else {
      Fluttertoast.showToast(msg: "No groups exist! Please create a new group!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.grey,
          fontSize: 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PlatformScaffold(
      appBar: PlatformAppBar(title: PlatformText("Joining Group Options")),
      body: Column(
        children: [
          if (one == 1 )
            Center(
              child: QrImage(
                data: _data,
                version: QrVersions.auto,
                size: 370,
                foregroundColor: Colors.white,
              ),
            ),
          if (one == 2 )
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
            child: (_scannedCode != null) ? Text('${_scannedCode!.code}') : const Text(""),
          ),
          TextButton(
            onPressed: openDialog,
            child: Text('Join Group Via Code'),),
          PlatformTextButton(onPressed: (){

            setState(() {
              _data = "GM${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}$_hash";
              keep = _data;
              one = 1;
            });
          },child :
              PlatformText("Get QR Code",
                  textAlign: TextAlign.center)
          ),
          PlatformTextButton(onPressed: () async{
            setState(() {
              one = 2;
            });
          }, child:
              PlatformText("Scan QR Code")),
          ],
      ),
    ));
  }
}