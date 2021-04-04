import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/auth/AuthMessages.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController usernameController = TextEditingController();
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
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'To generate new',
                style: textStyle(),
              ),
              Text(
                'password provide',
                style: textStyle(),
              ),
              Text(
                'your official Email-ID',
                style: textStyle(),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Email-ID',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Container(
                height: 50,
                width: width,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      hintStyle: TextStyle(fontSize: 20)),
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    print('Back');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AuthMessagesScreen(
                                  message1: 'You will receive a password',
                                  message2: 'of your e-mail id registered',
                                  message3: 'with us',
                                  message4: 'Thank you !!',
                                ))));
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Text(
                      'SEND',
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
