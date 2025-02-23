
import 'package:app8/lap1/View/widget/dotitem.dart';
import 'package:flutter/material.dart';

class Dotitemactive extends StatelessWidget {
  const Dotitemactive({super.key, required this.number});
  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Dotitem(
              active: number == index,
            ),
          );
        },
      ),
    );
  }
}