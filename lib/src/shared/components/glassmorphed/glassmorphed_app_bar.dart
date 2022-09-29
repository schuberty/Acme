import 'package:acme/src/shared/components/glassmorphed/glassmorphed_widget.dart';
import 'package:flutter/material.dart';

class GlassmorphedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double offset;
  final double opacity;

  const GlassmorphedAppBar({
    this.offset = 5.0,
    this.opacity = 0.7,
    super.key,
  })  : assert(offset >= 0),
        assert(opacity >= 0.0 && opacity <= 1.0);

  @override
  Widget build(BuildContext context) {
    return GlassmorphedWidget(
      offset: offset,
      child: AppBar(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.red.withOpacity(opacity),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
