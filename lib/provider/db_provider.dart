import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_plus/database/local_database/db_helper.dart';

class DBProvider with ChangeNotifier {
  final DBHelper _dbRef = DBHelper.getInstance;

  List<Map<String, dynamic>> _allScanData = [];
  List<Map<String, dynamic>> get allScanData => _allScanData;

  List<Map<String, dynamic>> _allCreateData = [];
  List<Map<String, dynamic>> get allCreateData => _allCreateData;

  Future<void> getInitialData() async {
    _allScanData = await _dbRef.getAllData(isCreate: false);
    _allCreateData = await _dbRef.getAllData(isCreate: true);
    notifyListeners();
  }

  Future<void> addData(
      {required String code,
      required DateTime date,
      required bool isCreate}) async {
    String d =
        "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
    bool check =
        await _dbRef.addHistory(code: code, date: d, isCreate: isCreate);
    if (check) {
      isCreate
          ? _allCreateData = await _dbRef.getAllData(isCreate: isCreate)
          : _allScanData = await _dbRef.getAllData(isCreate: isCreate);
      notifyListeners();
    }
  }

  Future<void> deleteData({required int sno, required bool isCreate}) async {
    bool check = await _dbRef.deleteHistory(sno: sno, isCreate: isCreate);
    if (check) {
      isCreate
          ? _allCreateData = await _dbRef.getAllData(isCreate: isCreate)
          : _allScanData = await _dbRef.getAllData(isCreate: isCreate);
      notifyListeners();
    }
  }
}
