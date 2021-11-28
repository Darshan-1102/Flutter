import 'package:demo/models/catalog.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/item_widget.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget{
  // final String name= "Darshan";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
  }
  loadData() async{
    var catalogueJson = await rootBundle.loadString("assets/files/catalogue.json");
    var decodeData = jsonDecode(catalogueJson);
    var productsData = decodeData["products"];
    CatalogueModel.items= List.from(productsData).map((item) => Item.fromMap(item)).cast<Item>().toList();
  }

  @override
  Widget build(BuildContext context){
    void initState(){
      super.initState();
      loadData().whenCompleted((){
        setState(() {});
      }
      );
    }
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
              return ItemWidget(item: CatalogueModel.items[index] );
            },
          ),
        ),
      drawer: MyDrawer(),
      );
  }
}