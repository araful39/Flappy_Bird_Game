import 'package:flutter/material.dart';
class MyBird extends StatelessWidget {
  const MyBird({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 80,width: 60,
        child: Image.asset("asset/images/bird.png"));
  }
}
