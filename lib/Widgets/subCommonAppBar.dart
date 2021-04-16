import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';

Widget subCommonAppBar(BuildContext context) {
  return Container(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        IconButton(
            icon: Icon(Icons.arrow_forward_outlined,
                size: 25, color: Colors.grey[800]),
            onPressed: () {
              Navigator.pop(context);
            }),
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
