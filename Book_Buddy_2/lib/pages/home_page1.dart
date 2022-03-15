import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/categoryicons.dart';
import 'package:demo/provider/categoty_provider.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/screens/cartpage1.dart';
import 'package:demo/screens/detailpage1.dart';
import 'package:demo/screens/listproduct.dart';
import 'package:demo/screens/profilescreen.dart';
import 'package:demo/screens/singleproduct.dart';
import 'package:demo/widgets/notification_button.dart';
import 'package:demo/widgets/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../store/product.dart';
import '../widgets/notification_button.dart';
import '../screens/profilescreen.dart';


class HomePage1 extends StatefulWidget{

  @override
  State<HomePage1> createState() => _HomePage1State();
}
late Product cdata;
late Product javadata;
late Product cgdata;
late Product dlcoadata;
late Product osdata;
late Product eddata;
late Product dbmsdata;
late Product cndata;


late CategoryProvider provider;
late ProductProvider productProvider;

var featureSnapShot;
var newArchivesSnapShot;
var firstyear;
var secondYear;
var thirdYear;
var fourthYear;
var icon;


class _HomePage1State extends State<HomePage1> {


  Widget _buildCategoryProduct(String image){
    return CircleAvatar(maxRadius: 45,
      backgroundColor: Colors.teal,
      child: Container(
        height: 45,
        child: Image(
        image: NetworkImage(image),
      ),
    )
    );
  }


  bool homeColor= true;
  bool cartColor= false;
  bool aboutColor= false;
  bool contactColor= false;
  bool profileColor= false;

