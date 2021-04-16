import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/ThanksForFeedbackPage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class RateThisApp extends StatefulWidget {
  @override
  _RateThisAppState createState() => _RateThisAppState();
}

class _RateThisAppState extends State<RateThisApp> {
  int currentStarIndex = -1; //To Give Stars Feedback
  TextEditingController _feedBackController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                child: Form(
                    key: formKey,
                    child: Column(children: [
                      Container(
                        child: subCommonAppBar(context, 60),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            children: [
                              SizedBox(height: 20),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text('Rate this App',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(height: 20),
                              Container(
                                height: mainAxisHeight * 0.30,
                                width: width,
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Image.asset(
                                  'assets/pngs/rateApp.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                  height: 60,
                                  width: width,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  padding: EdgeInsets.only(left: 40),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey[400], width: 2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int starIndex) {
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
                                              color: Color(0xffF89612),
                                              size: 40,
                                            ),
                                          ));
                                    },
                                  )),
                              SizedBox(height: 20),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text('Please leave any specific view',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(height: 20),
                              Container(
                                height: 100,
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey[700]),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: width * 0.65,
                                      padding: EdgeInsets.only(left: 15),
                                      child: TextFormField(
                                        validator: (value) => value.length <= 10
                                            ? '* Atleast 10 character'
                                            : null,
                                        controller: _feedBackController,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Add Feedback'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  submitForm();
                                },
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 120),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: componentColor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(2, 5),
                                            color: Colors.grey[400],
                                            blurRadius: 10)
                                      ]),
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))));
  }

  void submitForm() {
    final formState = formKey.currentState;

    if (formState.validate()) {
      try {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => ThanksForFeedbackPage())));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  // void showFeedbackMaessage() {
  //   Fluttertoast.showToast(
  //       msg: 'Thanks for your Input, Hope to hear you soon.',
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 2,
  //       backgroundColor: backgroundColor,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }
}
