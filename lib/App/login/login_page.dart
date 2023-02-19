import 'package:flutter/material.dart';
import 'package:flutter_ewidencja/components/my_button.dart';
import 'package:flutter_ewidencja/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  // text editing controler
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user In
  void signUserIn() {}

  @override
  build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              SizedBox(height: 10),

              //password textfiled
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              SizedBox(height: 20),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot password?'),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              SizedBox(height: 20),

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