  Widget _buildUserAccountsDrawerHeader(){
    List<UserModel> userModal= productProvider.getUserModalList;
    return Column(
      children: userModal.map<Widget>((e) {
        return UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundImage: e.userImage==null ?const AssetImage("assets/images/user.png")
              : NetworkImage(e.userImage.toString()) as ImageProvider,
              backgroundColor: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            accountName: Text(e.firstName.toString(),
                style: const TextStyle(color: Colors.black)),
            accountEmail: Text(e.email.toString(),
                style: const TextStyle(color: Colors.black))
        );
      }).toList(),
    );
  }


  Widget _buildMyDrawer(){
    return Drawer(
      child: ListView(
        children:  [
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: (){
              setState(() {
                homeColor=true;
                contactColor=false;
                cartColor=false;
                aboutColor=false;
                profileColor=false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: (){
              setState(() {
                cartColor=true;
                contactColor=false;
                homeColor=false;
                aboutColor=false;
                profileColor=false;
              });
            },
            leading: const Icon(Icons.shopping_cart),
            title: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> CartPage1()));
              },
                child: Text("Cart")
            ),
          ),
          ListTile(
            selected: profileColor,
            onTap: (){

              setState(() {
                aboutColor=false;
                contactColor=false;
                cartColor=false;
                homeColor=false;
                profileColor=true;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ProfileScreen()));
            },
            leading: const Icon(Icons.info),
            title: const Text("Profile"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: (){

              setState(() {
                aboutColor=true;
                contactColor=false;
                cartColor=false;
                homeColor=false;
                profileColor=false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: contactColor,
            onTap: (){
              setState(() {
                contactColor=true;
                homeColor=false;
                cartColor=false;
                aboutColor=false;
                profileColor=false;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contact Us"),
          ),
          ListTile(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
          ),

        ],
      ),
    );
  }
  Widget _buildImageSlider(){
    return Container(
      height: 240,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images:const [
          AssetImage("assets/catalogue_images/c.jpg"),
          AssetImage("assets/catalogue_images/cg.jpg"),
          AssetImage("assets/catalogue_images/eng_mat.jpg"),
          AssetImage("assets/catalogue_images/java.png"),
        ],
      ),
    );
  }
  Widget _buildFirstYearIcon(){
    List<CategoryIcon> firstyearIcon= provider.getfirstyearIcon;
    List<Product> firstyear= provider.getfirstyearList;

    return Row(
      children: firstyearIcon.map<Widget>((e)  {
        return GestureDetector(
          child: _buildCategoryProduct(e.image),
          onTap: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx)=>ListProduct(name: "First Year",
                  snapShot: firstyear,
                ),
                )
            );
          },
        );
      }).toList(),
    );
  }
  Widget _buildSecondYearIcon(){
    List<CategoryIcon> secondyearIcon= provider.getsecondyearIcon;
    List<Product> secondyear= provider.getsecondyearList;

    return Row(
      children: secondyearIcon.map<Widget>((e)  {
        return GestureDetector(
          child: _buildCategoryProduct(e.image),
          onTap: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx)=>ListProduct(name: "Second Year",
                  snapShot: secondyear,
                ),
                )
            );
          },
        );
      }).toList(),
    );
  }
  Widget _buildThirdYearIcon(){
    List<CategoryIcon> thirdyearIcon= provider.getthirdyearIcon;
    List<Product> thirdyear= provider.getthirdyearList;

    return Row(
      children: thirdyearIcon.map<Widget>((e)  {
        return GestureDetector(
          child: _buildCategoryProduct(e.image),
          onTap: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx)=>ListProduct(name: "Third Year",
                  snapShot: thirdyear,
                ),
                )
            );
          },
        );
      }).toList(),
    );
  }
  Widget _buildFourthYearIcon(){
    List<CategoryIcon> fourthyearIcon= provider.getfourthyearIcon;
    List<Product> fourthyear= provider.getfourthyearList;

    return Row(
      children: fourthyearIcon.map<Widget>((e)  {
        return GestureDetector(
          child: _buildCategoryProduct(e.image),
          onTap: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx)=>ListProduct(name: "Fourth Year",
                  snapShot: fourthyear,
                ),
                )
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategory(){

    return Column(
      children: [
      Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
          Text("Categories", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          Text("View More", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      Container(
            height: 70,
            child: Row(
              children: [
                _buildFirstYearIcon(),
                _buildSecondYearIcon(),
                _buildThirdYearIcon(),
                _buildFourthYearIcon(),
              ],
            ),
        )
      ],
    );
  }
  Widget _buildFeature(){
    List<Product> featureProduct= productProvider.getfeatureList;
    List<Product> homeFeatureProduct= productProvider.getHomeFeatureList;

      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Featured"),

                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) =>
                              ListProduct(name: "Featured",
                                snapShot: featureProduct,
                              ),
                          )
                      );
                    },
                    child: const Text("View More")),
              ]

          ),
          Row(
            children: homeFeatureProduct.map<Widget>((e) {
              return Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      DetailPage1(
                                          image: e.image,
                                          name: e.name,
                                          price: e.price
                                      )
                              )
                          );
                        },
                        child: SingleProduct(
                            price: e.price,
                            name: e.name,
                            image: e.image
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    DetailPage1(
                                        image: e.image,
                                        name: e.name,
                                        price: e.price
                                    )
                            )
                        );
                      },
                      child: SingleProduct(
                          price: e.price,
                          name: e.name,
                          image: e.image
                      ),
                    ),

                  ],
                ),
              );
            }).toList()

          ),
        ],
      );
  }
  Widget _buildNewArchives(){
    List<Product> newArchivesProduct= productProvider.getnewArchivesList;

      return Column(
        children: [
          Container(
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("New Archives"),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) =>
                                    ListProduct(name: "New Archives",
                                        snapShot: newArchivesProduct
                                    )));
                          },
                          child: const Text("View More")),
                    ]

                ),

              ],
            ),
          ),
          Row(
            children: productProvider.gethomeArchivesList.map<Widget>((e) {
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        DetailPage1(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price
                                        )));
                          },
                          child: SingleProduct(
                            price: e.price,
                            name: e.name,
                            image: e.image,
                          )
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      DetailPage1(
                                          image: e.image,
                                          name: e.name,
                                          price: e.price
                                      )
                              )
                          );
                        },
                        child: SingleProduct(
                            price: e.price,
                            name: e.name,
                            image: e.image
                        )
                    ),
                  ],
                ),
              );
            }).toList()

          )
        ],
      );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<CategoryProvider>(context);
    provider.getfirstyeardata();
    provider.getsecondyeardata();
    provider.getthirdyeardata();
    provider.getfourthyeardata();
    provider.getfirstyearIcondata();

    productProvider= Provider.of<ProductProvider>(context);
    productProvider.getfeaturedata();
    productProvider.getnewArchivesdata();
    productProvider.getHomeFeaturedata();
    productProvider.gethomeArchivesdata();
    productProvider.getUserData();

    provider.getsecondyearIconData();
    provider.getthirdyearIconData();
    provider.getfourthyearIconData();

    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(color: Colors.purple,icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer();
              },);
          }
        ),
        title:const Text("Book  Buddy", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
        centerTitle: true,
        elevation: 0.0,
        actions: const <Widget>[

          IconButton(onPressed: null, icon: Icon(Icons.search)),
          NotificationButton(),
        ],
      ),
       body:
           Container(
                        height: double.infinity,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child:  ListView(
                          children: <Widget> [
                            Container(
                              width: double.infinity,
                              color: MyTheme.lightPurple,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      _buildImageSlider(),
                                      _buildCategory(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      _buildFeature(),
                                      _buildNewArchives(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //_buildCardView(),
                          ],
                        )
                    )
                );

                }

            }







