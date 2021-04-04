import 'package:flutter/material.dart';

class HelpDetails extends StatefulWidget {
  @override
  _HelpDetailsState createState() => _HelpDetailsState();
}

class _HelpDetailsState extends State<HelpDetails> {
  Color backgroundColor = Colors.purple[900];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: backgroundColor,
        title: Text('Help'),
        actions: [
          Center(
            child: Text(
              'junedr375',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
          height: mainAxisHeight,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Q) What the bot do ?',
                  style: questionStyle(),
                )),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' A)  It meant to help user to understand the app better. And solve the queries',
                  style: answerStyle(),
                )),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Q) What App Aims to do ?',
                  style: questionStyle(),
                )),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' A)  This is user friendly App which solve the query with Chat Bot Interface.',
                  style: answerStyle(),
                )),
          ])),
    ));
  }

  TextStyle questionStyle() {
    return TextStyle(
        fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600);
  }

  TextStyle answerStyle() {
    return TextStyle(
        fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.w600);
  }
}
