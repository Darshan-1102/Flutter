import 'package:flutter/cupertino.dart';

class CatalogueModel{

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
     Item(
         4,
         "Engineering Graphics",
         "Drawing Textbook",
         295 ,
         "#33505a",
         "assets/catalogue_images/eng_graph.jpg"
     ),
     Item(
         5,
         "Let Us C",
         "C Programming",
         160 ,
         "#33505a",
         "assets/catalogue_images/c.jpg"
     ),
     Item(
         6,
         "Computer Graphics",
         "Graphics",
         320,
         "#33505a",
         "assets/catalogue_images/cg.jpg"
     ),
     Item(
         7,
         "Java Complete Reference",
         "Java",
         899 ,
         "#33505a",
         "assets/catalogue_images/java.png"
     ),
     Item(
         8,
         "Data Logic and Computer Architecture",
         "DLCOA",
         799 ,
         "#33505a",
         "assets/catalogue_images/dlcoa.jpg"
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


