import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ewidencja/components/my_button.dart';
import 'package:flutter_ewidencja/components/my_text_field.dart';
import 'package:flutter_ewidencja/components/squere_tile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  // text editing controler
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';

  // sign user In
  void signUserIn() {}

  @override
  build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              // logo
              Image.asset(
                'lib/images/bug.jpg',
                height: 110,
              ),

              const SizedBox(height: 30),

              // Welcome back, you've been missed
              const Text(
                'Welcome back, you\'ve been missed',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              //email textfield
              MyTextField(
                controller: widget.usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //password textfiled
              MyTextField(
                controller: widget.passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Forgot password?'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(errorMessage),

              const SizedBox(height: 10),

              // sign in button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 20,
                  ),
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.usernameController.text,
                        password: widget.passwordController.text);
                  } catch (error) {
                    setState(
                      () {
                        errorMessage = error.toString();
                      },
                    );
                  }
                },
                child: const Text('Login'),
              ),
              // MyButton(
              //   onTap: signUserIn,
              // ),

              const SizedBox(height: 30),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text('Or continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 10),

                  // apple button
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),
              // not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
