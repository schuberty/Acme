import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class CartCheckoutButton extends StatelessWidget {
  final EdgeInsets? margin;
  final VoidCallback? onTap;

  const CartCheckoutButton({this.margin, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: () {
          Feedback.forTap(context);

          if (onTap != null) {
            onTap!();
          }
        },
        child: const Icon(
          Icons.shopping_cart_checkout,
          color: AppConstants.primaryColor,
        ),
      ),
    );
  }
}
