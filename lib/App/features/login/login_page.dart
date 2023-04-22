import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ewidencja/App/cubit/root_cubit.dart';
import 'package:flutter_ewidencja/App/features/login/cubit/login_cubit.dart';
import 'package:flutter_ewidencja/components/my_text_field.dart';

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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
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
                              ? 'Załóż konto'
                              : 'Zaloguj się do aplikacji',
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 30),

                        //email textfield
                        MyTextField(
                          controller: widget.usernameController,
                          hintText: 'Nazwa użytkownika',
                          obscureText: false,
                        ),

                        const SizedBox(height: 10),

                        //password textfiled
                        MyTextField(
                          controller: widget.passwordController,
                          hintText: 'Hasło',
                          obscureText: true,
                        ),

                        const SizedBox(height: 20),

                        // forgot password
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Zapomniałeś hasła?'),
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
                                await context.read<RootCubit>().createUser(
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
                                await context.read<RootCubit>().signIn(
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
                          child: Text(isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj'),
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
                            child: const Text('Stwórz konto'),
                          ),
                        ],
                        if (isCreatingAccount == true) ...[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isCreatingAccount = false;
                              });
                            },
                            child: const Text('Mam już konto'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
