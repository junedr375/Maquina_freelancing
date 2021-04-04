import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/auth/LoginPage.dart';

class GoBackToLoginAfterPasswordChnage extends StatefulWidget {
  @override
  _GoBackToLoginAfterPasswordChnageState createState() =>
      _GoBackToLoginAfterPasswordChnageState();
}

class _GoBackToLoginAfterPasswordChnageState
    extends State<GoBackToLoginAfterPasswordChnage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    Color backgroundColor = Colors.purple[900];

    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        title: Text(appName),
        actions: [
          Center(
            child: Text(
              'junedr375',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
          height: mainAxisHeight,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Thank you',
                style: textStyle(),
              ),
              Text(
                'your Password is Updated',
                style: textStyle(),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                },
                child: Text(
                  'click here to login again',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      color: Colors.blue),
                ),
              ),
              Text(
                'again.',
                style: textStyle(),
              ),
              SizedBox(height: 30),
            ],
          )),
    ));
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white);
  }
}
