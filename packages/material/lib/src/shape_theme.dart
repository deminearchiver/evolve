import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:material/material.dart';

enum ShapeCornerFamily {
  rounded(RoundedCornersBorderDelegate()),
  cut(CutCornersBorderDelegate());

  const ShapeCornerFamily(this.delegate);

  final CornersBorderDelegate delegate;
}

@experimental
@immutable
class ShapeCornerThemeDataPartial with Diagnosticable {
  const ShapeCornerThemeDataPartial({
    this.family,
    this.none,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
    this.full,
  });

  final ShapeCornerFamily? family;
  final Corner? none;
  final Corner? extraSmall;
  final Corner? small;
  final Corner? medium;
  final Corner? large;
  final Corner? extraLarge;
  // final Corner? extraLargeIncreased;
  // final Corner? extraExtraLarge;
  final Corner? full;

  ShapeCornerThemeDataPartial copyWith({
    ShapeCornerFamily? family,
    Corner? none,
    Corner? extraSmall,
    Corner? small,
    Corner? medium,
    Corner? large,
    Corner? extraLarge,
    Corner? full,
  }) {
    if (family == null &&
        none == null &&
        extraSmall == null &&
        small == null &&
        medium == null &&
        large == null &&
        extraLarge == null &&
        full == null) {
      return this;
    }
    return ShapeCornerThemeDataPartial(
      family: family ?? this.family,
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      full: full ?? this.full,
    );
  }

  ShapeCornerThemeDataPartial merge(ShapeCornerThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      family: other.family,
      none: other.none,
      extraSmall: other.extraSmall,
      small: other.small,
      medium: other.medium,
      large: other.large,
      extraLarge: other.extraLarge,
      full: other.full,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      EnumProperty<ShapeCornerFamily>("family", family, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("none", none, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("extraSmall", extraSmall, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("small", small, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("medium", medium, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("large", large, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("extraLarge", extraLarge, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Corner>("full", full, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeCornerThemeDataPartial &&
            family == other.family &&
            none == other.none &&
            extraSmall == other.extraSmall &&
            small == other.small &&
            medium == other.medium &&
            large == other.large &&
            extraLarge == other.extraLarge &&
            full == other.full;
  }

  @override
  int get hashCode => Object.hash(
    family,
    none,
    extraSmall,
    small,
    medium,
    large,
    extraLarge,
    full,
  );
}

@experimental
@immutable
class ShapeCornerThemeData
    with Diagnosticable
    implements ShapeCornerThemeDataPartial {
  const ShapeCornerThemeData({
    required this.family,
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.full,
  });

  const ShapeCornerThemeData.fallback()
    : family = ShapeCornerFamily.rounded,
      none = Corner.none,
      extraSmall = const Corner.circular(4.0),
      small = const Corner.circular(8.0),
      medium = const Corner.circular(12.0),
      large = const Corner.circular(16.0),
      extraLarge = const Corner.circular(28.0),
      // TODO: decice if we should include tokens from material-components-android
      // extraLargeIncreased = const Corner.circular(32.0),
      // extraExtraLarge = const Corner.circular(48.0),
      full = Corner.full;

  @override
  final ShapeCornerFamily family;

  @override
  final Corner none;

  @override
  final Corner extraSmall;

  @override
  final Corner small;

  @override
  final Corner medium;

  @override
  final Corner large;

  @override
  final Corner extraLarge;

  @override
  final Corner full;

  @override
  ShapeCornerThemeData copyWith({
    ShapeCornerFamily? family,
    Corner? none,
    Corner? extraSmall,
    Corner? small,
    Corner? medium,
    Corner? large,
    Corner? extraLarge,
    Corner? full,
  }) {
    if (family == null &&
        none == null &&
        extraSmall == null &&
        small == null &&
        medium == null &&
        large == null &&
        extraLarge == null &&
        full == null) {
      return this;
    }
    return ShapeCornerThemeData(
      family: family ?? this.family,
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      full: full ?? this.full,
    );
  }

  @override
  ShapeCornerThemeData merge(ShapeCornerThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      family: other.family,
      none: other.none,
      extraSmall: other.extraSmall,
      small: other.small,
      medium: other.medium,
      large: other.large,
      extraLarge: other.extraLarge,
      full: other.full,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<ShapeCornerFamily>("family", family));
    properties.add(DiagnosticsProperty<Corner>("none", none));
    properties.add(DiagnosticsProperty<Corner>("extraSmall", extraSmall));
    properties.add(DiagnosticsProperty<Corner>("small", small));
    properties.add(DiagnosticsProperty<Corner>("medium", medium));
    properties.add(DiagnosticsProperty<Corner>("large", large));
    properties.add(DiagnosticsProperty<Corner>("extraLarge", extraLarge));
    properties.add(DiagnosticsProperty<Corner>("full", full));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeCornerThemeData &&
            family == other.family &&
            none == other.none &&
            extraSmall == other.extraSmall &&
            small == other.small &&
            medium == other.medium &&
            large == other.large &&
            extraLarge == other.extraLarge &&
            full == other.full;
  }

  @override
  int get hashCode => Object.hash(
    family,
    none,
    extraSmall,
    small,
    medium,
    large,
    extraLarge,
    full,
  );
}

@experimental
@immutable
class ShapeThemeDataPartial with Diagnosticable {
  const ShapeThemeDataPartial({this.corner});

  final ShapeCornerThemeDataPartial? corner;

  ShapeThemeDataPartial copyWith({
    covariant ShapeCornerThemeDataPartial? corner,
  }) {
    if (corner == null) return this;
    // ignore: dead_null_aware_expression
    return ShapeThemeDataPartial(corner: corner ?? this.corner);
  }

  ShapeThemeDataPartial merge(ShapeThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(corner: corner?.merge(other.corner) ?? other.corner);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("corner", corner, defaultValue: null));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeThemeDataPartial && corner == other.corner;
  }

  @override
  int get hashCode => corner.hashCode;
}

@experimental
@immutable
class ShapeThemeData with Diagnosticable implements ShapeThemeDataPartial {
  const ShapeThemeData({required this.corner});

  const ShapeThemeData.fallback()
    : corner = const ShapeCornerThemeData.fallback();

  @override
  final ShapeCornerThemeData corner;

  @override
  ShapeThemeData copyWith({covariant ShapeCornerThemeData? corner}) {
    if (corner == null) return this;
    // ignore: dead_null_aware_expression
    return ShapeThemeData(corner: corner ?? this.corner);
  }

  @override
  ShapeThemeData merge(ShapeThemeDataPartial? other) {
    if (other == null) return this;
    return ShapeThemeData(corner: corner.merge(other.corner));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("corner", corner));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeThemeData && corner == other.corner;
  }

  @override
  int get hashCode => corner.hashCode;
}

@experimental
class ShapeTheme extends InheritedTheme {
  const ShapeTheme({super.key, required this.data, required super.child});

  final ShapeThemeData data;

  @override
  bool updateShouldNotify(covariant ShapeTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ShapeTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("data", data));
  }

  static Widget merge({
    Key? key,
    required ShapeThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) =>
              ShapeTheme(key: key, data: of(context).merge(data), child: child),
    );
  }

  static ShapeThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShapeTheme>()?.data;
  }

  static ShapeThemeData of(BuildContext context) {
    final shapeTheme = maybeOf(context);
    return shapeTheme ?? const ShapeThemeData.fallback();
  }
}
