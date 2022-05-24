import 'package:flutter/material.dart';

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(147, 205, 72, .1),
  100: Color.fromRGBO(147, 205, 72, .2),
  200: Color.fromRGBO(147, 205, 72, .3),
  300: Color.fromRGBO(147, 205, 72, .4),
  400: Color.fromRGBO(147, 205, 72, .5),
  500: Color.fromRGBO(147, 205, 72, .6),
  600: Color.fromRGBO(147, 205, 72, .7),
  700: Color.fromRGBO(147, 205, 72, .8),
  800: Color.fromRGBO(147, 205, 72, .9),
  900: Color.fromRGBO(147, 205, 72, 1),
};

const Color bluishClr = Color(0xFF4E5AE8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFFF4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
MaterialColor primaryMaterialClr = MaterialColor(0xFF4E5AE8, colorCodes);
const Color darkGreyClr = Color(0xFF121212);
MaterialColor darkGreyMaterialClr = MaterialColor(0xFF121212, colorCodes);
const Color darkHeaderClr = Color(0xFF424242);


class Themes {
  static final light =  ThemeData(
    primarySwatch: primaryMaterialClr,
    primaryColor: primaryClr,
    brightness: Brightness.light
  );

  static final dark = ThemeData(
    primarySwatch: darkGreyMaterialClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark
  );
}