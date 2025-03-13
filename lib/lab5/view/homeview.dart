import 'package:app8/lab2/core/assets.dart';
import 'package:app8/lab5/View/widget/homeviewbody.dart';

import 'package:app8/lab5/constant/colors.dart';
import 'package:app8/lab5/core/styles/stylestext.dart';
import 'package:app8/lab5/data/sql_contstant.dart';
import 'package:app8/lab5/data/sqlite.dart';
import 'package:app8/lab5/view/favriteview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
 // Sqlite sqlite = Sqlite();
  int idexnum = 0;
  

  final List<Widget> pages = [
    Homeviewbody(),
    Favriteview(),
    Center(child: Text('profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.assetsArrowsf),
        ),
        title: Text('Breakfast', style: Stylestext.font22semibold),
        centerTitle: true,
        actions: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(600),
              color: kprimarycolor,
            ),
            child: Center(
              child: Icon(
                Icons.notifications_none_outlined,
                color: Color(0xffEC888D),
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(600),
              color: kprimarycolor,
            ),
            child: Center(
              child: Icon(Icons.search, color: Color(0xffEC888D), size: 30),
            ),
          ),
        ],
      ),
      body: pages[idexnum],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: kcolorwhite,
        color: kprimarycolor,
        items: [
          Icon(Icons.home, size: 30, color: Colors.amber),
          Icon(Icons.person, size: 30, color: Colors.amber),
          Icon(Icons.notifications, size: 30, color: Colors.amber),
        ],
        onTap: (value) {
          setState(() {
            idexnum = value;
            if (value == 1) {}
          });
        },
      ),
    );
  }
}
