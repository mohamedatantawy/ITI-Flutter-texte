import 'package:app8/lab3/core/image.dart';
import 'package:app8/lab3/ex2/view/customAppbar.dart';
import 'package:app8/lab3/ex2/view/modelsgird.dart';
import 'package:flutter/material.dart';

class Homeview2 extends StatelessWidget {
  const Homeview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }
}

_body() {
  return ListView(
    children: [
      _Appbar(),
      homeView2body(title: 'Recommended Jobs'),
      Expanded(child: homeView2body(title: 'Popular Jobs')),
    ],
  );
}

class homeView2body extends StatelessWidget {
  homeView2body({super.key, required this.title});
  List<Modelsgird> items = [
    Modelsgird(
      image: Imagess.image1,
      title: 'UX Designer',
      price: r'$80,000/y',
      subtitle: 'Dribbble',
    ),
    Modelsgird(
      image: Imagess.image1,
      title: 'UX Designer',
      price: r'$80,000/y',
      subtitle: 'Dribbble',
    ),
    Modelsgird(
      image: Imagess.image1,
      title: 'UX Designer',
      price: r'$80,000/y',
      subtitle: 'Dribbble',
    ),
    Modelsgird(
      image: Imagess.image1,
      title: 'UX Designer',
      price: r'$80,000/y',
      subtitle: 'Dribbble',
    ),
  ];
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff0D0D26),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(color: Color(0xff95969D), fontSize: 13),
              ),
            ],
          ),
        ),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          children:
              items.map((e) {
                return Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(foregroundImage: AssetImage(e.image)),
                        Text(
                          e.title,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(e.subtitle, style: TextStyle(color: Colors.grey)),
                        Text(
                          e.price,
                          style: TextStyle(color: Color(0xff0D0D26)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

/*Column(
                  children: [
                    CircleAvatar(foregroundImage: AssetImage(e.image)),
                    Text(
                     e.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                     Text('Burger King', style: TextStyle(color: Color(0xff0D0D26))),
                  ],
                );
               */
_Appbar() {
  return Customappbar();
}
