import 'package:acme/src/shared/app/app_constants.dart';
import 'package:flutter/material.dart';

/// Used as a button that has a [icon] centered.
///
/// - Can have a [label] that will be displayed in the right side of the [icon].
class CenteredButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback? onTap;
  final IconData icon;
  final String? label;

  const CenteredButton({
    required this.icon,
    this.onTap,
    this.label,
    this.backgroundColor = AppConstants.secondaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final List<Widget>? labelWidget;

    if (label != null) {
      labelWidget = [
        Container(
          margin: const EdgeInsets.only(left: 4),
          child: Text(
            label!,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(color: AppConstants.primaryColor),
          ),
        )
      ];
    }

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: SizedBox.expand(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: AppConstants.primaryColor),
              if (label != null) ...labelWidget!
            ],
          ),
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
