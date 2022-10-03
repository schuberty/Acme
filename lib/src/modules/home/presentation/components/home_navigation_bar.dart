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
      color: AppConstants.tertiaryColor,
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
            onTap: () => pushDashboard(context),
          ),
          IconTextButton(
            icon: Icons.star_rounded,
            bellowText: "Favoritos",
            iconColor: AppConstants.primaryColor.withOpacity(0.8),
            onTap: () => favoritesNotImplemented(context),
          ),
        ],
      ),
    );
  }

  void pushDashboard(BuildContext context) {
    Navigator.of(context).pushNamed('/dashboard');
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
