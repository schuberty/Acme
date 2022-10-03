import 'dart:async';

import 'package:acme/src/modules/products/presentation/states/product/product_bloc.dart';
import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductLoadingBar extends StatefulWidget implements PreferredSizeWidget {
  final double width;
  final preferredHeight = 5.0;

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  /// Widget utilizado na propriedade `bottom` do `AppBar` para indicar um
  /// carregamento da página.
  ///
  /// Parâmetro [width] deve ser a largura horizontal da tela.
  ///
  /// Exemplo abstrato:
  /// ```
  /// final screen = ScreenHelper(context); // Ou usando MediaQuery
  /// return AppBar(
  ///   bottom: AppLoadingBar(
  ///     width: screen.width,
  ///     isLoading: true,
  /// );
  /// ```
  const ProductLoadingBar({
    required this.width,
    super.key,
  });

  @override
  State<ProductLoadingBar> createState() => _ProductLoadingBarState();
}

class _ProductLoadingBarState extends State<ProductLoadingBar> with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final double offset = 100;

  late final AnimationController controller;
  late final Animation<double> positionAnimation;
  late final StreamSubscription<ProductState> productStream;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    positionAnimation =
        Tween<double>(begin: -(100 + offset), end: widget.width + offset).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    productStream = context.read<ProductBloc>().stream.listen((state) {
      if (state is ProductsLoading) {
        setState(() => isLoading = true);
        controller.forward().whenComplete(() => controller.repeat());
      } else if (state is ProductsFetched) {
        setState(() => isLoading = false);
        controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isLoading ? widget.preferredHeight : 0,
          width: widget.width,
          color: Colors.red.shade200,
        ),
        Positioned(
          left: positionAnimation.value,
          child: Container(
            height: widget.preferredHeight,
            color: AppConstants.tertiaryColor,
            width: 100,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    productStream.cancel();
    super.dispose();
  }
}
