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
      home: Variable(),
    );
  }
}

class Variable extends StatefulWidget {
  @override
  _VariableState createState() => _VariableState();
}

class _VariableState extends State<Variable> {
  String name, type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            SizedBox(

              width: 200.0,
              height: 20.0,

            ),

            Center(

              child: Text("Datatype Table"),

            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: DataTable(columns: [

                DataColumn(
                  label: Text("Variable Type"),
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
                    Text("boolean", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("b_"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("char", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("ch_"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("String", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("str_"),
                  ),
                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("long", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("l_"),
                  ),

                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("int", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("i_"),
                  ),


                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("short", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("s_"),
                  ),

                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("byte", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("by_"),
                  ),

                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("float", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("fl_"),
                  ),

                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),
                DataRow(cells: [

                  DataCell(
                    Text("double", style: new TextStyle( fontWeight: FontWeight.bold),),
                  ),
                  DataCell(
                    Text("db_"),
                  ),

                  DataCell(
                    Text("1 to 19 [A-z,0-9]"),
                  ),
                ]),

              ]),
            ),



          ],


        )
    );
  }
}
