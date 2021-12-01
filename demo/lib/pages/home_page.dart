import 'package:demo/models/catalog.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/item_widget.dart';
import 'package:demo/widgets/themes.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget{
  // final String name= "Darshan";

  @override
  Widget build(BuildContext context){
    //final dummyList= List.generate(4, (index) => CatalogueModel.items[0]);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              CatalogueList().expand(),
            ],
          ),
        ),
      ),

    );
  }
}

class CatalogueHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Book Buddy".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Books".text.xl2.make(),
      ],
    );
  }
}

class CatalogueList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context, index){
          final catalogue= CatalogueModel.items[index];
          return CatalogueItem(catalogue);
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
          CatalogueImage(
              image: catalogue.image
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
                          child: "Buy".text.make()
                      )
                    ],
                  )
                ],
              )
          )
        ],
      )
    ).blue50.roundedLg.square(150).make().py20();
  }
}

class CatalogueImage extends StatelessWidget{
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }

}





// body: Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: ListView.builder(
// itemCount: CatalogueModel.items.length,
// itemBuilder: (context, index){
// return ItemWidget(item: CatalogueModel.items[index] );
// },
// ),
// ),
// ),




// Widget build(BuildContext context){
//   //final dummyList= List.generate(4, (index) => CatalogueModel.items[0]);
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Book  Buddy"),
//       titleTextStyle: const TextStyle(
//           color: Colors.black,
//           fontSize: 22,
//           fontWeight: FontWeight.bold
//       ),
//     ),
//     body: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//           ),
//           itemBuilder: (context, index){
//             final item= CatalogueModel.items[index];
//             return Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: GridTile(
//                 header: Container(
//                   child: Text(item.name,
//                     textAlign: TextAlign.center,
//                     style:  const TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(12),
//                   decoration: const BoxDecoration(
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 child: Image.network(item.image),
//                 footer: Text(item.price,
//                   textAlign: TextAlign.center,),
//               ),
//             );
//           },
//           itemCount: CatalogueModel.items.length,
//         ),
//       ),
//     ),
//
//     drawer: MyDrawer(),
//   );
// }