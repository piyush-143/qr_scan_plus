import 'package:qr_plus/data/models/qr_result.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBHelper {
  DBHelper._();
  static final DBHelper getInstance = DBHelper._();

  static const String scanTableName = 'ScanTable';
  static const String scanTableColumnCode = 'ScanCode';
  static const String scanTableColumnSno = 'ScanSno';
  static const String scanTableColumnDate = 'ScanDate';

  static const String createTableName = 'createTable';
  static const String createTableColumnCode = 'createCode';
  static const String createTableColumnSno = 'createSno';
  static const String createTableColumnDate = 'createDate';

  Database? _myDb;

  Future<Database> getDb() async {
    _myDb ??= await openDb();
    return _myDb!;
  }

  Future<Database> openDb() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String dbPath = join(dir.path, 'qrPlusDb.db');
      return await openDatabase(
        dbPath,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE $scanTableName ($scanTableColumnSno INTEGER PRIMARY KEY AUTOINCREMENT, $scanTableColumnCode TEXT, $scanTableColumnDate TEXT)',
          );
          await db.execute(
            'CREATE TABLE $createTableName ($createTableColumnSno INTEGER PRIMARY KEY AUTOINCREMENT, $createTableColumnCode TEXT, $createTableColumnDate TEXT)',
          );
        },
        version: 1,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addHistory(QRResult result) async {
    try {
      final db = await getDb();
      final table = result.isCreated ? createTableName : scanTableName;
      final int rowsAffected = await db.insert(table, result.toInsertMap());
      return rowsAffected > 0;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteHistory({required int sno, required bool isCreated}) async {
    try {
      final db = await getDb();
      final table = isCreated ? createTableName : scanTableName;
      final columnId = isCreated ? createTableColumnSno : scanTableColumnSno;
      final int rowsAffected = await db.delete(
        table,
        where: '$columnId = ?',
        whereArgs: [sno],
      );
      return rowsAffected > 0;
    } catch (e) {
      return false;
    }
  }

  Future<List<QRResult>> getAllData({required bool isCreated}) async {
    try {
      final db = await getDb();
      final table = isCreated ? createTableName : scanTableName;
      final List<Map<String, dynamic>> maps = await db.query(table);

      return List.generate(maps.length, (i) {
        return QRResult.fromMap(maps[i], isCreated);
      });
    } catch (e) {
      return [];
    }
  }
}
