import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

void printErrorLog(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) {
  GetIt.I<Logger>().log(
    Level.error,
    message,
    time: time,
    error: error,
    stackTrace: stackTrace,
  );
}
