import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Jesteś niezalogowany'),
      ),
    );
  }
}
