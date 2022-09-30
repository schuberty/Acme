import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/components/buttons/cart_checkout_button.dart';
import 'package:acme/src/modules/products/presentation/components/product_card.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductEntity> products = [];

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista dos Produtos",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppConstants.primaryColor),
        ),
        actions: const <Widget>[
          CartCheckoutButton(
            margin: EdgeInsets.symmetric(horizontal: 8),
          )
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductAdded) {
            products.add(state.product);
          }
        },
        builder: (context, state) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            EdgeInsets cardMargin = const EdgeInsets.fromLTRB(16, 8, 16, 0);
            if (index == (products.length - 1)) {
              cardMargin = cardMargin.copyWith(bottom: 8);
            }

            return GestureDetector(
              onTap: () => Feedback.forTap(context),
              child: ProductCard(
                product,
                cardHeight: 130,
                cardMargin: cardMargin,
              ),
            );
          },
        ),
      ),
    );
  }
}
