import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marquina/Home/HomePage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Utils/validators.dart';
import 'package:marquina/Widgets/boxDecoration.dart';
import 'package:marquina/Widgets/commonAppBar.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Widgets/inputDecoration.dart';
import 'package:marquina/auth/ReachToHR.dart';
import 'package:marquina/auth/ResetPasswordConfirm.dart';
import 'package:marquina/auth/SignUp.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  bool isCredCorrect = true;
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
        child: Form(
            key: _formKey,
            child: Column(children: [
              commonAppBar(60, 20),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ListView(
                  children: [
                    SizedBox(height: mainAxisHeight * 0.10),
                    Container(
                        child: Center(
                      child: Text('Forgot Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue[400])),
                    )),
                    SizedBox(height: 20),
                    Container(
                        child: Center(
                      child: Text(
                          'To genrate new password.\nprovide your official Email id.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue[300])),
                    )),
                    SizedBox(height: mainAxisHeight * 0.04),
                    SizedBox(height: 50),
                    Container(
                      height: 50,
                      width: width,
                      decoration: auhtBoxDecoration(),
                      child: TextFormField(
                        controller: usernameController,
                        cursorColor: componentColor,
                        validator: validateEmail,
                        decoration: authInputDecoration(
                          'Email Id',
                          Icon(
                            Icons.email,
                            color: componentColor,
                            size: 25,
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 90),
                    InkWell(
                      onTap: () {
                        forgotPasswordFunction();
                      },
                      child: Container(
                        child: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: Image.asset('assets/pngs/nextArrow.png')),
                      ),
                    ),
                    SizedBox(height: 90),
                  ],
                ),
              ))
            ])),
      ),
    ));
  }

  void forgotPasswordFunction() async {
    final formState = _formKey.currentState;

    if (formState.validate()) {
      try {
        if (usernameController.text.split('@')[1] == 'maq.ai') {
          print(usernameController.text);
          var response = await http.post(
              Uri.parse('http://52.14.154.197:8000/user/forgot-password/'),
              body: {"email": usernameController.text});

          print(json.decode(response.body));
          if (response.statusCode == 200) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => ResetPasswordConfirm())));
          }
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: ((context) => ReachToHR())));
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
