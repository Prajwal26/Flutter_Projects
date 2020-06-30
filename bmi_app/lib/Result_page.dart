import 'package:bmiapp/constants.dart';
import 'package:bmiapp/reuseablecard.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'main.dart';
import 'constants.dart';
import 'Bottom_Button.dart';


class ResultPage extends StatelessWidget {

  ResultPage({@required this.BmiCount,@required this.BmiText,@required this.InterpretBmi});

  final String BmiCount;
  final String BmiText;
  final String InterpretBmi;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',style: ResTextstyle,),
          )),
          Expanded(
            flex: 5,
              child: ReusableCard(colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(BmiText,style: KresText,),
                  Text(BmiCount,style: Nrestext,),
                  Text(InterpretBmi,style:Arestext),
                ],
              ),


              )),
              BottomButton(ButtonTitle: 'RE-CALCULATE',
              onTap:() {Navigator.pop(context);}
              )
        ],
      ),    );
  }
}
