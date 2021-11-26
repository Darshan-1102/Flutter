import 'package:demo/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  // final String name= "Darshan";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,        //elevation shadow can be turned off by elevation: 0.0
        iconTheme: IconThemeData(color: Colors.purple),
        title: Text(
            "Book  Buddy",
          style: TextStyle(color: Colors.purple),
        ),
      ),
        body: Center(
          child: Container(
            child: Text("Welcome to Book Buddy"),
          ),
        ),
      drawer: MyDrawer(),
      );
  }

}