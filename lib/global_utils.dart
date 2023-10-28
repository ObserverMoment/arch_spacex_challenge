import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
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

List<Widget> spaceSiblingsEvenly(List<Widget> siblings,
    {double widthSpacing = 0,
    double heightSpacing = 0,
    bool addToStart = false,
    bool addToEnd = false}) {
  return siblings.foldIndexed([], (i, acum, next) {
    return [
      ...acum,
      if (i == 0 && addToStart)
        SizedBox(
          width: widthSpacing,
          height: heightSpacing,
        ),
      if (i > 0 && i < siblings.length)
        SizedBox(
          width: widthSpacing,
          height: heightSpacing,
        ),
      next,
      if (i == siblings.length - 1 && addToEnd)
        SizedBox(
          width: widthSpacing,
          height: heightSpacing,
        ),
    ];
  });
}
