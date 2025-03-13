import 'package:app8/lab5/data/sql_contstant.dart';
import 'package:app8/lab5/data/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class Mange {
  /*Future<List<Note>> getAllNotes() async {
    Database db = await DbHelper.instance.getDbInstance();
    List<Map<String, dynamic>> result = await db.query(DbConstants.tableName,
        orderBy: '${DbConstants.columnDate} DESC');
    return result.map((e) => Note.fromMap(e)).toList();
  } */
  late int length ;
 late List<Map> response ;
  Sqlite sqlite = Sqlite();
  Future<List<Map>> getdata() async {
    response = await sqlite.readData(
      "SELECT * FROM ${SqlContstant.nametable}",
    );

    return response;
  }
}
