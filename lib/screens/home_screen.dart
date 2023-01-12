import 'package:flutter/material.dart';
import 'package:weather_app/widgets/authentication_logo.dart';
import 'package:weather_app/widgets/authentication_button.dart';
import 'package:weather_app/widgets/google_signin_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthenticationLogo(image: 'assets/weather_logo.png', colour: Colors.blueAccent),
                AuthenticationButton(
                  title: 'Sign In',
                  colour: Colors.lightBlueAccent,
                  onpressed: () {
                    Navigator.pushNamed(context, 'signin_screen');
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthenticationButton(
                    title: 'Sign Up',
                    colour: Colors.blueAccent,
                    onpressed: () {
                      Navigator.pushNamed(context, 'signup_screen');
                    }),
                const SizedBox(
                  height: 15,
                ),
                GoogleSignInButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
