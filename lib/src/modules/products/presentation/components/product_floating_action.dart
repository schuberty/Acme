import 'package:flutter/material.dart';

class ProductFloatingActions extends StatelessWidget {
  final List<Widget> actions;

  const ProductFloatingActions({
    required this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          for (var widget in actions) widget,
        ],
      ),
    );
  }
}
