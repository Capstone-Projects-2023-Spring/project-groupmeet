import 'package:flutter/material.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key, required this.title});

  final String title;

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {

  bool instaSelect = false;
  bool fbSelect = false;
  bool discordSelect = false;
  bool messagesSelect = false;
  bool snapSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
              CheckboxListTile(
                title: Text('Instagram'),
                secondary: const Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"
                  ),
                  height: 30,
                  width: 30,
                ),
                value: instaSelect,
                onChanged: (value) {
                  setState(() {
                    instaSelect = value!;
                  });
                },
              ),

            CheckboxListTile(
              title: Text('Facebook'),
              secondary: const Image(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png"
                ),
                height: 30,
                width: 30,
              ),
              value: fbSelect,
              onChanged: (value) {
                setState(() {
                  fbSelect = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text('Discord'),
              secondary: const Image(
                image: NetworkImage(
                    "https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png"
                ),
                height: 30,
                width: 30,
              ),
              value: discordSelect,
              onChanged: (value) {
                setState(() {
                  discordSelect = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text('Messages'),
              secondary: const Image(
                image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IMessage_logo.svg/2048px-IMessage_logo.svg.png"
                ),
                height: 30,
                width: 30,
              ),
              value: messagesSelect,
              onChanged: (value) {
                setState(() {
                  messagesSelect = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text('SnapChat'),
              secondary: const Image(
                image: NetworkImage(
                    "https://assets.stickpng.com/images/580b57fcd9996e24bc43c536.png"
                ),
                height: 30,
                width: 30,
              ),
              value: snapSelect,
              onChanged: (value) {
                setState(() {
                  snapSelect = value!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}