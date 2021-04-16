import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marquina/Home/WebView.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class GoToTCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            child: subCommonAppBar(context, 60),
          ),
          SizedBox(height: mainAxisHeight * 0.25),
          Container(
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
              text: 'Click here it goes \n',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffF89612)),
              children: <TextSpan>[
                TextSpan(
                  text: 'to',
                ),
                TextSpan(
                    text: ' maq.ai',
                    style: TextStyle(color: Colors.lightBlue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    WebViewDetails('http://MAQ.AI'))));
                      }),
                TextSpan(text: ' page.'),
              ],
            )),
          ),
        ],
      ),
    ));
  }
}
