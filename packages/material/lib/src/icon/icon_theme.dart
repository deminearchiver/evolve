import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as flutterMaterial;
import 'package:material/material.dart';

flutterMaterial.IconThemeData? data;

@immutable
class IconThemeDataPartial with Diagnosticable {
  const IconThemeDataPartial({
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.opacity,
    this.shadows,
    this.applyTextScaling,
  }) : assert(fill == null || (0.0 <= fill && fill <= 1.0)),
       assert(weight == null || (0.0 < weight)),
       assert(opticalSize == null || (0.0 < opticalSize)),
       assert(opacity == null || (0.0 <= opacity && opacity <= 1.0));

  /// The default for [Icon.size].
  ///
  /// Falls back to 24.0.
  final double? size;

  /// The default for [Icon.fill].
  ///
  /// Falls back to 0.0.
  final double? fill;

  /// The default for [Icon.weight].
  ///
  /// Falls back to 400.0.
  final double? weight;

  /// The default for [Icon.grade].
  ///
  /// Falls back to 0.0.
  final double? grade;

  /// The default for [Icon.opticalSize].
  ///
  /// Falls back to 48.0.
  final double? opticalSize;

  /// The default for [Icon.color].
  ///
  /// In material apps, if there is a [Theme] without any [IconTheme]s
  /// specified, icon colors default to white if [ThemeData.brightness] is dark
  /// and black if [ThemeData.brightness] is light.
  ///
  /// Otherwise, falls back to black.
  final Color? color;

  /// An opacity to apply to both explicit and default icon colors.
  ///
  /// Falls back to 1.0.
  final double? opacity;

  /// The default for [Icon.shadows].
  final List<Shadow>? shadows;

  /// The default for [Icon.applyTextScaling].
  final bool? applyTextScaling;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("size", size, defaultValue: null));
    properties.add(DoubleProperty("fill", fill, defaultValue: null));
    properties.add(DoubleProperty("weight", weight, defaultValue: null));
    properties.add(DoubleProperty("grade", grade, defaultValue: null));
    properties.add(
      DoubleProperty("opticalSize", opticalSize, defaultValue: null),
    );
    properties.add(ColorProperty("color", color, defaultValue: null));
    properties.add(DoubleProperty("opacity", opacity, defaultValue: null));
    properties.add(
      IterableProperty<Shadow>("shadows", shadows, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        "applyTextScaling",
        applyTextScaling,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IconThemeDataPartial &&
            size == other.size &&
            fill == other.fill &&
            weight == other.weight &&
            grade == other.grade &&
            opticalSize == other.opticalSize &&
            color == other.color &&
            opacity == other.opacity &&
            listEquals(shadows, other.shadows) &&
            applyTextScaling == other.applyTextScaling;
  }

  @override
  int get hashCode => Object.hash(
    size,
    fill,
    weight,
    grade,
    opticalSize,
    color,
    opacity,
    shadows != null ? Object.hashAll(shadows!) : null,
    applyTextScaling,
  );
}

@immutable
class IconThemeData with Diagnosticable implements IconThemeDataPartial {
  const IconThemeData({
    required this.size,
    required this.fill,
    required this.weight,
    required this.grade,
    required this.opticalSize,
    required this.color,
    required this.opacity,
    required this.shadows,
    required this.applyTextScaling,
  }) : assert(0.0 <= fill && fill <= 1.0),
       assert(0.0 < weight),
       assert(0.0 < opticalSize),
       assert(0.0 <= opacity && opacity <= 1.0);

  const IconThemeData.fallback()
    : size = 24.0,
      fill = 0.0,
      weight = 400.0,
      grade = 0.0,
      opticalSize = 24.0,
      color = const Color(0xFF000000),
      opacity = 1.0,
      shadows = const [],
      applyTextScaling = false;

  @override
  final double size;

  @override
  final double fill;

  @override
  final double weight;

  @override
  final double grade;

  @override
  final double opticalSize;

  @override
  final Color color;

  @override
  final double opacity;

  @override
  final List<Shadow> shadows;

  @override
  final bool applyTextScaling;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("size", size));
    properties.add(DoubleProperty("fill", fill));
    properties.add(DoubleProperty("weight", weight));
    properties.add(DoubleProperty("grade", grade));
    properties.add(DoubleProperty("opticalSize", opticalSize));
    properties.add(ColorProperty("color", color));
    properties.add(DoubleProperty("opacity", opacity));
    properties.add(IterableProperty<Shadow>("shadows", shadows));
    properties.add(
      DiagnosticsProperty<bool>("applyTextScaling", applyTextScaling),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IconThemeData &&
            size == other.size &&
            fill == other.fill &&
            weight == other.weight &&
            grade == other.grade &&
            opticalSize == other.opticalSize &&
            color == other.color &&
            opacity == other.opacity &&
            listEquals(shadows, other.shadows) &&
            applyTextScaling == other.applyTextScaling;
  }

  @override
  int get hashCode => Object.hash(
    size,
    fill,
    weight,
    grade,
    opticalSize,
    color,
    opacity,
    Object.hashAll(shadows),
    applyTextScaling,
  );
}

class IconTheme {}
