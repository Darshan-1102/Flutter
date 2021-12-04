import 'package:demo/models/cart.dart';
import 'package:demo/store/store.dart';
import 'package:demo/utils/routes.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:demo/widgets/home_widgets/catalogue_header.dart';
import 'package:demo/widgets/home_widgets/catalogue_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  // final String name= "Darshan";

  @override
  Widget build(BuildContext context){
    final _cart = (VxState.store as MyStore).cart;
    //final dummyList= List.generate(4, (index) => CatalogueModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context,dynamic, _)=>FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: const Icon(CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(color: Vx.red400, size: 20,
            count: _cart.items.length,
          textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const CircularProgressIndicator().py16().expand(),
              CatalogueHeader(),

              const CatalogueList().expand(),

            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
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