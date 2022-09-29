import 'package:flutter/material.dart';

/// Singleton service for Alerts
class AlertService {
  static final AlertService _alertService = AlertService._();

  AlertService._();

  factory AlertService() => _alertService;

  static final _globalNavigator = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get globalNavigator => _globalNavigator;

  static void showErrorSnackBar(String errorText) {
    final currentContext = _globalNavigator.currentContext;

    if (currentContext != null) {
      final snackBar = SnackBar(
        content: Text(errorText),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent.shade200,
      );

      ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
    }
  }

  static void showNotImplementedSnackBar() {
    final currentContext = _globalNavigator.currentContext;

    if (currentContext != null) {
      final snackBar = SnackBar(
        content: const Text("Não implementado."),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent.shade200,
        duration: const Duration(milliseconds: 1500),
      );

      ScaffoldMessenger.of(currentContext).clearSnackBars();

      ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
    }
  }
}
