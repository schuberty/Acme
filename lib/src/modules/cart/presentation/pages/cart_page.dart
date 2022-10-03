import 'package:acme/src/modules/cart/presentation/components/cart_card.dart';
import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/modules/products/data/utils/product_extension.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/centered_button.dart';
import 'package:acme/src/shared/components/floating_action_buttons.dart';
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
    late final Widget body;

    if (productsInCart.isEmpty) {
      body = Center(
        child: Text(
          "Nenhum produto adicionado no carrinho",
          style:
              Theme.of(context).textTheme.labelLarge!.copyWith(color: AppConstants.secondaryColor),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      body = ListView.builder(
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
        child: body,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: productsInCart.isEmpty
          ? null
          : FloatingActionButtons(
              actions: <Widget>[
                Flexible(
                  child: CenteredButton(
                    icon: Icons.shopping_cart_checkout_rounded,
                    label: "Checkout",
                    onTap: checkout,
                  ),
                ),
              ],
            ),
    );
  }

  void updateProductsInCart() {
    final allProducts = context.read<ProductBloc>().products;
    final productIDsInCart = context.read<CartCubit>().cart;

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

  void checkout() async {
    String json = "";

    for (var product in productsInCart.keys) {
      json += "{\n";
      json += product.toJsonString();
      json += ',\n    "ammount": ${productsInCart[product]}';
      json += "\n},\n";
    }

    final screenHeight = MediaQuery.of(context).size.height;

    context.read<CartCubit>().clearProductsFromCart();

    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              height: screenHeight * 0.6,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Text(
                  json,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        );
      },
    );

    updateProductsInCart();
  }
}
