import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/presentation/components/product_page_header.dart';
import 'package:acme/src/modules/products/presentation/states/product_favorites/product_favorites_cubit.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/centered_button.dart';
import 'package:acme/src/shared/components/floating_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final ProductEntity product;
  final String heroPage;

  const ProductPage({
    required this.product,
    this.heroPage = "product",
    super.key,
  });

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
              heroPage: widget.heroPage,
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
      floatingActionButton: FloatingActionButtons(
        actions: <Widget>[
          Flexible(
            flex: 3,
            child: CenteredButton(
              icon: isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
              backgroundColor: AppConstants.tertiaryColor,
              label: isFavorite ? "Desfavoritar" : "Favoritar",
              onTap: () => setProductFavoriteStatus(context),
              margin: const EdgeInsets.only(right: 4),
            ),
          ),
          Flexible(
            flex: 2,
            child: CenteredButton(
              icon: Icons.add_shopping_cart,
              backgroundColor: AppConstants.secondaryColor,
              onTap: () => addProductToCart(context),
              margin: const EdgeInsets.only(left: 4),
            ),
          ),
        ],
      ),
    );
  }

  void setProductFavoriteStatus(BuildContext context) {
    context.read<ProductFavoritesCubit>().setProductFavorite(widget.product.id, !isFavorite);
  }

  void addProductToCart(BuildContext context) {
    context.read<CartCubit>().addProductToCart(widget.product);

    const snackBar = SnackBar(
      content: Text("Produto adicionado"),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppConstants.secondaryColor,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
