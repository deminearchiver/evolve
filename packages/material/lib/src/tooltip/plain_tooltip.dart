import 'package:flutter/gestures.dart';
import 'package:material/material.dart';

Tooltip? _tooltip;

class PlainTooltip extends StatefulWidget {
  const PlainTooltip({super.key});

  @override
  State<PlainTooltip> createState() => _PlainTooltipState();
}

class _PlainTooltipState extends State<PlainTooltip> {
  void _pointerRoute(PointerEvent event) {}

  @override
  void initState() {
    super.initState();
    GestureBinding.instance.pointerRouter.addGlobalRoute(_pointerRoute);
  }

  @override
  void dispose() {
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_pointerRoute);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 24.0),
      child: Material(
        animationDuration: Duration.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: colorTheme.inverseSurface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DefaultTextStyle(
            style: theme.textTheme.bodySmall!.copyWith(
              color: colorTheme.inverseOnSurface,
            ),
            maxLines: null,

            child: Text("Plain tooltip"),
          ),
        ),
      ),
    );
  }
}
