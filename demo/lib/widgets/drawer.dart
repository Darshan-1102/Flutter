import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const imageURL= "https://www.google.com/search?q=login+icon&tbm=isch&ved=2ahUKEwiIuqS7qbb0AhWFXn0KHTLqBUQQ2-cCegQIABAA&oq=login+icon&gs_lcp=CgNpbWcQAzIICAAQgAQQsQMyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6CwgAEIAEELEDEIMBOgQIABBDOgcIABCxAxBDUIkKWNUtYOovaABwAHgAgAFziAHwCJIBAzQuN5gBAKABAaoBC2d3cy13aXotaW1nsAEAwAEB&sclient=img&ei=kvqgYYipC4W99QOy1JegBA&bih=577&biw=1280#imgrc=3A1gJGkREcvF8M";
    return Drawer(
      child: Container( //wrapping the listview in container to give color
        color: Colors.white38,
        child: ListView(
          padding: EdgeInsets.zero, //In android there is some blank space problem
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.amber),
                  accountName: Text("Darshan Jadhav"),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                  ),
                )
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
            ),
            ListTile(               //can add as much as tiles
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

}
