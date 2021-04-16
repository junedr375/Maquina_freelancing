import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';

class ResetPasswordConfirm extends StatefulWidget {
  @override
  _ResetPasswordConfirmState createState() => _ResetPasswordConfirmState();
}

class _ResetPasswordConfirmState extends State<ResetPasswordConfirm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffEFF0FF),
            body: Container(
              height: mainAxisHeight,
              width: width,
              child: Column(
                children: [
                  Container(
                    child: commonAppBar(60, 20),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: mainAxisHeight * 0.55,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: width,
                    child: Image.asset(
                      'assets/pngs/resetPasword.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 130,
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
