import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testtag/screens/Test_create.dart';
import 'package:testtag/screens/owner_screen.dart';
import 'addContain.dart';
//import 'Test_create.dart';
//import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';

enum WhyFarther {Join,Create}
final _firestore = Firestore.instance;
FirebaseApp firebase;
FirebaseUser loggedInUser;


class HomePage extends StatefulWidget {
  static const String id="Home_scr";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WhyFarther _selection;
  final firestoreInstance = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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

  createAlert(BuildContext context)
  {
    TextEditingController customcontroller= TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Enter your room"),
        content: TextField(
          controller: customcontroller,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed: (){
              print("hsgfdshgfhdgfs");
              firestoreInstance
                  .collection("Ownerdetails")
                  .where("classname", isEqualTo: customcontroller.text.toString())
                  .getDocuments()
                  .then((value) {
//                value.documents.forEach((result) {
//                  print(result.data);
//                });
                  if(value.documents.length>0)
                    {
                      _firestore.collection('Ownerdetails').add(
                          {
                            'classname':customcontroller.text.toString(),
                            'Authority':'Joined',
                            'Email':loggedInUser.email,

                          }
                      );
                    }
              });
            },
          )
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "My anatomy",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            )),
            actions: <Widget>[
//              GestureDetector(
//                onTap: () {
//
//                },
//                child: Icon(
//                  Icons.add,
//                  size: 40.0,
//                  color: Colors.black,
//                ),
//              ),
          PopupMenuButton<WhyFarther>(
            icon: Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.black,
                ),
            enabled: true,
          onSelected: (WhyFarther result)
          {
            if(result==WhyFarther.Create)
              {
                Navigator.pushNamed(context,AddForm.id);
              }
            if(result==WhyFarther.Join)
              {
                createAlert(context);
              }
          },
          itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<WhyFarther>>[
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.Join,

              child: Text('Join'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.Create,
              child: Text('Create'),
            ),
          ],
        ),
//              Icon(
//                Icons.more_vert,
//                size: 40.0,
//                color: Colors.black,
//
//              ),

            ],
            backgroundColor: Colors.white,
            elevation: 50.0,
            leading: Icon(Icons.menu, size: 45.0, color: Colors.black),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.white,
                  height: 2.0,
                ),
                preferredSize: Size.fromHeight(2.0)),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              GestureDetector(child: Info_Card(),onTap: (){
                Navigator.pushNamed(context, OwnerClass.id);
              },),
            ],
          ),
        ),
      ),
    );
  }
}

class Info_Card extends StatelessWidget {
  Info_Card({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 165.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/two.jpg"),
//            colorFilter: ColorFilter.mode(Colors.grey,BlendMode.color),

            fit: BoxFit.cover,
          ),
//
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 11,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          child: Text(
                            "lost bdfdgsfhdsghg dsfhdsghfgdsf bsjdfghdsghfdsfk",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "abv abavab ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 10.0,
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Text(
                      "Mera Raja",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
