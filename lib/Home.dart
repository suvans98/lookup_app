import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:basic_utils/basic_utils.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget
{

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}

class Home extends StatefulWidget
{
  @override
  _HomeState createState()=> new _HomeState();
}

class _HomeState extends State<Home>
{


  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  encode()
  {
    String str=myController1.text;
    int l=str.length;

    String temp="";
    for(int i=l-1 ;i>=0&&str[i]!=' '; i--)
      {
        temp=temp+str[i];
      }
      temp=StringUtils.reverse(temp);

    String storage="",datatype="";


      if(str.contains("int"))
      {
          datatype="i_";
      }
      else if(str.contains("boolean"))
      {
          datatype="b_";
      }
      else if(str.contains("char"))
      {
        datatype="ch_";
      }
      else if(str.contains("String"))
      {
        datatype="str_";
      }
      else if(str.contains("long"))
      {
        datatype="l_";
      }
      else if(str.contains("short"))
      {
        datatype="s_";
      }
      else if(str.contains("byte"))
      {
        datatype="by_";
      }
      else if(str.contains("float"))
      {
        datatype="b=fl_";
      }
      else if(str.contains("double"))
      {
        datatype="db_";
      }

      if(str.contains("extern"))
      {
         storage="e_";
      }
      else if(str.contains("auto"))
      {
        storage="a_";
      }
      else if(str.contains("register"))
      {
        storage="r_";
      }
      else if(str.contains("static"))
      {
        storage="s_";
      }
      else if(str.contains("unsigned"))
      {
        storage="u_";
      }

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the that user has entered by using the
          // TextEditingController.

          content: Text(storage+datatype+temp),
        );
      },
    );
  }

  decode()
  {
      String storageclass=" ";
      String datatype;
      String name;
      int pos=0;
      String str=myController2.text;

      int l=str.length;
      int flg=0;
      if(l<5)
        {
          flg=1;
        }
      else {
        for (int i = 0; i < l; i++) {
          if (str[1] == '_') {
            switch (str[0]) {
              case 'e':
                storageclass = "extern";
                break;

              case 'a':
                storageclass = "auto";
                break;

              case 'r':
                storageclass = "register";
                break;

              case 's':
                storageclass = "static";
                break;

              case 'u':
                storageclass = "unsigned";
                break;

              default:
                flg = 1;
                break;
            }
            if(flg==1)
            {
              i=l+1;
              break;
            }

            if(str[3]=='_' || str[4]=='_' || str[5]==' ')
            {
              if(str[2]=='b')
              {
                if(str[3]=='_')
                {
                  datatype="boolean";
                  pos=4;
                }
                if(str[3]=='y' && str[4]=='_')
                {
                  datatype="byte";
                  pos=5;
                }
              }

              else if(str[2]=='c'&& str[3]=='h' && str[4]=='_')
              {
                datatype="char";
                pos=5;
              }

              else if(str[2]=='s')
              {
                if(str[3]=='_')
                {
                  datatype="short";
                  pos=4;
                }
                else if(str[4]=='t' && str[5]=='r')
                {
                  datatype="string";
                  pos=6;
                }
              }
              else if(str[2]=='l' && str[3]=='_')
              {
                datatype="long";
                pos=4;
              }
              else if(str[2]=='i' && str[3]=='_')
              {
                datatype="int";
                pos=4;
              }
              else if(str[2]=='f' && str[3]=='l' && str[4]=="_")
              {
                datatype="float";
                pos=5;
              }
              else if(str[2]=='d' && str[3]=='b' && str[4]=="_")
              {
                datatype="double";
                pos=5;
              }
              else
              {
                flg=1;
              }
            }
            else
            {
              flg=1;
              i=l+1;
              break;
            }

          }
          else
            {
              flg=1;
              i=l+1;
              break;
            }
        }


      }
      if(flg==1)
        {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.

                content: Text("Violation"),
              );
            },
          );
        }
      else
        {
          Firestore.instance
              .collection('variables')
              .add({
            "name": str.toString(),
            "sclass": storageclass.toString(),
            "type": datatype.toString(),
          });
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.

                content: Text(storageclass+" "+datatype),
              );
            },
          );

        }



  }


  static final color = const Color(0xff0B3954);



  @override

  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(


          child: ListView(


            children: <Widget>[

              SizedBox(

                width: 200.0,
                height: 50.0,

              ),

              Container(
                width: MediaQuery.of(context).size.width*0.85,

               child: new Text('Enter Variable Name', textAlign: TextAlign.center,
                  style: new TextStyle(color: hexToColor("#02706e"), fontSize: 25.0),),

              ),

              new Padding(padding: EdgeInsets.only(top: 50.0)),

              Container(
              width: MediaQuery.of(context).size.width*0.85,
               child: new TextFormField(
                 controller: myController1,
                  decoration: new InputDecoration(

                    labelText: "Enter...",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

              ),

              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                ),
                child: Text("Encode", style: TextStyle(color:  Colors.white),),
                onPressed: encode,
                color: color,
              ),
              SizedBox(

                width: 200.0,
                height: 50.0,

              ),


              new Padding(padding: EdgeInsets.only(top: 50.0)),

              Container(
                width: MediaQuery.of(context).size.width*0.85,
                child: new TextFormField(
                  controller: myController2,
                  decoration: new InputDecoration(

                    labelText: "Enter...",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

              ),


              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
                child: Text("Decode", style: TextStyle(color:  Colors.white),),
                color: color,
                onPressed: decode,



              ),

            ],

          ),

        ),
      ),


    );
  }


}

