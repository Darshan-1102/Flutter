import 'package:demo/pages/home_page1.dart';
import 'package:demo/provider/categoty_provider.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/screens/singleproduct.dart';
import 'package:demo/store/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCategory extends SearchDelegate<void>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
        IconButton(
            onPressed: (){
          query= "";
             //Navigator.push(context, MaterialPageRoute(builder: (ctx)=> HomePage1()));
              },
            icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, null);
            },
          icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    CategoryProvider provider= Provider.of(context);
    List<Product> searchProduct= provider.searchCategoryList(query);
    return GridView.count(
        crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: searchProduct.map<Widget>((e)=> SingleProduct(
          price: e.price,
          name: e.name,
          image: e.image
      )).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    CategoryProvider provider= Provider.of(context);
    List<Product> searchProduct= provider.searchCategoryList(query);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: searchProduct.map<Widget>((e)=> SingleProduct(
          price: e.price,
          name: e.name,
          image: e.image
      )).toList(),
    );
  }

}