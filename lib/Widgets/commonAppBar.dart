import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';

Widget commonAppBar(double height, double padding) {
  return Container(
    height: height,
    color: Colors.grey[100],
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          appName,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800]),
        ),
        Spacer(),
        Container(
          height: 40,
          width: 100,
          child: Image.asset(
            'assets/pngs/logoM.png',
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    ),
  );
}
