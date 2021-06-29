import 'dart:ui';

import 'package:flutter/material.dart';
import 'MainScreen.dart';

class About extends StatelessWidget {
  // const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // backgroundColor: Colors.red,

      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title:  Hero(
          tag: "icon",
          child: Icon(Icons.home),
        ),
      ),
      body: Container(
      color: Colors.indigo[200],
      alignment: Alignment.center,
      child: RaisedButton(
        splashColor: Colors.red,
      //  hoverColor: Colors.black,
       
       elevation: 20,
       color: Colors.grey, 
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
        },
      child: Text("Continue",style: TextStyle(
        color: Colors.white,
        fontSize: 40.0,
        
      ),),
      ),
    ),
    );
  }
}