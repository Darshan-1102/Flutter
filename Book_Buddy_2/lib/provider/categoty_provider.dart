import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/categoryicons.dart';
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

  List<CategoryIcon> firstyearIcon= [];
  late CategoryIcon firstyearIconData;

  Future<void> getfirstyearIcondata() async {

    List<CategoryIcon> newList=[];
    QuerySnapshot firstyearSnapShot= await FirebaseFirestore.instance.collection('categotyicon').
        doc('mK3DUNQYG5DDAHTM7kcx')
        .collection('firstyear').get();
    firstyearSnapShot.docs.forEach((element) {
      firstyearIconData= CategoryIcon(
          image: element.get("image"),

      );
      newList.add(firstyearIconData);
    },
    );
    firstyearIcon=newList;
    //notifyListeners();
  }
  List<CategoryIcon> get getfirstyearIcon{
    return firstyearIcon;
  }

  List<CategoryIcon> secondyearIcon=[];
  late CategoryIcon secondyearIconData;
  Future<void> getsecondyearIconData() async {

    List<CategoryIcon> newList=[];
    QuerySnapshot secondyearSnapShot= await FirebaseFirestore.instance.collection('categotyicon').
    doc('mK3DUNQYG5DDAHTM7kcx')
        .collection('secondyear').get();
    secondyearSnapShot.docs.forEach((element) {
      secondyearIconData= CategoryIcon(
        image: element.get("image"),
      );

      newList.add(secondyearIconData);
    },
    );
    secondyearIcon=newList;
    //notifyListeners();
  }
  List<CategoryIcon> get getsecondyearIcon{
    return secondyearIcon;
  }



  List<CategoryIcon> thirdyearIcon=[];
  late CategoryIcon thirdyearIconData;
  Future<void> getthirdyearIconData() async {

    List<CategoryIcon> newList=[];
    QuerySnapshot thirdyearSnapShot= await FirebaseFirestore.instance.collection('categotyicon').
    doc('mK3DUNQYG5DDAHTM7kcx')
        .collection('thirdyear').get();
    thirdyearSnapShot.docs.forEach((element) {
      thirdyearIconData= CategoryIcon(
        image: element.get("image"),
      );

      newList.add(thirdyearIconData);
    },
    );
    thirdyearIcon=newList;
    //notifyListeners();
  }
  List<CategoryIcon> get getthirdyearIcon{
    return thirdyearIcon;
  }


  List<CategoryIcon> fourthyearIcon=[];
  late CategoryIcon fourthyearIconData;
  Future<void> getfourthyearIconData() async {

    List<CategoryIcon> newList=[];
    QuerySnapshot fourthyearSnapShot= await FirebaseFirestore.instance.collection('categotyicon').
    doc('mK3DUNQYG5DDAHTM7kcx')
        .collection('fourthyear').get();
    fourthyearSnapShot.docs.forEach((element) {
      fourthyearIconData= CategoryIcon(
        image: element.get("image"),
      );

      newList.add(fourthyearIconData);
    },
    );
    fourthyearIcon=newList;
    //notifyListeners();
  }
  List<CategoryIcon> get getfourthyearIcon{
    return fourthyearIcon;
  }


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
    //notifyListeners();
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
    //notifyListeners();
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
    //notifyListeners();
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
    //notifyListeners();
  }
  List<Product> get getfourthyearList{
    return fourthyear;
  }

}