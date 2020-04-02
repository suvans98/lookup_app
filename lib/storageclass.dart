import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Storage(),
    );
  }
}

class Storage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  String name, type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            SizedBox(

              width: 200.0,
              height: 60.0,

            ),

            Center(

              child: Text("Storage Classes"),

            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: DataTable(columns: [

                DataColumn(
                  label: Text("Variable Type"),
                  numeric: false,

                ),

                DataColumn(
                  label: Text("CompID"),
                  numeric: false,

                ),
                DataColumn(
                  label: Text("Typefeild"),
                  numeric: false,

                ),

                DataColumn(
                  label: Text("Description"),
                  numeric: false,

                ),
              ], rows: [

                DataRow(cells: [

                  DataCell(
                    Text("Extern", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("e_"),
                  ),

                  DataCell(
                    Text("1 to 3 [a-z,0-9]"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-Z,0-9]"),
                  ),
                ]),
                DataRow(
                    cells: [

                    DataCell(
                    Text("Auto", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("a_"),
                  ),

                  DataCell(
                    Text("1 to 3 [a-z,0-9]"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-Z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("Register", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("r_"),
                  ),

                  DataCell(
                    Text("1 to 3 [a-z,0-9]"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-Z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("Static", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("s_"),
                  ),

                  DataCell(
                    Text("1 to 3 [a-z,0-9]"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-Z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("Unsigned", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("u_"),
                  ),

                  DataCell(
                    Text("1 to 3 [a-z,0-9]"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-Z,0-9]"),
                  ),
                ]),

              ]),
            ),



          ],


        )
    );
  }
}
