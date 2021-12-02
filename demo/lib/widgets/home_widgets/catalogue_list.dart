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
  final Item catalogue;
  const CatalogueItem(this.catalogue);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
              child: CatalogueImage(
                  image: catalogue.image
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalogue.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
                    catalogue.desc.text.textStyle(context.captionStyle!).make(),
                    10.heightBox,
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: Vx.mOnly(right: 16),
                      children: [
                        catalogue.price.text.bold.xl.make(),
                        ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(const StadiumBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                    MyTheme.lightPurpleColor
                                )
                            ),
                            child: "Add to cart".text.make()
                        )
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