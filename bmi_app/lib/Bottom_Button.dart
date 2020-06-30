import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'Result_page.dart';


class BottomButton extends StatelessWidget {

  BottomButton({this.onTap,this.ButtonTitle});
  final Function onTap;
  final String ButtonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(ButtonTitle))
        ,
        color: Color(0xFFD60057),

        margin: EdgeInsets.only(bottom: 2.0),
        width: double.infinity,
        height: 50.0,
      ),
    );
  }
}