import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper getInstance = DBHelper._();
  //Scan Table Data
  static const String scanTableName = "ScanTable";
  static const String scanTableColumnCode = "ScanCode";
  static const String scanTableColumnSno = "ScanSno";
  static const String scanTableColumnDate = "ScanDate";
  //Create Table Data
  static const String createTableName = "createTable";
  static const String createTableColumnCode = "createCode";
  static const String createTableColumnSno = "createSno";
  static const String createTableColumnDate = "createDate";

  Database? _myDb;
  Future<Database> getDb() async {
    if (_myDb != null) {
      return _myDb!;
    }
    _myDb = await openDb();
    return _myDb!;
  }

  Future<Database> openDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dbPath = join(dir.path, "qrPlusDb.db");
    return await openDatabase(dbPath, onCreate: (db, version) {
      db.execute(
          "create table $scanTableName ($scanTableColumnSno integer primary key autoincrement,$scanTableColumnCode text,$scanTableColumnDate text)");
      db.execute(
          "create table $createTableName ($createTableColumnSno integer primary key autoincrement,$createTableColumnCode text,$createTableColumnDate text)");
    }, version: 1);
  }

  Future<bool> addHistory(
      {required String code,
      required String date,
      required bool isCreate}) async {
    var db = await getDb();
    int rowsEffected = isCreate
        ? await db.insert(createTableName,
            {createTableColumnCode: code, createTableColumnDate: date})
        : await db.insert(scanTableName,
            {scanTableColumnCode: code, scanTableColumnDate: date});
    return rowsEffected > 0;
  }

  Future<bool> deleteHistory({required int sno, required bool isCreate}) async {
    var db = await getDb();
    int rowsEffected = isCreate
        ? await db.delete(createTableName,
            where: "$createTableColumnSno=?", whereArgs: ["$sno"])
        : await db.delete(scanTableName,
            where: "$scanTableColumnSno=?", whereArgs: ["$sno"]);
    return rowsEffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllData(
      {required bool isCreate}) async {
    var db = await getDb();
    List<Map<String, dynamic>> data = isCreate
        ? await db.query(createTableName)
        : await db.query(scanTableName);
    return data;
  }
}
