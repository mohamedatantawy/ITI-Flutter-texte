import 'package:app8/lab2/core/assets.dart';
import 'package:app8/lab5/constant/colors.dart';
import 'package:app8/lab5/core/styles/stylestext.dart';
import 'package:app8/lab5/models/categersmodels.dart';
import 'package:flutter/material.dart';

class Detailviewbody extends StatelessWidget {
  const Detailviewbody({super.key, required this.categersmodels});
  final Categersmodels categersmodels;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(35),
          child: Container(
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: kprimarycolor,
              borderRadius: BorderRadius.all(Radius.circular(17)),
            ),
            child: Column(
              children: [
                Container(
                  height: 280,
                  // width: 100,
                  decoration: BoxDecoration(
                    color: kprimarycolor,
                    borderRadius: BorderRadius.circular(18),

                    image: DecorationImage(
                      image: NetworkImage(categersmodels.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Flexible(
                        child: Text(
                          categersmodels.name ?? '',
                          style: Stylestext.font20medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, size: 14, color: kcolorwhite),
                        SizedBox(width: 4),
                        Text(
                          categersmodels.rating.toString(),
                          style: Stylestext.font12normal,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.chat, size: 14, color: kcolorwhite),
                        SizedBox(width: 4),
                        Text(categersmodels.reviewCount.toString()),
                        SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(Assets.assetsBr)),
            title: Text('@Andrew-Mar', style: Stylestext.font12normalpink),
            subtitle: Text(
              'Andrew Martinez-Chef',
              style: Stylestext.font12normalbrown,
            ),
            trailing: SizedBox(
              width: 140,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 21,
                    decoration: BoxDecoration(
                      color: kcolorpinkwhite,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text('Following', style: Stylestext.font15regular),
                    ),
                  ),
                  Icon(Icons.more_vert, color: kcolorpink),
                ],
              ),
            ),
          ),
        ),
        Divider(indent: 35, endIndent: 35, color: kprimarycolor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Details', style: Stylestext.font22semibold),
                  SizedBox(width: 15),
                  Icon(Icons.alarm, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '${categersmodels.cookTimeMinutes}min',
                    style: Stylestext.font12normal,
                  ),
                ],
              ),
              Text(
                categersmodels.instructions.toString() ?? '',
                style: Stylestext.font12normal,
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ingredients', style: Stylestext.font22semibold),
              SizedBox(height: 10),
              Column(
                children: List.generate(categersmodels.ingredients!.length, (
                  index,
                ) {
                  return Row(
                    children: [
                      Icon(Icons.circle, size: 6, color: kprimarycolor),
                      SizedBox(width: 10),
                      Text(
                        categersmodels.ingredients![index],
                        style: Stylestext.font12normal,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
