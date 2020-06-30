import 'package:flutter/material.dart' ;
import 'LoginPage.dart';
void main()
{
  runApp(Myblog());
}

class Myblog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My blog app",

      home: LoginPage()
    );
  }
}


