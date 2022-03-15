import 'package:demo/pages/home_page1.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class NotificationButton extends StatelessWidget{
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider= Provider.of<ProductProvider>(context);
    return Badge(
      position: const BadgePosition(end: 8, top: 8),
      badgeColor: Colors.redAccent,
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
        style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),),
      child: IconButton(
        color: Colors.black,
        onPressed: (){},
        icon: const Icon(Icons.notifications_none),
      ),

    );
  }

}