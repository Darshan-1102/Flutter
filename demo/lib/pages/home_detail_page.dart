import 'package:demo/models/catalog.dart';
import 'package:demo/widgets/home_widgets/add_to_cart.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget{
  final Item catalogue;
  const HomeDetailsPage({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: MyTheme.lightPurple,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(right: 16),
        children: [
          catalogue.price.text.bold.xl4.red800.make(),
          AddToCart(
              catalogue, catalog: catalogue).wh(120,50)
        ],
      ).py32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
                child: Image.asset(catalogue.image),
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 40,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        //expand(),
                        catalogue.name.text.xl4.bold.color(MyTheme.darkBluishColor).make(),
                        catalogue.desc.text.center.textStyle(context.captionStyle!).lg.make(),
                        10.heightBox,
                        "This book is used only for 1 year".text.center.make(),
                    ],
                    ).py64(),

            ),
                ))
          ],
        ),
      ),
    );
  }
}
