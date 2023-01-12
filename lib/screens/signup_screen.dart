import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/widgets/email_field.dart';
import 'package:weather_app/widgets/password_field.dart';
import 'package:weather_app/widgets/authentication_logo.dart';
import 'package:weather_app/widgets/authentication_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacementNamed(context, 'home_screen');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'home_screen');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.blueAccent,
          title: const Text('Sign Up Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthenticationLogo(
                    image: 'assets/signup.png',
                    colour: Colors.blueAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailField(
                    onchanged: (value) {
                      email = value;
                    },
                    decoration: Constants.signupFieldDecoration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(
                    onchanged: (value) {
                      password = value;
                    },
                    decoration: Constants.signupFieldDecoration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthenticationButton(
                    title: 'Register',
                    colour: Colors.blueAccent,
                    onpressed: () {
                      final newUser = _auth.createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      newUser;

                      Navigator.pushNamed(context, 'weather_screen');
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have an Account?',
                      ),
                      SizedBox(
                        width: 59,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signin_screen');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
