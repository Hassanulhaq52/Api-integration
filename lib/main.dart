import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/game_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/news_screen.dart';
import 'package:weather_app/screens/signin_screen.dart';
import 'package:weather_app/screens/signup_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: 'weather_screen',
      routes: {
        'home_screen': (context) => const HomeScreen(),
        'signup_screen': (context) => const SignupScreen(),
        'signin_screen': (context) => const SignInScreen(),
        'weather_screen': (context) => const WeatherScreen(),
        'news_screen': (context) => const NewsScreen(),
        'game_screen': (context) => const GameScreen(),
      },
    );
  }
}
