import 'package:demo/pages/home_page1.dart';
import 'package:demo/screens/cartpage1.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage1 extends StatefulWidget{
  final String image;
  final String name;
  final int price;

  const DetailPage1({Key? key, required this.image, required this.name, required this.price}) : super(key: key);

  @override
  State<DetailPage1> createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {

  Widget _buildImage(){
    return Center(
      child: Container(
        height: 400,
        width: 300,
        child: Card(
          child: Container(
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(13),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(widget.image)
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildNameToDescriptionPart(){
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text("₹ ${widget.price.toString()}",
                style: const TextStyle(color: Colors.pink,
                  fontSize: 17,
                ),
              ),
              const Text("Description :",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.deepPurpleAccent
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildDescription(){
    return Container(
      height: 200,
      color: Colors.amberAccent,
      child: Wrap(
        children: const [
          Text("Written by Yashvant Kanetkar Let Us C is a widely popular book among "
              "Engineering Students",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
  Widget _buildQuantityPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text("Quantity",
            style: TextStyle(fontSize: 17)
        ),
        const SizedBox(height: 5,),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: (){
                  setState(() {
                    if(count>1) {
                      count--;
                    }
                  });
                },
              ),
              Text(count.toString(), style: const TextStyle(fontSize: 18),),
              GestureDetector(
                child: const Icon(Icons.add),
                onTap: (){
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildCheckoutButton(){
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(onPressed: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx)=> CartPage1(
            price: widget.price, name: widget.name, image: widget.image
        )
        )
        );
      },
        child: const Text("Check Out"),
        style: ElevatedButton.styleFrom(
        primary: Colors.pink,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
         )
        ),
      ),
    );
  }



  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Buddy",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> HomePage1()));
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications, color: Colors.black,),
            onPressed: (){},)
        ],
      ),
      body: ListView(
        children: [
          _buildImage(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameToDescriptionPart(),
                _buildDescription(),
                _buildQuantityPart(),
                const SizedBox(
                  height: 15,
                ),
                _buildCheckoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}