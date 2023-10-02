import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: FlutterSplashScreen.gif(
            duration: Duration(milliseconds: 3000), defaultNextScreen: ChatScreen(),
            gifPath: 'assets/logo.jpeg',
            gifWidth: 200,
            gifHeight: 100,
          ),),
    );
  }
}
