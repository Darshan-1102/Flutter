import 'package:demo/pages/home_page1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
class CartSingleProduct extends StatefulWidget{
  final String name;
  final String image;
  late  int quantity;
  final int price;
  final int index;
  bool isCheckOutPage;

   CartSingleProduct({Key? key,
     required this.isCheckOutPage,
     required this.name, required this.image,
     required this.quantity, required this.price,
     required this.index}) : super(key: key);

  @override
  State<CartSingleProduct> createState() => _CartSingleProductState();
}

TextStyle myStyle = const TextStyle(fontSize:  18);
late ProductProvider productProvider;

class _CartSingleProductState extends State<CartSingleProduct> {

  @override
  Widget build(BuildContext context) {
    productProvider= Provider.of<ProductProvider>(context);
    // productProvider.getCheckOutData(
    //     quantity: widget.quantity,
    //     price: widget.price,
    //     name: widget.name,
    //     image: widget.image
    // );
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(widget.image)
                      )
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 140,
                    width: 240,
                    child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.name,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  widget.isCheckOutPage!=true?
                                  IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: (){
                                        productProvider.deleteCartProduct(widget.index);

                                      },

                                  ): Container()
                                ],
                              ),
                            ),
                            const Text("Books"),
                            Text("₹ ${widget.price.toString()}"),
                            Container(
                              height: 30,
                              width: 100,
                              color: Colors.lightBlueAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    child: const Icon(Icons.remove),
                                    onTap: (){
                                      setState(() {
                                        if(widget.quantity>1) {
                                          widget.quantity--;
                                          productProvider.getCheckOutData(
                                              quantity: widget.quantity,
                                              price: widget.price,
                                              name: widget.name,
                                              image: widget.image
                                          );
                                        }
                                      });
                                    },
                                  ),
                                  Text(widget.quantity.toString(), style: const TextStyle(fontSize: 15),),
                                  GestureDetector(
                                    child: const Icon(Icons.add),
                                    onTap: (){
                                      setState(() {
                                        widget.quantity++;
                                       productProvider.getCheckOutData(
                                           quantity: widget.quantity,
                                           price: widget.price,
                                           name: widget.name,
                                           image: widget.image
                                       );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}