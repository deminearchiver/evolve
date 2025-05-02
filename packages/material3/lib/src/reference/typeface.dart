import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypefaceWeightThemeDataPartial with Diagnosticable {
  const TypefaceWeightThemeDataPartial({this.regular, this.medium, this.bold});

  final double? regular;
  final double? medium;
  final double? bold;

  TypefaceWeightThemeDataPartial copyWith({
    covariant double? regular,
    covariant double? medium,
    covariant double? bold,
  }) {
    if (regular == null && medium == null && bold == null) {
      return this;
    }
    return TypefaceWeightThemeDataPartial(
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      bold: bold ?? this.bold,
    );
  }

  TypefaceWeightThemeDataPartial merge(TypefaceWeightThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      regular: other.regular,
      medium: other.medium,
      bold: other.bold,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypefaceWeightThemeDataPartial &&
            regular == other.regular &&
            medium == other.medium &&
            bold == other.bold;
  }

  @override
  int get hashCode => Object.hash(regular, medium, bold);
}

class TypefaceWeightThemeData
    with Diagnosticable
    implements TypefaceWeightThemeDataPartial {
  const TypefaceWeightThemeData({
    required this.regular,
    required this.medium,
    required this.bold,
  });

  const TypefaceWeightThemeData.fallback()
    : regular = 400,
      medium = 500,
      bold = 700;

  @override
  final double regular;

  @override
  final double medium;

  @override
  final double bold;

  @override
  TypefaceWeightThemeData copyWith({
    covariant double? regular,
    covariant double? medium,
    covariant double? bold,
  }) {
    if (regular == null && medium == null && bold == null) {
      return this;
    }
    return TypefaceWeightThemeData(
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      bold: bold ?? this.bold,
    );
  }

  @override
  TypefaceWeightThemeData merge(TypefaceWeightThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      regular: other.regular,
      medium: other.medium,
      bold: other.bold,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypefaceWeightThemeData &&
            regular == other.regular &&
            medium == other.medium &&
            bold == other.bold;
  }

  @override
  int get hashCode => Object.hash(regular, medium, bold);
}

class TypefaceThemeDataPartial with Diagnosticable {
  const TypefaceThemeDataPartial({this.plain, this.brand, this.weight});

  final List<String>? plain;

  final List<String>? brand;

  final TypefaceWeightThemeDataPartial? weight;

  TypefaceThemeDataPartial copyWith({
    covariant List<String>? plain,
    covariant List<String>? brand,
    covariant TypefaceWeightThemeDataPartial? weight,
  }) {
    if (plain == null && brand == null && weight == null) {
      return this;
    }
    return TypefaceThemeDataPartial(
      plain: plain ?? this.plain,
      brand: brand ?? this.brand,
      weight: weight ?? this.weight,
    );
  }

  TypefaceThemeDataPartial apply({
    List<String>? plain,
    List<String>? brand,
    TypefaceWeightThemeDataPartial? weight,
  }) {
    if (plain == null && brand == null && weight == null) {
      return this;
    }
    return TypefaceThemeDataPartial(
      plain: plain != null ? [...plain, ...?this.plain] : this.plain,
      brand: brand != null ? [...brand, ...?this.brand] : this.brand,
      weight: this.weight?.merge(weight) ?? weight,
    );
  }

  TypefaceThemeDataPartial merge(TypefaceThemeDataPartial? other) {
    if (other == null) return this;
    return apply(plain: other.plain, brand: other.brand, weight: other.weight);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypefaceThemeDataPartial &&
            listEquals(plain, other.plain) &&
            listEquals(brand, other.brand) &&
            weight == other.weight;
  }

  @override
  int get hashCode => Object.hash(
    plain != null ? Object.hashAll(plain!) : null,
    brand != null ? Object.hashAll(brand!) : null,
    weight,
  );
}

class TypefaceThemeData
    with Diagnosticable
    implements TypefaceThemeDataPartial {
  const TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weight,
  });

  const TypefaceThemeData.fallback()
    : plain = const ["Roboto"],
      brand = const ["Roboto"],
      weight = const TypefaceWeightThemeData.fallback();

  @override
  final List<String> plain;

  @override
  final List<String> brand;

  @override
  final TypefaceWeightThemeData weight;

  @override
  TypefaceThemeData copyWith({
    covariant List<String>? plain,
    covariant List<String>? brand,
    covariant TypefaceWeightThemeData? weight,
  }) {
    if (plain == null && brand == null && weight == null) {
      return this;
    }
    return TypefaceThemeData(
      plain: plain ?? this.plain,
      brand: brand ?? this.brand,
      weight: weight ?? this.weight,
    );
  }

  @override
  TypefaceThemeData apply({
    List<String>? plain,
    List<String>? brand,
    TypefaceWeightThemeDataPartial? weight,
  }) {
    if (plain == null && brand == null && weight == null) {
      return this;
    }
    return TypefaceThemeData(
      plain: plain != null ? [...plain, ...this.plain] : this.plain,
      brand: brand != null ? [...brand, ...this.brand] : this.brand,
      weight: this.weight.merge(weight),
    );
  }

  @override
  TypefaceThemeData merge(TypefaceThemeDataPartial? other) {
    if (other == null) return this;
    return apply(plain: other.plain, brand: other.brand, weight: other.weight);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TypefaceThemeData &&
            listEquals(plain, other.plain) &&
            listEquals(brand, other.brand) &&
            weight == other.weight;
  }

  @override
  int get hashCode =>
      Object.hash(Object.hashAll(plain), Object.hashAll(brand), weight);
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

  static Widget merge({
    Key? key,
    required TypefaceThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder: (context) =>
          TypefaceTheme(key: key, data: of(context).merge(data), child: child),
    );
  }

  static TypefaceThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypefaceTheme>()?.data;
  }

  static TypefaceThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    final textTheme = TextTheme.of(context);
    final brandTextStyle = textTheme._textStylesWithBrandTypeface
        .firstWhereOrNull(
          (textStyle) =>
              textStyle?.fontFamily != null ||
              textStyle?.fontFamilyFallback != null,
        );
    final plainTextStyle = textTheme._textStylesWithPlainTypeface.reversed
        .firstWhereOrNull(
          (textStyle) =>
              textStyle?.fontFamily != null ||
              textStyle?.fontFamilyFallback != null,
        );

    final brandFont = [
      if (brandTextStyle?.fontFamily case final fontFamily?) fontFamily,
      if (brandTextStyle?.fontFamilyFallback case final fontFamilyFallback?)
        ...fontFamilyFallback,
    ];
    final plainFont = [
      if (plainTextStyle?.fontFamily case final fontFamily?) fontFamily,
      if (plainTextStyle?.fontFamilyFallback case final fontFamilyFallback?)
        ...fontFamilyFallback,
    ];
    return const TypefaceThemeData.fallback().apply(
      plain: plainFont,
      brand: brandFont,
    );
  }
}

extension on TextTheme {
  List<TextStyle?> get _textStylesWithBrandTypeface => <TextStyle?>[
    displayLarge,
    displayMedium,
    displaySmall,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    titleLarge,
  ];
  List<TextStyle?> get _textStylesWithPlainTypeface => <TextStyle?>[
    titleMedium,
    titleSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    labelLarge,
    labelMedium,
    labelSmall,
  ];
}
