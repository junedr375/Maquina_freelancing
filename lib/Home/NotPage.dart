import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

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
            body: Container(
                height: mainAxisHeight,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/pngs/threeDot.png'))),
                child: Column(children: [
                  subCommonAppBar(context, 60),
                  Expanded(
                    child: Container(
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
                                  color: componentColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Notification will be shown here $index',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ]))));
  }
}
