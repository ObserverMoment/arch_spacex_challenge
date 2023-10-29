import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  dynamic pop({dynamic result, bool rootNavigator = false}) =>
      Navigator.of(this, rootNavigator: rootNavigator).pop(result);

  Future<T?> push<T>(
      {required Widget child,
      bool fullscreenDialog = false,
      bool rootNavigator = false}) async {
    final BuildContext context = this;
    final T? res = await Navigator.of(context, rootNavigator: rootNavigator)
        .push(MaterialPageRoute(
            fullscreenDialog: fullscreenDialog, builder: (context) => child));
    return res;
  }

  ThemeData get theme => Theme.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
}
