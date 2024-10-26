import 'package:intl/intl.dart';

class Helper {
  static String humanizeDate(DateTime datetime) {
    final DateFormat formatter = DateFormat('dd MMM yyy');
    return formatter.format(datetime);
  }
}
