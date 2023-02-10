import 'package:flutter/material.dart';
import 'package:tang_clue/constants/sizes.dart';

import 'authentication/login_screen.dart';

void main() {
  runApp(const MathStudyApp());
}

class MathStudyApp extends StatelessWidget {
  const MathStudyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Math Study App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle:
                  TextStyle(color: Colors.black, fontSize: Sizes.size32),
              elevation: 1,
              foregroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.amber,
        ),
        home: const LoginScreen());
  }
}
