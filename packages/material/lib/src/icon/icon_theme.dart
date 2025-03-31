import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as flutter_material;
import 'package:material/material.dart';

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

  @Deprecated("")
  factory IconThemeDataPartial.fromLegacy(
    flutter_material.IconThemeData legacy,
  ) {
    return IconThemeDataPartial(
      size: legacy.size,
      fill: legacy.fill,
      weight: legacy.weight,
      grade: legacy.grade,
      opticalSize: legacy.opticalSize,
      color: legacy.color,
      opacity: legacy.opacity,
      shadows: legacy.shadows,
      applyTextScaling: legacy.applyTextScaling,
    );
  }

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

  IconThemeDataPartial copyWith({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) {
    if (size == null &&
        fill == null &&
        weight == null &&
        grade == null &&
        opticalSize == null &&
        color == null &&
        opacity == null &&
        shadows == null &&
        applyTextScaling == null) {
      return this;
    }
    return IconThemeDataPartial(
      size: size ?? this.size,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      shadows: shadows ?? this.shadows,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
    );
  }

  IconThemeDataPartial merge(IconThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      fill: other.fill,
      weight: other.weight,
      grade: other.grade,
      opticalSize: other.opticalSize,
      color: other.color,
      opacity: other.opacity,
      shadows: other.shadows,
      applyTextScaling: other.applyTextScaling,
    );
  }

  /// Returns a partial [flutter_material.IconThemeData]
  ///
  /// The [flutter_material.IconThemeData.isConcrete] of the returned object
  /// may be `false`
  @Deprecated("")
  flutter_material.IconThemeData toLegacy() => flutter_material.IconThemeData(
    size: size,
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    color: color,
    opacity: opacity,
    shadows: shadows,
    applyTextScaling: applyTextScaling,
  );

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

  @Deprecated("")
  factory IconThemeData.fromLegacy(flutter_material.IconThemeData legacy) {
    assert(legacy.isConcrete);
    return IconThemeData(
      size: legacy.size!,
      fill: legacy.fill!,
      weight: legacy.weight!,
      grade: legacy.grade!,
      opticalSize: legacy.opticalSize!,
      color: legacy.color!,
      opacity: legacy.opacity!,
      shadows: legacy.shadows!,
      applyTextScaling: legacy.applyTextScaling!,
    );
  }

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
  IconThemeData copyWith({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) {
    if (size == null &&
        fill == null &&
        weight == null &&
        grade == null &&
        opticalSize == null &&
        color == null &&
        opacity == null &&
        shadows == null &&
        applyTextScaling == null) {
      return this;
    }
    return IconThemeData(
      size: size ?? this.size,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      shadows: shadows ?? this.shadows,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
    );
  }

  @override
  IconThemeData merge(IconThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      fill: other.fill,
      weight: other.weight,
      grade: other.grade,
      opticalSize: other.opticalSize,
      color: other.color,
      opacity: other.opacity,
      shadows: other.shadows,
      applyTextScaling: other.applyTextScaling,
    );
  }

  /// Returns a concrete [flutter_material.IconThemeData]
  ///
  /// The [flutter_material.IconThemeData.isConcrete] of the returned object
  /// is always `true`
  @override
  @Deprecated("")
  flutter_material.IconThemeData toLegacy() => flutter_material.IconThemeData(
    size: size,
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    color: color,
    opacity: opacity,
    shadows: shadows,
    applyTextScaling: applyTextScaling,
  );

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

class IconTheme extends InheritedTheme {
  const IconTheme({super.key, required this.data, required super.child});

  final IconThemeData data;

  @override
  bool updateShouldNotify(covariant IconTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return IconTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required IconThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) =>
              IconTheme(key: key, data: of(context).merge(data), child: child),
    );
  }

  static IconThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IconTheme>()?.data;
  }

  static IconThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;

    // ignore: deprecated_member_use_from_same_package
    final legacy = maybeLegacyOf(context)?.resolve(context);

    if (legacy != null && legacy.isConcrete) {
      // ignore: deprecated_member_use_from_same_package
      return IconThemeData.fromLegacy(legacy);
    }
    final fallback = _IconThemeDataFallback(context: context);
    if (legacy == null) return fallback;
    // ignore: deprecated_member_use_from_same_package
    final partial = IconThemeDataPartial.fromLegacy(legacy);
    return fallback.merge(partial);
  }

  @Deprecated("Use IconTheme.maybeOf instead")
  static flutter_material.IconThemeData? maybeLegacyOf(BuildContext context) {
    final iconTheme =
        context
            .dependOnInheritedWidgetOfExactType<flutter_material.IconTheme>();
    return iconTheme?.data;
  }

  @Deprecated("Use IconTheme.of instead")
  static flutter_material.IconThemeData legacyOf(BuildContext context) {
    return flutter_material.IconTheme.of(context);
  }
}

class _IconThemeDataFallback with Diagnosticable implements IconThemeData {
  _IconThemeDataFallback({required this.context})
    : size = 24,
      fill = 0,
      weight = 400,
      grade = 0,
      opticalSize = 24,
      opacity = 1,
      shadows = const [],
      applyTextScaling = false;

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);

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
  Color get color => _color.onSurface;

  @override
  final double opacity;

  @override
  final List<Shadow> shadows;

  @override
  final bool applyTextScaling;

  @override
  IconThemeData copyWith({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) {
    if (size == null &&
        fill == null &&
        weight == null &&
        grade == null &&
        opticalSize == null &&
        color == null &&
        opacity == null &&
        shadows == null &&
        applyTextScaling == null) {
      return this;
    }
    return IconThemeData(
      size: size ?? this.size,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      shadows: shadows ?? this.shadows,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
    );
  }

  @override
  IconThemeData merge(IconThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      fill: other.fill,
      weight: other.weight,
      grade: other.grade,
      opticalSize: other.opticalSize,
      color: other.color,
      opacity: other.opacity,
      shadows: other.shadows,
      applyTextScaling: other.applyTextScaling,
    );
  }

  @override
  flutter_material.IconThemeData toLegacy() => flutter_material.IconThemeData(
    size: size,
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    color: color,
    opacity: opacity,
    shadows: shadows,
    applyTextScaling: applyTextScaling,
  );

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
