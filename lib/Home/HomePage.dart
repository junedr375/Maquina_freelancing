import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquina/Home/ChatScreen.dart';
import 'package:marquina/Home/ExitToAppPage.dart';

import 'package:marquina/Home/SettingsPage.dart';
import 'package:marquina/Home/NotPage.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/commonAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: appBarColor,
            //   automaticallyImplyLeading: false,
            //   title: Text(appName),
            //   actions: [
            //     Center(
            //       child: Text(
            //         'junedr375',
            //         style: TextStyle(fontSize: 16),
            //       ),
            //     ),
            //     SizedBox(width: 10),
            //   ],
            // ),
            body: Container(
      height: mainAxisHeight,
      width: width,
      child: Column(children: [
        commonAppBar(60, 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                    height: 110,
                    width: width,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('HR Policies');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 110,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 88,
                                  width: 88,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(6, 6),
                                            color: Colors.grey[300],
                                            blurRadius: 5),
                                        BoxShadow(
                                            offset: Offset(-3, -3),
                                            color: Colors.grey[300],
                                            blurRadius: 10)
                                      ]),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/pngs/HRPolicy.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                    child: Center(
                                  child: Text(
                                    'HR Policies',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.lightBlue),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print('Bussiness');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 110,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 88,
                                  width: 88,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(6, 6),
                                            color: Colors.grey[300],
                                            blurRadius: 5),
                                        BoxShadow(
                                            offset: Offset(-3, -3),
                                            color: Colors.grey[300],
                                            blurRadius: 10)
                                      ]),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/pngs/Bussiness.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                    child: Center(
                                  child: Text(
                                    'Bussiness',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.lightBlue),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                    height: 110,
                    width: width,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            print('System');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 110,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 88,
                                  width: 88,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(6, 6),
                                            color: Colors.grey[300],
                                            blurRadius: 5),
                                        BoxShadow(
                                            offset: Offset(-3, -3),
                                            color: Colors.grey[300],
                                            blurRadius: 10)
                                      ]),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/pngs/browser.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                    child: Center(
                                  child: Text(
                                    'System',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.lightBlue),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print('Chat Screen');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ChatScreen())));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 110,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 88,
                                  width: 88,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(6, 6),
                                            color: Colors.grey[300],
                                            blurRadius: 5),
                                        BoxShadow(
                                            offset: Offset(-3, -3),
                                            color: Colors.grey[300],
                                            blurRadius: 10)
                                      ]),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/pngs/chatbot.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                    child: Center(
                                  child: Text(
                                    'Ask Amiga',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.lightBlue),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                    height: 40,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // InkWell(
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: ((context) => NotPageScreen())));
                        //     },
                        //     child: Container(
                        //       height: 40,
                        //       child: Icon(
                        //         Icons.notifications,
                        //         size: 30,
                        //       ),
                        //     )),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ExitToAppPage())));
                              //     exitAppConfirm();
                            },
                            child: Container(
                              height: 40,
                              child: Icon(
                                Icons.exit_to_app_rounded,
                                size: 30,
                              ),
                            )),
                      ],
                    )),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ]),
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
