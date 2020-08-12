import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:testtag/components/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';


class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';
  @override


  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
//      print(animation.value);
    });
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Center(
             child: Text(
               "Testtag",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 50.0,
                 fontFamily: 'Lobster',

              ),
             ),
           ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              colour: Color(0xff3E2948),
              title: 'LOG IN',
              textcolour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, Login_Page.id);
              },
            ),
            RoundButton(
              colour: Color(0xffE0DFE0),
              title: 'Register',
              textcolour:Color(0xff3E2948) ,

              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

