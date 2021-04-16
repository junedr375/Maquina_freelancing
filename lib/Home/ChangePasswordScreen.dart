import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/GoBackTOLoginAfterPC.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController newPasswordAgainController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: mainAxisHeight,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(height: 60, child: subCommonAppBar(context)),
              SizedBox(height: mainAxisHeight * 0.10),
              SizedBox(height: 5),
              Center(
                  child: Text('Change Your Password',
                      style: TextStyle(fontSize: 25, color: Colors.lightBlue))),
              SizedBox(height: mainAxisHeight * 0.14),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: width,
                //padding: EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: oldPasswordController,
                  cursorColor: componentColor,
                  decoration: InputDecoration(
                      fillColor: componentColor,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: componentColor,
                        size: 20,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      hintText: 'Old Password',
                      hintStyle:
                          TextStyle(fontSize: 20, color: componentColor)),
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
                //padding: EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: newPasswordController,
                  cursorColor: componentColor,
                  decoration: InputDecoration(
                      fillColor: componentColor,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: componentColor,
                        size: 20,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      hintText: 'New Password',
                      hintStyle:
                          TextStyle(fontSize: 20, color: componentColor)),
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
                //padding: EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: newPasswordAgainController,
                  cursorColor: componentColor,
                  decoration: InputDecoration(
                      fillColor: componentColor,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: componentColor,
                        size: 20,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: componentColor),
                      ),
                      hintText: 'Retype New Password',
                      hintStyle:
                          TextStyle(fontSize: 20, color: componentColor)),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                ),
              ),
              // Container(
              //   height: 50,
              //   width: width,
              //   padding: EdgeInsets.only(left: 20),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(25)),
              //   child: TextFormField(
              //     controller: oldPasswordController,
              //     decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: 'Old Password',
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
              //     controller: newPasswordController,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: 'Password',
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
              //     controller: newPasswordAgainController,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: 'Repeat New Password',
              //         hintStyle: TextStyle(fontSize: 20)),
              //     style: TextStyle(color: Colors.black, fontSize: 22),
              //   ),
              // ),
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
                  decoration: BoxDecoration(color: componentColor, boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 5),
                        color: Colors.grey[400],
                        blurRadius: 10)
                  ]),
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
