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

  Future<void> createUserProfile() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      uid = FirebaseAuth.instance.currentUser?.uid;
      ref = FirebaseDatabase.instance.ref("users/$uid");
      print("uid");
      print(uid);
      await ref.set({
        "email": _emailController.text.trim(),
        "firstName": _fnameController.text.trim(),
        "lastName": _lnameController.text.trim(),
      });

      _emailController.dispose();
      _passwordController.dispose();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {
                  createUserProfile();
                  Navigator.pop(context);
                },
                child: const Text("Create Account")),
          ],
        ),
      ),
    );
  }
}
