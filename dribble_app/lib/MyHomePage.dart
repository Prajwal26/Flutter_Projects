import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(

         child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             Expanded(
               child: Container(
                 child: Column(
                   children: <Widget>[

                     Expanded(

                         child: Container(
                           margin: EdgeInsets.all(40.0),
                           width: double.infinity,
                           child: Text("Refund Requests",style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w900,
                           ),),
                         )),

                     Expanded(child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 40),

                       child: SearchBar(
                         searchBarStyle: SearchBarStyle(
                             backgroundColor: Colors.black12
                         ),
                       ),
                     ),),

                     Expanded(

                         child: Container(
                           margin: EdgeInsets.only(right:40.0,left:40.0),
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text("80% is solved",style: TextStyle(
                                 fontSize: 30,
                                 fontWeight: FontWeight.w900,
                               ),),

                               Container(

                                 decoration: BoxDecoration(),
                                 child: CircularPercentIndicator(
                                   radius: 45.0,
                                   lineWidth: 4.0,
                                   percent: 0.60,
                                   center: new Text("60%"),
                                   progressColor: Colors.yellow,
                                 ),
                               ),
                             ],
                           ),

                         )),
                     Expanded(

                         child: Container(
                           margin: EdgeInsets.only(right:40.0,left:40.0),
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text("Jeff",style: TextStyle(
                                 fontWeight: FontWeight.w900,
                                 fontSize: 40,
                               ),),




                               Expanded(
                                   child: Image(image: AssetImage("assets/img1.png"),)

                               ),
                             ],
                           ),
                         )),

                     Expanded(

                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadiusDirectional.circular(40)
                           ),
                           margin: EdgeInsets.all(40.0),

                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               CircleAvatar(
                                 radius: 30.0,
                                 backgroundImage: AssetImage("assets/img1.png"),
                               ),
                               Expanded(
                                 child: Text("I am pk",style:TextStyle(
                                     fontWeight: FontWeight.w900
                                 )),
                               ),
                               SizedBox(width: 200,),
                               Expanded(

                                   child: Text("ab"))
                             ],
                           ),
                         )),
                     Expanded(

                       child: Container(
                         decoration: BoxDecoration(
                           color: Colors.white70
                         ),
                         child: BottomNavigationBar(items:[

                           BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.white70,title: Text("Home")),
                           BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.white70,title: Text("Home")),
                           BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.white70,title: Text("Home")),
                           BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.white70,title: Text("Home")),

                         ]),
                       ),

                     )


                   ],


                 ),
               ),

             ),


           ],

         ),


     ),
    );
  }
}
