import 'package:flutter/material.dart';
import 'package:marquina/Home/ChangePasswordScreen.dart';
import 'package:marquina/Home/GoToTCPage.dart';
import 'package:marquina/Home/HelpDetails.dart';
import 'package:marquina/Home/RateThisApp.dart';
import 'package:marquina/Home/WebView.dart';
import 'package:marquina/auth/LoginPage.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Color backgroundColor = Colors.purple[900];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: mainAxisHeight,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/pngs/settings.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 100,
                    child: Image.asset(
                      'assets/pngs/logoM.png',
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Settings',
                style: textStyle(),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ChangePasswordScreen())));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Change Password',
                    style: textStyle(),
                  ),
                )),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HelpDetails())));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Help',
                    style: textStyle(),
                  ),
                )),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => GoToTCPage())));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Terms & Privacy Policy',
                    style: textStyle(),
                  ),
                )),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => RateThisApp())));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rate The App',
                    style: textStyle(),
                  ),
                )),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Logout',
                    style: textStyle(),
                  ),
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]);
  }
}
