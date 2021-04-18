import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/GoBackTOLoginAfterPC.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/boxDecoration.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/Widgets/inputDecoration.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

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
                                  controller: oldPasswordController,
                                  cursorColor: componentColor,
                                  decoration: authInputDecoration(
                                    'Old Password',
                                    Icon(
                                      Icons.lock,
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
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                //padding: EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  controller: newPasswordController,
                                  cursorColor: componentColor,
                                  decoration: authInputDecoration(
                                    'New Password',
                                    Icon(
                                      Icons.lock,
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
                              SizedBox(height: 10),
                              Container(
                                height: 50,
                                width: width,
                                decoration: auhtBoxDecoration(),
                                //padding: EdgeInsets.only(left: 20),
                                //dec
                                child: TextFormField(
                                  controller: newPasswordAgainController,
                                  cursorColor: componentColor,
                                  decoration: authInputDecoration(
                                    'Retype New Password',
                                    Icon(
                                      Icons.lock,
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
