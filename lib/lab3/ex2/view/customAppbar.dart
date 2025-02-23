import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 18),
    color: Colors.white,
    child: Column(
      children: [
        SizedBox(height: 60),
        Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 20),

            Text(
              'UX Designer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Icon(Icons.close, color: Color(0xffAFB0B6)),
          ],
        ),
        SizedBox(height: 10),
        Divider(indent: 10, endIndent: 5, color: Color(0xffAFB0B6)),
        SizedBox(height: 24),
        Row(
          children: [
            Text(
              '293 Jobs Found',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff356899),
              ),
            ),
            Spacer(),
            Icon(Icons.filter, color: Color(0xff356899), size: 20),
          ],
        ),
      ],
    ),
  );
  }
}