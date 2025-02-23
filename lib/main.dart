import 'package:app8/lab3/ex2/view/homeview2.dart';
import 'package:flutter/material.dart';

import 'lab3/ex2/View/homeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homeview());
  }
}
