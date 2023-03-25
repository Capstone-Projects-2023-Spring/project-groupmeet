import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'link_calendar.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

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
            "discord": false,
            "facebook": false,
            "instagram": false,
            "messages": false,
            "snapchat": false,
          });
          setState(() {
            _creatingProfile = false;
          });
          // _emailController.dispose();
          // _passwordController.dispose();          
           Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (_) =>                        
                        const Calendar()    //link calendar page for onboarding                  
                  ),
                );

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
    //safety pop to make sure all is well.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(50),
                child: Material(
                  borderRadius: BorderRadius.circular(55),
                  elevation: 2,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(230, 128, 128, 128),
                    radius: 65,
                    child: Icon(
                        size: 75,
                        color: Colors.white,
                        PlatformIcons(context).add),
                  ),
                )),
              const Padding(
              padding: EdgeInsets.fromLTRB(120, 0, 120, 30),
              child: Text(
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                  "Be Round Or Be Square"),
            ),
            PlatformTextField(
              hintText: "First Name",
                controller: _fnameController,
                keyboardType: TextInputType.name,
                material: (_, __) => MaterialTextFieldData(
                    decoration: InputDecoration(                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      labelText: "First Name",
                      
                    )
                ),
            ),
            const SizedBox(height: 10,),
            PlatformTextField(
                controller: _lnameController,
                hintText: "Last Name",
                keyboardType: TextInputType.name,
                material: (_, __) => MaterialTextFieldData(
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      labelText: "Last Name",
                    )
                )
            ),
            const SizedBox(height: 10,),
            PlatformTextField(
              hintText: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              material: (_, __) => MaterialTextFieldData(
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: "Email",
                  )
              ),
                ),
                const SizedBox(height: 10),
            PlatformTextField(
              hintText: "Password",
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              material: (_, __) => MaterialTextFieldData(
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: "Password",
                  )
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10,),
            PlatformElevatedButton(
              onPressed:
                  _creatingProfile ? null : () => createUserProfile(context),
              material: (context, platform) => MaterialElevatedButtonData(
                  style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 5.0,
                  color: Color.fromARGB(255, 89, 4, 106),
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                backgroundColor: Colors.white,
              )
                ),
                child: _creatingProfile
                    ? const CircularProgressIndicator()
                    : Icon(color: Colors.black, PlatformIcons(context).forward),),
             
               
          ],
        ),
      ),
    );
  }
}


