import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Darshan";

    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to $name app"),
          ),
        ),
      ),
    );
  }
}
