import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:material3_expressive/material3_expressive.dart';

abstract class IconThemeDataPartial with Diagnosticable {
  const factory IconThemeDataPartial({
    Color? color,
    double? size,
    FontWeight? weight,
    double? wght,
    double? grad,
    double? opsz,
    double? fill,
  }) = _IconThemeDataPartial;

  const factory IconThemeDataPartial.fromLegacy(
    material.IconThemeData iconTheme,
  ) = _IconThemeDataPartialFromLegacy;

  Color? get color;

  double? get size;

  FontWeight? get weight;

  double? get wght;

  double? get grad;

  double? get opsz;

  double? get fill;

  IconThemeDataPartial copyWith({
    Color? color,
    double? size,
    FontWeight? weight,
    double? wght,
    double? grad,
    double? opsz,
    double? fill,
  });

  IconThemeDataPartial merge(IconThemeDataPartial? other);

  material.IconThemeData toLegacy();
}

mixin IconThemeDataPartialMixin on Diagnosticable
    implements IconThemeDataPartial {
  @override
  IconThemeDataPartial copyWith({
    Color? color,
    double? size,
    FontWeight? weight,
    double? wght,
    double? grad,
    double? opsz,
    double? fill,
  }) {
    if (color == null &&
        size == null &&
        weight == null &&
        wght == null &&
        grad == null &&
        opsz == null &&
        fill == null) {
      return this;
    }
    return IconThemeDataPartial(
      color: color ?? this.color,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      opsz: opsz ?? this.opsz,
      fill: fill ?? this.fill,
    );
  }

  @override
  IconThemeDataPartial merge(IconThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      size: other.size,
      weight: other.weight,
      wght: other.wght,
      grad: other.grad,
      opsz: other.opsz,
      fill: other.fill,
    );
  }

  @override
  material.IconThemeData toLegacy() {
    return material.IconThemeData(
      color: color,
      size: size,
      weight: wght ?? weight?.value.toDouble(),
      grade: grad,
      opticalSize: opsz,
      fill: fill,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color, defaultValue: null));
    properties.add(DoubleProperty("size", size, defaultValue: null));
    String? weightDescription;
    if (weight case final weight?) {
      weightDescription = "${weight.index + 1}00";
    }
    properties.add(
      DiagnosticsProperty<FontWeight>(
        "weight",
        weight,
        description: weightDescription,
        defaultValue: null,
      ),
    );
    properties.add(DoubleProperty("wght", wght, defaultValue: null));
    properties.add(DoubleProperty("grad", grad, defaultValue: null));
    properties.add(DoubleProperty("opsz", opsz, defaultValue: null));
    properties.add(DoubleProperty("fill", fill, defaultValue: null));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is IconThemeDataPartial &&
            color == other.color &&
            size == other.size &&
            weight == other.weight &&
            wght == other.wght &&
            grad == other.grad &&
            opsz == other.opsz &&
            fill == other.fill;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, color, size, weight, wght, grad, opsz, fill);
}

class _IconThemeDataPartial with Diagnosticable, IconThemeDataPartialMixin {
  const _IconThemeDataPartial({
    this.color,
    this.size,
    this.weight,
    this.wght,
    this.grad,
    this.opsz,
    this.fill,
  });

  @override
  final Color? color;

  @override
  final double? size;

  @override
  final FontWeight? weight;

  @override
  final double? wght;

  @override
  final double? grad;

  @override
  final double? opsz;

  @override
  final double? fill;
}

class _IconThemeDataPartialFromLegacy
    with Diagnosticable, IconThemeDataPartialMixin {
  const _IconThemeDataPartialFromLegacy(material.IconThemeData iconTheme)
    : _icon = iconTheme;

  final material.IconThemeData _icon;

  @override
  Color? get color => _icon.color;

  @override
  double? get size => _icon.size;

  @override
  FontWeight? get weight => null;

  @override
  double? get wght => _icon.weight;

  @override
  double? get grad => _icon.grade;

  @override
  double? get opsz => _icon.opticalSize;

  @override
  double? get fill => _icon.fill;
}

