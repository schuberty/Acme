import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/components/product_card.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/modules/products/presentation/states/product_favorites/product_favorites_cubit.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/app/route/route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsFavoritePage extends StatefulWidget {
  const ProductsFavoritePage({super.key});

  @override
  State<ProductsFavoritePage> createState() => _ProductsFavoritePageState();
}

class _ProductsFavoritePageState extends State<ProductsFavoritePage> {
  final List<ProductEntity> products = <ProductEntity>[];

  @override
  void initState() {
    super.initState();

    context.read<ProductFavoritesCubit>().fetchProductFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Produtos Favoritados",
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
      body: BlocListener<ProductFavoritesCubit, ProductFavoritesState>(
        listener: (context, state) {
          if (state is FavoriteProductUpdated) {
          } else if (state is FavoriteProductsIDFetched) {
            final favoritedProducts = context
                .read<ProductBloc>()
                .products
                .where((product) => state.favoriteProductsID.contains(product.id));

            setState(() {
              products.addAll(favoritedProducts);
            });
          }
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            final product = products[index];

            final card = ProductCard(product);

            return GestureDetector(
              onTap: () {
                Feedback.forTap(context);

                Navigator.of(context).pushNamed(
                  "/product",
                  arguments: ProductRouteArgument(product: product),
                );
              },
              child: card,
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}
