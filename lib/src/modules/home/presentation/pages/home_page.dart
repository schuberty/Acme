import 'package:acme/src/modules/cart/presentation/components/cart_checkout_button.dart';
import 'package:acme/src/modules/home/presentation/components/home_navigation_bar.dart';
import 'package:acme/src/modules/products/presentation/components/product_list_widget.dart';
import 'package:acme/src/modules/products/presentation/components/product_loading_bar.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista dos Produtos",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppConstants.primaryColor),
        ),
        actions: const <Widget>[
          CartCheckoutButton(),
        ],
        bottom: ProductLoadingBar(width: screenWidth),
      ),
      body: const ProductListWidget(),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
