import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:meta/meta.dart';

@experimental
@immutable
class ShapeCornerThemeDataPartial with Diagnosticable {
  const ShapeCornerThemeDataPartial({
    this.none,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
    this.full,
  });

  final OutlinedBorder? none;
  final OutlinedBorder? extraSmall;
  final OutlinedBorder? small;
  final OutlinedBorder? medium;
  final OutlinedBorder? large;
  final OutlinedBorder? extraLarge;
  final OutlinedBorder? full;

  ShapeCornerThemeDataPartial copyWith({
    OutlinedBorder? none,
    OutlinedBorder? extraSmall,
    OutlinedBorder? small,
    OutlinedBorder? medium,
    OutlinedBorder? large,
    OutlinedBorder? extraLarge,
    OutlinedBorder? full,
  }) {
    if (none == null &&
        extraSmall == null &&
        small == null &&
        medium == null &&
        large == null &&
        extraLarge == null &&
        full == null) {
      return this;
    }
    return ShapeCornerThemeDataPartial(
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
      DiagnosticsProperty<OutlinedBorder>("none", none, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>(
        "extraSmall",
        extraSmall,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>("small", small, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>("medium", medium, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>("large", large, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>(
        "extraLarge",
        extraLarge,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<OutlinedBorder>("full", full, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeCornerThemeDataPartial &&
            none == other.none &&
            extraSmall == other.extraSmall &&
            small == other.small &&
            medium == other.medium &&
            large == other.large &&
            extraLarge == other.extraLarge &&
            full == other.full;
  }

  @override
  int get hashCode =>
      Object.hash(none, extraSmall, small, medium, large, extraLarge, full);
}

@experimental
@immutable
class ShapeCornerThemeData
    with Diagnosticable
    implements ShapeCornerThemeDataPartial {
  const ShapeCornerThemeData({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.full,
  });

  const ShapeCornerThemeData.fallback()
    : none = const RoundedRectangleBorder(),
      extraSmall = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      small = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      medium = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      large = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      extraLarge = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28.0)),
      ),
      full = const StadiumBorder();

  @override
  final OutlinedBorder none;

  @override
  final OutlinedBorder extraSmall;

  @override
  final OutlinedBorder small;

  @override
  final OutlinedBorder medium;

  @override
  final OutlinedBorder large;

  @override
  final OutlinedBorder extraLarge;

  @override
  final OutlinedBorder full;

  @override
  ShapeCornerThemeData copyWith({
    OutlinedBorder? none,
    OutlinedBorder? extraSmall,
    OutlinedBorder? small,
    OutlinedBorder? medium,
    OutlinedBorder? large,
    OutlinedBorder? extraLarge,
    OutlinedBorder? full,
  }) {
    if (none == null &&
        extraSmall == null &&
        small == null &&
        medium == null &&
        large == null &&
        extraLarge == null &&
        full == null) {
      return this;
    }
    return ShapeCornerThemeData(
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
    properties.add(DiagnosticsProperty<OutlinedBorder>("none", none));
    properties.add(
      DiagnosticsProperty<OutlinedBorder>(
        "extraSmall",
        extraSmall,
        defaultValue: null,
      ),
    );
    properties.add(DiagnosticsProperty<OutlinedBorder>("small", small));
    properties.add(DiagnosticsProperty<OutlinedBorder>("medium", medium));
    properties.add(DiagnosticsProperty<OutlinedBorder>("large", large));
    properties.add(
      DiagnosticsProperty<OutlinedBorder>(
        "extraLarge",
        extraLarge,
        defaultValue: null,
      ),
    );
    properties.add(DiagnosticsProperty<OutlinedBorder>("full", full));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ShapeCornerThemeData &&
            none == other.none &&
            extraSmall == other.extraSmall &&
            small == other.small &&
            medium == other.medium &&
            large == other.large &&
            extraLarge == other.extraLarge &&
            full == other.full;
  }

  @override
  int get hashCode =>
      Object.hash(none, extraSmall, small, medium, large, extraLarge, full);
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
    return copyWith(corner: corner.merge(other.corner));
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
