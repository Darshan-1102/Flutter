import 'package:demo/models/cart.dart';
import 'package:demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogueModel catalog;
  late CartModel cart;

  MyStore(){
    catalog= CatalogueModel();
    cart= CartModel();
    cart.catalog= catalog;
  }

}