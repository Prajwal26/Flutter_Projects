import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(

          title: Center(child: Text("Create Class",style: TextStyle(
              color: Colors.black,
              fontSize: 25.0
          ),)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: (){
                print("xxj");
              },
                  color: Colors.grey.shade200,
                 // padding: EdgeInsets.all(10.0),
                  child: Text("Create",style: TextStyle(fontSize: 15.0,color: Colors.grey),)
              ),
            ),
            Icon(Icons.more_vert,size: 40.0,color: Colors.black,),
          ],
          backgroundColor: Colors.white,
          elevation: 50.0,
          leading: Icon(Icons.close,size: 30.0,color: Colors.grey.shade500),


        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child:TextField(
                    decoration: InputDecoration(
                      hintText: "Hellonjkh",
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
