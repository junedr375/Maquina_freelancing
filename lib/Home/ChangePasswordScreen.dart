import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/GoBackTOLoginAfterPC.dart';
import 'package:marquina/Utils/Utility.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    Color backgroundColor = Colors.purple[900];

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController newPasswordAgainController = TextEditingController();
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
                  child: Text('Hello !!',
                      style: TextStyle(fontSize: 25, color: Colors.white))),
              SizedBox(height: 5),
              Center(
                  child: Text('Change Your Password',
                      style: TextStyle(fontSize: 25, color: Colors.white))),
              SizedBox(height: mainAxisHeight * 0.04),
              SizedBox(height: mainAxisHeight * 0.1),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: width,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  controller: oldPasswordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Old Password',
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
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
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
                  controller: newPasswordAgainController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Repeat New Password',
                      hintStyle: TextStyle(fontSize: 20)),
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              GoBackToLoginAfterPasswordChnage())));
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
                    'OK',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ));
  }

  void showCredentialError() {
    Fluttertoast.showToast(
        msg: 'Please provide correct details',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0);
  }
}
