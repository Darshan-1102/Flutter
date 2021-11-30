import 'package:flutter/cupertino.dart';

class CatalogueModel{
   static final items= [
     Item(
          1,
         "Engineering Mathematics 1",
          "Mathematics Textbook",
         "229 ₹",
          "#33505a",
         "assets/catalogue_images/eng_mat.jpg"
     ),
     Item(
         2,
         "Engineering Physics",
         "Physics Textbook",
         "599 ₹",
         "#33505a",
         "assets/catalogue_images/eng_phy.jpg"
     ),
     Item(
         3,
         "Engineering Chemistry",
         "Chemistry Textbook",
         "399 ₹",
         "#33505a",
         "assets/catalogue_images/eng_chem.jpg"
     ),
   ];
}

class Item{
  late final int id;
  late final String name;
  late final String desc;
  late final String price;
  late final String color;
  late final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image,);

}


