import 'package:flutter/material.dart';
import 'package:testtag/screens/Home_screen.dart';
import 'package:testtag/screens/score.dart';
import 'Test_create.dart';
import 'Page_review.dart';
import 'Questpass.dart';



int numbOfQuest;
int answer;
bool validate=true;
int i=1;
//List Qlist=[];
//List Opt1List=[];
//List Opt2List=[];
//List Opt3List=[];
//List Opt4List=[];



//_OptionsState OldOptionId = null;
//
//final messageTextController = TextEditingController();
//final Options1Controller = TextEditingController();
//final OptionsController = TextEditingController();
//final Options2Controller = TextEditingController();
//final Options3Controller = TextEditingController();
//final Options4Controller = TextEditingController();
enum SingingCharacter { optiona, optionb,optionc,optiond }

class Attemp_test extends StatefulWidget {


  static const String id = "Attempt";
  @override
  _Attemp_testState createState() => _Attemp_testState();
}

class _Attemp_testState extends State<Attemp_test> {
  SingingCharacter _character = SingingCharacter.optiona;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("questions"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(7),
                child: Text(
                  "Question no. $i",
                  style: TextStyle(fontSize: 20.0),
                ),
                decoration: BoxDecoration(
                  border: Border.all(  style: BorderStyle.solid, color: Colors.black, width: 2),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
                child: Text("kl sameeskha aayi thi ppt ki class m . sir n bola ki sb camera on kro. shuru m usne mna kra then on kr.mang m sindoor badan pr saadi camera m sharmaye haye haye"),
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.black, width: 2)),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(

                        style: BorderStyle.solid, color: Colors.black, width: 2)),

                child: ListTile(
                  title: const Text('Lafayette'),
                  leading: Radio(
                    value: SingingCharacter.optiona,
                    groupValue: _character,
                    onChanged: ( value) {
                      setState(() {
                        print(value);
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(

                        style: BorderStyle.solid, color: Colors.black, width: 2)),
                child: ListTile(
                  title: const Text('Lafayette'),
                  leading: Radio(
                    value: SingingCharacter.optionb,
                    groupValue: _character,
                    onChanged: ( value) {
                      setState(() {
                        print(value);
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(

                        style: BorderStyle.solid, color: Colors.black, width: 2)),
                child: ListTile(
                  title: const Text('Lafayette'),
                  leading: Radio(
                    value: SingingCharacter.optionc,
                    groupValue: _character,
                    onChanged: ( value) {
                      setState(() {
                        print(value);
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(

                        style: BorderStyle.solid, color: Colors.black, width: 2)),
                child: ListTile(
                  title: const Text('Lafayette'),
                  leading: Radio(
                    value: SingingCharacter.optiond,
                    groupValue: _character,
                    onChanged: ( value) {
                      setState(() {
                        print(value);
                        _character = value;
                      });
                    },
                  ),
                ),
              ),
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            FlatButton(onPressed: (){
              print("Save");
              Navigator.pushNamed(context, Score.id);
            }, color: Colors.green, child: Text("Save")),
            FlatButton(onPressed: (){ print("Back"); }, color: Colors.red, child: Text("Back")),

          ],
        )

          ],
        ),
      ),
    );
  }
}



//
//class Options extends StatelessWidget {
//
//
//}
