// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:demo/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Material
    (
      color: Colors.white,
      child:SingleChildScrollView(
        child: Column(
          children:
          [
            SizedBox(height: 40.0),
            Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
            SizedBox(height: 5.0),
            Text
              ("Welcome  To  Book  Buddy", style: TextStyle
                (
                fontSize: 25,color: Colors.purple,
                fontWeight: FontWeight.bold,
                )
              ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(hintText: "Enter Username",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Username", labelStyle: TextStyle(color: Colors.purple) ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Password",labelStyle: TextStyle(color: Colors.purple)),
                  ),
                  SizedBox(height: 40.0),
                   ElevatedButton(
                     child: Text("Login", style: TextStyle(fontSize: 18), ),
                     style: TextButton.styleFrom(minimumSize: Size(100,40)),
                     onPressed: (){
                       Navigator.pushNamed(context, MyRoutes.homeRoute);
                     },
                   ),
                ],

              ),
            )
          ],
        ),
      )
    );
  }
}