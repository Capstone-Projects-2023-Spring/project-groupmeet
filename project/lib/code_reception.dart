import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:groupmeet/qr_overlay.dart';

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {
  late TextEditingController groupId;
  MobileScannerController cameraController = MobileScannerController();

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
                  decoration: const InputDecoration(hintText: 'Enter here......'),
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
                Fluttertoast.showToast(
                    msg: "You have already joined this group. Please enter another Code.",
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
                msg: "You've now been added to the group -> ${snapshot2.value}!",
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
            msg: "The codes assigned doesn't match any groups that exit. Please try again!",
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

  void camScanner() async {
    // get the app to ask for permissions and get the barcode to show and then link to updateDatabase()
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      IconButton(
          color: Colors.white,
          icon: const Icon(size: 20, IconData(0xef26, fontFamily: 'MaterialIcons')),
          onPressed: () => cameraController.switchCamera());
      Stack(children:[
      MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.front,
          torchEnabled: true,),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            groupId = barcode.rawValue as TextEditingController;
            updateDatabase();
          }
        },
      ),
      QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
    ]);
    }
    else if (status.isDenied && !status.isPermanentlyDenied) {
      Fluttertoast.showToast(msg: "Permissions Needed to Use Feature! Accept Camera Permissions.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.grey,
          fontSize: 15);
      status = await Permission.camera.request();
    }
    else {
      Fluttertoast.showToast(msg: "Please Go to Settings and Allow Permissions For Camera For This App.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.grey,
          fontSize: 15);
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PlatformScaffold(
        appBar: PlatformAppBar(title: PlatformText("Joining Group Options"),),
        body: Column(
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
      ));
  }
}
