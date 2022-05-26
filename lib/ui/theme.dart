import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

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
    backgroundColor: Colors.white,
    brightness: Brightness.light
  );

  static final dark = ThemeData(
    primarySwatch: darkGreyMaterialClr,
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400]: Colors.grey
    )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white: Colors.black
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.white: Colors.black
      )
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100]: Colors.grey[400]
      )
  );
}