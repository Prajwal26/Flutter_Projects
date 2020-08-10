import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testtag/screens/Questions.dart';

final numbText = TextEditingController();
bool validate = true;

class Test_create extends StatefulWidget {
  static const String id="test";

  @override
  _Test_createState createState() => _Test_createState();
}

class _Test_createState extends State<Test_create> {

  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(

            children: <Widget>[
              Input_box(text: "Enter no. of questions",),
              FlatButton(onPressed: (){
                setState(() {
                  int noOfQuestion=0;
                  if(numbText.text.toString().isNotEmpty)
                     noOfQuestion = int.parse(numbText.text.toString());
                  print(numbText.text.isEmpty);
                  numbText.text.isNotEmpty && noOfQuestion>0 && noOfQuestion<26? validate = true : validate = false;

                  if(validate==true) {
                    Navigator.pushNamed(context, Questions.id,arguments: numbText.text);

                  }
                });
                print(validate);

              }, child: Text("Submit"),color: Colors.blue,)



            ],
          ),
        ),
      ),


    );
  }
}

class Input_box extends StatelessWidget {

  Input_box({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(

        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.solid,color: Colors.black,width: 2.0)
        ),
        child: Column(
          children: <Widget>[
            Text(text,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            TextField(
              controller: numbText,


              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(2),],
              maxLength: 2,
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
//                          contentPadding: EdgeInsets.all(20.0),

//                          hintText: "Enter number between 01 to 99",
                  counterText: "",
                errorText: validate ?  null:'Value Can\'t Be Empty and must lie between 1 and 25' ,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
