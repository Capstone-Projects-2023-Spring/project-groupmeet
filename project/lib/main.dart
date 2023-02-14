// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'account_info.dart';
import 'create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        platform: TargetPlatform.iOS,
      ),
      home: const MyHomePage(title: 'GroupMeet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  late DatabaseReference ref;

  final _emailCont = TextEditingController();
  final _passwordCont = TextEditingController();

  String? uid;

  Future<void> login() async {
    try {
      print('inside Login');
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCont.text.trim(),
        password: _passwordCont.text.trim(),
      );
      _emailCont.dispose();
      _passwordCont.dispose();

      // this is the path that each user's information is stored at
      // not doing anything with it while logging in right now
      uid = FirebaseAuth.instance.currentUser?.uid;
      ref = FirebaseDatabase.instance.ref("users/$uid");
    

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    print("logging out");
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/09/09/23/27/the-ostrich-1658267_960_720.jpg"),
            ),
            Container(
              child: Column(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Account creation"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount(
                                    title: "Create Account")),
                          );
                        },
                        icon: Icon(Icons.create),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text("My Account"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AccountInfo(title: "My Account")),
                          );
                        },
                        icon: Icon(Icons.create),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
