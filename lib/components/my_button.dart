// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   final void Function()? onTap;
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   MyButton({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.green,
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 120,
//           vertical: 20,
//         ),
//       ),
//       onPressed: () async {
//         try {
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//             email: usernameController.text,
//             password: passwordController.text,
//           );
//         } catch (error) {
//           print(error);
//         }
//       },
//       child: const Text('Login'),
//     );
//   }
// }
