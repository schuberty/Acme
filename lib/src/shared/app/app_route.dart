import 'package:acme/src/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Route<void>? onGenerateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
