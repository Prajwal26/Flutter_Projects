import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _ClassName ="";
Color colour=Colors.yellow;

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

final classNameTextController = TextEditingController();
final sectionController = TextEditingController();
final roomController = TextEditingController();
final subjectController = TextEditingController();

void change(String text)
{
  _ClassName = text;
  if(_ClassName.length>0)
    {
      colour=Colors.red;
    }
  else
    {
      colour=Colors.green;
    }
  print(_ClassName);

}

class AddForm extends StatefulWidget {
  static const String id="Addform";
  @override
  _AddFormState createState() => _AddFormState();

  void changeColor()
  {

  }
}

class _AddFormState extends State<AddForm> {

  final messageTextController = TextEditingController();
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: null,
        appBar: AppBar(

          title: Center(child: Text("Create Class",style: TextStyle(
              color: Colors.black,

              fontSize: 25.0
          ),)),
          elevation: 5.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: (){

                DocumentReference id =_firestore.collection('Class').document();
                id.setData({
                  'Classname': classNameTextController.text ,
                  'Email': loggedInUser.email,
                  'Room': roomController.text,
                  'Section': sectionController.text,
                  'Subject': subjectController.text,
                });
                _firestore.collection('Ownerdetails').add(
                  {
                    'classname':id.documentID,
                    'Authority':'Owner',
                    'Email':loggedInUser.email,

                  }
                );

                print(id.documentID);
              },

                  color: colour,
                 // padding: EdgeInsets.all(10.0),
                  child: Text( _ClassName,style: TextStyle(fontSize: 15.0,color: Colors.grey),)
              ),
            ),
            Icon(Icons.more_vert,size: 40.0,color: Colors.black,),
          ],
          backgroundColor: Colors.white,

          leading: GestureDetector(child: Icon(Icons.close,size: 30.0,color: Colors.grey.shade500,),
              onTap:(){ Navigator.pop(context);}
          ),


        ),


        body: Container(
          child: ListView(
            children: <Widget>[
              form_element(text: "Class Name(is required)",controller: classNameTextController,),
              form_element(text: "Section",controller: sectionController,),
              form_element(text: "Room",controller: roomController,),
              form_element(text: "Subject",controller: subjectController,),

            ],
          ),
        ),
      ),
    );
  }
}


class form_element extends StatefulWidget {

  final String text;
  final TextEditingController controller;

  form_element({this.controller,this.text});

  @override
  _form_elementState createState() => _form_elementState();
}

class _form_elementState extends State<form_element> {

  FocusNode myFocus =FocusNode();
  Color colour = Colors.lightBlue[900];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(bottom: BorderSide(color:colour)),
        ),
        height: 60.0,

        padding: EdgeInsets.only(left: 15.0),
        child: TextField(
          controller: widget.controller,
          onChanged: (String value){
            setState(() {

            if(widget.text =="Class Name(is required)")
            {
              change(value);
            }
          });
          },

          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 20.0,color: myFocus.hasFocus?Colors.green:Colors.grey),
            labelText: widget.text,
            focusedBorder: InputBorder.none,
            enabledBorder:InputBorder.none,
//            contentPadding: EdgeInsets.only(top:20.0)
          ),
        ),
      ),
    );
  }

}



/*class form_element extends StatelessWidget {
  form_element({this.text});
  final String text;
  FocusNode myFocus =FocusNode();
  Color colour = Colors.lightBlue[900];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(bottom: BorderSide(color:colour)),
        ),
        height: 60.0,

        padding: EdgeInsets.only(left: 15.0),
        child: TextField(

          onChanged: (String value){


//            setState(() {
//
//            if(text =="Class Name(is required)")
//            {
//
//               _ClassName = value;
//            }
          },

          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 20.0,color: myFocus.hasFocus?Colors.green:Colors.grey),
            labelText: text,
            focusedBorder: InputBorder.none,
            enabledBorder:InputBorder.none,
//            contentPadding: EdgeInsets.only(top:20.0)
          ),
        ),
      ),
    );
  }
}
*/