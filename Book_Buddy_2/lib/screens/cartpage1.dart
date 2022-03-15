import 'package:demo/pages/home_page1.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/screens/checkout.dart';
import 'package:demo/widgets/cartsingleproduct.dart';
import 'package:demo/widgets/notification_button.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage1 extends StatefulWidget{
   @override
  State<CartPage1> createState() => _CartPage1State();
}

late ProductProvider productProvider;
class _CartPage1State extends State<CartPage1> {

  @override
  Widget build(BuildContext context) {
    productProvider= Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple
          ),
          onPressed: () {
            productProvider.addNotification("Notification");
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> CheckOut()));

          },
          child: const Text("Continue",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

        ),
      ),
      backgroundColor: MyTheme.lightPurple,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart  Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[100],
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> HomePage1()));
          },
        ),
        actions: const [
          NotificationButton()
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCartModalListLength,
        itemBuilder: (ctx, index)=> CartSingleProduct(
            isCheckOutPage: false,
            name: productProvider.getCartModalList[index].name,
            image: productProvider.getCartModalList[index].image,
            quantity: productProvider.getCartModalList[index].quantity,
            price: productProvider.getCartModalList[index].price,
            index: index
        ),
      ),

    );
  }
}