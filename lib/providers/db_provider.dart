import 'package:flutter/material.dart';
import 'package:qr_plus/core/database/db_helper.dart';
import 'package:qr_plus/data/models/qr_result.dart';

class DBProvider with ChangeNotifier {
  final DBHelper _dbRef = DBHelper.getInstance;

  List<QRResult> _allScanData = [];
  List<QRResult> get allScanData => _allScanData;

  List<QRResult> _allCreateData = [];
  List<QRResult> get allCreateData => _allCreateData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getInitialData() async {
    _isLoading = true;
    notifyListeners();

    _allScanData = await _dbRef.getAllData(isCreated: false);
    _allCreateData = await _dbRef.getAllData(isCreated: true);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addData({
    required String content,
    required DateTime date,
    required bool isCreated,
  }) async {
    final result = QRResult(
      content: content,
      date: date,
      isCreated: isCreated,
    );

    bool check = await _dbRef.addHistory(result);
    if (check) {
      if (isCreated) {
        _allCreateData = await _dbRef.getAllData(isCreated: true);
      } else {
        _allScanData = await _dbRef.getAllData(isCreated: false);
      }
      notifyListeners();
    }
  }

  Future<void> addCurrentData({
    required String code,
    required bool isCreate,
  }) async {
    await addData(
      content: code,
      date: DateTime.now(),
      isCreated: isCreate,
    );
  }

  Future<void> deleteData({required int sno, required bool isCreated}) async {
    bool check = await _dbRef.deleteHistory(sno: sno, isCreated: isCreated);
    if (check) {
      if (isCreated) {
        _allCreateData = await _dbRef.getAllData(isCreated: true);
      } else {
        _allScanData = await _dbRef.getAllData(isCreated: false);
      }
      notifyListeners();
    }
  }
}
