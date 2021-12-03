import 'package:demo/models/catalog.dart';

class CartModel {
  static final cartModel= CartModel._internal();

  CartModel._internal();
  factory CartModel()=> cartModel;

  late CatalogueModel _catalog;

  final List<int> _itemIds= []; //store ids of items

  CatalogueModel get catalog =>_catalog;   //get catalog

  set catalog(CatalogueModel newCatalog){
    _catalog= newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(1, (total, current) => total+ current.price);

  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

