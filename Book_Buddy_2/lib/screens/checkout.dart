import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/pages/home_page1.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/widgets/cartsingleproduct.dart';
import 'package:demo/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartpage1.dart';

class CheckOut extends StatefulWidget{

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();
  late ProductProvider productProvider;

  Widget _buildBottomDetail({required String startName, required String endName}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(startName, style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(endName, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  User? user;
  late double total;
  late int index;
  Widget _buildButton(){
    return Column(
      children: productProvider.getUserModalList.map<Widget>((e) {
        return  Container(
          height: 55,
          width: 300,
          child: ElevatedButton(onPressed: (){
            if(productProvider.cartModalList.isNotEmpty){
              FirebaseFirestore.instance.collection('order').doc(user?.uid).set({
                "Product": productProvider.cartModalList.map((c) =>{
                  "Product Name": c.name,
                  "Product Price": c.price,
                  "Product Quantity": c.quantity,
                }).toList(),

                "Total Price": total.toStringAsFixed(2),
                "First Name": e.firstName,
                "Second Name": e.secondName,
                "UserEmail": e.email,
                "UserUid": user!.uid
              });
              productProvider.clearCartProduct();
            }
            else{
              print("No item in cart");
            }


            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx)=> CartPage1(
                  // price: widget.price, name: widget.name, image: widget.image
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
        );
      }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    user= FirebaseAuth.instance.currentUser;

    double subTotal=0;
    double discount=3;
    double discountRupees;
    double shipping=50;

    productProvider= Provider.of<ProductProvider>(context);
    productProvider.getCartModalList.forEach((element) {
      subTotal+=element.price * element.quantity;
    });
    discountRupees= discount/100;
    total= (subTotal+shipping-discountRupees) ;
    if(productProvider.cartModalList.isEmpty){
      discountRupees=0;
      total=0;
      shipping=0;
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[100],
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> CartPage1()));
          },
        ),
        actions: const [
          NotificationButton()
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        child:
          _buildButton()
      ),
      body: Container(
        //color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount:  productProvider.getCartModalListLength,
                    itemBuilder: (ctx, myIndex){
                     index= myIndex;
                      return CartSingleProduct(
                          isCheckOutPage: true,
                          name: productProvider.getCartModalList[myIndex].name,
                          image: productProvider.getCartModalList[myIndex].image,
                          quantity: productProvider.getCartModalList[myIndex].quantity,
                          price: productProvider.getCartModalList[myIndex].price,
                          index: myIndex
                      );
                    }
                )
              ),
            ),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  _buildBottomDetail(
                      startName: "Sub Total", endName: "₹ $subTotal"),
                    _buildBottomDetail(startName: "Discount" , endName: discountRupees.toString()),
                  _buildBottomDetail(
                      startName: "Shipping ", endName: shipping.toString()),
                  _buildBottomDetail(
                      startName: "Total", endName: "₹ ${total.toStringAsFixed(2)}"),
                ],
              ),
            )
          ]
    ),
      ),
    );
  }
}

// Widget _buildSingleCartProduct(){
//   return Container(
//     height: 150,
//     width: double.infinity,
//     child: Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 130,
//                 width: 150,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fitHeight,
//                         image: NetworkImage(widget.image)
//                     )
//                 ),
//               ),
//               Container(
//                 height: 140,
//                 width: 200,
//                 child: ListTile(
//                     title: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(widget.name,
//                           style: const TextStyle(color: Colors.black),
//                         ),
//                         const Text("Books"),
//                         Text("₹ ${widget.price.toString()}"),
//                         Container(
//                           height: 35,
//                           width: 100,
//                           //color: Colors.lightBlueAccent,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Text("Quantity"),
//                               Text("1"),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }