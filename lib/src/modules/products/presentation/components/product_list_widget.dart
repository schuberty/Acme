import 'package:acme/src/modules/products/data/utils/product_extension.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/components/product_card.dart';
import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/modules/products/presentation/states/product_favorites/product_favorites_cubit.dart';
import 'package:acme/src/shared/app/route/route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final GlobalKey<AnimatedListState> listState = GlobalKey<AnimatedListState>();

  final List<ProductEntity> products = [];

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductBloc, ProductState>(
          listener: (context, state) async {
            if (state is ProductsUpdated) {
              products.add(state.products.last);
              listState.currentState!.insertItem(
                state.indexUpdated,
                duration: const Duration(milliseconds: 400),
              );
            } else if (state is ProductsCleared) {
              for (var i = 0; i < products.length; i++) {
                listState.currentState!.removeItem(0, (context, _) => const SizedBox.shrink());
              }
              products.clear();
            }
          },
        ),
        BlocListener<ProductFavoritesCubit, ProductFavoritesState>(
          listener: (context, state) {
            if (state is FavoriteProductUpdated) {
              final productIndex = products.indexWhere((product) => product.id == state.productID);

              if (productIndex != -1) {
                listState.currentState!
                    .removeItem(productIndex, (context, animation) => const SizedBox.shrink());

                products[productIndex] = products[productIndex].copyWith(
                  isFavorite: state.isProductFavorite,
                );

                listState.currentState!.insertItem(
                  productIndex,
                  duration: const Duration(),
                );
              }
            }
          },
        )
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => AnimatedList(
          key: listState,
          initialItemCount: products.length,
          itemBuilder: (context, index, Animation<double> animation) {
            final product = products[index];

            EdgeInsets cardMargin = const EdgeInsets.fromLTRB(16, 8, 16, 0);

            if (index == (products.length - 1)) {
              cardMargin = cardMargin.copyWith(bottom: 8);
            }

            final card = ProductCard(
              product,
              cardHeight: 130,
              cardMargin: cardMargin,
              heroPage: "product",
            );

            return SizeTransition(
              axis: Axis.vertical,
              sizeFactor: animation,
              child: GestureDetector(
                onTap: () {
                  Feedback.forTap(context);

                  Navigator.of(context).pushNamed(
                    "/product",
                    arguments: ProductRouteArgument(product: product, heroPage: "product"),
                  );
                },
                child: card,
              ),
            );
          },
        ),
      ),
    );
  }
}
