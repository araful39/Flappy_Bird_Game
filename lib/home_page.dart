import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Expanded(
             flex: 2,
             child: Container(
           decoration: BoxDecoration(
             color: Colors.blue
           ),

               child: Center(child: MyBird())
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
