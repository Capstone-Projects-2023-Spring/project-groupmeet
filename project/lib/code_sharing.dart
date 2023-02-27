import 'package:flutter/material.dart';

class CodeSharing extends StatefulWidget {
  const CodeSharing({super.key, required this.title});

  final String title;

  @override
  State<CodeSharing> createState() => _CodeSharingState();
}

class _CodeSharingState extends State<CodeSharing> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(size: 250, Icons.qr_code_2),
            const Text("Random Code Placeholder"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Link Here"),
                IconButton(
                    onPressed: () {
                      print("generate code");
                    },
                    icon: const Icon(size: 30, Icons.content_copy_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
// Page that displays QR code link, random code, and copy link button



