import 'package:flutter/material.dart';

class GroupHomePage extends StatefulWidget {
  const GroupHomePage({super.key, required this.title});

  final String title;

  @override
  State<GroupHomePage> createState() => _GroupHomePageState();
}

class _GroupHomePageState extends State<GroupHomePage> {

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
              const Text.rich(
                TextSpan(
                  text: "Insert Project Title Here", // Import Group Title
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              const Image(
                image: NetworkImage( // TEMPORARY IMAGE, SHOW STATIC CALENDAR HERE
                    "https://cdn.discordapp.com/attachments/979937535272816703/1079918387339206886/image.png"),
                    width: 400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          print("Test");
                        },
                        child: const Text('View Calendar', style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          print("Test");
                        },
                        child: const Text('Edit Availabilities', style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            print("Test");
                          },
                          child: const Text('Suggest New Meeting Time', style: TextStyle(fontSize: 25)),
                        ),
                      ],
                    ),
                  ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          print("Test");
                        },
                        child: const Text('Cancel Active Meeting', style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          print("Test");
                        },
                        child: const Text('Edit Members'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {
                          print("Test");
                        },
                        child: const Text('Leave Group'),
                      ),
                    ],
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
