import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi dengan sqflite",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  Homepagechild createState() => Homepagechild();
}

class Homepagechild extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add, color: Colors.white),
          onPressed: (){},
          ),
          
      appBar: new AppBar(
        title: new Text("Flutter + Sqflite"),
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: new Text(
                "Saya sudah menambahkan module sqflite dan module path provider"),
          )
        ],
      ),
    );
  }
}
