import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  const MyButton({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(25.0),
//         margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: const Center(
//           child: Text(
//             'Sign in',
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 120,
          vertical: 20,
        ),
      ),
      onPressed: () {},
      child: Text('Login'),
    );
  }
}
