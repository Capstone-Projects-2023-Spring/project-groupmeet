import 'package:flutter/material.dart';
import 'package:groupmeet/code_sharing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'account_info.dart';
import 'create_account.dart';
import 'group_creation.dart';
import 'code_reception.dart';
import 'group_home.dart';

// Initialize the app and run it.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// The main app widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build the app widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // text on other pages are not visible with these uncommented with dark text on dark
        // uncomment when UI of other pages are changed?
        // scaffoldBackgroundColor: const Color(0x000000),
        // textTheme: Typography.whiteHelsinki,
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: const MyHomePage(title: 'GroupMeet'),
    );
  }
}

// The home page widget for the app.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // The home page widget for the app.
  final String title;

  // Create a state object for the home page widget.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Reference to the database for login.
  late DatabaseReference ref;

  // Controller to see email information.
  final _emailCont = TextEditingController();

  // Controller to see password information.
  final _passwordCont = TextEditingController();

  // String containing id to access database.
  String? uid;

  // Asynchronous method using Firebase framework to authenticate a user using their email and password.
  Future<void> login() async {
    try {
      print("logging in");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCont.text.trim(),
        password: _passwordCont.text.trim(),
      );
      print(credential);
      _emailCont.dispose();
      _passwordCont.dispose();

      // not doing anything with it while logging in right now

      // Store the current user's id.
      uid = FirebaseAuth.instance.currentUser?.uid;

      // Store a reference to the current user's information in the database.
      ref = FirebaseDatabase.instance.ref("users/$uid");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // Asynchronous method to log the user out of their account.
  Future<void> logout() async {
    print("logging out");
    await FirebaseAuth.instance.signOut();
  }

  // Build the home page widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const Image(
          //   image: NetworkImage(
          //       "https://cdn.pixabay.com/photo/2016/09/09/23/27/the-ostrich-1658267_960_720.jpg"),
          // ),
          Column(
            children: <Widget>[
              TextField(
                  controller: _emailCont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                  )),
              TextField(
                controller: _passwordCont,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: const Text("Logout")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Account creation"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateAccount(title: "Create Account")),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("My Account"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AccountInfo(title: "My Account", ref: ref)),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Group creation"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GroupCreation()),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("Join a Group"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CodeReception(title: "Join a Group")),
                      );
                    },
                    icon: const Icon(Icons.create),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("Code Sharing Page"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CodeSharing(title: "Code Sharing")),
                      );
                    },
                    icon: const Icon(Icons.qr_code),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("Main Group Page (TEMPORARY BUTTON)"),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GroupHomePage(title: "Main Group Page")),
                      );
                    },
                    icon: const Icon(Icons.cabin),
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
