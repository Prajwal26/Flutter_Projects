import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First blog app",style:TextStyle(
          fontWeight: FontWeight.w900,
        ),),
      ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.yellow,
                  Colors.red,
                ],
              )
            ),
        child: Column(

        ),
    ),
    );

  }


}
