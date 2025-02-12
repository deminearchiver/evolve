import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class TypefaceThemeData with Diagnosticable {
  const TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weightRegular,
    required this.weightMedium,
    required this.weightBold,
  });

  const TypefaceThemeData.fallback()
    : plain = "Roboto",
      brand = "Roboto",
      weightRegular = 400,
      weightMedium = 500,
      weightBold = 700;

  final String plain;
  final String brand;

  final double weightRegular;
  final double weightMedium;
  final double weightBold;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("plain", plain));
    properties.add(StringProperty("brand", brand));
    properties.add(DoubleProperty("weightRegular", weightRegular));
    properties.add(DoubleProperty("weightMedium", weightMedium));
    properties.add(DoubleProperty("weightBold", weightBold));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypefaceThemeData &&
            plain == other.plain &&
            brand == other.brand &&
            weightRegular == other.weightRegular &&
            weightMedium == other.weightMedium &&
            weightBold == other.weightBold;
  }

  @override
  int get hashCode =>
      Object.hash(plain, brand, weightRegular, weightMedium, weightBold);
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

  // static Widget merge()

  static TypefaceThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypefaceTheme>()?.data ??
        const TypefaceThemeData.fallback();
  }
}
