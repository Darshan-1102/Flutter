import 'package:demo/models/cart.dart';
import 'package:demo/store/store.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget{
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyTheme.lightOrangeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
              notifications: const {},
              mutations: const {RemoveMutation},
              builder: (context, dynamic, _){
                return ("₹"+ (_cart.totalPrice).toString()).text.xl.black.make();
                },
                ),

            20.widthBox,
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Buying Not supported yet".text.make()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)
              ),
              child: "Buy".text.lg.black.make(),
            ).w16(context)
          ]
        ),
    );
  }
}

class _CartList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart= (VxState.store as MyStore).cart;
    return _cart.items.isEmpty ? "Nothing to show".text.xl3.makeCentered(): ListView.builder(
        itemCount: _cart.items.length,       //this was causing an error
      itemBuilder: (context, index)=> ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            RemoveMutation(_cart.items[index]);
          },
        ),
        title: Text(_cart.items[index].name),
      ),
    );
  }
}
// _cart.items[index].name.text.make()

// ("₹"+ (_cart.totalPrice).toString()).text.xl.black.make()

