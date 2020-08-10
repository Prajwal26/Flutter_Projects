
import 'package:flutter/material.dart';
import 'package:testtag/components/rounded_button.dart';
import 'package:testtag/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:testtag/screens/Home_screen.dart';
import 'package:testtag/screens/registration_screen.dart';
import 'package:testtag/screens/welcome_screen.dart';

class Login_Page extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  _displaySnackBar(BuildContext context,String SnackBarText) {
    final snackBar = SnackBar( backgroundColor: Color(0xFFBD34C59),
      content: Text(SnackBarText,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'OK',
        onPressed: () {

        },
      ),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFBD34C59)
//          gradient: LinearGradient(colors: [
////            Colors.yellow,
////            Colors.orange,
//            Color.fromRGBO(8, 19, 53, 50),
//            Color.fromRGBO(22, 48, 124, 50)
//
//          ]),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0))),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
//
                             Column(
                              children: <Widget>[

                                TextField(

                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  decoration:
                                  kTextFileDecoration.copyWith(hintText: 'Enter your email',),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                TextField(
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  decoration: kTextFileDecoration.copyWith(
                                      hintText: 'Enter your password'),
                                ),


                              ],
                            ),

                          SizedBox(height:50.0),
                          GestureDetector(
                            onTap: () async{
                              if(email != null && email.isNotEmpty){
                                print("abc");
                                try {
                                  await _auth.sendPasswordResetEmail(
                                      email: email.trim());
                                  _displaySnackBar(context,'Mail sent!');
                                }
                                catch(e){
                                  _displaySnackBar(context,'User not found');
                                }
                              }
                              else
                                {
                                  _displaySnackBar(context,'Please Enter Email');
                                }
                            },
                            child: Text('forgot Password',style: TextStyle(
                              color: Colors.grey,
                            ),),
                          ),
                          SizedBox(height: 40.0,),
                          RoundButton(
                            title: 'Log In',

                            colour: Color(0xff3E2948),
                            textcolour: Colors.white,
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user = await _auth.signInWithEmailAndPassword(
                                    email: email.trim(), password: password.trim());
                                if (user != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                }

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                _displaySnackBar(context,'Invalid Credentials');
                                print(e);
                              }
                            },
                          ),
                          SizedBox(height: 30.0,),





                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}



