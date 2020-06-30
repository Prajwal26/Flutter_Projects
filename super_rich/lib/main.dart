import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("I am rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Image(
          image: NetworkImage('https://i.insider.com/5e32f2a324306a19834af322?width=1100&format=jpeg&auto=webp'),
    )
        ,

      ),
    )
  ));
}

