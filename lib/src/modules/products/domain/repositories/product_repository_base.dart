import 'dart:async';

import 'package:acme/src/modules/products/domain/entities/product_entity.dart';

abstract class ProductRepositoryBase {
  Stream<ProductEntity> fetchProducts();
}
