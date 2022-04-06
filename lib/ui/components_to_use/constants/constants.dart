import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const String tableName = 'cart';
const String columnThingName = 'thingName';
const String columnPic = 'pic';
const String columnQuantity = 'quantity';
const String columnID = 'id';
const String columnPrice = 'price';
const String textType = 'TEXT NOT NULL';
const String integerType = 'INTEGER NOT NULL';
const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
/////////////////////////////

Color primaryColor = const Color.fromRGBO(255, 51, 51, .8);
var color = const Color(0xff453658);

Color color1 = const Color(0xFF69c5df);
Color color2 = const Color(0xFffbc33e);
Color color3 = const Color(0xff392850);
Color color4 = const Color(0xff390050);
Color color5 = Colors.blueGrey.shade900;
Color color6 = Colors.blueGrey.shade700;
Color color9 = Colors.grey.shade500;
Color color10 = Colors.indigo;
//to have ready themes and fonts to use.

Color? bluishClr = const Color(0xff4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
Color? primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
Color color7 = Colors.indigo.shade400;
const Color color8 = Color.fromRGBO(255, 51, 51, .8);
const lightsky = Color(0xFFA6C0FF);
const whiteshade = Color(0xFFF8F9FA);
const blue = Color(0xFF497fff);
const lightblueshade = Color(0xFF758CC8);
const grayshade = Color(0xFFEBEBEB);
const lightblue = Color(0xFF4B68D1);
const blackshade = Color(0xFF555555);
const hintText = Color(0xFFC7C7CD);

class Themes {
  static final light = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigoAccent.shade100),
      scaffoldBackgroundColor: color7,
      appBarTheme: AppBarTheme(backgroundColor: color7));
  static final dark = ThemeData(
    scaffoldBackgroundColor: darkHeaderClr,
    appBarTheme: const AppBarTheme(backgroundColor: darkHeaderClr),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkHeaderClr),

    // primaryColor: darkGreyClr,
    // backgroundColor: darkGreyClr,
    // brightness: Brightness.dark
  );
}

const headerTextStyle =
    TextStyle(color: whiteshade, fontSize: 28, fontWeight: FontWeight.w700);

const textFieldHeading =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

const textFieldHintStyle =
    TextStyle(color: hintText, fontSize: 14, fontWeight: FontWeight.w500);

const authButtonTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: whiteshade);
TextStyle style2 = GoogleFonts.syneMono(
    textStyle: const TextStyle(
        color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.bold));

TextStyle get largeHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get semiLargeHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.syneMono(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color5,
  ));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color6,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get body1Style {
  return GoogleFonts.abel(
      textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ));
}

TextStyle get body2Style {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      color: Colors.white38,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );
}

//size of the device used
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
