import 'package:demo/models/catalog.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  // final String name= "Darshan";
  @override
  Widget build(BuildContext context){
    final dummyList= List.generate(4, (index) => CatalogueModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book  Buddy",),
        titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index){
              return ItemWidget(item: dummyList[index] );
            }
            ,

          ),
        ),
      drawer: MyDrawer(),
      );
  }

}