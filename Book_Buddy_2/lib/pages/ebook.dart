import 'package:flutter/material.dart';

class Ebook extends StatelessWidget{
  const Ebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Books"),
        foregroundColor: Colors.purple,
        backgroundColor: Colors.white30,
      ),
    );
  }
  
}