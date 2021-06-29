


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'About.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
      // animationDuration: Duration(milliseconds: 500),
      duration: 4000,
      splash: Hero(tag: "icon", child: Icon(Icons.home,size: 100,)),
      
      nextScreen: About(),
      splashTransition: SplashTransition.sizeTransition,
      curve: Curves.bounceInOut,
       animationDuration: Duration(seconds:3),
      //  disableNavigation: true,
      backgroundColor: Colors.white,
    ));
  }
}

// class MyApp extends StatelessWidget{
//     @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//    home: About()
//     );
//   }
// }

