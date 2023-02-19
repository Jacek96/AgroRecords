import 'package:flutter/material.dart';

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
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              //password textfiled

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
