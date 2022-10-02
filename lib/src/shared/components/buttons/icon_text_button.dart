import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String bellowText;
  final Color iconColor;
  final IconData icon;

  const IconTextButton({
    required this.bellowText,
    required this.icon,
    Color? iconColor,
    this.onTap,
    super.key,
  }) : iconColor = iconColor ?? AppConstants.primaryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 1),
            Text(
              bellowText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
