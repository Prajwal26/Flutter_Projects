import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
void main() {
  runApp(Xylophoneapp());
}
class Xylophoneapp extends StatelessWidget {
  
  void playsound(int soundnumber)
  {
    final player = AudioCache();

    // call this method when desired
    player.play('note$soundnumber.wav');
  }

  Expanded buildkey({Color color,int soundnumber})
  {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FlatButton(
            color: color,
            onPressed: ()
            {
              playsound(soundnumber);
            }, child: Text('sound')),
      ),
    );
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: GradientAppBar(
          title: Text('Xylophone') ,
        backgroundColorStart: Colors.black ,
        backgroundColorEnd: Colors.red ,),
        body: SafeArea(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                buildkey(color: Colors.red,soundnumber : 1),

                buildkey(color: Colors.orange,soundnumber : 2),
                buildkey(color: Colors.yellow,soundnumber : 3),
                buildkey(color: Colors.green,soundnumber : 4),
                buildkey(color: Colors.blue,soundnumber : 5),
                buildkey(color: Colors.indigo,soundnumber : 6),
              ],

            )
        ),
      )
    );
  }
}

