import 'package:flutter/material.dart';
import 'package:marquina/Splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext constext) {
    return MaterialApp(
        title: 'Maq Digital',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: SplashScreen());
  }
}
