import 'package:example/keep/theme/extended_colors_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:flutter/material.dart' as flutter_material;

class ColorThemeFactory {}

class ThemeFactory {
  static ThemeData fromColorTheme({required ColorThemeData colorTheme}) {
    return fromColorScheme(colorScheme: colorTheme.toColorScheme());
  }

  static ThemeData fromColorScheme({required ColorScheme colorScheme}) {
    return ThemeData(
      colorScheme: colorScheme,
      platform: kDebugMode ? TargetPlatform.android : null,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.standard,
      splashFactory: InkSparkle.splashFactory,
      bottomSheetTheme: const BottomSheetThemeData(
        clipBehavior: Clip.antiAlias,
      ),
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
  late StateThemeData _state;
  late MotionThemeData _motion;
  late ElevationThemeData _elevation;
  late TextTheme _text;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _color = ColorTheme.of(context);
    _shape = ShapeTheme.of(context);
    _state = StateTheme.of(context);
    _motion = MotionTheme.of(context);
    _elevation = ElevationTheme.of(context);
    _text = TextTheme.of(context);
  }

  Widget _buildLegacyIconTheme(BuildContext context, Widget child) {
    final iconTheme = IconTheme.of(context);
    return flutter_material.IconTheme(
      // ignore: deprecated_member_use
      data: iconTheme.toLegacy(),
      child: child,
    );
  }

  Widget _buildTooltipTheme(BuildContext context, Widget child) {
    return TooltipTheme(
      data: TooltipThemeData(
        constraints: const BoxConstraints(minWidth: 64, minHeight: 32),
        preferBelow: false,
        decoration: ShapeDecoration(
          shape: CornersBorder(
            delegate: _shape.corner.family.delegate,
            corners: Corners.all(_shape.corner.full),
          ),
          color: _color.tertiary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        textStyle: _text.labelLarge!.copyWith(color: _color.onTertiary),
      ),
      child: child,
    );
  }

  // TODO: migrate top app bar to use component themes
  Widget _buildTopAppBarTheme(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        appBarTheme: AppBarTheme(
          leadingWidth: 56,
          titleSpacing: 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          toolbarHeight: 64,
          elevation: _elevation.level0,
          scrolledUnderElevation: _elevation.level2,
          actionsPadding: EdgeInsets.zero,
        ),
      ),
      child: child,
    );
  }

  Widget _buildNavigationBarTheme(BuildContext context, Widget child) {
    final selectedIconColor = switch (_color.brightness) {
      Brightness.light => _color.onPrimaryContainer,
      Brightness.dark => _color.onPrimary,
    };
    final unselectedIconColor = _color.onSurfaceVariant;

    final unselectedLabelColor = _color.onSurfaceVariant;
    final selectedLabelColor = _color.onSurface;

    final indicatorColor = switch (_color.brightness) {
      Brightness.light => _color.primaryContainer,
      Brightness.dark => _color.primary,
    };

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 80,
        elevation: _elevation.level2,
        shadowColor: Colors.transparent,
        backgroundColor: _color.surfaceContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        overlayColor: WidgetStateLayerColor(
          WidgetStatePropertyAll(_color.onSurface),
          _state.stateLayerOpacity,
        ),
        indicatorColor: indicatorColor,
        indicatorShape: CornersBorder(
          delegate: _shape.corner.family.delegate,
          corners: Corners.all(_shape.corner.full),
        ),
        iconTheme: WidgetStateProperty.fromMap({
          WidgetState.selected: flutter_material.IconThemeData(
            color: selectedIconColor,
            fill: 1,
            size: 24,
            opticalSize: 24,
          ),
          WidgetState.any: flutter_material.IconThemeData(
            color: unselectedIconColor,
            fill: 0,
            size: 24,
            opticalSize: 24,
          ),
        }),
        labelTextStyle: WidgetStateProperty.fromMap({
          WidgetState.selected: _text.labelMedium!.copyWith(
            color: selectedLabelColor,
          ),
          WidgetState.any: _text.labelMedium!.copyWith(
            color: unselectedLabelColor,
          ),
        }),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CombiningBuilder(
      // Order of builders must be preserved
      builders: [
        // Dependency components
        _buildLegacyIconTheme,
        // Dependent components
        _buildTopAppBarTheme,
        _buildTooltipTheme,
        _buildNavigationBarTheme,
      ],
      child: widget.child,
    );
  }
}

class Themes extends StatefulWidget {
  const Themes({
    super.key,
    required this.extendedColorsTheme,
    required this.child,
  });

  final ExtendedColorsThemeData extendedColorsTheme;
  final Widget child;

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  Widget _buildExtendedColorsTheme(BuildContext context, Widget child) {
    return ExtendedColorsTheme(data: widget.extendedColorsTheme, child: child);
  }

  Widget _buildComponentThemes(BuildContext context, Widget child) {
    return ComponentThemes(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return CombiningBuilder(
      builders: [_buildExtendedColorsTheme, _buildComponentThemes],
      child: widget.child,
    );
  }
}
