import 'package:flutter/material.dart';
import 'package:testtag/screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Questions.dart';
import 'Questpass.dart';
int i=1;
int j=0;
int numberOfQuest =1;

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;


class PageReview extends StatefulWidget{
  static const String id="Page_review";
  @override
  _PageReviewState createState() => _PageReviewState();
}

class _PageReviewState extends State<PageReview> {


  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Quest args = ModalRoute.of(context).settings.arguments;

    List<Widget> Questions=[];

    void addQuestionToFirebase()
    {
      for(j=0;j<numberOfQuest;j++)
      {

        Widget temp =Question_review(Qlist[j].toString(),Opt1List[j].toString(),Opt2List[j].toString(),Opt3List[j].toString(),Opt4List[j].toString(),Answers[j].toString());
        numberOfQuest=numbOfQuest;
        _firestore.collection('Questions').add({
          'Question': Qlist[j].toString(),
          'Option1':Opt1List[j].toString(),
          'Option2':Opt2List[j].toString(),
          'Option3':Opt3List[j].toString(),
          'Option4':Opt4List[j].toString(),
          'classname':"1",
        });
        Questions.add(temp);

      }
    }

    List<Widget> getQuestions()
    {

      for(j=0;j<numberOfQuest;j++)
      {

        Widget temp =Question_review(Qlist[j].toString(),Opt1List[j].toString(),Opt2List[j].toString(),Opt3List[j].toString(),Opt4List[j].toString(),Answers[j].toString());
        numberOfQuest=numbOfQuest;
        //Widget temp = Question_review("Heloo", "gfdg", "dasff", "fdsfds", "dsfds");
        Questions.add(temp);

      }
      Questions.add(FlatButton(onPressed: (){
        addQuestionToFirebase();
        Navigator.pushNamed(context, HomePage.id)
        ;}, child: Text("Save")));
      return Questions;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: getQuestions(),
        ),

      ),
    );
  }
}

class Question_review extends StatelessWidget {

  Question_review(this.Question,this.Option1,this.Option2,this.Option3,this.Option4,this.Answers);

  final String Question;
  final String Option1;
  final String Option2;
  final String Option3;
  final String Option4;
  final String Answers;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Question:",

              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              Question,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "1. $Option1",
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              "2. $Option2",
              style: TextStyle(fontSize: 15.0),
            ),
            Option3.toString().isNotEmpty?Text(
              "3. $Option3",
              style: TextStyle(fontSize: 15.0),
            ):SizedBox(
              height: 0.0,
            ),
            Option4.toString().isNotEmpty?Text(
              "3. $Option4",
              style: TextStyle(fontSize: 15.0),
            ):SizedBox(
              height: 0.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Correct answer: Option $Answers",
                style: TextStyle(fontSize: 15.0),

            ),


          ],

        ),
        decoration: BoxDecoration(
          border: Border.all(  style: BorderStyle.solid, color: Colors.black, width: 2),
        ),
      ),

    );
  }
}
