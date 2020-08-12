import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testtag/screens/Subject_screen.dart';
import 'package:testtag/screens/owner_screen.dart';
import 'package:testtag/components/Infocard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseApp firebase;
FirebaseUser loggedInUser;
ListView temp;
int flag=0;

class ExamDetailPage extends StatefulWidget {
  static const String id = "Exam_scr";
  @override
  _ExamDetailPageState createState() => _ExamDetailPageState();
}

class _ExamDetailPageState extends State<ExamDetailPage> {


  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    flag=0;
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

  void getExamNames(String ExamName) async {
    print(ExamName);
    List<Widget> examNames = [];
    await firestoreInstance.collection("ExamDetails").where("ExamName", isEqualTo: ExamName).getDocuments().then((
        querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data["DetailName"]);
        final temp = GestureDetector(
          child: Info_Card(text: result.data["DetailName"], imageUrl:result.data["ImageUrl"]),
          onTap: () {
            Navigator.pushNamed(context, PreviousYearPage.id,arguments:{"ExamName":ExamName});
            print(result.data["examName"]);
          },
        );
        examNames.add(temp);
      });
    });
    setState(() {
      temp = ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: examNames,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    print("haggu $arguments['ExamName']");
    if (arguments != null && flag ==0)
    {
      setState(() {
        flag = 1;
        print("haggu $arguments['ExamName']");
        getExamNames(arguments['ExamName']);
      });
    }

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
          body: temp,
        ),
      ),
    );
  }
}
