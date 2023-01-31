import 'package:flutter/material.dart';

class Constants {
  static const TextStyle authenticationButtonStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle weatherStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 50,
    color: Colors.white,
  );

  static const TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle containerStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const InputDecoration signinFieldDecoration = InputDecoration(
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightBlueAccent,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightBlueAccent,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
  );

  static const InputDecoration signupFieldDecoration = InputDecoration(
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          32.0,
        ),
      ),
    ),
  );
}
