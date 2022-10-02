import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductPageHeader extends StatelessWidget {
  final double height;

  final ProductEntity product;

  const ProductPageHeader({
    required this.product,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: AppConstants.secondaryColor,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: AppConstants.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              product.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                product.price.formatToReal(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        background: Hero(
          tag: product.id,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: SizedBox.expand(
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: const [0, 0.2, 0.4, 0.6],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
