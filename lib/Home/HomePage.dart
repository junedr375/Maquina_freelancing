import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/ChatScreen.dart';

import 'package:marquina/Home/SettingsPage.dart';
import 'package:marquina/Home/NotPage.dart';
import 'package:marquina/Utils/Utility.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color appBarColor = Colors.purple[900];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              automaticallyImplyLeading: false,
              title: Text(appName),
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
                      height: 80,
                      width: width,
                      child: Row(
                        children: [
                          InkWell(
                              child: Container(
                                  height: 80,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.format_list_bulleted_rounded,
                                        size: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text('HR Policies')
                                    ],
                                  ))),
                          Spacer(),
                          InkWell(
                              child: Container(
                                  height: 80,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.business_sharp,
                                        size: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Bussiness')
                                    ],
                                  ))),
                        ],
                      )),
                  SizedBox(height: 30),
                  Container(
                      height: 80,
                      width: width,
                      child: Row(
                        children: [
                          InkWell(
                              child: Container(
                                  height: 80,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.system_update_alt_rounded,
                                        size: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text('HR Policies')
                                    ],
                                  ))),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => ChatScreen())));
                              },
                              child: Container(
                                  height: 80,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.ac_unit_rounded,
                                        size: 50,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Ask Amiga')
                                    ],
                                  ))),
                        ],
                      )),
                  Spacer(),
                  Container(
                      height: 40,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            NotPageScreen())));
                              },
                              child: Container(
                                height: 40,
                                child: Icon(
                                  Icons.notifications,
                                  size: 30,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => SettingPage())));
                              },
                              child: Container(
                                height: 40,
                                child: Icon(
                                  Icons.settings,
                                  size: 30,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                exitAppConfirm();
                              },
                              child: Container(
                                height: 40,
                                child: Icon(
                                  Icons.toggle_off,
                                  size: 30,
                                ),
                              )),
                        ],
                      )),
                  SizedBox(height: 10),
                ],
              ),
            )));
  }

  Future<void> exitAppConfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Are you sure, You want to exit!!'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            content: Container(
                height: 60,
                child: Column(
                  children: [
                    Row(children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                              msg: 'Thank You!!!\n Hope to see you soon.',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.purple[900],
                              textColor: Colors.white,
                              fontSize: 16.0);

                          Future.delayed(const Duration(milliseconds: 1200),
                              () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple[700]),
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple[700]),
                            child: Text(
                              'Calcel',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ])
                  ],
                )));
      },
    );
  }
}
