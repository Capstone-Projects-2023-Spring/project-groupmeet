import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia(
      {super.key, required this.databaseReference, required this.title});

  final String title;
  final DatabaseReference databaseReference;

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  late DatabaseReference databaseReference;
  late bool instaSelect;
  late bool fbSelect;
  late bool discordSelect;
  late bool messagesSelect;
  late bool snapSelect;

  @override
  void initState() {
    super.initState();
    instaSelect = false;
    fbSelect = false;
    discordSelect = false;
    messagesSelect = false;
    snapSelect = false;
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
      });
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
          children: <Widget>[

            CheckboxListTile(
              title: PlatformText('Instagram'),
              secondary: const Image(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"),
                height: 30,
                width: 30,
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
              title: const Text('Facebook'),
              secondary: const Image(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png"),
                height: 30,
                width: 30,
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
              title: const Text('Discord'),
              secondary: const Image(
                image: NetworkImage(
                    "https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png"),
                height: 30,
                width: 30,
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
              title: const Text('Messages'),
              secondary: const Image(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IMessage_logo.svg/2048px-IMessage_logo.svg.png"),
                height: 30,
                width: 30,
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
              title: const Text('SnapChat'),
              secondary: const Image(
                image: NetworkImage(
                    "https://assets.stickpng.com/images/580b57fcd9996e24bc43c536.png"),
                height: 30,
                width: 30,
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
          ],
        ),
      ),
    );
  }
}
