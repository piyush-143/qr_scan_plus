import 'package:intl/intl.dart';

class CustomFormat {
  static String formatDateTime(DateTime date) {
    return "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
  }

  static String now() {
    return formatDateTime(DateTime.now());
  }
}
