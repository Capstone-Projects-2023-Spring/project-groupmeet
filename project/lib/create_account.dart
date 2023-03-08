import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.title});

  final String title;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  late DatabaseReference ref;
  String? uid;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _creatingProfile = false;

  void createUserProfile(BuildContext context) {
    setState(() {
      _creatingProfile = true;
    });

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        )
        .then((authResult) {
          uid = authResult.user?.uid;
          ref = FirebaseDatabase.instance.ref("users/$uid");
          ref.set({
            "email": _emailController.text.trim(),
            "firstName": _fnameController.text.trim(),
            "lastName": _lnameController.text.trim(),
          });
          setState(() {
            _creatingProfile = false;
          });
          _emailController.dispose();
          _passwordController.dispose();
          Navigator.of(context).pop();
        })
        .catchError((e) {
          setState(() {
            _creatingProfile = false;
          });
          if (e is FirebaseAuthException) {
            if (e.code == 'weak-password') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The password provided is too weak.'),
                  duration: Duration(seconds: 5),
                ),
              );
            } else if (e.code == 'email-already-in-use') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('The account already exists for that email.'),
                  duration: Duration(seconds: 5),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occurred: $e'),
                duration: const Duration(seconds: 5),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
                controller: _fnameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First Name",
                )),
            TextField(
                controller: _lnameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last Name",
                )),
            TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                )),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: _creatingProfile ? null : () => createUserProfile(context),
                child: _creatingProfile
                    ? const CircularProgressIndicator()
                    : const Text("Create Account")),
          ],
        ),
      ),
    );
  }
}
