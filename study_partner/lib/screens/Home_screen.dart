import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(

          appBar: AppBar(

            title: Center(child: Text("My anatomy",style: TextStyle(
                color: Colors.black,
              fontSize: 25.0
            ),)),
            actions: <Widget>[
              Icon(Icons.add,size: 40.0,color: Colors.black),
              Icon(Icons.more_vert,size: 40.0,color: Colors.black,),
            ],
            backgroundColor: Colors.white,
            elevation: 50.0,
            leading: Icon(Icons.menu,size: 45.0,color: Colors.black),
            bottom: PreferredSize(child: Container(color: Colors.white, height: 2.0,), preferredSize: Size.fromHeight(2.0)),


          ),
        body: ListView(
            shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Info_Card(),






          ],
        ),

        ),
      ),
    );
  }
}

class Info_Card extends StatelessWidget {
 Info_Card({this.color});
final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),

      child: Container(
        height: 165.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("Images/two.jpg"),
//            colorFilter: ColorFilter.mode(Colors.grey,BlendMode.color),

            fit: BoxFit.cover,
          ),
//
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
        child:Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,top:8.0,right: 8.0),
                child: Row(

                  children: <Widget>[
                    Expanded(
                      flex: 11,
                      child:  Align(
                         alignment: Alignment.bottomLeft,
                        child: Container(
                          child: Text("Sky Elephant bdfdgsfhdsghg dsfhdsghfgdsf bsjdfghdsghfdsfk",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                    )
        ,
                    Expanded(
                      flex: 1,

                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0,),
                          child: Icon(Icons.more_vert,color:Colors.white,size: 30.0,),
                        ))

                  ],
                ),
              ),
            ),
            Expanded(

                flex:2,
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "zara zara ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0
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
            Expanded(
                flex:3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
             padding: const EdgeInsets.all(2.0),
                  child: Container(
                   padding: EdgeInsets.only(left: 15.0,bottom: 8.0),
                    child: Text(
                      "Mera Raja",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ) ,


      ),
    );
  }
}
