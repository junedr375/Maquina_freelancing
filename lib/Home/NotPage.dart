import 'package:flutter/material.dart';

class NotPageScreen extends StatefulWidget {
  @override
  _NotPageScreenState createState() => _NotPageScreenState();
}

class _NotPageScreenState extends State<NotPageScreen> {
  Color backGroundColor = Colors.purple[900];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        automaticallyImplyLeading: true,
        title: Text('Notification'),
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
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 8),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple[400],
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Notification will be shown here $index',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              );
            }),
      ),
    ));
  }
}
