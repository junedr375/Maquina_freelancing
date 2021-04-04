import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/auth/AuthMessages.dart';
import 'package:http/http.dart' as http;
import 'package:marquina/auth/LoginPage.dart';

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
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: textStyle(),
                  ),
                  SizedBox(height: 20),
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
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(fontSize: 20)),
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: width,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: false,
                      validator: (val) =>
                          val.length < 4 ? 'Invalid Format' : null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Pasword',
                          hintStyle: TextStyle(fontSize: 20)),
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: width,
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      validator: (val) =>
                          val.length < 4 ? 'Invalid Format' : null,
                      controller: passwordAgainController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password Again',
                          hintStyle: TextStyle(fontSize: 20)),
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                      onTap: () {
                        //     print('Back');
                        signUp();
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Text(
                          'Sign Up',
                          style: textStyle(),
                        ),
                      )),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      print('Login');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Text(
                        'Already Have an account login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
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