abstract class IconThemeData
    with Diagnosticable
    implements IconThemeDataPartial {
  const factory IconThemeData({
    required Color color,
    required double size,
    required FontWeight weight,
    required double wght,
    required double grad,
    required double opsz,
    required double fill,
  }) = _IconThemeData;

  const factory IconThemeData.fallback({required ColorThemeData colorTheme}) =
      _IconThemeDataFallback;

  @override
  Color get color;

  @override
  double get size;

  @override
  FontWeight get weight;

  @override
  double get wght;

  @override
  double get grad;

  @override
  double get opsz;

  @override
  double get fill;

  @override
  IconThemeData copyWith({
    Color? color,
    double? size,
    FontWeight? weight,
    double? wght,
    double? grad,
    double? opsz,
    double? fill,
  });

  @override
  IconThemeData merge(IconThemeDataPartial? other);
}

mixin IconThemeDataMixin on Diagnosticable implements IconThemeData {
  @override
  IconThemeData copyWith({
    Color? color,
    double? size,
    FontWeight? weight,
    double? wght,
    double? grad,
    double? opsz,
    double? fill,
  }) {
    if (color == null &&
        size == null &&
        weight == null &&
        wght == null &&
        grad == null &&
        opsz == null &&
        fill == null) {
      return this;
    }
    return IconThemeData(
      color: color ?? this.color,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      wght: wght ?? this.wght,
      grad: grad ?? this.grad,
      opsz: opsz ?? this.opsz,
      fill: fill ?? this.fill,
    );
  }

  @override
  IconThemeData merge(IconThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      size: other.size,
      weight: other.weight,
      wght: other.wght,
      grad: other.grad,
      opsz: other.opsz,
      fill: other.fill,
    );
  }

  @override
  material.IconThemeData toLegacy() {
    return material.IconThemeData(
      color: color,
      size: size,
      weight: wght,
      grade: grad,
      opticalSize: opsz,
      fill: fill,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("color", color));
    properties.add(DoubleProperty("size", size));
    String? weightDescription = "${weight.index + 1}00";

    properties.add(
      DiagnosticsProperty<FontWeight>(
        "weight",
        weight,
        description: weightDescription,
      ),
    );
    properties.add(DoubleProperty("wght", wght));
    properties.add(DoubleProperty("grad", grad));
    properties.add(DoubleProperty("opsz", opsz));
    properties.add(DoubleProperty("fill", fill));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is IconThemeData &&
            color == other.color &&
            size == other.size &&
            weight == other.weight &&
            wght == other.wght &&
            grad == other.grad &&
            opsz == other.opsz &&
            fill == other.fill;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, color, size, weight, wght, grad, opsz, fill);
}

class _IconThemeData with Diagnosticable, IconThemeDataMixin {
  const _IconThemeData({
    required this.color,
    required this.size,
    required this.weight,
    required this.wght,
    required this.grad,
    required this.opsz,
    required this.fill,
  });

  @override
  final Color color;

  @override
  final double size;

  @override
  final FontWeight weight;

  @override
  final double wght;

  @override
  final double grad;

  @override
  final double opsz;

  @override
  final double fill;
}

class _IconThemeDataFallback with Diagnosticable, IconThemeDataMixin {
  const _IconThemeDataFallback({required ColorThemeData colorTheme})
    : _color = colorTheme;

  final ColorThemeData _color;

  @override
  Color get color => _color.onSurface;

  @override
  double get size => 24.0;

  @override
  FontWeight get weight => FontWeight.w400;

  @override
  double get wght => 400.0;

  @override
  double get grad => 0.0;

  @override
  double get opsz => 24.0;

  @override
  double get fill => 0.0;
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

  static Widget merge({
    Key? key,
    required IconThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        IconTheme(key: key, data: of(context).merge(data), child: child),
  );

  static IconThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IconTheme>()?.data;
  }

  static IconThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    return IconThemeData.fallback(colorTheme: ColorTheme.of(context));
  }

  static material.IconThemeData? maybeLegacyOf(BuildContext context) {
    return maybeOf(context)?.toLegacy();
  }

  static material.IconThemeData legacyOf(BuildContext context) {
    return of(context).toLegacy();
  }
}
