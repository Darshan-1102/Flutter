import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) =>ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.cyanAccent,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,     //instead of doing it from home_page we are doing from here
    ),
  );

  static ThemeData darkTheme(BuildContext context) =>ThemeData(
    brightness: Brightness.dark,
  );
}
