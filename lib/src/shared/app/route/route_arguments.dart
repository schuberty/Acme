import 'package:acme/src/modules/products/domain/entities/product_entity.dart';

abstract class RouteArgumentBase {}

class ProductRouteArgument implements RouteArgumentBase {
  final ProductEntity product;

  ProductRouteArgument({required this.product});
}

class RouteArgumentException implements Exception {
  final Object? targetRouteArgument;
  final Object? receivedObject;

  RouteArgumentException({
    required this.targetRouteArgument,
    required this.receivedObject,
  });

  @override
  String toString() {
    final message =
        "Expected $ProductRouteArgument object, instead got a ${receivedObject.runtimeType}";
    return "Exception: $message";
  }
}