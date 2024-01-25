import 'dart:async';

import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 static double birdYaxis=0;
  double time=0;
  double height=0;
  double initialHeight=birdYaxis;
  bool gameHasStarted=false;
  void jump(){
setState(() {
time=0;
initialHeight=birdYaxis;
});

  }
  void startGame(){
    gameHasStarted=true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time +=0.04;
      height =-4.9 * time*time + 2.8 * time;
      setState(() {
        birdYaxis =initialHeight-height;
      });
      if(birdYaxis>1){
        timer.cancel();
        gameHasStarted=false;
      }
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
               onTap:(){
                 if(gameHasStarted){
                   jump();
                 }else{
                   startGame();
                 }
               },
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
             color: Colors.brown,
           ),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Column(
                   children: [
                     Text("SCORE",style: TextStyle(color: Colors.white),),
                     SizedBox(
                       height: 10,
                     ),
                     Text("0",style: TextStyle(color: Colors.white),)
                   ],
                 ),
                   Column(
                   children: [
                     Text("BEST",style: TextStyle(color: Colors.white),),
                     SizedBox(
                       height: 10,
                     ),
                     Text("10",style: TextStyle(color: Colors.white),)
                   ],
                 )
                 ]
                 ,
               ),
         ))
       ],
     ),
    );
  }
}
