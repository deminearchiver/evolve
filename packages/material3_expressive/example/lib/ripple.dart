import 'package:flutter/material.dart';
import 'package:material3_expressive/material3_expressive.dart';

class Ripple extends StatelessWidget {
  const Ripple({
    super.key,
    this.statesController,
    this.onTap,
    this.color,
    this.opacity,
    this.child = const SizedBox.shrink(),
  });

  final WidgetStatesController? statesController;
  final VoidCallback? onTap;
  final WidgetStateProperty<Color?>? color;
  final WidgetStateProperty<double?>? opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final color = this.color ?? WidgetStatePropertyAll(colorTheme.onSurface);
    final opacity =
        this.opacity ?? StateLayerOpacity.fromStateTheme(stateTheme);
    final WidgetStateProperty<Color>
    overlayColor = WidgetStateProperty.resolveWith((states) {
      final resolvedColor = color.resolve(states);
      if (resolvedColor == null) return Colors.transparent;
      if (resolvedColor.a == 0.0) return resolvedColor;

      final resolvedOpacity = opacity.resolve(states) ?? 0.0;
      if (resolvedOpacity == 0.0) return resolvedColor.withValues(alpha: 0.0);

      return resolvedColor.withValues(alpha: resolvedColor.a * resolvedOpacity);
    });
    return InkWell(
      statesController: statesController,
      overlayColor: overlayColor,
      onTap: onTap,
      child: child,
    );
  }
}
