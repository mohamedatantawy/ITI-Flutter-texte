import 'package:app8/lab3/core/image.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}

_body() {
  return Column(
    children: [
      _Appbar(),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return _bodyofcolumn();
          },
        ),
      ),
    ],
  );
}

_bodyofcolumn() {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 27, vertical: 17),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Colors.white),
    ),
    child: ListTile(
      leading: CircleAvatar(foregroundImage: AssetImage(Imagess.image1)),
      title: Text(
        'UX Designer',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text('Burger King', style: TextStyle(color: Color(0xff0D0D26))),

      trailing: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              r'$96,000/y',
              style: TextStyle(color: Color(0xff0D0D26), fontSize: 12),
            ),
            Text(
              r'Los Angels, US',
              style: TextStyle(color: Colors.grey[70], fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}

_Appbar() {
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
