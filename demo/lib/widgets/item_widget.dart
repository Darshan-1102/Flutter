import 'package:demo/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget{
  final Item item;
  const ItemWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      //shape: CircleBorder(),
      child: ListTile(
        onTap: (){
          print(item.name +" is pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(item.price,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,

        ),),
      ),
    );
  }

}
