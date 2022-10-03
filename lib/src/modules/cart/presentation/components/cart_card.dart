import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/app/route/route_arguments.dart';
import 'package:acme/src/shared/components/buttons/custom_icon_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final ProductEntity product;
  final int ammount;
  final VoidCallback? onTapRemove;
  final VoidCallback? onTapAdd;

  const CartCard({
    required this.product,
    required this.ammount,
    this.onTapRemove,
    this.onTapAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 60,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Feedback.forTap(context);

              Navigator.of(context).pushNamed(
                "/product",
                arguments: ProductRouteArgument(product: product, heroPage: "cart"),
              );
            },
            child: Hero(
              tag: "${product.id}_cart",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: screenWidth * 0.4,
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          CustomIconButton(
            Icons.remove,
            iconColor: AppConstants.secondaryColor,
            onTap: onTapRemove,
          ),
          const SizedBox(width: 4),
          Text(
            ammount.toString(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
          const SizedBox(width: 4),
          CustomIconButton(
            Icons.add,
            iconColor: AppConstants.secondaryColor,
            onTap: onTapAdd,
          ),
        ],
      ),
    );
  }
}
