import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class CartCheckoutButton extends StatelessWidget {
  final EdgeInsets? _margin;
  final VoidCallback? _onTap;

  const CartCheckoutButton({
    EdgeInsets? margin,
    VoidCallback? onTap,
    super.key,
  })  : _margin = margin,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: IconButton(
        onPressed: _onTap,
        highlightColor: Colors.transparent,
        icon: const Icon(
          Icons.shopping_cart_checkout,
          color: AppConstants.primaryColor,
        ),
      ),
    );
  }
}
