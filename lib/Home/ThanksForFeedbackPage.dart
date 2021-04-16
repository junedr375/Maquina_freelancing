import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ThanksForFeedbackPage extends StatefulWidget {
  @override
  _ThanksForFeedbackPageState createState() => _ThanksForFeedbackPageState();
}

class _ThanksForFeedbackPageState extends State<ThanksForFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            height: 60,
            child: subCommonAppBar(context),
          ),
          SizedBox(height: 50),
          Container(
            height: mainAxisHeight * 0.25,
            width: width,
            margin: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(43)),
                border: Border.all(width: 1.5, color: Colors.grey[500])),
            child: Text(
              'Thank you for your \ninputs.\n\n Hope to hear you soon',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xffF89612)),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/pngs/threeDot.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    ));
  }
}
