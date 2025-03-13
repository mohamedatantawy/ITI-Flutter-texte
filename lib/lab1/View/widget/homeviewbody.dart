import 'package:app8/lab1/View/widget/dotactive.dart';
import 'package:app8/lab1/View/widget/models/cardmodels.dart';
import 'package:app8/lab1/View/widget/models/categersmodels.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key});

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  final List<Categersmodelslab1> categersmodels = const [
    Categersmodelslab1(icon: Icons.send, title: 'Send'),
    Categersmodelslab1(icon: Icons.receipt, title: 'receipt'),
    Categersmodelslab1(icon: Icons.payment, title: 'payment'),
    Categersmodelslab1(icon: Icons.phone, title: 'phone'),
  ];

  final List<Cardmodels> cardmodels = const [
    Cardmodels(
      title: 'mohamed Tantawy',
      amount: "#17.500.200",
      icon: Icons.wallet,
      name: "Paycard",
    ),
    Cardmodels(
      title: 'Ahmed ali',
      amount: "#200.200.200",
      icon: Icons.wallet_membership_rounded,
      name: "visacard",
    ),
  ];
  PageController pageController = PageController();
  int currentapge = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      pageController.addListener(
        () => currentapge = pageController.page!.toInt(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: cardmodels.map((e) => carditem(cardmodels: e)).toList(),
          ),
          SizedBox(height: 15),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categers',
              style: TextStyle(color: Colors.grey, fontSize: 25),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                categersmodels
                    .map((e) => categersitem(categersmodels: e))
                    .toList(),
          ),
          SizedBox(height: 15),
          ExpandablePageView.builder(
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'mohamed tantawy',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(
                      'mohamed tantawy',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 15),
          Dotitemactive(number: currentapge),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NEWS', style: TextStyle(color: Colors.black, fontSize: 25)),
              Text(
                'mohamed tantawy',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class categersitem extends StatelessWidget {
  const categersitem({super.key, required this.categersmodels});
  final Categersmodelslab1 categersmodels;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 35,
          child: Icon(categersmodels.icon, size: 40),
        ),
        SizedBox(height: 12),
        Text(
          categersmodels.title,
          style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class carditem extends StatelessWidget {
  const carditem({super.key, required this.cardmodels});
  final Cardmodels cardmodels;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  alignment: Alignment.bottomLeft,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(8),
      height: 150,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueAccent,
      ),
      child: Column(
        children: [
          Text(
            cardmodels.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            cardmodels.amount,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(800),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(cardmodels.icon),
                SizedBox(width: 12),
                Text(cardmodels.name, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
