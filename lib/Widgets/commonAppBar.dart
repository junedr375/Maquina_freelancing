import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';

Widget commonAppBar() {
  return Container(
    height: 40,
    // padding: EdgeInsets.symmetric(horizontal: 4),
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
            fit: BoxFit.fitHeight,
          ),
        )
      ],
    ),
  );
}
