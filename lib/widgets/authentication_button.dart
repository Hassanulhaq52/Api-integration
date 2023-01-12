import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    required this.title,
    required this.colour,
    required this.onpressed,
  });

  final String title;
  final Color colour;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colour,
      borderRadius: BorderRadius.circular(
        30.0,
      ),
      child: MaterialButton(
        onPressed: onpressed,
        height: 40,
        child: Text(
          title,
          style: Constants.authenticationButtonStyle,
        ),
      ),
    );
  }
}
