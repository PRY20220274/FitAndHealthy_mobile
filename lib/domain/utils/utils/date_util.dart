import 'package:intl/intl.dart';

String formatDateToString(DateTime date) {
  final String weekday = DateFormat(DateFormat.WEEKDAY, "es_ES").format(date);
    final String month = DateFormat(DateFormat.MONTH, "es_ES").format(date);
    final String dateString = "${weekday.substring(0,1).toUpperCase()}${weekday.substring(1)}, ${date.day} de $month";
    return dateString;
}