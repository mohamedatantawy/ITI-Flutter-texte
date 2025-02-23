import 'package:app8/lab3/core/image.dart';
import 'package:app8/lab3/ex1/View/iamgemodels.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});
  final List<Iamgemodels> items = [
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
    Iamgemodels(image: Imagess.image1, title: 'the best mode'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Positioned(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(items[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //   child: Text(items[index].title, style: TextStyle(fontSize: 25)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 100,
                    padding: EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(color: Colors.black45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          items[index].title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
