import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marquina/Home/HomePage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/auth/FaceRecognisation.dart';
import 'package:marquina/auth/ForgotPassword.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/auth/SignUp.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color backgroundColor = Colors.purple[900];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: mainAxisHeight * 0.10),
              Center(
                  child: Text('Marquina',
                      style: TextStyle(fontSize: 25, color: Colors.white))),
              SizedBox(height: 5),
              Center(
                  child: Text('Your Digital Assistant',
                      style: TextStyle(fontSize: 25, color: Colors.white))),
              SizedBox(height: mainAxisHeight * 0.04),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => FaceRecognization())));
                },
                child: Container(
                    height: 80,
                    width: 120,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 80,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: mainAxisHeight * 0.1),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                    onTap: () {
                      print('Sign UP');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpPage())));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(height: 10),
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
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 20)),
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  height: 50,
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print('Forgot Password');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ForgotPassword())));
                },
                child: Container(
                  width: width,
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void login() async {
    String apiUrl = 'http://52.14.154.197:8000/user/login/';

    var res = await http.post(Uri.parse(apiUrl), body: {
      'email': usernameController.text.trim(),
      'password': passwordController.text.trim(),
    });

    var result = jsonDecode(res.body);
    print(result);

    if (result['status'] == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
    } else {
      showCredentialError(result['message']);
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
