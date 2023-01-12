import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/widgets/email_field.dart';
import 'package:weather_app/widgets/password_field.dart';
import 'package:weather_app/widgets/authentication_logo.dart';
import 'package:weather_app/widgets/authentication_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          backgroundColor: Colors.lightBlueAccent,
          title: const Text('Sign In Screen'),
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
                    image: 'assets/signin.png',
                    colour: Colors.lightBlueAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailField(
                    onchanged: (value) {
                      email = value;
                    },
                    decoration: Constants.signinFieldDecoration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(
                    onchanged: (value) {
                      password = value;
                    },
                    decoration: Constants.signinFieldDecoration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthenticationButton(
                      title: 'Sign In',
                      colour: Colors.lightBlueAccent,
                      onpressed: () {
                        final user = _auth.signInWithEmailAndPassword(email: email!, password: password!);
                        user;
                        Navigator.pushNamed(context, 'weather_screen');
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have an Account?',
                      ),
                      SizedBox(
                        width: 65,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup_screen');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
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
