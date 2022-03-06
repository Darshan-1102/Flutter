import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
//import 'package:auto_size_text_pk/auto_size_text_pk.dart';

class SingleProduct extends StatelessWidget{
  final String image;
  final int price;
  final String name;
  SingleProduct({Key? key, required this.price, required this.name, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          padding: const EdgeInsets.only(top: 8.0),
          height: 250,
          width: 170,
          color: MyTheme.veryLightGreen,
          child: Column(
            children: [
              Container(
                height: 180,
                width: 170,
                decoration: BoxDecoration(
                  //color: Colors.blueGrey,
                    image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(image))
                ),
              ),
              Text("₹ ${price.toString()}", style: const TextStyle(//fontWeight: FontWeight.bold,
                  fontSize: 15, color: Colors.black),
              ),
              Center(
                child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 13),

                  //overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        )
    );
  }

}