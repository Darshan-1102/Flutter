

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllData extends StatefulWidget{
  @override
  _AllDataState createState()=> _AllDataState();
}

class _AllDataState extends State<AllData>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Buddy"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('text').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: Text("No Value Present"),
            );
          }
          return ListView(
            children:
            snapshot.data!.docs.map((document){
              return Text(document['field1']);
            }).toList(),
          );
        },
      ),

      // FutureBuilder(
      //   future: FirebaseFirestore.instance.collection('products')
      //       .doc('hhog20i0dceJfelMK9Si')
      //   .collection('featureproduct').get(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  },
      //
      // )
    );
  }
}

