import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/cart.dart';
import 'package:demo/models/cartmodel.dart';
import 'package:demo/models/user_model.dart';
import 'package:demo/pages/home_page1.dart';
import 'package:demo/store/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{

  List<Product> feature=[];
  late Product featuredata;

  List<Product> newArchives=[];
  late Product newArchivesdata;

  List<CartModal> cartModalList= [];
  late CartModal cartModal;

  List<CartModal> checkOutModalList= [];
  late CartModal checkOutModal;

  List<UserModel> userModalList= [];
  late UserModel userModal;

  Future<void> getUserData() async{
    List<UserModel> newList=[];
    User? currentUser= FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapshot= await FirebaseFirestore.instance.collection("users").get();
    userSnapshot.docs.forEach((element) {
      if(currentUser?.email== element.get("email")){
        userModal= UserModel(
          firstName: element.get("firstName"),
          secondName: element.get("secondName"),
          email: element.get("email"),
          userImage: element.get("userimage")
        );
        newList.add(userModal);
      }
      userModalList=newList;
    },
    );
  }

  List<UserModel> get getUserModalList{
    return userModalList;
  }

  void deleteCartProduct(int index){
    cartModalList.removeAt(index);
    notifyListeners();
  }


  void getCheckOutData(
      {required int quantity, required int price, required String name, required String image})
  {
    checkOutModal= CartModal(name: name, image: image, price: price, quantity: quantity);
    checkOutModalList.add(checkOutModal);
  }

  List<CartModal> get getcheckOutModalList{
    return List.from(checkOutModalList);
  }

  int get getCheckOutModalListLength{
    return checkOutModalList.length;
  }


  void getCartData({required String name, required String image, required int price, required int quantity}) {
   cartModal= CartModal(name: name, image: image,price: price,quantity:  quantity);
   cartModalList.add(cartModal);

  }

  List<CartModal> get getCartModalList{
   return List.from(cartModalList);
  }

  int get getCartModalListLength{
    return cartModalList.length;
  }
  void clearCartProduct(){
    cartModalList.clear();
    notifyListeners();
  }



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
   //notifyListeners();
  }

   List<Product> get getfeatureList{
    return feature;
   }

  List<Product> homeFeature=[];
  late Product homeFeaturedata;

  Future<void> getHomeFeaturedata() async {

   List<Product> newList=[];
   QuerySnapshot featureSnapShot= await FirebaseFirestore.instance.collection('homefeature').get();
   featureSnapShot.docs.forEach((element) {
    homeFeaturedata= Product(
        name: element.get("name"),
        image: element.get("image"),
        price: element.get("price")
    );
    newList.add(homeFeaturedata);
     },
   );
   homeFeature=newList;
   //notifyListeners();
  }

  List<Product> get getHomeFeatureList{
   return homeFeature;
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
   //notifyListeners();
  }
  List<Product> get getnewArchivesList{
   return newArchives;
  }

  List<Product> homeArchives=[];
  late Product homeArchivesdata;

  Future<void> gethomeArchivesdata() async {

   List<Product> newList=[];
   QuerySnapshot newArchivesSnapShot= await FirebaseFirestore.instance.collection('homearchives').get();
   newArchivesSnapShot.docs.forEach((element) {
    homeArchivesdata= Product(
        name: element.get("name"),
        image: element.get("image"),
        price: element.get("price")
      );
        newList.add(homeArchivesdata);
     },
   );
   homeArchives=newList;
   //notifyListeners();
  }
  List<Product> get gethomeArchivesList{
   return homeArchives;
  }

  List<String> notificationList=[];
  void addNotification(String notification){
    notificationList.add(notification);
  }
  int get getNotificationIndex{
    return notificationList.length;
  }


  late List<Product> searchList;
  void getSearchList({required List<Product> list}){
    searchList= list;
  }

  List<Product> searchProductList(String query){
    List<Product> searchFirstYear= searchList.where((element){
      return element.name.toUpperCase().contains(query)||element.name.toLowerCase().contains(query);
    }).toList();
    return searchFirstYear;
  }




 }