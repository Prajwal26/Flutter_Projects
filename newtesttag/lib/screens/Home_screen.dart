import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testtag/screens/owner_screen.dart';
import 'package:testtag/components/Infocard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseApp firebase;
FirebaseUser loggedInUser;
List<Widget> examNames = [];

class HomePage extends StatefulWidget {
  static const String id = "Home_scr";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getExamNames();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  ListView getExamNames() {
    firestoreInstance.collection("ExamName").getDocuments().then((
        querySnapshot) {
      querySnapshot.documents.forEach((result) {
        final temp = GestureDetector(
          child: Info_Card(text: result.data["examName"], imageUrl:result.data["ImageUrl"]),
          onTap: () {
            //Navigator.pushNamed(context, OwnerClass.id);
            print("Lawde ki sarkar");
          },
        );
        examNames.add(temp);
        //print(examNames);
      });
      print(examNames.length);
    });
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      children: examNames,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFBD34C59),
            title: Center(
                child: Text(
              "Testtag",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Lobster', fontSize: 25.0),
            )),

//            elevation: 50.0,
            leading: Icon(Icons.menu, size: 45.0, color: Colors.black),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.white,
                  height: 2.0,
                ),
                preferredSize: Size.fromHeight(2.0)),
          ),
          body: getExamNames(),
        ),
      ),
    );
  }
}
