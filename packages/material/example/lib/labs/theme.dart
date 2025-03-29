import 'package:material/material.dart';

abstract final class AppTheme {
  static ThemeData fromColorTheme({required ColorThemeData colorTheme}) {
    return fromColorScheme(colorScheme: colorTheme.toColorScheme());
  }

  static ThemeData fromColorScheme({required ColorScheme colorScheme}) {
    return ThemeData(
      colorScheme: colorScheme,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
    );
  }
}

class ComponentThemes extends StatefulWidget {
  const ComponentThemes({super.key, required this.child});

  final Widget child;

  @override
  State<ComponentThemes> createState() => _ComponentThemesState();
}

class _ComponentThemesState extends State<ComponentThemes> {
  late ColorThemeData _color;
  late ShapeThemeData _shape;
  late MotionThemeData _motion;
  late ElevationThemeData _elevation;
  late StateThemeData _state;
  late TextTheme _text;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _color = ColorTheme.of(context);
    _shape = ShapeTheme.of(context);
    _motion = MotionTheme.of(context);
    _elevation = ElevationTheme.of(context);
    _state = StateTheme.of(context);
    _text = TextTheme.of(context);
  }

  Widget _buildIconTheme(BuildContext context, Widget child) {
    return IconTheme.merge(
      data: IconThemeData(
        color: _color.onSurface,
        fill: 0,
        grade: 0,
        size: 24,
        weight: 400,
        opticalSize: 24,
        opacity: 1,
        shadows: [],
        applyTextScaling: false,
      ),
      child: child,
    );
  }

  Widget _buildBadgeTheme(BuildContext context, Widget child) {
    return BadgeTheme(
      data: BadgeThemeData(padding: const EdgeInsets.symmetric(horizontal: 4)),
      child: child,
    );
  }

  Widget _buildDividerTheme(BuildContext context, Widget child) {
    return DividerTheme(
      data: DividerThemeData(indent: 0, endIndent: 0, space: 1, thickness: 1),
      child: child,
    );
  }

  Widget _buildTooltipTheme(BuildContext context, Widget child) {
    return TooltipTheme(
      data: TooltipThemeData(
        constraints: BoxConstraints(minHeight: 24),
        decoration: ShapeDecoration(
          shape: CornersBorder(
            delegate: _shape.corner.family.delegate,
            corners: Corners.all(_shape.corner.extraSmall),
          ),
          color: _color.inverseSurface,
        ),
        textStyle: _text.bodySmall!.copyWith(color: _color.inverseOnSurface),
        waitDuration: Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
      child: child,
    );
  }

  Widget _buildDrawerTheme(BuildContext context, Widget child) {
    final shapeTheme = ShapeTheme.of(context);
    return DrawerTheme(
      data: DrawerThemeData(
        width: 360,
        scrimColor: _color.onSurface.withValues(alpha: 0.5),
        shape: CornersBorder(
          delegate: shapeTheme.corner.family.delegate,
          corners: Corners.horizontal(right: shapeTheme.corner.large),
        ),
      ),
      child: child,
    );
  }

  Widget _buildNavigationDrawerTheme(BuildContext context, Widget child) {
    final unselectedForegroundColor = _color.onSurfaceVariant;
    final selectedBackgroundColor = switch (_color.brightness) {
      Brightness.light => _color.primaryContainer,
      Brightness.dark => _color.primary,
    };
    final selectedForegroundColor = switch (_color.brightness) {
      Brightness.light => _color.onPrimaryContainer,
      Brightness.dark => _color.onPrimary,
    };
    final disabledBackgroundColor = _color.onSurface.withValues(alpha: 0.12);
    final disabledForegroundColor = _color.onSurface.withValues(alpha: 0.38);
    return NavigationDrawerTheme.merge(
      data: NavigationDrawerThemeDataPartial(
        backgroundColor: _color.surface,
        activeIndicatorColor: selectedBackgroundColor,
        iconTheme: WidgetStateProperty.fromMap({
          WidgetState.disabled: IconThemeDataPartial(
            color: disabledForegroundColor,
            fill: 0,
          ),
          WidgetState.selected: IconThemeDataPartial(
            fill: 1,
            color: selectedForegroundColor,
          ),
          WidgetState.any: IconThemeDataPartial(
            fill: 0,
            color: unselectedForegroundColor,
          ),
        }),
        labelTextStyle: WidgetStateProperty.fromMap({
          WidgetState.disabled: _text.labelLarge!.copyWith(
            color: disabledForegroundColor,
          ),
          WidgetState.selected: _text.labelLarge!.copyWith(
            color: selectedForegroundColor,
          ),
          WidgetState.any: _text.labelLarge!.copyWith(
            color: unselectedForegroundColor,
          ),
        }),
        shadowColor: Colors.transparent,
        elevation: _elevation.level1,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CombiningBuilder(
      builders: [
        _buildIconTheme,
        _buildDividerTheme,
        _buildBadgeTheme,
        _buildTooltipTheme,
        _buildDrawerTheme,
        _buildNavigationDrawerTheme,
      ],
      child: widget.child,
    );
  }
}
