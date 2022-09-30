import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity _product;
  final double cardHeight;
  final EdgeInsets cardMargin;

  const ProductCard(
    ProductEntity product, {
    this.cardHeight = 100,
    this.cardMargin = const EdgeInsets.fromLTRB(16, 4, 16, 4),
    super.key,
  }) : _product = product;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    final favoriteWidget = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(0, -1),
            spreadRadius: 1,
            blurRadius: 6,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      child: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );

    final result = Container(
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
          if (!_product.isFavorite) favoriteWidget,
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
                        _product.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "R\$${_product.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _product.description,
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
    );

    return Container(
      height: cardHeight,
      margin: cardMargin,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(_product.imageUrl),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
        borderRadius: borderRadius,
      ),
      child: result,
    );
  }
}
