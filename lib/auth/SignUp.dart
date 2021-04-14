import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/auth/AuthMessages.dart';
import 'package:http/http.dart' as http;
import 'package:marquina/auth/LoginPage.dart';
import 'package:marquina/auth/SignUpSuccessFul.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: commonAppBar(),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: mainAxisHeight * 0.3,
                    width: width,
                    child: Image.asset(
                      'assets/pngs/signUp.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: usernameController,
                      cursorColor: componentColor,
                      decoration: InputDecoration(
                          fillColor: componentColor,
                          prefixIcon: Icon(
                            Icons.email,
                            color: componentColor,
                            size: 22,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: componentColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: componentColor),
                          ),
                          hintText: 'Email id',
                          hintStyle:
                              TextStyle(fontSize: 20, color: componentColor)),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Container(
                  //   height: 50,
                  //   width: width,
                  //   padding: EdgeInsets.only(left: 20),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(25)),
                  //   child: TextFormField(
                  //     controller: passwordController,
                  //     obscureText: false,
                  //     validator: (val) =>
                  //         val.length < 4 ? 'Invalid Format' : null,
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: 'Enter Pasword',
                  //         hintStyle: TextStyle(fontSize: 20)),
                  //     style: TextStyle(color: Colors.black, fontSize: 22),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Container(
                  //   height: 50,
                  //   width: width,
                  //   padding: EdgeInsets.only(left: 20),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(25)),
                  //   child: TextFormField(
                  //     validator: (val) =>
                  //         val.length < 4 ? 'Invalid Format' : null,
                  //     controller: passwordAgainController,
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: 'Enter Password Again',
                  //         hintStyle: TextStyle(fontSize: 20)),
                  //     style: TextStyle(color: Colors.black, fontSize: 22),
                  //   ),
                  // ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      //     print('Back');
                      //   signUp();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpSuccessFul())));
                    },
                    child: Container(
                      height: 40,
                      width: 150,
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
                        'Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // InkWell(
                  //   onTap: () {
                  //     print('Login');
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: ((context) => LoginPage())));
                  //   },
                  //   child: Container(
                  //     width: width,
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       'Already Have an account login',
                  //       style: TextStyle(fontSize: 18, color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ))),
    ));
  }

  TextStyle textStyle() {
    return TextStyle(
        fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white);
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      try {
        String apiUrl = 'http://52.14.154.197:8000/user/register/';

        var res = await http.post(Uri.parse(apiUrl), body: {
          'email': usernameController.text.trim(),
          'password': passwordController.text.trim(),
          'phone': '1234567890',
          'firstName': 'Upman',
          'lastName': 'Tech'
        });

        var result = jsonDecode(res.body);
        print(result);

        if (result['message'] == 'You have successfully registered') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => AuthMessagesScreen(
                        message1: 'Thank you for Chosing',
                        message2: 'Continue to Login By',
                        message3: 'Entering email and password',
                        message4: 'Thank you !!',
                      ))));
        } else {
          showCredentialError(result['message'].toString());
        }
      } catch (e) {}
    } else {}
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
