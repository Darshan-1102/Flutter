import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Link extends StatefulWidget{
  const Link({Key? key}) : super(key: key);

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link>{
  _launchurl() async {
    const url = "https://flutter.dev/learn";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch url";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Click and link")),
      body: Center(
        child: IconButton(icon: Icon(Icons.link, size: 50, color: Colors.blue,),
          onPressed: _launchurl),
      ),
    );
  }

}
