import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductsInCartChart extends StatelessWidget {
  const ProductsInCartChart({super.key});

  @override
  Widget build(BuildContext context) {
    final allProducts = context.read<ProductBloc>().products;
    final productIDsInCart = context.read<CartCubit>().cart;

    final products = <ProductEntity>[];

    for (var product in allProducts) {
      if (productIDsInCart.containsKey(product.id)) {
        products.add(product);
      }
    }

    return ExpansionTile(
      title: Text(
        "Produtos no Carrinho",
        style:
            Theme.of(context).textTheme.titleMedium!.copyWith(color: AppConstants.secondaryColor),
      ),
      iconColor: AppConstants.tertiaryColor,
      children: [
        SfCircularChart(
          series: <CircularSeries>[
            DoughnutSeries<ProductEntity, String>(
              dataSource: products,
              xValueMapper: (product, index) => product.title,
              yValueMapper: (product, index) => productIDsInCart[product.id],
            )
          ],
          tooltipBehavior: TooltipBehavior(enable: true),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            textStyle:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: AppConstants.secondaryColor),
          ),
        )
      ],
    );
  }
}
