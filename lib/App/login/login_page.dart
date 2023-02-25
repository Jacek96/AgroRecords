import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  var isCreatingAccount = false;

  // sign user In
  void signUserIn() {}

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.green,
              Colors.yellow,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              // padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  // logo
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/images/logo.jpg',
                    ),
                    radius: 60,
                  ),
                  const SizedBox(height: 30),

                  // Welcome back, you've been missed
                  Text(
                    isCreatingAccount == true
                        ? 'Create a new account'
                        : 'Welcome back, you\'ve been missed',
                    style: const TextStyle(fontSize: 16),
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
                      if (isCreatingAccount == true) {
                        //rejestracja
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: widget.usernameController.text,
                                  password: widget.passwordController.text);
                        } catch (error) {
                          setState(
                            () {
                              errorMessage = error.toString();
                            },
                          );
                        }
                      } else {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: widget.usernameController.text,
                                  password: widget.passwordController.text);
                        } catch (error) {
                          setState(
                            () {
                              errorMessage = error.toString();
                            },
                          );
                        }
                      }
                    },
                    child:
                        Text(isCreatingAccount == true ? 'Sign In' : 'Login'),
                  ),
                  // MyButton(
                  //   onTap: signUserIn,
                  // ),
                  const SizedBox(height: 10),
                  if (isCreatingAccount == false) ...[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = true;
                        });
                      },
                      child: Text('Create account'),
                    ),
                  ],
                  if (isCreatingAccount == true) ...[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = false;
                        });
                      },
                      child: Text('I have an account'),
                    ),
                  ],

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

                  const SizedBox(height: 30),

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
        ),
      ),
    );
  }
}
