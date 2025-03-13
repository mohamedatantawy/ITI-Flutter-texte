import 'package:app8/lab2/core/assets.dart';
import 'package:app8/lab5/constant/colors.dart';
import 'package:app8/lab5/core/styles/stylestext.dart';
import 'package:app8/lab5/models/categersmodels.dart';
import 'package:app8/lab5/view/widget/detailviewbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detailsview extends StatelessWidget {
  const Detailsview({super.key, required this.categersmodels});
  final Categersmodels categersmodels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
              child: SvgPicture.asset(
                Assets.assetsHeart,
                // colorFilter: ColorFilter.srgbToLinearGamma(),
                color: kcolorwhite,
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
              child: Icon(Icons.share, color: kcolorwhite, size: 20),
            ),
          ),
        ],
      ),
      body: Detailviewbody(categersmodels: categersmodels),
    );
  }
}
