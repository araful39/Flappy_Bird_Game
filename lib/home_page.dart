import 'dart:async';

import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdYaxis=-1;
  void jump(){
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        birdYaxis +=0.1;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print("Print");
    return Scaffold(
     body: Column(
       children: [
         Expanded(
             flex: 2,
             child: GestureDetector(
               onTap:jump,
               child: AnimatedContainer(
                 alignment: Alignment(0,birdYaxis),
           duration: Duration(milliseconds: 0),
           decoration: BoxDecoration(
               color: Colors.blue
           ),

                 child: MyBird()
         ),
             )),
         Expanded(
             flex: 1,
             child: Container(
           decoration: BoxDecoration(
             color: Colors.green
           ),
         ))
       ],
     ),
    );
  }
}
