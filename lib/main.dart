import 'package:flutter/material.dart';
import 'storageclass.dart';
import 'variabletype.dart';
import 'Home.dart';
import 'display.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled=true;
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Encode(),
    );
  }
}

class Encode extends StatefulWidget {
  @override
  _EncodeState createState() => new _EncodeState();
}

class _EncodeState extends State<Encode> {


  int _currentIndex=0;
  final color = const Color(0xff0B3954);

  final List<Widget> _children=[

    Home(),
    Storage(),
    Variable(),
    Display(),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Variable Encoder and Decoder",style: TextStyle(fontSize: 14.0),),
        backgroundColor: color,
      ),



      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.store),
            title: Text("Home",style: TextStyle(fontSize: 10.0),),
            backgroundColor: color,
          ),

          BottomNavigationBarItem(
            icon: new Icon(Icons.gradient),
            title: Text("Storage Table",style: TextStyle(fontSize: 10.0)),
            backgroundColor: color,
          ),

          BottomNavigationBarItem(
            icon: new Icon(Icons.format_color_text),
            title: Text("Variable Table",style: TextStyle(fontSize: 10.0)),
            backgroundColor: color,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.view_list),
            title: Text("View vars",style: TextStyle(fontSize: 10.0)),
            backgroundColor: color,
          ),

        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}