import 'package:intl/intl.dart';

String dateTimeFormater(DateTime d) {
  String date =
      "${DateFormat('d MMM y, hh:mm').format(d)} ${DateFormat("a").format(d).toLowerCase()}";
  return date;
}
