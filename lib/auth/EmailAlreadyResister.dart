import 'package:flutter/material.dart';

import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';

class EmailAlreadyRegister extends StatefulWidget {
  @override
  _EmailAlreadyRegisterState createState() => _EmailAlreadyRegisterState();
}

class _EmailAlreadyRegisterState extends State<EmailAlreadyRegister> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: mainAxisHeight,
        width: width,
        child: Column(
          children: [
            Container(
              //    padding: EdgeInsets.symmetric(horizontal: 20),
              child: commonAppBar(60, 20),
            ),
            SizedBox(height: 60),
            Container(
                child: Center(
              child: Text('Signup Unsuccessful',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[300])),
            )),
            SizedBox(height: 60),
            SizedBox(height: 20),
            Container(
                child: Center(
              child: Text(
                  'The email is already\n registered. Click Forgot\nPassword if you do not\nremember',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[300])),
            )),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: componentColor, boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 5),
                      color: Colors.grey[400],
                      blurRadius: 10)
                ]),
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
