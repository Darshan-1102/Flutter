import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/store/product.dart';
import 'package:flutter/material.dart';
class CategoryProvider with ChangeNotifier{

  List<Product> firstyear=[];
  late Product firstyeardata;

  List<Product> secondyear=[];
  late Product secondyeardata;

  List<Product> thirdyear=[];
  late Product thirdyeardata;

  List<Product> fourthyear=[];
  late Product fourthyeardata;

  Future<void> getfirstyeardata() async {

    List<Product> newList=[];
    QuerySnapshot firstyearSnapShot= await FirebaseFirestore.instance.collection('category').
                              doc('9xfkRxjpyaJuC7liUXXd')
                              .collection('firstyear').get();
    firstyearSnapShot.docs.forEach((element) {
      firstyeardata= Product(
          name: element.get("name"),
          image: element.get("image"),
          price: element.get("price")
        );
      newList.add(firstyeardata);
      },
    );
    firstyear=newList;
  }
    List<Product> get getfirstyearList{
      return firstyear;
    }

    //Second year
  Future<void> getsecondyeardata() async {

    List<Product> newList=[];
    QuerySnapshot secondyearSnapShot= await FirebaseFirestore.instance.collection('category').
      doc('9xfkRxjpyaJuC7liUXXd')
        .collection('secondyear').get();
        secondyearSnapShot.docs.forEach((element) {
      secondyeardata= Product(
          name: element.get("name"),
          image: element.get("image"),
          price: element.get("price")
      );
      newList.add(secondyeardata);
      },
    );
      secondyear=newList;
    }
        List<Product> get getsecondyearList{
          return secondyear;
    }


  //third year
  Future<void> getthirdyeardata() async {

    List<Product> newList=[];
    QuerySnapshot thirdyearSnapShot= await FirebaseFirestore.instance.collection('category').
    doc('9xfkRxjpyaJuC7liUXXd')
        .collection('thirdyear').get();
    thirdyearSnapShot.docs.forEach((element) {
      thirdyeardata= Product(
          name: element.get("name"),
          image: element.get("image"),
          price: element.get("price")
      );
      newList.add(thirdyeardata);
    },
    );
    thirdyear=newList;
  }
  List<Product> get getthirdyearList{
    return thirdyear;
  }

  //fourth year
  Future<void> getfourthyeardata() async {

    List<Product> newList=[];
    QuerySnapshot fourthyearSnapShot= await FirebaseFirestore.instance.collection('category').
    doc('9xfkRxjpyaJuC7liUXXd')
        .collection('fourthyear').get();
    fourthyearSnapShot.docs.forEach((element) {
      fourthyeardata= Product(
          name: element.get("name"),
          image: element.get("image"),
          price: element.get("price")
      );
      newList.add(fourthyeardata);
    },
    );
    fourthyear=newList;
  }
  List<Product> get getfourthyearList{
    return fourthyear;
  }

}