import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquina/Widgets/subCommonAppBar.dart';

class ExitingAppPage extends StatefulWidget {
  @override
  _ExitingAppPageState createState() => _ExitingAppPageState();
}

class _ExitingAppPageState extends State<ExitingAppPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            child: subCommonAppBar(context, 60),
          ),
          Expanded(
            child: Image.asset('assets/pngs/thankYou.png', fit: BoxFit.fill),
          )
        ],
      ),
    ));
  }
}
