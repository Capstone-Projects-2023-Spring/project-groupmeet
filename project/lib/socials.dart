import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupmeet/theme.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key, required this.databaseReference});

  final DatabaseReference databaseReference;

  @override
  State<SocialMedia> createState() => SocialMediaState();
}

class SocialMediaState extends State<SocialMedia> {
  late DatabaseReference databaseReference;
  late bool instaSelect;
  late bool fbSelect;
  late bool discordSelect;
  late bool messagesSelect;
  late bool snapSelect;

  late String instaHandle;
  late String fbHandle;
  late String discordHandle;
  late String messagesHandle;
  late String snapHandle;

  final TextEditingController _instaHandleController = TextEditingController();
  final TextEditingController _fbHandleController = TextEditingController();
  final TextEditingController _discordHandleController = TextEditingController();
  final TextEditingController _messagesHandleController = TextEditingController();
  final TextEditingController _snapHandleController = TextEditingController();


  @override
  void initState() {
    super.initState();
    instaSelect = false;
    fbSelect = false;
    discordSelect = false;
    messagesSelect = false;
    snapSelect = false;

    instaHandle = "";
    fbHandle = "";
    discordHandle = "";
    messagesHandle = "";
    snapHandle = "";

    getData();

    String temp = FirebaseAuth.instance.currentUser?.uid ?? "";
    databaseReference = FirebaseDatabase.instance.ref("users/$temp");
  }

  void getData() async {
    DataSnapshot snapshot =
        await widget.databaseReference.once().then((event) => event.snapshot);

    if (snapshot.value != null) {
      Map<dynamic, dynamic>? data = snapshot.value as Map?;

      setState(() {
        instaSelect = data!['instagram'] ?? false;
        fbSelect = data['facebook'] ?? false;
        discordSelect = data['discord'] ?? false;
        messagesSelect = data['messages'] ?? false;
        snapSelect = data['snapchat'] ?? false;

        instaHandle = data['instagram_name'];
        fbHandle = data['facebook_name'];
        discordHandle = data['discord_name'];
        messagesHandle = data['messages_name'];
        snapHandle = data['snapchat_name'];
      });
    }
  }

  void saveChanges() async {
    // DataSnapshot snapshot =
    //   await widget.databaseReference.once().then((event) => event.snapshot);
    //
    // if (snapshot.value != null) {
    //   Map<dynamic, dynamic>? data = snapshot.value as Map?;
    //
    //   setState(() {
    //     data!['instagram_name'] = _instaHandleController.text.trim();
    //     data!['facebook_name'] = _fbHandleController.text.trim();
    //     data!['discord_name'] = _discordHandleController.text.trim();
    //     data!['messsages_name'] = _messagesHandleController.text.trim();
    //     data!['snapchat_name'] = _snapHandleController.text.trim();
    //   });
    // }

    DatabaseEvent event = await widget.databaseReference.once();

    var email = event.snapshot.child("email").value.toString();
    var fName = event.snapshot.child("firstName").value.toString();
    var lName = event.snapshot.child("lastName").value.toString();
    var discord = event.snapshot.child("discord").value;
    var facebook = event.snapshot.child("facebook").value;
    var instagram = event.snapshot.child("instagram").value;
    var messages = event.snapshot.child("messages").value;
    var snapchat = event.snapshot.child("snapchat").value;
    var groups = event.snapshot.child("groupIds").value;

    databaseReference.set({
      "email": email,
      "firstName": fName,
      "lastName": lName,
      "discord": discord,
      "facebook": facebook,
      "instagram": instagram,
      "messages": messages,
      "snapchat": snapchat,
      "groupIds": groups,

      "instagram_name": _instaHandleController.text.trim(),
      "facebook_name": _fbHandleController.text.trim(),
      "discord_name": _discordHandleController.text.trim(),
      "messages_name": _messagesHandleController.text.trim(),
      "snapchat_name": _snapHandleController.text.trim(),
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return
        // PlatformScaffold(
        // body:
        // removed the scaffold to reuse with the account creation onboarding
        // consider using the social media component within another settings page
        // otherwise put the scaffold back and use the same code twice for socialMediaOnboarding ?
        Material(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CheckboxListTile(
            tileColor: roundBlack,
            title: PlatformText('Instagram @'),
            secondary: const Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"),
              height: 30,
              width: 30,
            ),
            subtitle: PlatformTextFormField(
              controller: _instaHandleController..text = instaHandle,
            ),
            value: instaSelect,
            onChanged: (value) {
              setState(() {
                instaSelect = value!;
                databaseReference.update({
                  "instagram": instaSelect,
                });
              });
            },
          ),
          CheckboxListTile(
            tileColor: roundBlack,
            title: const Text('Facebook @'),
            secondary: const Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png"),
              height: 30,
              width: 30,
            ),
            subtitle: PlatformTextFormField(
              controller: _fbHandleController..text = fbHandle,
            ),
            value: fbSelect,
            onChanged: (value) {
              setState(() {
                fbSelect = value!;
                databaseReference.update({
                  "facebook": fbSelect,
                });
              });
            },
          ),
          CheckboxListTile(
            tileColor: roundBlack,
            title: const Text('Discord @'),
            secondary: const Image(
              image: NetworkImage(
                  "https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png"),
              height: 30,
              width: 30,
            ),
            subtitle: PlatformTextFormField(
              controller: _discordHandleController..text = discordHandle,
            ),
            value: discordSelect,
            onChanged: (value) {
              setState(() {
                discordSelect = value!;
                databaseReference.update({
                  "discord": discordSelect,
                });
              });
            },
          ),
          CheckboxListTile(
            tileColor: roundBlack,
            title: const Text('Messages @'),
            secondary: const Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IMessage_logo.svg/2048px-IMessage_logo.svg.png"),
              height: 30,
              width: 30,
            ),
            subtitle: PlatformTextFormField(
              controller: _messagesHandleController..text = messagesHandle,
            ),
            value: messagesSelect,
            onChanged: (value) {
              setState(() {
                messagesSelect = value!;
                databaseReference.update({
                  "messages": messagesSelect,
                });
              });
            },
          ),
          CheckboxListTile(
            tileColor: roundBlack,
            title: const Text('SnapChat @'),
            secondary: const Image(
              image: NetworkImage(
                  "https://assets.stickpng.com/images/580b57fcd9996e24bc43c536.png"),
              height: 30,
              width: 30,
            ),
            subtitle: PlatformTextFormField(
              controller: _snapHandleController..text = snapHandle,
            ),
            value: snapSelect,
            onChanged: (value) {
              setState(() {
                snapSelect = value!;
                databaseReference.update({
                  "snapchat": snapSelect,
                });
              });
            },
          ),
          PlatformElevatedButton(
            onPressed: saveChanges,
            child: PlatformText("Save Changes"),
          ),
        ],
      ),
    ));

  }
}
