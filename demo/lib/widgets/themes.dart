
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) =>ThemeData(
    cardColor: Colors.white,
    canvasColor: MyTheme.lightPurple,
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      color: Colors.cyanAccent,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(
        color: Colors.purple,
        //Theme.of(context).textTheme,
      )      //instead of doing it from home_page we are doing from here
    ),
  );

  static ThemeData darkTheme(BuildContext context) =>ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkColor,
    appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        toolbarTextStyle: TextStyle(
          color: Colors.purple,
          //Theme.of(context).textTheme,
        )      //instead of doing it from home_page we are doing from here
    ),
  );

  static Color creamColor= const Color(0xfff5f5f5);
  static Color darkBluishColor= const Color(0xff403b58);
  static Color lightPurpleColor= const Color(0xff9c27b0);
  static Color lightPurple= const Color(0xffd1c4e9);
  static Color greenshadeColor= const Color(0xffb2ff59);
  static Color lightOrangeColor= const Color(0xffffccbc);
  static Color darkColor=  Vx.gray900;

}
