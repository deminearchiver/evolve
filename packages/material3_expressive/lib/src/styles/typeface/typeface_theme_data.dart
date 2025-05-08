part of 'typeface.dart';

@immutable
abstract class TypefaceThemeData
    with Diagnosticable
    implements TypefaceThemeDataPartial {
  const factory TypefaceThemeData({
    required List<String> plain,
    required List<String> brand,
    required double weightRegular,
    required double weightMedium,
    required double weightBold,
  }) = _TypefaceThemeData;

  const factory TypefaceThemeData.fallback() = _TypefaceThemeData.fallback;

  @override
  List<String> get plain;

  @override
  List<String> get brand;

  @override
  double get weightRegular;

  @override
  double get weightMedium;

  @override
  double get weightBold;

  @override
  TypefaceThemeData copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  });

  @override
  TypefaceThemeData apply({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  });

  @override
  TypefaceThemeData merge(TypefaceThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

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

mixin TypefaceThemeDataMixin on Diagnosticable implements TypefaceThemeData {
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
}

@immutable
class _TypefaceThemeData with Diagnosticable, TypefaceThemeDataMixin {
  const _TypefaceThemeData({
    required this.plain,
    required this.brand,
    required this.weightRegular,
    required this.weightMedium,
    required this.weightBold,
  });

  const _TypefaceThemeData.fallback()
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
}
