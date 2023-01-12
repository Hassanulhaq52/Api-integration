import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> googleSignin(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential authCredential =
          GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
      final UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(user);
      Navigator.pushNamed(context, 'weather_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google.png',
            height: 40,
            width: 40,
            // color: Colors.white,
          ),
          MaterialButton(
            onPressed: () {
              googleSignin(context);
            },
            height: 40,
            child: const Text(
              'Sign In With Google',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
