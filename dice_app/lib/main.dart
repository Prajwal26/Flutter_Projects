import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar( title:Text('dice app'),
        backgroundColor: Colors.blueGrey,),

      body: DicePage(),
    ),
  ),);
}


class DicePage extends StatefulWidget {
  @override
  _DicePagestate createState() => _DicePagestate();
}

class _DicePagestate extends State<DicePage> {
  int leftdicenum=3;
  int rightdicenum=4;
  Widget build(BuildContext context) {
     ;
      return Center(
        child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('nimg/del.jpg'),
          ),
          Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
          child: FlatButton(
            onPressed: ()
            {
              setState(() {
                leftdicenum=Random().nextInt(6)+1;
                rightdicenum=Random().nextInt(6)+1;
              });
            },
            child: Image.asset('nimg/dice$leftdicenum.png')),
            )),
          Expanded
            (child: Padding(
            padding: const EdgeInsets.all(16.0),
              child: FlatButton(
              onPressed: ()
              {
                setState(() {
                  leftdicenum=Random().nextInt(6)+1;
                rightdicenum=Random().nextInt(6)+1;
              });
            },
              child: Image.asset('nimg/dice$rightdicenum.png')),
            )
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('nimg/del1.jpg'),
          ),
          ],
        ),
        );
      }
    }





