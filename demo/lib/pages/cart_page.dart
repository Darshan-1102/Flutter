import 'package:demo/models/cart.dart';
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
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cart.totalPrice.text.xl.black.make(),  //Causing error
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

class _CartList extends StatefulWidget{
  @override
  State<_CartList> createState() => _CartListState();
}
class _CartListState extends State<_CartList>{
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,       //this was causing an error
      itemBuilder: (context, index)=> ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {  },
        ),
        title: Text(_cart.items[index].name),
      ),
    );
  }
}
// _cart.items[index].name.text.make()

