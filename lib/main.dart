import 'package:app8/lab1/View/widget/models/categersmodels.dart';
import 'package:app8/lab5/api/ApiService.dart';
import 'package:app8/lab5/view/homeview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
 Apiservice(Dio()).fetchcagters();
  // Apiservice(Dio()).gettype();
  runApp( MyApp(
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,
  // required this.categersmodels
   });
 // final List<Categersmodels> categersmodels;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homeview());
  }
}
