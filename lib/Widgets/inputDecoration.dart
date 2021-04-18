import 'package:flutter/material.dart';
import 'package:marquina/Utils/Utility.dart';

InputDecoration authInputDecoration(String name, Icon icon) {
  return InputDecoration(
    border: InputBorder.none,
    fillColor: componentColor,
    prefixIcon: icon,
    hintText: name,
    // errorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.red, width: 2),
    // ),
    errorStyle: TextStyle(color: Colors.red, fontSize: 10),
    hintStyle: TextStyle(fontSize: 20, color: componentColor),
  );
}
