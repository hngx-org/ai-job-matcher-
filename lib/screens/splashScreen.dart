import 'package:ai_job_matcher/screens/sign_in_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

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
          duration: Duration(milliseconds: 3000),
          defaultNextScreen: SignIn(),
          gifPath: 'assets/logo.jpeg',
          gifWidth: 200,
          gifHeight: 100,
        ),
      ),
    );
  }
}
