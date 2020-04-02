import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:basic_utils/basic_utils.dart';
class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Center(

            child: Text("Decoded Variables"),

          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(1.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('variables').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return new ListView(
                          controller: _scrollController,
                          reverse: false,
                          shrinkWrap: true,
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return Card(
                              child: new Row(
                                children: <Widget>[

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(document['sclass'].toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(document['type'].toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(document['name'].toString()),
                                  ),
                                ],

                              ),
                            );

                          }).toList(),
                        );
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
