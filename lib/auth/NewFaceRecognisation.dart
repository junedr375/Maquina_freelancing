import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marquina/Home/HomePage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/auth/FaceConfirmPage.dart';
import 'package:marquina/auth/FaceRecognisation.dart';
import 'package:marquina/auth/ForgotPassword.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/auth/SignUp.dart';
import 'package:http/http.dart' as http;

class FaceRecognization extends StatefulWidget {
  @override
  FaceRecognizationState createState() => FaceRecognizationState();
}

class FaceRecognizationState extends State<FaceRecognization> {
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
        //
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
                    Center(
                        child: Text('Face recognition\nSignup',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800]))),
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                            'Make sure your full face captured\nin the camera of your mobile device',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w400))),
                    SizedBox(height: mainAxisHeight * 0.04),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) => FaceRecognization())));
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 5, color: Colors.blue[400])),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.camera_alt,
                            size: 35,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 50,
                      width: width,
                      //    padding: EdgeInsets.only(left: 20),
                      child: TextFormField(
                        controller: usernameController,
                        cursorColor: componentColor,
                        decoration: InputDecoration(
                            fillColor: componentColor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: componentColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: componentColor),
                            ),
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: 20, color: componentColor)),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 90),
                    InkWell(
                      onTap: () {
                        //  login();
                        setState(() {
                          isCredCorrect = !isCredCorrect;
                        });
                        // print('hello');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => FaceConfirmPage())));
                      },
                      child: Container(
                        child: Container(
                            height: 40,
                            width: 40,
                            // margin: EdgeInsets.symmetric(horizontal: 80),
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //     color: componentColor,
                            //     boxShadow: [
                            //       BoxShadow(
                            //           offset: Offset(2, 5),
                            //           color: Colors.grey[400],
                            //           blurRadius: 10)
                            //     ]),
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

  void showCredentialError(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  }
}
