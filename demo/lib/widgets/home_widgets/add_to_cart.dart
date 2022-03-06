import 'package:demo/models/cart.dart';
import 'package:demo/models/catalog.dart';
import 'package:demo/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart(Item catalogue, {
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: (){
          if(!isInCart) {
            AddMutation(catalog);
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