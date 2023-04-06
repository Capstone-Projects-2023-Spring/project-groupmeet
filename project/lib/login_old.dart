// Not being used

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:groupmeet/create_account_old.dart';
// import 'package:groupmeet/theme.dart';

// import 'home.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   LoginScreenState createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isUsernameValid = true;
//   bool _isPasswordValid = true;

//   Future<void> _login() async {
//     final String email = _usernameController.text.trim();
//     final String password = _passwordController.text.trim();
//     setState(() {
//       _isUsernameValid = email.isNotEmpty;
//       _isPasswordValid = password.isNotEmpty;
//     });
//     if (_isUsernameValid && _isPasswordValid) {
//       try {
//         await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email, password: password);
//         _navigateToHomeScreen();
//       } catch (e) {
//         String errorMessage = 'An error occurred, please try again later.';
//         if (e is FirebaseAuthException) {
//           if (e.code == 'user-not-found') {
//             errorMessage = 'Invalid email address.';
//           } else if (e.code == 'wrong-password') {
//             errorMessage = 'Invalid password.';
//           }
//         }
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(errorMessage)));
//       }
//     }
//   }

//   void _navigateToHomeScreen() {
//     Navigator.of(context).push(
//       platformPageRoute(
//         context: context,
//         builder: (_) => HomeScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PlatformScaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PlatformText('Login'),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: PlatformTextFormField(
//                 cursorColor: roundPurple,
//                 controller: _usernameController,
//                 hintText: "Username",
//                 material: (_, __) => MaterialTextFormFieldData(
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     border: const OutlineInputBorder(),
//                     errorText:
//                         _isUsernameValid ? null : 'Username cannot be empty',
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: PlatformTextFormField(
//                 cursorColor: roundPurple,
//                 controller: _passwordController,
//                 obscureText: true,
//                 hintText: "Password",
//                 material: (_, __) => MaterialTextFormFieldData(
//                     decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: const OutlineInputBorder(),
//                   errorText:
//                       _isPasswordValid ? null : 'Password cannot be empty',
//                 )),
//               ),
//             ),
//             const SizedBox(height: 20),
//             PlatformElevatedButton(
//               onPressed: _login,
//               color: roundPurple,
//               child: PlatformText('Login'),
//             ),
//             const SizedBox(height: 20),
//             PlatformElevatedButton(
//               color: roundPurple,
//               onPressed: () {
//                 Navigator.of(context).push(
//                   platformPageRoute(
//                       context: context, builder: (_) => const CreateAccount()),
//                 );
//               },
//               child: PlatformText('Create Account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
