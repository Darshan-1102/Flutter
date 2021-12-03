import 'package:demo/models/cart.dart';
import 'package:demo/models/catalog.dart';
import 'package:demo/pages/home_detail_page.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalogue_image.dart';


class CatalogueList extends StatelessWidget{
  const CatalogueList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context, index){
          final catalogue= CatalogueModel.items[index];
          return InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(
                builder: (context)=>HomeDetailsPage(catalogue: catalogue,
                ))),
              child: CatalogueItem(
                  catalogue
              ));
        }
    );
  }
}
class CatalogueItem extends StatelessWidget{
  final Item catalog;
  const CatalogueItem(this.catalog);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogueImage(
                  image: catalog.image
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
                    catalog.desc.text.textStyle(context.captionStyle!).make(),
                    10.heightBox,
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: Vx.mOnly(right: 16),
                      children: [
                        catalog.price.text.bold.xl.make(),
                        _AddToCart(catalog, catalog: catalog,)
                      ],
                    )
                  ],
                )
            )
          ],
        )
    ).color(context.cardColor).roundedLg.square(150).make().py20();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart(Item catalogue, {
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          isAdded= isAdded.toggle();
          final catalog= CatalogueModel();
          final _cart = CartModel();
          _cart.catalog = catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(
                MyTheme.lightPurpleColor
            )
        ),
        child: isAdded ? const Icon(Icons.done): "Add to cart".text.make()
    );
  }
}