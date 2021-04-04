import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RateThisApp extends StatefulWidget {
  @override
  _RateThisAppState createState() => _RateThisAppState();
}

class _RateThisAppState extends State<RateThisApp> {
  Color backgroundColor = Colors.purple[900];
  int currentStarIndex = -1; //To Give Stars Feedback
  TextEditingController _feedBackController = TextEditingController();
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
        title: Text('Rate This App'),
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
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
                child: Text('Rate this App',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600))),
            SizedBox(height: 20),
            Container(
                height: 40,
                width: width,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.only(left: 70),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int starIndex) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            currentStarIndex = starIndex;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            currentStarIndex >= starIndex
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.purple,
                            size: 40,
                          ),
                        ));
                  },
                )),
            SizedBox(height: 30),
            Container(
                child: Text('Please leave your',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            Container(
                child: Text('Valuable Feedback',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
            SizedBox(height: 40),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[700]),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: width * 0.65,
                    padding: EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: _feedBackController,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Add Feedback'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                showFeedbackMaessage();
              },
              child: Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void showFeedbackMaessage() {
    Fluttertoast.showToast(
        msg: 'Thanks for your Input, Hope to hear you soon.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
