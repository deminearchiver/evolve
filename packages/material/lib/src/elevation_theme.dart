import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

class ElevationThemeDataPartial with Diagnosticable {
  const ElevationThemeDataPartial({
    this.level0,
    this.level1,
    this.level2,
    this.level3,
    this.level4,
    this.level5,
  });

  final double? level0;
  final double? level1;
  final double? level2;
  final double? level3;
  final double? level4;
  final double? level5;

  ElevationThemeDataPartial copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) {
    return ElevationThemeDataPartial(
      level0: level0 ?? this.level0,
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
    );
  }

  ElevationThemeDataPartial merge(ElevationThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      level0: other.level0,
      level1: other.level1,
      level2: other.level2,
      level3: other.level3,
      level4: other.level4,
      level5: other.level5,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("level0", level0, defaultValue: null));
    properties.add(DoubleProperty("level1", level1, defaultValue: null));
    properties.add(DoubleProperty("level2", level2, defaultValue: null));
    properties.add(DoubleProperty("level3", level3, defaultValue: null));
    properties.add(DoubleProperty("level4", level4, defaultValue: null));
    properties.add(DoubleProperty("level5", level5, defaultValue: null));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ElevationThemeDataPartial &&
            level0 == other.level0 &&
            level1 == other.level1 &&
            level2 == other.level2 &&
            level3 == other.level3 &&
            level4 == other.level4 &&
            level5 == other.level5;
  }

  @override
  int get hashCode =>
      Object.hash(level0, level1, level2, level3, level4, level5);
}

class ElevationThemeData
    with Diagnosticable
    implements ElevationThemeDataPartial {
  const ElevationThemeData({
    required this.level0,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
    required this.level5,
  });

  const ElevationThemeData.fallback({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) : level0 = level0 ?? 0,
       level1 = level1 ?? 1,
       level2 = level2 ?? 3,
       level3 = level3 ?? 6,
       level4 = level4 ?? 8,
       level5 = level5 ?? 12;

  @override
  final double level0;

  @override
  final double level1;

  @override
  final double level2;

  @override
  final double level3;

  @override
  final double level4;

  @override
  final double level5;

  @override
  ElevationThemeData copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) {
    return ElevationThemeData(
      level0: level0 ?? this.level0,
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
    );
  }

  @override
  ElevationThemeData merge(ElevationThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      level0: other.level0,
      level1: other.level1,
      level2: other.level2,
      level3: other.level3,
      level4: other.level4,
      level5: other.level5,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("level0", level0));
    properties.add(DoubleProperty("level1", level1));
    properties.add(DoubleProperty("level2", level2));
    properties.add(DoubleProperty("level3", level3));
    properties.add(DoubleProperty("level4", level4));
    properties.add(DoubleProperty("level5", level5));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ElevationThemeData &&
            level0 == other.level0 &&
            level1 == other.level1 &&
            level2 == other.level2 &&
            level3 == other.level3 &&
            level4 == other.level4 &&
            level5 == other.level5;
  }

  @override
  int get hashCode =>
      Object.hash(level0, level1, level2, level3, level4, level5);
}

class ElevationTheme extends InheritedTheme {
  const ElevationTheme({super.key, required this.data, required super.child});

  final ElevationThemeData data;

  @override
  bool updateShouldNotify(covariant ElevationTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ElevationTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ElevationThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required ElevationThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return ElevationTheme(
          key: key,
          data: of(context).merge(data),
          child: child,
        );
      },
    );
  }

  static ElevationThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElevationTheme>()?.data;
  }

  static ElevationThemeData of(BuildContext context) {
    return maybeOf(context) ?? const ElevationThemeData.fallback();
  }
}
