class QRResult {
  final int? id;
  final String content;
  final DateTime date;
  final bool isCreated;

  const QRResult({
    this.id,
    required this.content,
    required this.date,
    required this.isCreated,
  });

  /// Convert from Map (Database)
  factory QRResult.fromMap(Map<String, dynamic> map, bool isCreated) {
    return QRResult(
      id: isCreated ? map['createSno'] : map['ScanSno'],
      content: (isCreated ? map['createCode'] : map['ScanCode']) ?? '',
      date: DateTime.tryParse((isCreated ? map['createDate'] : map['ScanDate']) ?? '') ?? DateTime.now(),
      isCreated: isCreated,
    );
  }

  /// Convert to Map (Database)
  Map<String, dynamic> toMap() {
    if (isCreated) {
      return {
        'createSno': id,
        'createCode': content,
        'createDate': date.toIso8601String(),
      };
    } else {
      return {
        'ScanSno': id,
        'ScanCode': content,
        'ScanDate': date.toIso8601String(),
      };
    }
  }

  /// Since the database columns are named differently for Scan and Create tables
  /// we might need a specific map for insertion that excludes the auto-increment ID
  Map<String, dynamic> toInsertMap() {
    if (isCreated) {
      return {
        'createCode': content,
        'createDate': date.toIso8601String(),
      };
    } else {
      return {
        'ScanCode': content,
        'ScanDate': date.toIso8601String(),
      };
    }
  }

  @override
  String toString() {
    return 'QRResult(id: $id, content: $content, date: $date, isCreated: $isCreated)';
  }
}
