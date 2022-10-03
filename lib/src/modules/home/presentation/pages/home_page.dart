import 'package:acme/src/modules/home/presentation/components/home_navigation_bar.dart';
import 'package:acme/src/modules/products/presentation/components/product_list_widget.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista dos Produtos",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppConstants.primaryColor),
        ),
        actions: <Widget>[
          CustomIconButton(
            Icons.shopping_cart_checkout,
            onTap: () => Navigator.of(context).pushNamed("/cart"),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
      body: const ProductListWidget(),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}
