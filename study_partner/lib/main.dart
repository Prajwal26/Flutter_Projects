import 'package:flutter/material.dart';
import 'screens/Home_screen.dart';
import 'screens/addContain.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
      theme: ThemeData(


      ),
      home: AddForm(),
    );
  }
}


