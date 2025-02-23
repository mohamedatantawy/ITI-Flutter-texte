import 'package:app8/lap1/View/widget/homeviewbody.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(800),
            color: Colors.amber,
          ),
        ),
        title: Text('Mohamed El tantawy'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
        ],
      ),
      body: Homeviewbody(),
      bottomNavigationBar: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent[200],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: BottomNavigationBar(
            backgroundColor: Colors.blue,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'qe_code',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'account',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menw'),
            ],
          ),
        ),
      ),
    );
  }
}
