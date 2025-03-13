import 'package:app8/lab2/core/assets.dart';
import 'package:app8/lab5/api/ApiService.dart';
import 'package:app8/lab5/constant/colors.dart';
import 'package:app8/lab5/core/styles/stylestext.dart';
import 'package:app8/lab5/data/sql_contstant.dart';
import 'package:app8/lab5/data/sqlite.dart';
import 'package:app8/lab5/models/categersmodels.dart' as lab;
import 'package:app8/lab5/view/detailsview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key});

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  final List<String> categersup = const [
    'Breakfast',
    'lunch',
    'Dinner',
    'Vegan',
    'lunch',
    'Dinner',
    'Vegan',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categersup.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 25,
                    width: 81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kprimarycolor,
                    ),
                    child: Center(
                      child: Text(
                        categersup[index],
                        style: Stylestext.font16regular,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        categersui(),
      ],
    );
  }
}

class categersui extends StatelessWidget {
  const categersui({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apiservice(Dio()).fetchcagters(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverGrid.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: recipeItems(categers: snapshot.data![index]),
              );
            },
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Container(color: kprimarycolor));
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
    // return SliverGrid.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 30,
    //     crossAxisSpacing: 20,
    //     childAspectRatio: 0.8,
    //   ),
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: recipeItems(categers: items[index]),
    //     );
    //   },
    // );
  }
}

class recipeItems extends StatefulWidget {
  const recipeItems({super.key, required this.categers});
  final lab.Categersmodels categers;

  @override
  State<recipeItems> createState() => _recipeItemsState();
}

class _recipeItemsState extends State<recipeItems> {
  Sqlite sqlite = Sqlite();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Detailsview(categersmodels: widget.categers);
            },
          ),
        );
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 5,

            child: Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width * 0.4,
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: kprimarycolor),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.categers.name ?? '',
                    style: Stylestext.font12regular,
                    maxLines: 1,
                  ),
                  Text(
                    widget.categers.ingredients!.first.toString() ?? 'sd',
                    style: Stylestext.font13regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.categers.rating.toString(),
                            style: Stylestext.font12regular,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: kprimarycolor,
                            size: 18,
                            weight: 10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.alarm, color: kprimarycolor, size: 18),
                          Text(
                            '${widget.categers.cookTimeMinutes}min',
                            style: Stylestext.font12regular.copyWith(
                              color: kprimarycolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.categers.image ??
                        'https://cdn.dummyjson.com/recipe-images/2.webp',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 8,
            child: GestureDetector(
              onTap: () async {
                int response = await sqlite.insertdata(
                 '''INSERT INTO ${SqlContstant.nametable}  (
    ${SqlContstant.producttitle}, 
    ${SqlContstant.productimage}, 
    ${SqlContstant.productid}, 
    ${SqlContstant.productdetails}, 
    ${SqlContstant.productingredients}, 
    ${SqlContstant.productrating}
) VALUES (
    '${widget.categers.name}', 
    '${widget.categers.image}', 
    '${widget.categers.id}', 
    '${widget.categers.instructions.toString()}', 
    '${widget.categers.ingredients.toString()}', 
    '${widget.categers.rating.toString()}'
);
                 ''',
                );
                print('insert Database ');
              },
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: kprimarycolor,
                  //image: DecorationImage(image: AssetImage("asset/heart.svg")),
                ),
                child: SvgPicture.asset(
                  Assets.assetsHeart,
                  height: 28,
                  width: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
