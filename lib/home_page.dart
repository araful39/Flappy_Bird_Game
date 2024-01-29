import 'dart:async';

import 'package:flappy_bird/barriars.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

static double barrierXone=1;
  double barrierXtwo=barrierXone+1.5;
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
    Timer.periodic(Duration(milliseconds: 60), (timer) {

      time +=0.04;
      height =-4.9 * time*time + 2.8 * time;
      setState(() {
        birdYaxis =initialHeight-height;

      });

  setState(() {
    if(barrierXone < -2){
      barrierXone +=3.5;
    }else{
      barrierXone -=0.05;
    }});

  setState(() {
    if(barrierXtwo < -2){
      barrierXtwo +=3.5;
    }else{
      barrierXtwo -=0.05;
    }


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
    return GestureDetector(
      onTap:(){
      if(gameHasStarted){
        jump();
      }else{
        startGame();
      }
    },
      child: Scaffold(
       body: Column(
         children: [
           Expanded(
               flex: 2,
               child: Stack(
                 children: [
                   AnimatedContainer(
                       alignment: Alignment(0,birdYaxis),
                       duration: Duration(milliseconds: 0),
                       decoration: BoxDecoration(
                           color: Colors.blue
                       ),

                       child: MyBird()
                   ),
                   Container(
                     alignment: Alignment(0,-0.2,),
                     child: gameHasStarted?Text(" "):Text("TAP  TO  PLAY",style: TextStyle(fontSize: 30,color: Colors.white),),
                   ),

                   AnimatedContainer(
                     alignment: Alignment(barrierXone,1.1),
                     duration: Duration(milliseconds: 0),
                     child:    MyBarriers(
                       size: 200.0,
                     ),
                   ),
                   AnimatedContainer(
                     alignment: Alignment(barrierXone,-1.1),
                     duration: Duration(milliseconds: 0),
                     child:    MyBarriers(
                       size: 200.0,
                     ),
                   ),
                   AnimatedContainer(
                     alignment: Alignment(barrierXtwo,1.1),
                     duration: Duration(milliseconds: 0),
                     child:    MyBarriers(
                       size: 200.0,
                     ),
                   ),
                   AnimatedContainer(
                     alignment: Alignment(barrierXtwo,-1.1),
                     duration: Duration(milliseconds: 0),
                     child:    MyBarriers(
                       size: 200.0,
                     ),
                   ),
                 ],
               )),


           Expanded(
               flex: 1,
               child: Container(

             decoration: BoxDecoration(
               color: Colors.brown,
             ),
                 child: Row(

                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("SCORE",style: TextStyle(color: Colors.white,fontSize: 30),),
                       SizedBox(
                         height: 10,
                       ),
                       Text("0",style: TextStyle(color: Colors.white,fontSize: 20),)
                     ],
                   ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("BEST",style: TextStyle(color: Colors.white,fontSize: 30),),
                       SizedBox(
                         height: 10,
                       ),
                       Text("10",style: TextStyle(color: Colors.white,fontSize: 20),)
                     ],
                   )
                   ]
                   ,
                 ),
           ))
         ],
       ),
      ),
    );
  }
}
