import 'package:acme/src/modules/home/presentation/pages/home_page.dart';
import 'package:acme/src/modules/products/presentation/pages/product_page.dart';
import 'package:acme/src/shared/app/route/route_arguments.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Route<void>? onGenerateRoutes(RouteSettings routeSettings) {
    final argument = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/product':
        if (argument is ProductRouteArgument) {
          return MaterialPageRoute(
            builder: (context) => ProductPage(product: argument.product),
          );
        } else {
          throw RouteArgumentException(
            receivedObject: argument,
            targetRouteArgument: ProductRouteArgument,
          );
        }

      default:
        return null;
    }
  }
}
