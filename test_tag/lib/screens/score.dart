import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  static const String id="Score";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(

        appBar: AppBar(
          title: Text("Score"),

        ),
      body: Column(
        children: <Widget>[
          Container(
            child:Text(" Your Score is:100")
          )
        ],
      ),
    ),
    );
  }
}
