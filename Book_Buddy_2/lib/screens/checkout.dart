import 'package:demo/pages/home_page1.dart';
import 'package:flutter/material.dart';

import 'cartpage1.dart';

class CheckOut extends StatefulWidget{
  final int price;
  final String name;
  final String image;

  const CheckOut({Key? key, required this.price, required this.name, required this.image}) : super(key: key);
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(widget.image)
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
                            height: 35,
                            width: 100,
                            //color: Colors.lightBlueAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Quantity"),
                                Text("1"),
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

  Widget _buildBottomDetail({required String startName, required String endName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(startName, style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(endName, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out Page",
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
            onPressed: (){},
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx)=> CartPage1(
                  price: widget.price, name: widget.name, image: widget.image
              )
          )
          );
        },
          child: const Text("Buy"),
          style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSingleCartProduct(),
              _buildSingleCartProduct(),
              _buildSingleCartProduct(),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomDetail(startName: "Your Price" , endName: "₹ 250"),
                    //_buildBottomDetail(startName: "Discount" , endName: "₹ 3%"),
                    _buildBottomDetail(startName: "Shipping " , endName: "₹ 50"),
                    _buildBottomDetail(startName: "Total" , endName: "₹ 250"),
                  ],
                ),
              )
            ],
          ),
        ]
        ),
      ),
    );
  }
}