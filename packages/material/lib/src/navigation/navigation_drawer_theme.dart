import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class NavigationDrawerThemeDataPartial with Diagnosticable {
  const NavigationDrawerThemeDataPartial({
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.activeIndicatorColor,
    this.activeIndicatorSize,
    this.activeIndicatorShape,
    this.stateLayerColor,
    this.iconTheme,
    this.labelTextStyle,
  });

  final Color? backgroundColor;

  final Color? shadowColor;

  final double? elevation;

  final Color? activeIndicatorColor;

  final Size? activeIndicatorSize;

  final ShapeBorder? activeIndicatorShape;

  final WidgetStateProperty<Color>? stateLayerColor;

  final WidgetStateProperty<IconThemeDataPartial>? iconTheme;

  final WidgetStateProperty<TextStyle>? labelTextStyle;

  NavigationDrawerThemeDataPartial copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    Color? activeIndicatorColor,
    Size? activeIndicatorSize,
    ShapeBorder? activeIndicatorShape,
    WidgetStateProperty<Color>? stateLayerColor,
    WidgetStateProperty<IconThemeDataPartial>? iconTheme,
    WidgetStateProperty<TextStyle>? labelTextStyle,
  }) {
    if (backgroundColor == null &&
        shadowColor == null &&
        elevation == null &&
        activeIndicatorColor == null &&
        activeIndicatorSize == null &&
        activeIndicatorShape == null &&
        stateLayerColor == null &&
        iconTheme == null &&
        labelTextStyle == null) {
      return this;
    }
    return NavigationDrawerThemeDataPartial(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
      activeIndicatorSize: activeIndicatorSize ?? this.activeIndicatorSize,
      activeIndicatorShape: activeIndicatorShape ?? this.activeIndicatorShape,
      stateLayerColor: stateLayerColor ?? this.stateLayerColor,
      iconTheme: iconTheme ?? this.iconTheme,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  NavigationDrawerThemeDataPartial merge(
    NavigationDrawerThemeDataPartial? other,
  ) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      activeIndicatorColor: other.activeIndicatorColor,
      activeIndicatorSize: other.activeIndicatorSize,
      activeIndicatorShape: other.activeIndicatorShape,
      stateLayerColor: other.stateLayerColor,
      iconTheme: other.iconTheme,
      labelTextStyle: other.labelTextStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ColorProperty("backgroundColor", backgroundColor, defaultValue: null),
    );
    properties.add(
      ColorProperty("shadowColor", shadowColor, defaultValue: null),
    );
    properties.add(DoubleProperty("elevation", elevation, defaultValue: null));
    properties.add(
      ColorProperty(
        "activeIndicatorColor",
        activeIndicatorColor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Size>(
        "activeIndicatorSize",
        activeIndicatorSize,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>(
        "activeIndicatorShape",
        activeIndicatorShape,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<Color>>(
        "stateLayerColor",
        stateLayerColor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<IconThemeDataPartial>>(
        "iconTheme",
        iconTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<TextStyle>>(
        "labelTextStyle",
        labelTextStyle,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is NavigationDrawerThemeDataPartial &&
            backgroundColor == other.backgroundColor &&
            shadowColor == other.shadowColor &&
            elevation == other.elevation &&
            activeIndicatorColor == other.activeIndicatorColor &&
            activeIndicatorSize == other.activeIndicatorSize &&
            activeIndicatorShape == other.activeIndicatorShape &&
            stateLayerColor == other.stateLayerColor &&
            iconTheme == other.iconTheme &&
            labelTextStyle == other.labelTextStyle;
  }

  @override
  int get hashCode => Object.hash(
    backgroundColor,
    shadowColor,
    elevation,
    activeIndicatorColor,
    activeIndicatorSize,
    activeIndicatorShape,
    stateLayerColor,
    iconTheme,
    labelTextStyle,
  );
}

@immutable
class NavigationDrawerThemeData
    with Diagnosticable
    implements NavigationDrawerThemeDataPartial {
  const NavigationDrawerThemeData({
    required this.backgroundColor,
    required this.shadowColor,
    required this.elevation,
    required this.activeIndicatorColor,
    required this.activeIndicatorSize,
    required this.activeIndicatorShape,
    required this.stateLayerColor,
    required this.iconTheme,
    required this.labelTextStyle,
  });

  // TODO: decide if we should include a factory here
  // factory NavigationDrawerThemeData.fallback({required BuildContext context}) =
  //     _NavigationDrawerThemeDataFallback;

  @override
  final Color backgroundColor;

  @override
  final Color shadowColor;

  @override
  final double elevation;

  @override
  final Color activeIndicatorColor;

  @override
  final Size activeIndicatorSize;

  @override
  final ShapeBorder activeIndicatorShape;

  @override
  final WidgetStateProperty<Color> stateLayerColor;

  @override
  final WidgetStateProperty<IconThemeDataPartial> iconTheme;

  @override
  final WidgetStateProperty<TextStyle> labelTextStyle;

  @override
  NavigationDrawerThemeData copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    Color? activeIndicatorColor,
    Size? activeIndicatorSize,
    ShapeBorder? activeIndicatorShape,
    WidgetStateProperty<Color>? stateLayerColor,
    WidgetStateProperty<IconThemeDataPartial>? iconTheme,
    WidgetStateProperty<TextStyle>? labelTextStyle,
  }) {
    if (backgroundColor == null &&
        shadowColor == null &&
        elevation == null &&
        activeIndicatorColor == null &&
        activeIndicatorSize == null &&
        activeIndicatorShape == null &&
        stateLayerColor == null &&
        iconTheme == null &&
        labelTextStyle == null) {
      return this;
    }
    return NavigationDrawerThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
      activeIndicatorSize: activeIndicatorSize ?? this.activeIndicatorSize,
      activeIndicatorShape: activeIndicatorShape ?? this.activeIndicatorShape,
      stateLayerColor: stateLayerColor ?? this.stateLayerColor,
      iconTheme: iconTheme ?? this.iconTheme,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  @override
  NavigationDrawerThemeData merge(NavigationDrawerThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      activeIndicatorColor: other.activeIndicatorColor,
      activeIndicatorSize: other.activeIndicatorSize,
      activeIndicatorShape: other.activeIndicatorShape,
      stateLayerColor: other.stateLayerColor,
      iconTheme: other.iconTheme,
      labelTextStyle: other.labelTextStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("backgroundColor", backgroundColor));
    properties.add(ColorProperty("shadowColor", shadowColor));
    properties.add(DoubleProperty("elevation", elevation));
    properties.add(ColorProperty("activeIndicatorColor", activeIndicatorColor));
    properties.add(
      DiagnosticsProperty<Size>("activeIndicatorSize", activeIndicatorSize),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>(
        "activeIndicatorShape",
        activeIndicatorShape,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<Color>>(
        "stateLayerColor",
        stateLayerColor,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<IconThemeDataPartial>>(
        "iconTheme",
        iconTheme,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<TextStyle>>(
        "labelTextStyle",
        labelTextStyle,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is NavigationDrawerThemeData &&
            backgroundColor == other.backgroundColor &&
            shadowColor == other.shadowColor &&
            elevation == other.elevation &&
            activeIndicatorColor == other.activeIndicatorColor &&
            activeIndicatorSize == other.activeIndicatorSize &&
            activeIndicatorShape == other.activeIndicatorShape &&
            stateLayerColor == other.stateLayerColor &&
            iconTheme == other.iconTheme &&
            labelTextStyle == other.labelTextStyle;
  }

  @override
  int get hashCode => Object.hash(
    backgroundColor,
    shadowColor,
    elevation,
    activeIndicatorColor,
    activeIndicatorSize,
    activeIndicatorShape,
    stateLayerColor,
    iconTheme,
    labelTextStyle,
  );
}

class NavigationDrawerTheme extends InheritedTheme {
  const NavigationDrawerTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final NavigationDrawerThemeData data;

  @override
  bool updateShouldNotify(covariant NavigationDrawerTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return NavigationDrawerTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<NavigationDrawerThemeData>("data", data),
    );
  }

  static Widget merge({
    Key? key,
    required NavigationDrawerThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return NavigationDrawerTheme(
          key: key,
          data: of(context).merge(data),
          child: child,
        );
      },
    );
  }

  static NavigationDrawerThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NavigationDrawerTheme>()
        ?.data;
  }

  static NavigationDrawerThemeData of(BuildContext context) {
    final result = maybeOf(context);
    return result ?? _NavigationDrawerThemeDataFallback(context: context);
  }
}

class _NavigationDrawerThemeDataFallback
    with Diagnosticable
    implements NavigationDrawerThemeData {
  _NavigationDrawerThemeDataFallback({required this.context})
    : shadowColor = Colors.transparent,
      activeIndicatorSize = const Size(336, 56);

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);
  late final ShapeThemeData _shape = ShapeTheme.of(context);
  late final StateThemeData _state = StateTheme.of(context);
  late final ElevationThemeData _elevation = ElevationTheme.of(context);
  late final TextTheme _text = TextTheme.of(context);

  @override
  Color get backgroundColor => _color.surfaceContainerLow;

  @override
  final Color shadowColor;

  @override
  double get elevation => _elevation.level1;

  @override
  Color get activeIndicatorColor => _color.secondaryContainer;

  @override
  final Size activeIndicatorSize;

  @override
  WidgetStateProperty<Color> get stateLayerColor => WidgetStateLayerColor(
    WidgetStateProperty.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? _color.onSecondaryContainer
          : _color.onSurface;
    }),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<IconThemeDataPartial> get iconTheme =>
      WidgetStateProperty.resolveWith((states) {
        final Color color;
        final double fill;
        if (states.contains(WidgetState.selected)) {
          color = _color.onSecondaryContainer;
          fill = 1.0;
        } else {
          color = _color.onSurfaceVariant;
          fill = 0.0;
        }
        return IconThemeDataPartial(
          fill: fill,
          size: 24,
          opticalSize: 24,
          color: color,
        );
      });

  @override
  WidgetStateProperty<TextStyle> get labelTextStyle =>
      WidgetStateProperty.resolveWith((states) {
        final Color color;
        if (states.contains(WidgetState.selected)) {
          color = _color.onSecondaryContainer;
        } else {
          color = _color.onSurfaceVariant;
        }
        return _text.labelLarge!.copyWith(color: color);
      });

  @override
  ShapeBorder get activeIndicatorShape => CornersBorder(
    delegate: _shape.corner.family.delegate,
    corners: Corners.all(_shape.corner.full),
  );
  @override
  NavigationDrawerThemeData copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    Color? activeIndicatorColor,
    Size? activeIndicatorSize,
    ShapeBorder? activeIndicatorShape,
    WidgetStateProperty<Color>? stateLayerColor,
    WidgetStateProperty<IconThemeDataPartial>? iconTheme,
    WidgetStateProperty<TextStyle>? labelTextStyle,
  }) {
    if (backgroundColor == null &&
        shadowColor == null &&
        elevation == null &&
        activeIndicatorColor == null &&
        activeIndicatorSize == null &&
        activeIndicatorShape == null &&
        stateLayerColor == null &&
        iconTheme == null &&
        labelTextStyle == null) {
      return this;
    }
    return NavigationDrawerThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
      activeIndicatorSize: activeIndicatorSize ?? this.activeIndicatorSize,
      activeIndicatorShape: activeIndicatorShape ?? this.activeIndicatorShape,
      stateLayerColor: stateLayerColor ?? this.stateLayerColor,
      iconTheme: iconTheme ?? this.iconTheme,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  @override
  NavigationDrawerThemeData merge(NavigationDrawerThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      activeIndicatorColor: other.activeIndicatorColor,
      activeIndicatorSize: other.activeIndicatorSize,
      activeIndicatorShape: other.activeIndicatorShape,
      stateLayerColor: other.stateLayerColor,
      iconTheme: other.iconTheme,
      labelTextStyle: other.labelTextStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("backgroundColor", backgroundColor));
    properties.add(ColorProperty("shadowColor", shadowColor));
    properties.add(DoubleProperty("elevation", elevation));
    properties.add(ColorProperty("activeIndicatorColor", activeIndicatorColor));
    properties.add(
      DiagnosticsProperty<Size>("activeIndicatorSize", activeIndicatorSize),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>(
        "activeIndicatorShape",
        activeIndicatorShape,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<Color>>(
        "stateLayerColor",
        stateLayerColor,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<IconThemeDataPartial>>(
        "iconTheme",
        iconTheme,
      ),
    );
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<TextStyle>>(
        "labelTextStyle",
        labelTextStyle,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is NavigationDrawerThemeData &&
            backgroundColor == other.backgroundColor &&
            shadowColor == other.shadowColor &&
            elevation == other.elevation &&
            activeIndicatorColor == other.activeIndicatorColor &&
            activeIndicatorSize == other.activeIndicatorSize &&
            activeIndicatorShape == other.activeIndicatorShape &&
            stateLayerColor == other.stateLayerColor &&
            iconTheme == other.iconTheme &&
            labelTextStyle == other.labelTextStyle;
  }

  @override
  int get hashCode => Object.hash(
    backgroundColor,
    shadowColor,
    elevation,
    activeIndicatorColor,
    activeIndicatorSize,
    activeIndicatorShape,
    stateLayerColor,
    iconTheme,
    labelTextStyle,
  );
}
