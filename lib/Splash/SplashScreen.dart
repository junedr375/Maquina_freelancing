import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marquina/Home/HomePage.dart';
import 'package:marquina/Utils/helperFunction.dart';
import 'package:marquina/auth/LoginPage.dart';
import '../Utils/Utility.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  @override
  void initState() {
    getLoginValue();
    super.initState();
  }

  void getLoginValue() async {
    isLoggedIn = await getLogin();
    if (!isLoggedIn) {
      Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: ((context) => LoginPage()))));
    } else {
      Future.delayed(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: ((context) => HomePage()))));
    }
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
