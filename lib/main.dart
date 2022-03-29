import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newnokosuios/animated_screen.dart';
import 'package:newnokosuios/image_picker.dart';

// @dart=2.9

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: const AnimatedScreen()),
  ));
}

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({Key? key, required this.goToPage, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: AnimatedSplashScreen(
          splash: const ImageIcon(
            AssetImage("assets/black_name.png"), size: 500.0,
            // splash: Lottie.asset(
            //   'assets/74423-photography.json',
          ),
          nextScreen: const AnimatedScreen(),
          // nextScreen: LoginPage(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200.0,
          backgroundColor: Colors.transparent,
          duration: 1550,
        ),

        // const Center(
        //   child: ImageIcon(
        //     AssetImage("assets/black_name.png"),
        //     size: 200.0,
        //   ),
        // ),
      ),
    );

    // return AnimatedSplashScreen(
    //   splash: const ImageIcon(
    //     AssetImage("assets/black_name.png"),
    //     size: 500.0,
    //     // splash: Lottie.asset(
    //     //   'assets/74423-photography.json',
    //   ),
    //   // nextScreen: ImagePicker(),
    //   nextScreen: AnimatedScreen(),

    //   splashTransition: SplashTransition.fadeTransition,
    //   splashIconSize: 200.0,
    //   backgroundColor: Colors.transparent,
    //   duration: 1550,
    // );
  }
}
