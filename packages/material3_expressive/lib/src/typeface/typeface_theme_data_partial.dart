part of 'typeface.dart';

abstract class TypefaceThemeDataPartial with Diagnosticable {
  const factory TypefaceThemeDataPartial({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  }) = _TypefaceThemeDataPartial;

  List<String>? get plain;
  List<String>? get brand;
  double? get weightRegular;
  double? get weightMedium;
  double? get weightBold;

  TypefaceThemeDataPartial copyWith({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  });

  TypefaceThemeDataPartial apply({
    List<String>? plain,
    List<String>? brand,
    double? weightRegular,
    double? weightMedium,
    double? weightBold,
  });

  TypefaceThemeDataPartial merge(TypefaceThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

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

mixin TypefaceThemeDataPartialMixin on Diagnosticable
    implements TypefaceThemeDataPartial {
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
}

class _TypefaceThemeDataPartial
    with Diagnosticable, TypefaceThemeDataPartialMixin {
  const _TypefaceThemeDataPartial({
    this.plain,
    this.brand,
    this.weightRegular,
    this.weightMedium,
    this.weightBold,
  });

  @override
  final List<String>? plain;

  @override
  final List<String>? brand;

  @override
  final double? weightRegular;

  @override
  final double? weightMedium;

  @override
  final double? weightBold;
}
