import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/auth/LoginPage.dart';

class AuthMessagesScreen extends StatefulWidget {
  final String message1;
  final String message2;
  final String message3;
  final String message4;

  AuthMessagesScreen(
      {this.message1, this.message2, this.message3, this.message4});

  @override
  _AuthMessagesScreenState createState() => _AuthMessagesScreenState();
}

class _AuthMessagesScreenState extends State<AuthMessagesScreen> {
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
                widget.message1,
                style: textStyle(),
              ),
              Text(
                widget.message2,
                style: textStyle(),
              ),
              Text(
                widget.message3,
                style: textStyle(),
              ),
              SizedBox(height: 20),
              Text(
                widget.message4,
                style: textStyle(),
              ),
              SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    print('Back');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Text(
                      'Ok',
                      style: textStyle(),
                    ),
                  )),
            ],
          )),
    ));
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white);
  }
}
