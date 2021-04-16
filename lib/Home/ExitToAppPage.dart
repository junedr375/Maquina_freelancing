import 'package:flutter/material.dart';
import 'package:marquina/Home/ExitingAppPage.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ExitToAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            child: subCommonAppBar(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          Container(
              alignment: Alignment.center,
              child: Text('Do you want to exit',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo[700]))),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ExitingAppPage())));
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.lightBlue),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
