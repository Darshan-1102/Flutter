import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/pages/home_page1.dart';
import 'package:demo/store/product.dart';
import 'package:flutter/material.dart';
 class ProductProvider with ChangeNotifier{

  List<Product> feature=[];
  late Product featuredata;

  List<Product> newArchives=[];
  late Product newArchivesdata;

  Future<void> getfeaturedata() async {

   List<Product> newList=[];
   QuerySnapshot featureSnapShot= await FirebaseFirestore.instance.collection('products').
   doc('hhog20i0dceJfelMK9Si')
       .collection('featureproduct').get();
   featureSnapShot.docs.forEach((element) {
    featuredata= Product(
        name: element.get("name"),
        image: element.get("image"),
        price: element.get("price")
    );
    newList.add(featuredata);
   },
   );
   feature=newList;
   notifyListeners();
  }
  List<Product> get getfeatureList{
   return feature;
  }

  Future<void> getnewArchivesdata() async {

   List<Product> newList=[];
   QuerySnapshot newArchivesSnapShot= await FirebaseFirestore.instance.collection('products').
   doc('hhog20i0dceJfelMK9Si')
       .collection('newarchives').get();
   newArchivesSnapShot.docs.forEach((element) {
    newArchivesdata= Product(
        name: element.get("name"),
        image: element.get("image"),
        price: element.get("price")
    );
    newList.add(newArchivesdata);
   },
   );
   newArchives=newList;
   notifyListeners();
  }
  List<Product> get getnewArchivesList{
   return newArchives;
  }

 }