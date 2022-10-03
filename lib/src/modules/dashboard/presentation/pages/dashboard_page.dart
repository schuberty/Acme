import 'package:acme/src/modules/dashboard/presentation/components/products_in_cart_chart.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
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
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            ProductsInCartChart(),
          ],
        ),
      ),
    );
  }
}
