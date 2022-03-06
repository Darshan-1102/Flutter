import 'package:demo/pages/home_page1.dart';
import 'package:demo/screens/checkout.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage1 extends StatefulWidget{
  final int price;
  final String name;
  final String image;

  const CartPage1({Key? key, required this.price, required this.name, required this.image}) : super(key: key);

  @override
  State<CartPage1> createState() => _CartPage1State();
}

class _CartPage1State extends State<CartPage1> {
  int count=1;

  Widget _buildSingleCartProduct(){
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
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,
                            style: const TextStyle(color: Colors.black),
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
                                      if(count>1) {
                                        count--;
                                      }
                                    });
                                  },
                                ),
                                Text(count.toString(), style: const TextStyle(fontSize: 15),),
                                GestureDetector(
                                  child: const Icon(Icons.add),
                                  onTap: (){
                                    setState(() {
                                      count++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>CheckOut(
                price: widget.price, name: widget.name, image: widget.image)
            )
            );
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
        actions: [
          IconButton(icon: const Icon(Icons.notifications, color: Colors.black,),
            onPressed: (){},)
        ],
      ),
      body: ListView(
        children: [
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct()
        ],
      ),

    );
  }
}