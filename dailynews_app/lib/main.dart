import 'package:flutter/material.dart';

import 'package:dailynewsapp/views/home_view.dart';
void main()=>runApp(DesignApp());
class DesignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      initialRoute: NewPage.id,
//      routes: {
//      NewPage.id:(context)=>NewPage(),
//        HomePage.id:(context)=>HomePage(),
//      },
      home: HomeView(),

    );
  }
}
