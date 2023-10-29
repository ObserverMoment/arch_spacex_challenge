import 'package:intl/intl.dart';

extension IntExtension on int {
  String get asCurrency => NumberFormat.simpleCurrency().format(this);
}
