import 'package:app8/lab4/view/model/sheetmodel.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue, body: homeody());
  }
}

class homeody extends StatefulWidget {
  const homeody({super.key});

  @override
  State<homeody> createState() => _homeodyState();
}

class _homeodyState extends State<homeody> {
  List<Sheetmodel> items = [
    Sheetmodel(title: 'Work files', isactive: false),
    Sheetmodel(title: 'personal', isactive: false),
    Sheetmodel(title: 'projects', isactive: false),
    Sheetmodel(title: 'priority', isactive: false),
    Sheetmodel(title: 'Events', isactive: false),
    Sheetmodel(title: 'Reminders', isactive: false),
  ];
  bool issave = false;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          return showsheet(context);
        },
        child: Text('Show'),
      ),
    );
  }

  showsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              //  width: double.infinity,
              // height: 300,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filters'),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 3,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          value: items[index].isactive,
                          onChanged: (value) {
                            setState(() {
                              items[index].isactive = value!;
                            });
                          },
                          title: Text(items[index].title),
                        );
                      },
                    ),
                  ),
                  // items
                  //     .map((e) {
                  //       return CheckboxListTile(
                  //         value: issave,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             issave = value!;
                  //             num++;
                  //           });
                  //         },
                  //         title: Text(e.title),
                  //       );
                  //     })
                  //     .toList()
                  //     ,
                ],
              ),
            );
          },
        );
      },
    );
  }
}
