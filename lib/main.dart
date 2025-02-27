import 'package:flutter/material.dart';

import 'lab4/View/homeView.dart';
import 'package:app8/lab4/ex1/homeView2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:  
   // homeody(),
     Homeview2()
     
     );
  }
}
