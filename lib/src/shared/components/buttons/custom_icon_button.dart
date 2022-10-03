import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color? iconColor;

  const CustomIconButton(
    this.icon, {
    this.margin,
    this.onTap,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        margin: margin,
        child: Icon(
          icon,
          color: iconColor ?? AppConstants.primaryColor,
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (onTap != null) {
      Feedback.forTap(context);
      onTap!();
    }
  }
}
