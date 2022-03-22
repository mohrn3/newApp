import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newnokosuios/animated_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const ImageIcon(
        AssetImage("assets/black_name.png"), size: 500.0,
        // splash: Lottie.asset(
        //   'assets/74423-photography.json',
      ),
      nextScreen: AnimatedScreen(),
      // nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 200.0,
      backgroundColor: Colors.transparent,
      duration: 1550,
    );
  }
}
