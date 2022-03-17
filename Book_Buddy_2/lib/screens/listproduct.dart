import 'package:demo/pages/home_page1.dart';
import 'package:demo/provider/categoty_provider.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/screens/search_product.dart';
import 'package:demo/screens/singleproduct.dart';
import 'package:demo/store/product.dart';
import 'package:demo/store/search_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget{
  final String name;
  bool isCategory=true;
  final List<Product>snapShot;
  ListProduct({required this.name, required this.isCategory, required this.snapShot});


  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider= Provider.of<CategoryProvider>(context);
    ProductProvider productProvider= Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.arrow_back),color: Colors.black,onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> HomePage1()));
        }),
        actions: <Widget>[
          isCategory==true?
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: (){
              categoryProvider.getSearchList(list: snapShot);
              showSearch(context: context, delegate: SearchCategory());
            },
          ):
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: (){
              productProvider.getSearchList(list: snapShot);
              showSearch(context: context, delegate: SearchProduct());
            },
          ),

          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    scrollDirection: Axis.vertical,
                    children: snapShot.map((e) => SingleProduct(
                        price: e.price,
                        name: e.name,
                        image: e.image
                    ),
                    ).toList(),
                  ),
                )
              ],
            )
          ],
        ),

          ),



    );
  }

}


// GridView.builder(
// itemCount: snapShot.data.docs.length,
// itemBuilder: (ctx, index)=>SingleProduct(
// price: snapShot.data.docs[index]['price'],
// name: snapShot.data.docs[index]['name'],
// image: snapShot.data.docs[index]['image']
// ),
// scrollDirection: Axis.vertical,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// childAspectRatio: 0.6,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10
// ),
// ),






//Widget _buildFeaturedProduct({required String name, required int price, required String image}){
  //   return Card(
  //       child: Container(
  //         padding: const EdgeInsets.only(top: 8.0),
  //         height: 250,
  //         width: 170,
  //         color: MyTheme.veryLightGreen,
  //         child: Column(
  //           children: [
  //             Container(//controls the image and text
  //               height: 160,
  //               width: 160,
  //               decoration: BoxDecoration(
  //                 //color: Colors.blueGrey,
  //                   image: DecorationImage(
  //                       image: AssetImage(image))
  //               ),
  //             ),
  //             Text("₹$price", style: const TextStyle(fontWeight: FontWeight.bold,
  //                 fontSize: 16, color: Colors.black),
  //             ),
  //             Text(name, style: const TextStyle(fontWeight: FontWeight.bold,
  //                 fontSize: 17),)
  //           ],
  //         ),
  //       )
  //   );
  // }

