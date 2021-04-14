import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marquina/auth/LoginPage.dart';
import '../Utils/Utility.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: ((context) => LoginPage()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/pngs/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    ));
  }
}
