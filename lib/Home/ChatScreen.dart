import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquina/Utils/Utility.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

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
    {"isMe": false, "text": "We Will Surely Help you, on this"},
    {"isMe": false, "text": "Thank you for asking"},
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
        backgroundColor: Color(0xffEFF6FF),
        body: ListView(
          children: [
            Container(
              height: 60,
              color: Colors.white,
              child: subCommonAppBar(context),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.78,
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
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                            print(messageController.text);

                            setState(() {
                              list.add(
                                {
                                  "isMe": true,
                                  "text": messageController.text.trim()
                                },
                              );
                              list.add(botIntent[3]);
                              list.add(botIntent[4]);
                            });
                            messageController.clear();
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
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
          ],
        ));
  }
}
