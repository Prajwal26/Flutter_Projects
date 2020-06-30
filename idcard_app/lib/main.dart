import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/elon.jpg'),
            ),
              Text(
                "X Æ A-12",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),

                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    title: Text("Q. Who is khadus?",
                      style: TextStyle(
                        color: Colors.black,

                      ),),
                  )
                ),

              Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),

                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    title: Text("Ans: Toshika",
                      style: TextStyle(
                        color: Colors.black,

                      ),),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
