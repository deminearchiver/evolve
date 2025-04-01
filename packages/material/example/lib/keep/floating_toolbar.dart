import 'package:material/material.dart';

enum FloatingToolbarVariant { standard, vibrant }

class FloatingToolbar extends StatefulWidget {
  const FloatingToolbar({
    super.key,
    this.variant = FloatingToolbarVariant.standard,
    required this.direction,
    required this.child,
  });
  const FloatingToolbar.horizontal({
    super.key,
    this.variant = FloatingToolbarVariant.standard,
    required this.child,
  }) : direction = Axis.horizontal;

  const FloatingToolbar.vertical({
    super.key,
    this.variant = FloatingToolbarVariant.standard,
    required this.child,
  }) : direction = Axis.vertical;

  final FloatingToolbarVariant variant;

  final Axis direction;

  final Widget child;

  @override
  State<FloatingToolbar> createState() => _FloatingToolbarState();
}

class _FloatingToolbarState extends State<FloatingToolbar> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);

    final elevation = elevationTheme.level3;
    final shape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      corners: Corners.all(shapeTheme.corner.full),
    );
    final backgroundColor = switch (widget.variant) {
      FloatingToolbarVariant.standard => colorTheme.surfaceContainer,
      FloatingToolbarVariant.vibrant => colorTheme.primaryContainer,
    };

    const double minWidth = 64;
    const double minHeight = 64;

    return SizedBox(
      width: widget.direction == Axis.vertical ? minWidth : null,
      height: widget.direction == Axis.horizontal ? minHeight : null,
      child: Material(
        animationDuration: Duration.zero,
        type: MaterialType.card,
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        surfaceTintColor: Colors.transparent,
        shape: shape,
        elevation: elevation,
        shadowColor: Colors.transparent,
        child: IconButtonTheme.merge(
          data: IconButtonThemeDataPartial(
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.transparent,
              overlayColor: WidgetStateLayerColor(
                WidgetStatePropertyAll(colorTheme.onPrimaryContainer),
                stateTheme.stateLayerOpacity,
              ),
              iconColor: WidgetStatePropertyAll(colorTheme.onPrimaryContainer),
            ),
            selectedStyle: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                colorTheme.surfaceContainer,
              ),
              overlayColor: WidgetStateLayerColor(
                WidgetStatePropertyAll(colorTheme.onSurface),
                stateTheme.stateLayerOpacity,
              ),
              iconColor: WidgetStatePropertyAll(colorTheme.onSurface),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
