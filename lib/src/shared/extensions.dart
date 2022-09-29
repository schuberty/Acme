import 'package:flutter/widgets.dart';

extension NavigatorExtension on NavigatorState {
  Future<T?> pushNamedAndRemoveAll<T extends Object?>(String routeName, {Object? arguments}) {
    return pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }
}
