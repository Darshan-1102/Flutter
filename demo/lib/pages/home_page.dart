import 'package:demo/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  // final String name= "Darshan";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Book  Buddy"),
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