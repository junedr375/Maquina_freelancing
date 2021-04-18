import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marquina/Home/HomePage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Utils/validators.dart';
import 'package:marquina/Widgets/boxDecoration.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/Widgets/inputDecoration.dart';
import 'package:marquina/auth/FaceRecognisation.dart';
import 'package:marquina/auth/ForgotPassword.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/auth/NewFaceRecognisation.dart';
import 'package:marquina/auth/SignUp.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isCredCorrect = true;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: backgroundColor,
            // appBar: AppBar(
            //   backgroundColor: backgroundColor,
            //   title: Text(appName),
            //   actions: [
            //     Center(
            //       child: Text(
            //         'junedr375',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //     ),
            //     SizedBox(width: 10),
            //   ],
            // ),
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
                              if (!isCredCorrect)
                                SizedBox(height: mainAxisHeight * 0.05),
                              Container(
                                  child: isCredCorrect
                                      ? Column(
                                          children: [
                                            Container(
                                                height: mainAxisHeight * 0.18,
                                                width: width,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 60),
                                                child: Image.asset(
                                                  'assets/pngs/logo.png',
                                                  fit: BoxFit.fitHeight,
                                                )),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                                    'your digital assistant',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.grey[700],
                                                        fontWeight:
                                                            FontWeight.w400))),
                                            SizedBox(
                                                height: mainAxisHeight * 0.02),
                                            InkWell(
                                              onTap: () {
                                                //     Navigator.push(
                                                //         context,
                                                //         MaterialPageRoute(
                                                //             builder: ((context) =>
                                                //                 FaceRecognization())));
                                              },
                                              child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Colors
                                                              .blue[400])),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    size: 35,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          height: mainAxisHeight * 0.22,
                                          width: width * 0.7,
                                          child: Image.asset(
                                            'assets/pngs/login.png',
                                            fit: BoxFit.fill,
                                          ))),
                              SizedBox(
                                  height: isCredCorrect
                                      ? mainAxisHeight * 0.05
                                      : mainAxisHeight * 0.05),
                              SizedBox(height: 10),
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
                                      Icons.people_alt_sharp,
                                      color: componentColor,
                                      size: 20,
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                child: TextFormField(
                                  controller: passwordController,
                                  cursorColor: componentColor,
                                  obscureText: isObscure,
                                  validator: (value) => value.length <= 5
                                      ? '         Atleast 6 character'
                                      : null,
                                  decoration: InputDecoration(
                                      fillColor: componentColor,
                                      border: InputBorder.none,
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        child: Icon(
                                          isObscure
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          color: componentColor,
                                          size: 20,
                                        ),
                                      ),
                                      hintText: 'Password',
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 10),
                                      hintStyle: TextStyle(
                                          fontSize: 20, color: componentColor)),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22),
                                ),
                              ),
                              if (!isCredCorrect) SizedBox(height: 20),
                              if (!isCredCorrect)
                                Container(
                                    child: Text(
                                  'Please provide correct details',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600),
                                )),
                              if (!isCredCorrect) SizedBox(height: 30),
                              if (isCredCorrect) SizedBox(height: 50),
                              InkWell(
                                onTap: () {
                                  login();
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: ((context) => HomePage())),
                                  //     (Route<dynamic> route) => false);
                                },
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 80),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: componentColor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 5),
                                            color: Colors.grey[400],
                                            blurRadius: 10)
                                      ]),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 90),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('Forgot Password');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  ForgotPassword())));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Forgot Password ?',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        print('Sign UP');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    SignUpPage())));
                                      },
                                      child: Text('Sign Up',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.blue,
                                          )))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ])))));
  }

  void login() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      try {
        setState(() {
          isCredCorrect = true;
        });
        print('Hello');
        String apiUrl = 'http://52.14.154.197:8000/user/login/';

        var res = await http.post(Uri.parse(apiUrl), body: {
          'email': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        });

        var result = jsonDecode(res.body);
        print(result);

        if (result['status'] == 200) {
          setState(() {
            isCredCorrect = true;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => HomePage())),
              (Route<dynamic> route) => false);
        } else {
          setState(() {
            isCredCorrect = false;
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }
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
