import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NewQR extends StatelessWidget {

  bool scanning = false;

  void scanQR(BuildContext context) async {

    if (scanning) {
      return;
    }

    scanning = true;

    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#FFFFFF",
          "Cancel",
          true,
          ScanMode.QR).whenComplete(() => Navigator.of(context).pop());

      updateDatabase(barcodeScanRes);
      print(barcodeScanRes);

    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    scanQR(context);

    return PlatformScaffold(
      body: Container()
    );
  }

  // Jerrell
  void updateDatabase(groupID) async {
    int count = 0;
    int count_2 = 0;
    String? userEx = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groups').get();
    DatabaseReference ref2 =
    FirebaseDatabase.instance.ref("groups/${groupID}");
    // final snapshot2 = await ref2.child('name').get();
    DatabaseReference userRef = FirebaseDatabase.instance.ref(
        "users/$userEx/groupIds");
    DatabaseReference userRef2 =
    FirebaseDatabase.instance.ref("groups/${groupID}/members");
    Map<dynamic, dynamic> type = snapshot.value as Map<dynamic, dynamic>;
    if (snapshot.key != null) {
      for (var keys in type.entries) {
        if (keys.key.toString().contains(groupID) &&
            groupID.isNotEmpty) {
          count = 1;
          final snapshot1 = await ref.child('users/$userEx/groupIds').get();
          if (snapshot1.exists) {
            Map<dynamic, dynamic> type1 = snapshot1.value as Map<
                dynamic,
                dynamic>;
            for (var keys2 in type1.entries) {
              count_2++;
              if (keys2.key.toString().contains(groupID)) {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have already joined this group. Please enter another Code.")));
                break;
              } else {
                if (type1.entries.length == count_2) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Adding to group ${snapshot2.value} ....")));
                  userRef.update({groupID: true});
                  userRef2.update({userEx: true});
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You're now added to ${snapshot2.value}!")));
                  // Navigator.of(context).pop(false);
                  break;
                }
              }
            }
          } else {
            userRef.update({groupID: true});
            userRef2.update({userEx: true});
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You've now been added to the group -> ${snapshot2
            //     .value}!")));
            // Navigator.of(context).pop(false);
            break;
          }
        }
      }
      if (count.isEven) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The codes assigned doesn't match any groups that exit. Please try again!")));
        // Navigator.of(context).pop(false);
      }
    }
    else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No groups exist! Please create a new group!")));
    }
  }

}