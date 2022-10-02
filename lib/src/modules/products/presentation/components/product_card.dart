import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final EdgeInsets cardMargin;
  final double cardHeight;

  const ProductCard(
    this.product, {
    this.cardMargin = const EdgeInsets.fromLTRB(16, 4, 16, 4),
    this.cardHeight = 120,
    super.key,
  }) : assert(cardHeight >= 120);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    final favoriteWidget = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, -0.5),
            spreadRadius: 3,
            blurRadius: 8,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      child: const Icon(
        Icons.star_rounded,
        color: AppConstants.tertiaryColor,
      ),
    );

    final resultWidget = Hero(
      tag: product.id,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(product.imageUrl),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
          borderRadius: borderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1),
                Colors.transparent,
              ],
              stops: const [0, 0.3, 0.6, 0.9],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (product.isFavorite) favoriteWidget,
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            product.price.formatToReal(),
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Container(
      height: cardHeight,
      margin: cardMargin,
      child: resultWidget,
    );
  }
}
