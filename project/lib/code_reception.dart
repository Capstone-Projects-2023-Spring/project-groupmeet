import 'package:flutter/material.dart';

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                width: 200,
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Input Code",
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Scan QR Code (Open Camera)"),
                  IconButton(
                      onPressed: () {
                        print("Test");
                        // Open camera functionality
                      },
                      icon: const Icon(size: 30, Icons.content_copy_rounded)
                  ),
                ],
              ),
            ],
          ),
        ],

      ),
    );
  }
}
