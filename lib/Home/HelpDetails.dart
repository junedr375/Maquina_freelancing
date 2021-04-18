import 'package:flutter/material.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class HelpDetails extends StatefulWidget {
  @override
  _HelpDetailsState createState() => _HelpDetailsState();
}

class _HelpDetailsState extends State<HelpDetails> {
  int currentHelpIndex = -1;

  Map<int, dynamic> helps = {
    0: {
      'header': 'What the bot do',
      'body':
          'It meant to help user to understand the app better. And solve the quries.'
    },
    1: {
      'header': 'What App Aims to do ?',
      'body':
          'This is user friendly App which solve the query with Chat Bot Interface.'
    },
    2: {
      'header': 'Why is the Bot For ?',
      'body': 'Bot is for updating the user in user friendly manner.'
    },
  };
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
          child: Column(children: [
            Container(child: subCommonAppBar(context, 60)),
            // SizedBox(height: 20),
            Container(
              height: mainAxisHeight * 0.25,
              width: width,
              child: Image.asset(
                'assets/pngs/help.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 10),
            for (int i = 0; i < helps.length; i++)
              InkWell(
                onTap: () {
                  setState(() {
                    currentHelpIndex = i;
                  });
                },
                child: Container(
                    height: currentHelpIndex == i ? 170 : 70,
                    width: width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: currentHelpIndex == i
                            ? Colors.blue[200]
                            : Colors.white,
                        border: Border(
                          left: BorderSide(color: Color(0xffF89612), width: 5),
                          top: BorderSide(color: Colors.lightBlue, width: 3),
                          bottom: BorderSide(color: Colors.lightBlue, width: 3),
                          right: BorderSide(color: Colors.lightBlue, width: 3),
                        )),
                    child: currentHelpIndex != i
                        ? Row(
                            children: [
                              Text(
                                'Q. ' + helps[i]['header'],
                                style: questionStyle(),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                size: 30,
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Q. ' + helps[i]['header'],
                                    style: questionStyle(),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.navigate_next,
                                    size: 30,
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.lightBlue,
                                thickness: 2,
                              ),
                              Text(
                                'A. ' + helps[i]['body'],
                                style: answerStyle(),
                              ),
                            ],
                          )),
              ),
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