// FutureBuilder(
// future: FirebaseFirestore.instance.collection('products')
// .doc('hhog20i0dceJfelMK9Si')
// .collection('featureproduct').get(),
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
// if(snapshot.connectionState== ConnectionState.waiting){
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// featureSnapShot= snapshot;
// cdata= Product(
// name: snapshot.data.docs[0]['name'],
// image: snapshot.data.docs[0]['image'],
// price: snapshot.data.docs[0]['price']
// );
// cgdata= Product(
// name: snapshot.data.docs[3]['name'],
// image: snapshot.data.docs[3]['image'],
// price: snapshot.data.docs[3]['price']
// );
// osdata= Product(
// name: snapshot.data.docs[2]['name'],
// image: snapshot.data.docs[2]['image'],
// price: snapshot.data.docs[2]['price']
// );
// javadata= Product(
// name: snapshot.data.docs[1]['name'],
// image: snapshot.data.docs[1]['image'],
// price: snapshot.data.docs[1]['price']
// );
// dlcoadata= Product(
// name: snapshot.data.docs[4]['name'],
// image: snapshot.data.docs[4]['image'],
// price: snapshot.data.docs[4]['price']
// );
// eddata= Product(
// name: snapshot.data.docs[5]['name'],
// image: snapshot.data.docs[5]['image'],
// price: snapshot.data.docs[5]['price']
// );
//
// return FutureBuilder(
// future: FirebaseFirestore.instance.
// collection('category').
// doc('9xfkRxjpyaJuC7liUXXd').
// collection('firstyear').get(),
// builder: (context, firstyearsnapshot) {
// if(snapshot.connectionState==ConnectionState.waiting){
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// firstyear= firstyearsnapshot;
// //secondYear= secondyearsnapshot;
//
// return FutureBuilder(
// future: FirebaseFirestore.instance.collection('products')
//     .doc('hhog20i0dceJfelMK9Si')
//     .collection('newarchives').get(),
//
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
// if(snapshot.connectionState== ConnectionState.waiting){
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// newArchivesSnapShot= snapshot;
// dbmsdata= Product(
// name: snapshot.data.docs[0]['name'],
// image: snapshot.data.docs[0]['image'],
// price: snapshot.data.docs[0]['price']
// );
// cndata= Product(
// name: snapshot.data.docs[2]['name'],
// image: snapshot.data.docs[2]['image'],
// price: snapshot.data.docs[2]['price']
// );

// Widget _singleFirebase(){
//   return FutureBuilder(
//     future: FirebaseFirestore.instance
//           .collection("products")
//           .doc("hhog20i0dceJfelMK9Si")
//           .collection("featureproduct")
//           .get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         Product cdata= Product(image: snapshot.data!.doc[0]['image'],
//                     price: snapshot.data!.docs[0]['price'],
//                     name: snapshot.data.docs[0]['name']
//         )   ;
//       }
//   );
// }

// Widget _buildFeaturedProduct({required String name, required int price, required String image}){
//   return Card(
//       child: Container(
//         padding: const EdgeInsets.only(top: 8.0),
//         height: 250,
//         width: 170,
//         color: MyTheme.veryLightGreen,
//         child: Column(
//           children: [
//             Container(
//               height: 190,
//               width: 160,
//               decoration: BoxDecoration(
//                 //color: Colors.blueGrey,
//                   image: DecorationImage(
//                       fit: BoxFit.scaleDown,
//                       image: AssetImage(image))
//               ),
//             ),
//             Text("₹$price", style: const TextStyle(fontWeight: FontWeight.bold,
//                 fontSize: 16, color: Colors.black),
//             ),
//             Text(name, style: const TextStyle(fontWeight: FontWeight.bold,
//                 fontSize: 17),)
//           ],
//         ),
//       )
//   );
// }

// Widget _buildCardView(){
//   return Row(
//     children:<Widget> [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               SingleProduct(price: 250, name: "Java", image: "assets/catalogue_images/java.png"),
//               SingleProduct(price: 550, name: "C Programming", image: "assets/catalogue_images/c.jpg"),
//               // SingleProduct(price: 650, name: "Computer Graphics", image: "assets/catalogue_images/cg.jpg"),
//               // SingleProduct(price: 150, name: "Chemistry", image: "assets/catalogue_images/eng_chem.jpg"),
//
//             ],
//           ),
//
//         ],
//       ),
//     ],
//   );
// }



