
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) =>ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.cyanAccent,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,     //instead of doing it from home_page we are doing from here
    ),
  );

  static ThemeData darkTheme(BuildContext context) =>ThemeData(
    brightness: Brightness.dark,
  );

  static Color creamColor= const Color(0xfff5f5f5);
  static Color darkBluishColor= const Color(0xff403b58);
  static Color lightPurpleColor= const Color(0xff9c27b0);
  static Color lightPurple= const Color(0xffd1c4e9);
  static Color greenshadeColor= const Color(0xffb2ff59);
}
