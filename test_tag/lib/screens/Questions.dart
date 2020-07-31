import 'package:flutter/material.dart';
import 'package:testtag/screens/Home_screen.dart';
import 'Test_create.dart';
import 'Page_review.dart';
import 'Questpass.dart';




int numbOfQuest;
int answer;
bool validate=true;
int i=1;
List Qlist=[];
List Opt1List=[];
List Opt2List=[];
List Opt3List=[];
List Opt4List=[];
List Answers = [];
String ErrorMsg = "";

_OptionsState OldOptionId = null;

final messageTextController = TextEditingController();
final Options1Controller = TextEditingController();
final OptionsController = TextEditingController();
final Options2Controller = TextEditingController();
final Options3Controller = TextEditingController();
final Options4Controller = TextEditingController();


class Questions extends StatefulWidget {

  int NoOfQuestion = int.parse(numbText.text.toString());
  static const String id = "Question";

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    i=1;
  }

  @override
  Widget build(BuildContext context) {

    void changeScreen()
    {
      print(Qlist);
      numbOfQuest=widget.NoOfQuestion;
      Navigator.pushNamed(context,PageReview.id,arguments:Quest(qlist: Qlist,opt1List: Opt1List,opt2List: Opt2List,opt3List: Opt3List,opt4List: Opt4List,answers: Answers,noOfQuest: numbOfQuest));
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      messageTextController.dispose();
      super.dispose();
    }

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
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.black, width: 2)),
              child: TextField(
                controller: messageTextController,
               decoration: InputDecoration(
                 errorText: messageTextController.text.toString().isNotEmpty ?  null:'Question must be Required' ,
               ),
                maxLines: 8,
              ),
            ),
            Options(controller: Options1Controller,context:context,id:1),
            Options(controller: Options2Controller,context:context,id:2),
            Options(controller: Options3Controller,context:context,id:3),
            Options(controller: Options4Controller,context:context,id:4),
            Container(
              child:Text(
                ErrorMsg,
                //validate?"":"Option A and Option B are required",
              )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(onPressed: (){
                  setState(() {
                    messageTextController.text.toString().isNotEmpty && Options1Controller.text.toString().isNotEmpty && Options2Controller.text.toString().isNotEmpty?validate=true:validate=false;
                    if(validate) {
                      ErrorMsg="";
                      i == widget.NoOfQuestion ? changeScreen() :
                      print(messageTextController.text);
                      Qlist.add(messageTextController.text);
                      Opt1List.add(Options1Controller.text);
                      Opt2List.add(Options2Controller.text);
                      Opt3List.add(Options3Controller.text);
                      Opt4List.add(Options4Controller.text);
                      Answers.add(answer);

                      messageTextController.clear();
                      Options1Controller.clear();
                      Options2Controller.clear();
                      Options3Controller.clear();
                      Options4Controller.clear();
                      i++;
                    }
                    else
                    {
                      ErrorMsg = "opt1 and 2 are req";
                    }

                  });

                }, child: Text(i==widget.NoOfQuestion?"Finish":"Save"),color: Colors.green,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
void changeColor(_OptionsState oldOption, _OptionsState newOption,BuildContext context,int answerId)
{
  if(oldOption!=null)
    oldOption.containerColor = Colors.white;
  OldOptionId = newOption;
  newOption.containerColor = Colors.green;
  answer = answerId;

  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }
  (context as Element).visitChildren(rebuild);


}

class Options extends StatefulWidget {

  Options({this.controller,this.context,this.id});
  final TextEditingController controller;
  final BuildContext context;
  final int id;



  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {


  @override
  Color containerColor=Colors.white;


  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(

              style: BorderStyle.solid, color: Colors.black, width: 2)),
      child: GestureDetector(
        child: TextField(
          controller: widget.controller,
          maxLines: 1,
          decoration: InputDecoration(

          ),
        ),
        onDoubleTap: (){
          setState(() {
            changeColor(OldOptionId,this,widget.context,widget.id);
          });
        },
      ),

    );
  }
}

//
//class Options extends StatelessWidget {
//
//
//}
