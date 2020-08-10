import 'package:flutter/material.dart';
import 'package:testtag/components/rounded_button.dart';
import 'package:testtag/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:testtag/screens/Home_screen.dart';
import 'package:testtag/screens/registration_screen.dart';
import 'package:testtag/screens/welcome_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  _displaySnackBar(BuildContext context, String SnackBarText) {
    final snackBar = SnackBar(
      backgroundColor: Color(0xFFBD34C59),
      content: Text(
        SnackBarText,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'OK',
        onPressed: () {},
      ),
    );
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
        decoration: BoxDecoration(color: Color(0xFFBD34C59)
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
                    'Register',
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
                    'Welcome!',
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
                            height: 80,
                          ),
//
                          Column(
                            children: <Widget>[
                              TextField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: kTextFileDecoration.copyWith(
                                  hintText: 'Enter your email',
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
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

                          SizedBox(height: 50.0),

                          RoundButton(
                            title: 'Register',
                            colour: Color(0xff3E2948),
                            textcolour: Colors.white,
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              if(email!=null && password != null && email.isNotEmpty && password.isNotEmpty)
                                {
                                  try {
                                    final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email.trim(),
                                        password: password.trim());
                                    if (newUser != null) {
                                      Navigator.pushNamed(context, HomePage.id);
                                    }

                                    setState(() {
                                      showSpinner = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                    _displaySnackBar(
                                        context, "Email is invalid or registered");
                                  }
                                }
                              else
                                {
                                  _displaySnackBar(
                                  context, "Email or PassWord is Empty");

                                }
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
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
