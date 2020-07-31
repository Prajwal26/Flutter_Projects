import 'package:flutter/material.dart';
import 'package:testtag/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testtag/screens/Page_review.dart';
import 'package:testtag/screens/Test_create.dart';
class OwnerClass extends StatefulWidget {
  static const String id="Owner Screen";
  @override
  _OwnerClassState createState() => _OwnerClassState();
}

class _OwnerClassState extends State<OwnerClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                  child:Text("Random Text"),
            ),
            Expanded(
                  child:FlatButton(
                    child: Text("Create Test"),
                    color: Colors.green,
                    onPressed: (){
                      Navigator.pushNamed(context,Test_create.id);
                    },
                  ),
                ),
              ])
            ),
          );
  }
}
