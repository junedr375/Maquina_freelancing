import 'package:flutter/material.dart';
import 'package:marquina/Home/GoBackTOLoginAfterPC.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Utils/helperFunction.dart';
import 'package:marquina/Widgets/boxDecoration.dart';

import 'package:marquina/Widgets/subCommonAppBar.dart';
import 'package:http/http.dart' as http;

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;

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
                      Container(child: subCommonAppBar(context, 60)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            children: [
                              SizedBox(height: mainAxisHeight * 0.10),
                              SizedBox(height: 5),
                              Center(
                                  child: Text('Change Your Password',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.lightBlue))),
                              SizedBox(height: mainAxisHeight * 0.14),
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                child: TextFormField(
                                  obscureText: isObscure1,
                                  controller: oldPasswordController,
                                  cursorColor: componentColor,
                                  validator: (value) => value.isEmpty
                                      ? "      *Can't be empty"
                                      : null,
                                  decoration: InputDecoration(
                                      fillColor: componentColor,
                                      border: InputBorder.none,
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isObscure1 = !isObscure1;
                                          });
                                        },
                                        child: Icon(
                                          isObscure1
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          color: componentColor,
                                          size: 20,
                                        ),
                                      ),
                                      hintText: 'Old Password',
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
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                child: TextFormField(
                                  controller: newPasswordController,
                                  cursorColor: componentColor,
                                  validator: (value) => value.length <= 5
                                      ? '      * Atleast 6 Character long'
                                      : null,
                                  obscureText: isObscure2,
                                  decoration: InputDecoration(
                                      fillColor: componentColor,
                                      border: InputBorder.none,
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isObscure2 = !isObscure2;
                                          });
                                        },
                                        child: Icon(
                                          isObscure2
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          color: componentColor,
                                          size: 20,
                                        ),
                                      ),
                                      hintText: 'New Password',
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
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                child: TextFormField(
                                  controller: newPasswordAgainController,
                                  cursorColor: componentColor,
                                  validator: passwordValidate,
                                  obscureText: isObscure3,
                                  decoration: InputDecoration(
                                      fillColor: componentColor,
                                      border: InputBorder.none,
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isObscure3 = !isObscure3;
                                          });
                                        },
                                        child: Icon(
                                          isObscure3
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          color: componentColor,
                                          size: 20,
                                        ),
                                      ),
                                      hintText: 'Retype New Password',
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
                              SizedBox(height: 50),
                              InkWell(
                                onTap: () {
                                  changePassword();
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
                                    'OK',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ])))));
  }

  String passwordValidate(String val) {
    return newPasswordController.text != newPasswordAgainController.text
        ? '         * New Password Mismatch'
        : null;
  }

  void changePassword() async {
    String username = await getUsername();
    if (username != '') {
      final formState = _formKey.currentState;
      if (formState.validate()) {
        try {
          var res = await http.post(
              Uri.parse('http://52.14.154.197:8000/user/update-password'),
              body: {
                "email": username,
                "password": newPasswordController.text.trim(),
                "old_password": oldPasswordController.text.trim()
              });
          if (res.statusCode == 200) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        GoBackToLoginAfterPasswordChnage())));
          }
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }
}
