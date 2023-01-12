import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, this.onchanged, required this.decoration});

  final Function(String)? onchanged;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        onChanged: onchanged,
        decoration: decoration.copyWith(
          hintText: 'Enter Your Email',
        ));
  }
}
