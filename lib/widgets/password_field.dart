import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, this.onchanged, required this.decoration});

  final Function(String)? onchanged;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText: true,
      textAlign: TextAlign.center,
      onChanged: onchanged,
      decoration: decoration.copyWith(
        hintText: 'Enter Your Password',
      ),
    );
  }
}
