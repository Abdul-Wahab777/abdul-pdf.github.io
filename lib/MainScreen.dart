import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'showSubject.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  List classes = ['9th Class', '10th Class', '11th Class', '12th Class'];
  var colors = [Colors.red, Colors.yellow, Colors.teal, Colors.orange];
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Icon(Icons.home),
      ),

      body: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (BuildContext context, int count) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      color: colors[count],
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(15.0)),
                      depth: 2,
                      intensity: 1,
                      shape: NeumorphicShape.concave,
                      shadowLightColor: Colors.black,
                      lightSource: LightSource.bottomLeft),
                  child: MaterialButton(
                   highlightColor: Colors.black,
                  splashColor: Colors.white,
                  highlightElevation: 9,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: NeumorphicText(
                          '${classes[count]}',
                          style: NeumorphicStyle(
                              depth: 1,
                              color: colors[count],
                              shadowLightColorEmboss: Colors.red,
                              surfaceIntensity: 1,
                              intensity: 1),
                          textStyle: NeumorphicTextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Teko',
                          ),
                        )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// body: GridView.builder(
//     itemCount: classes.length,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, mainAxisSpacing: 0),
//     itemBuilder: (BuildContext context, int count) {
//       return Center(
//         child: Neumorphic(
//           style: NeumorphicStyle(
//             color: colors[count],

//             boxShape:
//                 NeumorphicBoxShape.roundRect(BorderRadius.circular(15.0)),
//             depth: 2,

//             intensity: 1,
//             // surfaceIntensity: 0.5,
//             shape: NeumorphicShape.concave,

//             shadowLightColor:Colors.black,

//             lightSource: LightSource.bottomLeft
//           ),
//           child: Container(
//               alignment: Alignment.center,
//               height: 100,
//               width: 180,
//               decoration: BoxDecoration(
//                   // color: colors[count],
//                   // borderRadius: BorderRadius.circular(20.0)
//                   ),
//               child: NeumorphicText(
//                 '${classes[count]}',
//                 style: NeumorphicStyle(
//                   depth: 1, //customize depth here
//                   // color: Colors.greenAccent,
//                   color: colors[count],

//                   shadowLightColorEmboss:

//                       Colors.red,
//                       surfaceIntensity: 1,
//                       intensity: 1 //customize color here
//                 ),
//                 textStyle: NeumorphicTextStyle(
//                   fontSize: 37,
//                   fontWeight: FontWeight.bold
//                 ),
//               )),
//         ),
//       );
//     }),
//  Container(
//          alignment: Alignment.center,
//         height: 100,
//         width: 190,
//         decoration: BoxDecoration(
//          color: colors[count],
//          borderRadius: BorderRadius.circular(20.0)

//         ),
//           child:Text(classes[count]
//           ,style: TextStyle(
//             color: Colors.white,
//             fontSize: 40.0,

//           ),) ,
//        ),
