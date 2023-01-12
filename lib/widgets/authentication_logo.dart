import 'package:flutter/material.dart';

class AuthenticationLogo extends StatelessWidget {
  const AuthenticationLogo({super.key, required this.image, required this.colour});

  final String image;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      color: colour,
      height: 150,
      width: 150,
    );
  }
}
