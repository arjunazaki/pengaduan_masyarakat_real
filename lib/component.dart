import 'dart:ui';
import 'package:flutter/material.dart';

var Outline = OutlineInputBorder(
  borderRadius: BorderRadius.circular(9),
);

var Focused = OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: BorderSide(width: 1, color: navyColor));

var textpengaduan =
    TextStyle(fontFamily: 'Poppins', fontSize: 40, color: Colors.black);

var hint = TextStyle(color: background, fontFamily: 'Itim', fontSize: 16);
var roletext = TextStyle(
    color: Color.fromRGBO(74, 107, 138, 1), fontFamily: 'Itim', fontSize: 15);
var background = Color.fromRGBO(238, 238, 238, 1);
var orenColor = Color.fromRGBO(255, 95, 0, 1);
var merahColor = Color.fromRGBO(178, 6, 0, 1);
var merah50Color = Color.fromRGBO(178, 6, 0, 0.5
);
var navyColor = Color.fromRGBO(0, 9, 44, 1);
var shadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0);

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
