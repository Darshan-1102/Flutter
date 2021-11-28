import 'package:flutter/cupertino.dart';

class CatalogueModel{
   static final items= [
     Item(
          1,
         "Engineering Mathematics 1",
          "Mathematics",
         "100 ₹",
          "#33505a",
         "assets/catalogue_images/eng_mat.jpg"
     )];
}

class Item{
  late final int id;
  late final String name;
  late final String desc;
  late final String price;
  late final String color;
  late final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image,

)  ;

}


