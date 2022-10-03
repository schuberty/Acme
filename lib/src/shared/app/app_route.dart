import 'package:acme/src/modules/cart/presentation/pages/cart_page.dart';
import 'package:acme/src/modules/dashboard/presentation/pages/dashboard_page.dart';
import 'package:acme/src/modules/home/presentation/pages/home_page.dart';
import 'package:acme/src/modules/products/presentation/pages/product_page.dart';
import 'package:acme/src/modules/products/presentation/pages/products_favorite_page.dart';
import 'package:acme/src/shared/app/route/route_animator.dart';
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
        return _productRoute(argument);
      case '/product/favorites':
        return RouteAnimator.bottomToTopRoute(const ProductsFavoritePage());
      case '/dashboard':
        return RouteAnimator.bottomToTopRoute(const DashboardPage());
      case '/cart':
        return RouteAnimator.rightToLeftRoute(const CartPage());
      default:
        return null;
    }
  }

  static PageRoute<dynamic> _productRoute(dynamic argument) {
    if (argument is ProductRouteArgument) {
      return MaterialPageRoute(
        builder: (context) => ProductPage(
          product: argument.product,
          heroPage: argument.heroPage,
        ),
      );
    } else {
      throw RouteArgumentException(
        receivedObject: argument,
        targetRouteArgument: ProductRouteArgument,
      );
    }
  }
}
