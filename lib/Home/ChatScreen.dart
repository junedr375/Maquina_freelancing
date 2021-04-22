import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Utils/helperFunction.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';
import 'package:marquina/Utils/backendFunctions.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //String message;
  TextEditingController messageController = new TextEditingController();
  bool loading = true;
  String myAddedList = 'dummy';
  String myCoinForAddedList;
  String myCurrencyForAddedList;
  String sessionId = '';

  ScrollController scrollController = ScrollController();

  List botIntent = [
    {"isMe": false, "text": "Hello"},
    {"isMe": false, "text": "Welcome to ChatBot Screen"},
    {"isMe": false, "text": "Add your Query Here"},
    {"isMe": false, "text": "We Will Surely Help you, on this"},
    {"isMe": false, "text": "Thank you for asking"},
  ];

  List list = [];

  Color backGroundColor = Colors.purple[900];
  int seconds = 600; //For poping out

  @override
  void initState() {
    getSessionIdHere();
    setState(() {
      loading = false;
    });

    list.add(botIntent[0]);
    list.add(botIntent[1]);
    list.add(botIntent[2]);
    super.initState();
    resetTimer();
  }

  getSessionIdHere() async {
    sessionId = await getSessionId();
    setState(() {});
  }

  void resetTimer() {
    print('here');
    Future.delayed(Duration(seconds: seconds), () async {
      var res = await updateSession(sessionId);
      print(res.toString());
      //Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffEFF6FF),
            body: Column(
              children: [
                Container(
                  child: subCommonAppBar(context, 60),
                ),
                Expanded(
                    //height: MediaQuery.of(context).size.height * 0.78,
                    child: ListView.builder(
                        controller: scrollController,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int indexChild) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: list[indexChild]['isMe'] ? 0 : 10,
                                right: list[indexChild]['isMe'] ? 10 : 0),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            width: MediaQuery.of(context).size.width,
                            alignment: list[indexChild]['isMe']
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              decoration: BoxDecoration(
                                  color: list[indexChild]['isMe']
                                      ? Color(0xff8FDDFA)
                                      : Color(0xffF9D4A2),
                                  borderRadius: list[indexChild]['isMe']
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(23),
                                          bottomRight: Radius.circular(23),
                                          bottomLeft: Radius.circular(23))
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(23),
                                          topRight: Radius.circular(23),
                                          bottomRight: Radius.circular(23))),
                              child: Text(
                                list[indexChild]['text'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        })),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff948C8C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(23),
                          bottomRight: Radius.circular(23)),
                      border: Border.all(color: backGroundColor, width: 1)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Stack(children: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              controller: messageController,
                              cursorColor: Colors.red[500],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Your Message Here',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              child: Container(
                                height: 42,
                                width: 42,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff403B3B),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'assets/pngs/send.png',
                                  fit: BoxFit.scaleDown,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              onTap: () {
                                if (messageController.text.length > 0) {
                                  sendMessage();
                                }
                              },
                            ),
                          )
                        ]),
                      ),
                      Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            )));
  }

  void sendMessage() async {
    print(messageController.text);
    setState(() {
      list.add(
        {"isMe": true, "text": messageController.text.trim()},
      );
    });
    messageController.clear();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    var res = await getAnswer(sessionId, messageController.text);
    print(res);
    if (res['status'] == 200) {
      setState(() {
        list.add({"isMe": false, "text": res['data']['answer']});
        seconds = 5; //For updating popping out time
        resetTimer();
      });
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 200.0,
          duration: Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
        );
      }
    } else {
      setState(() {
        list.add({"isMe": false, "text": "Error connection server"});
        seconds = 600; //For updating popping out time
      });
    }
  }
}
