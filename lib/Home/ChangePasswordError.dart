import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';
import 'package:marquina/auth/LoginPage.dart';

class ChangePasswordErrorPage extends StatefulWidget {
  @override
  _ChangePasswordErrorPageState createState() =>
      _ChangePasswordErrorPageState();
}

class _ChangePasswordErrorPageState extends State<ChangePasswordErrorPage> {
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
              Container(child: subCommonAppBar(context, 60)),
              SizedBox(height: 30),
              Container(
                  height: mainAxisHeight * 0.1,
                  width: width,
                  child: Image.asset(
                    'assets/pngs/singleDot.png',
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: 20),
              Text(
                'You have entered',
                style: textStyle(),
              ),
              Text(
                'wrong old password',
                style: textStyle(),
              ),
              Text(
                'Try again.',
                style: textStyle(),
              ),
              SizedBox(height: 30),
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
              Expanded(
                child: Container(
                    width: width,
                    child: Image.asset(
                      'assets/pngs/threeDot.png',
                      fit: BoxFit.fitWidth,
                    )),
              )
            ],
          )),
    ));
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.lightBlue);
  }
}
