import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GroupHomePage extends StatefulWidget {
  const GroupHomePage({super.key, required this.title, required this.ref, required this.uid});

  final String title;  
  final DatabaseReference ref;
  final String? uid;
  @override
  State<GroupHomePage> createState() => _GroupHomePageState();
}

class _GroupHomePageState extends State<GroupHomePage> {



Future<void> temporaryAddGroupListsToUser() async {
  // "users/uid/"
  await widget.ref.update({"groupIds": {"TEMPORARY": true, "-NPJzVjHIDD3NYQndB_Y":true, "-NPFpbZZsn3ocVTFD-8H":true }});
}

  @override
  Widget build(BuildContext context) {
    // grabGroupMembers();
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
                    height: 200, 
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
                        child: Text('View Calendar', style: TextStyle(fontSize: 20)),
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
                        child: Text('Edit Availabilities', style: TextStyle(fontSize: 20)),
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
                          child: Text('Suggest New Meeting Time', style: TextStyle(fontSize: 25)),
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
                        child: Text('Cancel Active Meeting', style: TextStyle(fontSize: 25)),
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
                        child: Text('Edit Members'),
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
                        child: Text('Leave Group'),
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
