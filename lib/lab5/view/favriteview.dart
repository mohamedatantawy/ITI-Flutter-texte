import 'package:app8/lab2/core/assets.dart';
import 'package:app8/lab5/constant/colors.dart';
import 'package:app8/lab5/core/styles/stylestext.dart';
import 'package:app8/lab5/data/mange.dart';
import 'package:app8/lab5/data/sql_contstant.dart';
import 'package:app8/lab5/data/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Favriteview extends StatefulWidget {
  const Favriteview({super.key});

  @override
  State<Favriteview> createState() => _FavriteviewState();
}

class _FavriteviewState extends State<Favriteview> {
  List<Map> respo = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewAllNotes();
  }

  @override
  void didUpdateWidget(covariant Favriteview oldWidget) {
    _viewAllNotes();
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  void _viewAllNotes() {
    Mange().getdata().then((notes) {
      setState(() {
        this.respo = notes;
      });
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        children: List.generate(respo.length, (index) {
          return Card(
            child: ListTile(
              title: Text(respo[index][SqlContstant.producttitle]),
              subtitle: Text('lds;fk;gllsdkgk'),
              leading: Image.asset(Assets.assetsBr),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          );
        }),
      );
      throw UnimplementedError();
    }
  }

  _deleteNote(note) {
    Sqlite().deletdata(note);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(respo.length, (index) {
        return Card(
          child: ListTile(
            title: Text(respo[index][SqlContstant.producttitle]),
            subtitle: Text(
              respo[index][SqlContstant.productdetails] ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Container(
              height: 50,
              width: 50,
              child: Image.network(
                respo[index][SqlContstant.productimage] ?? '',
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _deleteNote(
                    "DELETE FROM ${SqlContstant.nametable} WHERE ${SqlContstant.producttitle} = '${respo[index][SqlContstant.producttitle]}';};",
                  );
                });
              },
              icon: Icon(Icons.delete),
            ),
          ),
        );
      }),
    );
    throw UnimplementedError();
  }
}
