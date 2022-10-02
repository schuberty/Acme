import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/components/product_floating_action.dart';
import 'package:acme/src/modules/products/presentation/components/product_page_header.dart';
import 'package:acme/src/modules/products/presentation/states/product_favorites/product_favorites_cubit.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/centered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final ProductEntity product;

  const ProductPage({required this.product, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();

    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocListener<ProductFavoritesCubit, ProductFavoritesState>(
        listener: (context, state) {
          if (state is FavoriteProductUpdated) {
            if (state.productID == widget.product.id) {
              setState(() => isFavorite = state.isProductFavorite);
            }
          }
        },
        child: CustomScrollView(
          slivers: <Widget>[
            ProductPageHeader(
              product: widget.product,
              height: screenHeight * 0.4,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 48),
                child: Text(
                  widget.product.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppConstants.customBlack),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ProductFloatingActions(
        actions: <Widget>[
          Flexible(
            flex: 3,
            child: CenteredButton(
              icon: isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
              backgroundColor: AppConstants.tertiaryColor,
              label: isFavorite ? "Desfavoritar" : "Favoritar",
              onTap: () => _setProductFavoriteStatus(context),
            ),
          ),
          const Flexible(
            flex: 2,
            child: CenteredButton(
              icon: Icons.add_shopping_cart,
              backgroundColor: AppConstants.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _setProductFavoriteStatus(BuildContext context) {
    context.read<ProductFavoritesCubit>().setProductFavorite(widget.product.id, !isFavorite);
  }
}
