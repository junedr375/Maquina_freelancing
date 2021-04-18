import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ReachToHR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            subCommonAppBar(context, 60),
            SizedBox(height: 100),
            Container(
              height: 100,
              width: width,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/pngs/warn.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 50),
            Container(
                child: Text(
                    'Email Domain not registered kindly\nreach out to your HR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightBlue))),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 120),
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
          ],
        ),
      ),
    ));
  }
}
