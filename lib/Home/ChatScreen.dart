import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquina/Utils/Utility.dart';

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
  bool isInternetConnected = true;

  List botIntent = [
    {"isMe": false, "text": "Hello"},
    {"isMe": false, "text": "Welcome to ChatBot Screen"},
    {"isMe": false, "text": "Add your Query Here"},
  ];

  List list = [];

  Color backGroundColor = Colors.purple[900];

  @override
  void initState() {
    setState(() {
      loading = false;
    });

    list.add(botIntent[0]);
    list.add(botIntent[1]);
    list.add(botIntent[2]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backGroundColor,
          automaticallyImplyLeading: true,
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
        body: ListView(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                                  ? Colors.indigo[400]
                                  : Colors.indigo[100],
                              borderRadius: list[indexChild]['isMe']
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(23),
                                      topRight: Radius.circular(23),
                                      bottomLeft: Radius.circular(23))
                                  : BorderRadius.only(
                                      topLeft: Radius.circular(23),
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
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: backGroundColor, width: 1)),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.keyboard,
                    color: backGroundColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: TextField(
                      controller: messageController,
                      cursorColor: Colors.red[500],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Message Here',
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.send,
                      color: backGroundColor,
                      size: 35,
                    ),
                    onTap: () {
                      print(messageController.text);

                      setState(() {
                        list.add(
                          {"isMe": true, "text": messageController.text.trim()},
                        );
                      });
                      messageController.clear();
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.mic,
                    color: backGroundColor,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
