import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypefaceThemeDataPartial with Diagnosticable {
  const TypefaceThemeDataPartial({
    this.plain,
    this.brand,
    this.weightRegular,
    this.weightMedium,
    this.weightBold,
  });

  final List<String>? plain;
  final List<String>? brand;
  final double? weightRegular;
  final double? weightMedium;
  final double? weightBold;

  TypefaceThemeDataPartial copyWith({
    covariant List<String>? plain,
    covariant List<String>? brand,
    covariant double? weightRegular,
    covariant double? weightMedium,
    covariant double? weightBold,
  }) {
    if (plain == null &&
        brand == null &&
        weightRegular == null &&
        weightMedium == null &&
        weightBold == null) {
      return this;
    }
    return TypefaceThemeDataPartial(
      plain: plain ?? this.plain,
      brand: brand ?? this.brand,
      weightRegular: weightRegular ?? this.weightRegular,
      weightMedium: weightMedium ?? this.weightMedium,
      weightBold: weightBold ?? this.weightBold,
    );
  }

  TypefaceThemeDataPartial apply({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) {
    if (plain == null &&
        brand == null &&
        weightRegular == null &&
        weightMedium == null &&
        weightBold == null) {
      return this;
    }
    return TypefaceThemeDataPartial(
      plain: plain != null ? [...plain, ...?this.plain] : this.plain,
      brand: brand != null ? [...brand, ...?this.brand] : this.brand,
      weightRegular: weightRegular ?? this.weightRegular,
      weightMedium: weightMedium ?? this.weightMedium,
      weightBold: weightBold ?? this.weightBold,
    );
  }

  TypefaceThemeDataPartial merge(TypefaceThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      plain: other.plain,
      brand: other.brand,
      weightRegular: other.weightRegular,
      weightMedium: other.weightMedium,
      weightBold: other.weightBold,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<List<String>>("plain", plain, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<List<String>>("brand", brand, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<double>(
        "weightRegular",
        weightRegular,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>(
        "weightMedium",
        weightMedium,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<double>("weightBold", weightBold, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypefaceThemeDataPartial &&
            listEquals(plain, other.plain) &&
            listEquals(brand, other.brand) &&
            weightRegular == other.weightRegular &&
            weightMedium == other.weightMedium &&
            weightBold == other.weightBold;
  }

  @override
  int get hashCode => Object.hash(
    plain != null ? Object.hashAll(plain!) : null,
    brand != null ? Object.hashAll(brand!) : null,
    weightRegular,
    weightMedium,
    weightBold,
  );

  static TypefaceThemeDataPartial? lerp(
    TypefaceThemeDataPartial? a,
    TypefaceThemeDataPartial? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return TypefaceThemeDataPartial(
      plain: t < 0.5 ? a?.plain : b?.plain,
      brand: t < 0.5 ? a?.brand : b?.brand,
      weightRegular: lerpDouble(a?.weightRegular, b?.weightRegular, t),
      weightMedium: lerpDouble(a?.weightMedium, b?.weightMedium, t),
      weightBold: lerpDouble(a?.weightBold, b?.weightBold, t),
    );
  }
}

class TypefaceThemeData
    with Diagnosticable
    implements TypefaceThemeDataPartial {
  const TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weightRegular,
    required this.weightMedium,
    required this.weightBold,
  });

  const TypefaceThemeData.fallback()
    : plain = const ["Roboto"],
      brand = const ["Roboto"],
      weightRegular = 400,
      weightMedium = 500,
      weightBold = 700;

  @override
  final List<String> plain;

  @override
  final List<String> brand;

  @override
  final double weightRegular;

  @override
  final double weightMedium;

  @override
  final double weightBold;

  @override
  TypefaceThemeData copyWith({
    covariant List<String>? plain,
    covariant List<String>? brand,
    covariant double? weightRegular,
    covariant double? weightMedium,
    covariant double? weightBold,
  }) {
    if (plain == null &&
        brand == null &&
        weightRegular == null &&
        weightMedium == null &&
        weightBold == null) {
      return this;
    }
    return TypefaceThemeData(
      plain: plain ?? this.plain,
      brand: brand ?? this.brand,
      weightRegular: weightRegular ?? this.weightRegular,
      weightMedium: weightMedium ?? this.weightMedium,
      weightBold: weightBold ?? this.weightBold,
    );
  }

  @override
  TypefaceThemeData apply({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) {
    if (plain == null &&
        brand == null &&
        weightRegular == null &&
        weightMedium == null &&
        weightBold == null) {
      return this;
    }
    return TypefaceThemeData(
      plain: plain != null ? [...plain, ...this.plain] : this.plain,
      brand: brand != null ? [...brand, ...this.brand] : this.brand,
      weightRegular: weightRegular ?? this.weightRegular,
      weightMedium: weightMedium ?? this.weightMedium,
      weightBold: weightBold ?? this.weightBold,
    );
  }

  @override
  TypefaceThemeData merge(TypefaceThemeDataPartial? other) {
    if (other == null) return this;
    return apply(
      plain: other.plain,
      brand: other.brand,
      weightRegular: other.weightRegular,
      weightMedium: other.weightMedium,
      weightBold: other.weightBold,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<List<String>>("plain", plain));
    properties.add(DiagnosticsProperty<List<String>>("brand", brand));
    properties.add(DiagnosticsProperty<double>("weightRegular", weightRegular));
    properties.add(DiagnosticsProperty<double>("weightMedium", weightMedium));
    properties.add(DiagnosticsProperty<double>("weightBold", weightBold));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TypefaceThemeData &&
            listEquals(plain, other.plain) &&
            listEquals(brand, other.brand) &&
            weightRegular == other.weightRegular &&
            weightMedium == other.weightMedium &&
            weightBold == other.weightBold;
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(plain),
    Object.hashAll(brand),
    weightRegular,
    weightMedium,
    weightBold,
  );

  static TypefaceThemeData lerp(
    TypefaceThemeData a,
    TypefaceThemeData b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return TypefaceThemeData(
      plain: t < 0.5 ? a.plain : b.plain,
      brand: t < 0.5 ? a.brand : b.brand,
      weightRegular: lerpDouble(a.weightRegular, b.weightRegular, t)!,
      weightMedium: lerpDouble(a.weightMedium, b.weightMedium, t)!,
      weightBold: lerpDouble(a.weightBold, b.weightBold, t)!,
    );
  }
}

class TypefaceTheme extends InheritedTheme {
  const TypefaceTheme({super.key, required this.data, required super.child});

  final TypefaceThemeData data;

  @override
  bool updateShouldNotify(covariant TypefaceTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TypefaceTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypefaceThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required TypefaceThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        TypefaceTheme(key: key, data: of(context).merge(data), child: child),
  );

  static TypefaceThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypefaceTheme>()?.data;
  }

  static TypefaceThemeData of(BuildContext context) {
    return maybeOf(context) ?? const TypefaceThemeData.fallback();
  }
}
