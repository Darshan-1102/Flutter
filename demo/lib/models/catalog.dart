import 'package:flutter/cupertino.dart';

class CatalogueModel{
   static late List<Item> items= [
     Item(
         id: "1",
         name: "Engineering Mathematics 1",
         desc: "Mathematics",
         price: "100 ₹",
         color: "#33505a",
         image: "assets/catalogue_images/eng_mat.jpg"
     )];
}

class Item{
  late int id;
  late String name;
  late String desc;
  late String price;
  late String color;
  late String image;

  Item({id, name,desc, price, color, image});
  Item.fromMap(Map<String, dynamic> map){
    Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() =>{
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };
}


