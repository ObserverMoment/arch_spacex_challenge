import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get timeString => DateFormat.jm().format(this);
  String get minimalDateStringYear => DateFormat('MMM d, yyyy').format(this);
  String get dateAndTime => '$minimalDateStringYear, $timeString';
}
