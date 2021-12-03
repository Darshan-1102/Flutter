import 'package:demo/models/cart.dart';
import 'package:demo/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart(Item catalogue, {
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        onPressed: (){
          if(!isInCart) {
            isInCart= isInCart.toggle();
            final catalog = CatalogueModel();

            _cart.catalog = catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(
                MyTheme.lightPurpleColor
            )
        ),
        child: isInCart ? const Icon(Icons.done): const Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}