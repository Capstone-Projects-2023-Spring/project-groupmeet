import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groupmeet/DisplayQr.dart';

class CodeSharing extends StatefulWidget {
  const CodeSharing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CodeSharing> createState() => _CodeSharingState();
}

Future<DataSnapshot> _grabGroupId() async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
  final snapshot = await ref.child('groupId').get();
  return snapshot;
}

class _CodeSharingState extends State<CodeSharing> {

  void getQr() async {
    List <dynamic> groupName = [];
    List <dynamic> name_id = [];
    String? user_ex = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("users/$user_ex/groupIds").get();
    if (snapshot.exists) {
      //Get groupsIds then send search for groupname
      Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
      for (var keys in type.entries) {
        //call to ref is a single instance where it doesn't loop. Figure it out.
        final snapshot2 = await ref.child("groups/${keys.key.toString()}/name")
            .get();
        groupName.add(snapshot2.value);
        name_id.add(keys.key);
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => Display(groupName, name_id)));
    }
    else {
      Fluttertoast.showToast(
          msg: "You are not apart of any groups! Please create one or add yourself to one",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.grey,
          fontSize: 15);
      Navigator.of(context).pop(false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(size: 30, PlatformIcons(context).shareSolid),
            FutureBuilder<DataSnapshot>(
              future: _grabGroupId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return PlatformCircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return PlatformText('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return PlatformText('No data available');
                }
                String? groupId = snapshot.data!.value.toString();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlatformText("Join Group: $groupId"),
                    PlatformIconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: PlatformText('Join Group Button'),
                            duration: const Duration(seconds: 5),
                          ),
                        );
                      },
                      icon: Icon(size: 30, PlatformIcons(context).share),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformText("Link Here"),
                PlatformIconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Link Here Button'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  },
                  icon: Icon(size: 30, PlatformIcons(context).share),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformText("Get QR Code(s) Here"),
                PlatformIconButton(
                  onPressed: getQr,
                  icon: Icon(size: 30, IconData(0xe4f7, fontFamily: 'MaterialIcons')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
