import 'package:acme/src/modules/cart/presentation/components/cart_card.dart';
import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Map<ProductEntity, int> productsInCart = <ProductEntity, int>{};

  @override
  void initState() {
    super.initState();

    updateProductsInCart();
  }

  @override
  Widget build(BuildContext context) {
    late final Widget result;

    if (productsInCart.isEmpty) {
      result = Center(
        child: Text(
          "Nenhum item no carrinho!",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      );
    } else {
      result = ListView.builder(
        itemBuilder: (context, index) {
          final product = productsInCart.keys.elementAt(index);
          final ammount = productsInCart.values.elementAt(index);

          return CartCard(
            product: product,
            ammount: ammount,
            onTapAdd: () => onAddToCart(product),
            onTapRemove: () => onRemoveFromCart(product),
          );
        },
        itemCount: productsInCart.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrinho",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppConstants.primaryColor),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppConstants.primaryColor,
          ),
        ),
        leadingWidth: 40,
      ),
      body: SafeArea(
        child: result,
      ),
    );
  }

  void updateProductsInCart() {
    final allProducts = context.read<ProductBloc>().products;
    final productIDsInCart = context.read<CartCubit>().productsInCart;

    productsInCart.clear();

    for (var product in allProducts) {
      if (productIDsInCart.containsKey(product.id)) {
        productsInCart[product] = productIDsInCart[product.id]!;
      }
    }

    setState(() {});
  }

  void onRemoveFromCart(ProductEntity product) {
    context.read<CartCubit>().removeProductFromCart(product);

    updateProductsInCart();
  }

  void onAddToCart(ProductEntity product) {
    context.read<CartCubit>().addProductToCart(product);

    updateProductsInCart();
  }
}
