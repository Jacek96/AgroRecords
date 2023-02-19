import 'package:flutter/material.dart';
import 'package:flutter_ewidencja/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              SizedBox(height: 30),
              // logo
              Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(height: 30),

              // Welcome back, you've been missed
              Text(
                'Welcome back, you\'ve been missed',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 30),

              //email textfield
              MyTextField(),

              SizedBox(height: 20),

              //password textfiled
              MyTextField(),

              // forgot password

              // sign in button

              // or continue with

              // google + apple sign in buttons

              // not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
