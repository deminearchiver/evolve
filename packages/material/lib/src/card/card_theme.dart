import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class CardThemeDataPartial with Diagnosticable {
  const CardThemeDataPartial({
    this.color,
    this.elevation,
    this.shadowColor,
    this.shape,
  });

  final Color? color;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;

  CardThemeDataPartial copyWith({
    Color? color,
    double? elevation,
    Color? shadowColor,
    ShapeBorder? shape,
  }) {
    if (color == null &&
        elevation == null &&
        shadowColor == null &&
        shape == null) {
      return this;
    }
    return CardThemeDataPartial(
      color: color ?? this.color,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
    );
  }

  CardThemeDataPartial merge(CardThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      shape: other.shape,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color, defaultValue: null));
    properties.add(DoubleProperty("elevation", elevation, defaultValue: null));
    properties.add(
      ColorProperty("shadowColor", shadowColor, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>("shape", shape, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CardThemeDataPartial &&
            color == other.color &&
            elevation == other.elevation &&
            shadowColor == other.shadowColor &&
            shape == other.shape;
  }

  @override
  int get hashCode => Object.hash(color, elevation, shadowColor, shape);
}

@immutable
class CardThemeData with Diagnosticable implements CardThemeDataPartial {
  const CardThemeData({
    required this.color,
    required this.elevation,
    required this.shadowColor,
    required this.shape,
  });

  @override
  final Color color;

  @override
  final double elevation;

  @override
  final Color shadowColor;

  @override
  final ShapeBorder shape;

  @override
  CardThemeData copyWith({
    Color? color,
    double? elevation,
    Color? shadowColor,
    ShapeBorder? shape,
  }) {
    if (color == null &&
        elevation == null &&
        shadowColor == null &&
        shape == null) {
      return this;
    }
    return CardThemeData(
      color: color ?? this.color,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
    );
  }

  @override
  CardThemeData merge(CardThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      shape: other.shape,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color));
    properties.add(DoubleProperty("elevation", elevation));
    properties.add(ColorProperty("shadowColor", shadowColor));
    properties.add(DiagnosticsProperty<ShapeBorder>("shape", shape));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CardThemeData &&
            color == other.color &&
            elevation == other.elevation &&
            shadowColor == other.shadowColor &&
            shape == other.shape;
  }

  @override
  int get hashCode => Object.hash(color, elevation, shadowColor, shape);
}

class _CardTheme extends InheritedTheme {
  const _CardTheme({super.key, required this.data, required super.child});

  final CardThemeData data;

  @override
  bool updateShouldNotify(covariant _CardTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _CardTheme(data: data, child: child);
  }
}

class ElevatedCardTheme extends _CardTheme {
  const ElevatedCardTheme({
    super.key,
    required super.data,
    required super.child,
  });

  static Widget merge({
    Key? key,
    required CardThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) => ElevatedCardTheme(
            key: key,
            data: of(context).merge(data),
            child: child,
          ),
    );
  }

  static CardThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ElevatedCardTheme>()
        ?.data;
  }

  static CardThemeData of(BuildContext context) {
    final result = maybeOf(context);
    return result ?? _ElevatedCardThemeDataFallback(context: context);
  }
}

class FilledCardTheme extends _CardTheme {
  const FilledCardTheme({super.key, required super.data, required super.child});

  static Widget merge({
    Key? key,
    required CardThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) => FilledCardTheme(
            key: key,
            data: of(context).merge(data),
            child: child,
          ),
    );
  }

  static CardThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FilledCardTheme>()?.data;
  }

  static CardThemeData of(BuildContext context) {
    final result = maybeOf(context);
    return result ?? _FilledCardThemeDataFallback(context: context);
  }
}

class OutlinedCardTheme extends _CardTheme {
  const OutlinedCardTheme({
    super.key,
    required super.data,
    required super.child,
  });

  static Widget merge({
    Key? key,
    required CardThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) => OutlinedCardTheme(
            key: key,
            data: of(context).merge(data),
            child: child,
          ),
    );
  }

  static CardThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<OutlinedCardTheme>()
        ?.data;
  }

  static CardThemeData of(BuildContext context) {
    final result = maybeOf(context);
    return result ?? _OutlinedCardThemeDataFallback(context: context);
  }
}

mixin _Shared implements CardThemeData {
  @override
  CardThemeData copyWith({
    Color? color,
    double? elevation,
    Color? shadowColor,
    ShapeBorder? shape,
  }) {
    if (color == null &&
        elevation == null &&
        shadowColor == null &&
        shape == null) {
      return this;
    }
    return CardThemeData(
      color: color ?? this.color,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
    );
  }

  @override
  CardThemeData merge(CardThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      shape: other.shape,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CardThemeData &&
            color == other.color &&
            elevation == other.elevation &&
            shadowColor == other.shadowColor &&
            shape == other.shape;
  }

  @override
  int get hashCode => Object.hash(color, elevation, shadowColor, shape);
}

mixin _SharedDiagnosticable on Diagnosticable implements CardThemeData {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color));
    properties.add(DoubleProperty("elevation", elevation));
    properties.add(ColorProperty("shadowColor", shadowColor));
    properties.add(DiagnosticsProperty<ShapeBorder>("shape", shape));
  }
}

class _ElevatedCardThemeDataFallback
    with Diagnosticable, _Shared, _SharedDiagnosticable
    implements CardThemeData {
  _ElevatedCardThemeDataFallback({required this.context});

  final BuildContext context;

  late final ColorThemeData _color = ColorTheme.of(context);
  late final ShapeThemeData _shape = ShapeTheme.of(context);
  late final ElevationThemeData _elevation = ElevationTheme.of(context);

  @override
  Color get color => _color.surfaceContainerLow;

  @override
  double get elevation => _elevation.level1;

  @override
  Color get shadowColor => _color.shadow;

  @override
  ShapeBorder get shape => CornersBorder(
    delegate: _shape.corner.family.delegate,
    corners: Corners.all(_shape.corner.medium),
  );
}

class _FilledCardThemeDataFallback
    with Diagnosticable, _Shared, _SharedDiagnosticable
    implements CardThemeData {
  _FilledCardThemeDataFallback({required this.context});

  final BuildContext context;

  late final ColorThemeData _color = ColorTheme.of(context);
  late final ShapeThemeData _shape = ShapeTheme.of(context);
  late final ElevationThemeData _elevation = ElevationTheme.of(context);

  @override
  Color get color => _color.surfaceContainerHighest;

  @override
  double get elevation => _elevation.level0;

  @override
  Color get shadowColor => _color.shadow;

  @override
  ShapeBorder get shape => CornersBorder(
    delegate: _shape.corner.family.delegate,
    corners: Corners.all(_shape.corner.medium),
  );
}

class _OutlinedCardThemeDataFallback
    with Diagnosticable, _Shared, _SharedDiagnosticable
    implements CardThemeData {
  _OutlinedCardThemeDataFallback({required this.context});

  final BuildContext context;

  late final ColorThemeData _color = ColorTheme.of(context);
  late final ShapeThemeData _shape = ShapeTheme.of(context);
  late final ElevationThemeData _elevation = ElevationTheme.of(context);

  @override
  Color get color => _color.surface;

  @override
  double get elevation => _elevation.level0;

  @override
  Color get shadowColor => _color.shadow;

  @override
  ShapeBorder get shape => CornersBorder(
    delegate: _shape.corner.family.delegate,
    corners: Corners.all(_shape.corner.medium),
    side: BorderSide(
      width: 1,
      color: _color.outlineVariant,
      strokeAlign: BorderSide.strokeAlignInside,
    ),
  );
}
