import 'package:acme/src/modules/cart/presentation/states/cart_cubit.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:acme/src/shared/components/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Center(
          child: CustomIconButton(
            Icons.shopping_cart_checkout,
            onTap: () => Navigator.of(context).pushNamed("/cart"),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppConstants.tertiaryColor,
          ),
          clipBehavior: Clip.none,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cartLength = context.read<CartCubit>().cart.length;

              if (cartLength == 0) {
                return const SizedBox.shrink();
              }

              final bubbleText = cartLength > 9 ? "9+" : cartLength.toString();

              return Text(
                bubbleText,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end,
              );
            },
          ),
        ),
      ],
    );
  }
}
