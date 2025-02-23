
import 'package:app8/lab2/core/assets.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key});

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  int leftPart = 1;
  int rightPart = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Click to roll",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Row(
          children: [
            Text("Sum :", style: TextStyle(color: Colors.white, fontSize: 25)),
            SizedBox(width: 25),
            Text("2", style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
        Container(
          height: 100,
          width: 100,
          //color: Colors.amber,
          child: Image.asset('asset/dice1.png'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              leftPart = math.Random().nextInt(6) + 1;
            });
          },
          child: Text('Roll'),
        ),
      ],
    );
  }
}
