import 'package:flutter/material.dart';
import 'package:testtag/screens/Attemp_test.dart';
import 'package:testtag/screens/owner_screen.dart';
import 'screens/Home_screen.dart';
import 'screens/addContain.dart';
import 'screens/Test_create.dart';
import 'screens/Questions.dart';
import 'screens/Page_review.dart';
import 'screens/Attemp_test.dart';
import 'screens/score.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/owner_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
      theme: ThemeData(


      ),
//      home: HomePage(),
      initialRoute: WelcomeScreen.id,
      routes:{
        HomePage.id :(context)=>HomePage(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        OwnerClass.id:(context)=>OwnerClass(),

        AddForm.id:(context)=>AddForm(),
        Test_create.id:(context)=>Test_create(),
        Questions.id:(context)=>Questions(),
        PageReview.id:(context)=>PageReview(),
        Attemp_test.id:(context)=>Attemp_test(),
        Score.id:(context)=>Score(),

      }
    );
  }
}


