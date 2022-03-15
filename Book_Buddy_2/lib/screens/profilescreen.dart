import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/provider/product_provider.dart';
import 'package:demo/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../pages/home_page1.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget{

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late String userUid;
  String? userImage;
  void getUserUid(){
    User? myUser= FirebaseAuth.instance.currentUser;
    userUid= myUser!.uid;
  }

  void getUserImage(){

  }
  //late File? _pickedImage;
  //late PickedFile _image;
  //File? pickedImage;

  //late ProductProvider productProvider;
  var imageMap;
  void userDetailUpdate() async{
    setState(() {
      centerCircle=true;
    });
    _pickedImage!=null ? imageMap= await _uploadImage(image: _pickedImage) : Container();
    FirebaseFirestore.instance.collection('users').doc(userUid).update({
      //'secondName': "xyz",
      'userimage': imageMap

        });
  }

  //File? image;
  File? _pickedImage;
  late PickedFile _image;
  Future getImage({required ImageSource source}) async{

    final _image = await ImagePicker().pickImage(source: source);
    setState(() {
      _pickedImage = File(_image!.path);
    });

    // try {
    //   final image = await ImagePicker().pickImage(source: source);
    //   if (image == null) return;
    //   final pickedImage = File(image.path);
    //   setState(() {
    //     this.image = pickedImage;
    //   });
    //   //return pickedImage;
    // } on PlatformException catch(e){
    //   print("Failed to pick image: $e");
    // }

  }

  late String imageUrl;
  Future<String> _uploadImage({required File? image})async{
    User? user= FirebaseAuth.instance.currentUser;
    Reference storageReference= FirebaseStorage.instance.ref().child("UserImage/${user?.uid}");
    UploadTask uploadTask= storageReference.putFile(image!);
    TaskSnapshot snapshot=  await uploadTask;
    imageUrl= await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  Widget _buildSingleContainer({required String startText, required String endText}){
    productProvider= Provider.of(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(startText,
              style: const TextStyle(fontSize: 17),
            ),
            Text(endText,
              style: const TextStyle( fontSize: 17, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTextFormField({required String name}){
    return TextFormField(
      decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          )
      ),
    );
  }

  bool edit= false;
  bool centerCircle=false;
  Widget _buildContainerPart(){
    List<UserModel> userModal= productProvider.userModalList;
    return SingleChildScrollView(
      child: Column(
        children: userModal.map<Widget>((e){
          return Column(
            children: [
              _buildSingleContainer(
                  startText: "Name",
                  endText: e.firstName.toString()+" "+e.secondName.toString()
              ),
              _buildSingleContainer(
                  startText: "Email",
                  endText: e.email.toString()
              ),
              _buildSingleContainer(
                  startText: "Phone No",
                  endText: "8767570859"
              ),

              _buildSingleContainer(
                  startText: "Gender",
                  endText: "Male"
              ),
              _buildSingleContainer(
                  startText: "Uid",
                  endText: userUid
              )
            ],
          );

        }).toList(),
      ),
    );

  }

  Future<void> myDialogBox(){
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content:  SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Pick from Camera"),
                    onTap: (){
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading:  const Icon(Icons.photo_library),
                    title: const Text("Pick from Gallery"),
                    onTap: (){
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ) ,
            ),
          );
        }
    );
  }

  Widget _buildTextFormPart(){
    List<UserModel> userModal= productProvider.userModalList;
    return Column(
      children: userModal.map<Widget>((e) {
        return Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleTextFormField(
                  name: e.firstName.toString() +
                      " "+ e.secondName.toString()
              ),
              _buildSingleContainer(
                  startText: "Email", endText: e.email.toString()
              ),
              _buildSingleTextFormField(
                  name: "Phone No"
              ),
              _buildSingleTextFormField(name: "Gender"),
            ],
          ),
        );
      }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    getUserUid();
    return Scaffold(
      //key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: edit==true? IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 30,),
          onPressed: (){
            setState(() {
              edit=false;
            });
          },
        ): IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
          onPressed: (){
            setState(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage1()));
            });
          },
        ),
        backgroundColor: Colors.purpleAccent[100],
        actions:[
          edit==false? const NotificationButton():
          IconButton(
              onPressed: (){
                _uploadImage(image: _pickedImage);
                userDetailUpdate();
                setState(() {
                  edit=false;
                });
              },
              icon: const Icon(Icons.check, size: 30,)
          ),
        ],
      ),
      body: Container(
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20  ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 65,
                        backgroundImage: _pickedImage!=null ?
                        FileImage(_pickedImage!) as ImageProvider
                            : const AssetImage("assets/images/user.png",),
                      ),
                    ],
                  ),
                ),
                edit==true ?Padding(
                  padding: const EdgeInsets.only(left: 225, top: 80),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: GestureDetector(
                      onTap: (){
                        myDialogBox();
                      },
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.camera_alt, color:  Colors.black,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ):
                    Container()
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              //color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit==true?
                    _buildTextFormPart()
                    :
                    Column(
                      children: [
                        Container(
                          height: 300,
                          child: _buildContainerPart()
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 200,
                height: 50,
                child: edit == false ?ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //minimumSize: const Size(200, 50),
                    primary: Colors.purple,
                  ),
                    onPressed: (){
                    setState(() {
                      edit=true;
                    });
                    },
                    child: const Text("Edit Profile", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),)
                ):
                    Container()
              ),
            )
          ],
        ),
      ),
    );
  }
}