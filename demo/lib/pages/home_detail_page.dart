import 'package:demo/models/catalog.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget{
  final Item catalogue;
  const HomeDetailsPage({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.lightPurple,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(right: 16),
        children: [
          catalogue.price.text.bold.xl4.red800.make(),
          ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(
                      MyTheme.lightPurpleColor
                  )
              ),
              child: "Buy".text.make()
          )
        ],
      ).py32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
                child: Image.network(catalogue.image),
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: MyTheme.greenshadeColor,
                    child: Column(
                                children: [
                                  catalogue.name.text.xl4.bold.color(MyTheme.darkBluishColor).make(),
                                  catalogue.desc.text.textStyle(context.captionStyle!).xl.make(),
                                  10.heightBox,
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
