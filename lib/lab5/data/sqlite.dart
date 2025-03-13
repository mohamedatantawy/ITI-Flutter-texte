import 'dart:async';

import 'package:app8/lab5/data/sql_contstant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqlite {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, SqlContstant.nameDB);
    Database mydb = await openDatabase(
      path,
      version: SqlContstant.version,
      onUpgrade: _onupgrade,
      onCreate: _oncreate,
    );

    return mydb;
  }

  _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "${SqlContstant.nametable}" (
    ${SqlContstant.productid} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${SqlContstant.producttitle} TEXT,
    ${SqlContstant.productimage} TEXT,
    ${SqlContstant.productrating} TEXT,
    ${SqlContstant.productdetails} TEXT,
    ${SqlContstant.productingredients} TEXT
);
''');
    print('create db-----------------------------------------------');
  }

  readData(String sql) async {
    Database? mydata = await db;
    List<Map<String, dynamic>> response = await mydata!.rawQuery(sql);
    return response;
  }

  insertdata(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawInsert(sql);
    return response;
  }

  updatdata(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawUpdate(sql);
    return response;
  }

  deletdata(String sql) async {
    Database? mydata = await db;
    int response = await mydata!.rawDelete(sql);
    return response;
  }

  _onupgrade(Database db, int oldVersion, int newVersion) {
    print('onupgrade-------------------------------');
  }
}
