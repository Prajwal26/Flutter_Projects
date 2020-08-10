import 'package:flutter/material.dart';


class Info_Card extends StatelessWidget {
  Info_Card({this.color,this.text,this.imageUrl});
  final Color color;
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 185.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff81ECEC),Color(0xffd1d1e0)]),
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.0,
                child: Image.network(imageUrl,width: 200.0,height: 200.0,),
              ),
              Expanded(
                flex: 11,

                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: Center(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff3E2948),
                            fontFamily: 'Lobster',
                            fontWeight: FontWeight.w500,
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 10.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}