import 'package:demo/pages/home_page1.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/widgets/cartsingleproduct.dart';
import 'package:demo/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartpage1.dart';

class CheckOut extends StatefulWidget{

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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

  @override
  Widget build(BuildContext context) {
    double subTotal=0;
    double discount=3;
    double discountRupees;
    double shipping=50;
    double total;
    productProvider= Provider.of<ProductProvider>(context);
    productProvider.getCartModalList.forEach((element) {
      subTotal+=element.price * element.quantity;
    });
    discountRupees= discount/100;
    total= (subTotal+shipping-discountRupees) ;
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
        actions: const [
          NotificationButton()
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
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
                    itemBuilder: (ctx, index){
                      return CartSingleProduct(
                          isCheckOutPage: true,
                          name: productProvider.getCartModalList[index].name,
                          image: productProvider.getCartModalList[index].image,
                          quantity: productProvider.getCartModalList[index].quantity,
                          price: productProvider.getCartModalList[index].price,
                          index: index
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