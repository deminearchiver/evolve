part of 'elevation.dart';

@immutable
abstract class ElevationThemeDataPartial with Diagnosticable {
  const factory ElevationThemeDataPartial({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) = _ElevationThemeDataPartial;

  double? get level0;
  double? get level1;
  double? get level2;
  double? get level3;
  double? get level4;
  double? get level5;

  ElevationThemeDataPartial copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  });

  ElevationThemeDataPartial merge(ElevationThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin ElevationThemeDataPartialMixin on Diagnosticable
    implements ElevationThemeDataPartial {
  @override
  ElevationThemeDataPartial copyWith({
    double? level0,
    double? level1,
    double? level2,
    double? level3,
    double? level4,
    double? level5,
  }) {
    if (level0 == null &&
        level1 == null &&
        level2 == null &&
        level3 == null &&
        level4 == null &&
        level5 == null) {
      return this;
    }
    return ElevationThemeDataPartial(
      level0: level0 ?? this.level0,
      level1: level1 ?? this.level1,
      level2: level2 ?? this.level2,
      level3: level3 ?? this.level3,
      level4: level4 ?? this.level4,
      level5: level5 ?? this.level5,
    );
  }

  @override
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
        runtimeType == other.runtimeType &&
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

@immutable
class _ElevationThemeDataPartial
    with Diagnosticable, ElevationThemeDataPartialMixin {
  const _ElevationThemeDataPartial({
    this.level0,
    this.level1,
    this.level2,
    this.level3,
    this.level4,
    this.level5,
  });

  @override
  final double? level0;

  @override
  final double? level1;

  @override
  final double? level2;

  @override
  final double? level3;

  @override
  final double? level4;

  @override
  final double? level5;
}
