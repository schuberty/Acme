import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/icon_text_button.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppConstants.secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const IconTextButton(
            icon: Icons.home_rounded,
            bellowText: "Home",
          ),
          IconTextButton(
            icon: Icons.show_chart_rounded,
            bellowText: "Dashboard",
            iconColor: AppConstants.primaryColor.withOpacity(0.8),
            onTap: () => pushToDashboard(context),
          ),
          IconTextButton(
            icon: Icons.shopping_cart_checkout,
            bellowText: "Carrinho",
            iconColor: AppConstants.primaryColor.withOpacity(0.8),
            onTap: () => pushToCart(context),
          ),
        ],
      ),
    );
  }

  void pushToDashboard(BuildContext context) {
    Navigator.of(context).pushNamed('/dashboard');
  }

  void pushToCart(BuildContext context) {
    Navigator.of(context).pushNamed('/cart');
  }

  void favoritesNotImplemented(BuildContext context) {
    //  Navigator.of(context).pushNamed('/product/favorites')

    const snackBar = SnackBar(
      content: Text("Implementação dos Favoritos não concluída."),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppConstants.tertiaryColor,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
