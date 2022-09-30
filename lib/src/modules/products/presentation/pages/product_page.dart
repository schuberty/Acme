import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductPage extends StatelessWidget {
  final ProductEntity _product;

  const ProductPage({
    required ProductEntity product,
    super.key,
  }) : _product = product;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
