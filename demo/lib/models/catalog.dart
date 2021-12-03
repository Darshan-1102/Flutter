import 'package:flutter/cupertino.dart';

class CatalogueModel{
  static final catModel= CatalogueModel._internal();

  CatalogueModel._internal();
  factory CatalogueModel()=> catModel;
  Item getById(int id)=> items.firstWhere((element) => element.id==id); // get item by id

  Item getByPosition(int pos) => items[pos];  //get by position
   static final items= [
     Item(
          1,
         "Engineering Mathematics 1",
         "Mathematics Textbook",
         229,
         "#33505a",
         "assets/catalogue_images/eng_mat.jpg"
     ),
     Item(
         2,
         "Engineering Physics",
         "Physics Textbook",
         599,
         "#33505a",
         "assets/catalogue_images/eng_phy.jpg"
     ),
     Item(
         3,
         "Engineering Chemistry",
         "Chemistry Textbook",
         399 ,
         "#33505a",
         "assets/catalogue_images/eng_chem.jpg"
     ),
   ];
}

class Item{
  late final int id;
  late final String name;
  late final String desc;
  late final int price;
  late final String color;
  late final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image,);

}

// ₹


