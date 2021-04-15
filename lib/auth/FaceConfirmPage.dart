import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';

class FaceConfirmPage extends StatefulWidget {
  @override
  _FaceConfirmPageState createState() => _FaceConfirmPageState();
}

class _FaceConfirmPageState extends State<FaceConfirmPage> {
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: commonAppBar(),
            ),
            SizedBox(height: 10),
            Container(
              height: mainAxisHeight * 0.10,
              width: width,
              child: Image.asset(
                'assets/pngs/singleDot.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 50),
            Container(
                child: Center(
              child: Text(
                  'Thank you for sign-up.\nConfirmation mail will be\nsent to your mail After\nverification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue[300])),
            )),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 130,
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
            Expanded(
              child: Container(
                width: width,
                child: Image.asset(
                  'assets/pngs/threeDot.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
