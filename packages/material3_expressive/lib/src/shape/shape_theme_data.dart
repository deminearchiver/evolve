part of 'shape.dart';

abstract class ShapeThemeData
    with Diagnosticable
    implements ShapeThemeDataPartial {
  const factory ShapeThemeData({
    required Corner none,
    required Corner extraSmall,
    required Corner small,
    required Corner medium,
    required Corner large,
    required Corner largeIncreased,
    required Corner extraLarge,
    required Corner extraLargeIncreased,
    required Corner extraExtraLarge,
    required Corner full,
  }) = _ShapeThemeData;

  const factory ShapeThemeData.fallback() = _ShapeThemeData.fallback;

  @override
  Corner get none;

  @override
  Corner get extraSmall;

  @override
  Corner get small;

  @override
  Corner get medium;

  @override
  Corner get large;

  @override
  Corner get largeIncreased;

  @override
  Corner get extraLarge;

  @override
  Corner get extraLargeIncreased;

  @override
  Corner get extraExtraLarge;

  @override
  Corner get full;

  @override
  ShapeThemeData copyWith({
    Corner? none,
    Corner? extraSmall,
    Corner? small,
    Corner? medium,
    Corner? large,
    Corner? largeIncreased,
    Corner? extraLarge,
    Corner? extraLargeIncreased,
    Corner? extraExtraLarge,
    Corner? full,
  });

  @override
  ShapeThemeData merge(ShapeThemeDataPartial? other);
}

mixin ShapeThemeDataMixin on Diagnosticable implements ShapeThemeData {
  @override
  ShapeThemeData copyWith({
    Corner? none,
    Corner? extraSmall,
    Corner? small,
    Corner? medium,
    Corner? large,
    Corner? largeIncreased,
    Corner? extraLarge,
    Corner? extraLargeIncreased,
    Corner? extraExtraLarge,
    Corner? full,
  }) {
    if (none == null &&
        extraSmall == null &&
        small == null &&
        medium == null &&
        large == null &&
        largeIncreased == null &&
        extraLarge == null &&
        extraLargeIncreased == null &&
        extraExtraLarge == null &&
        full == null) {
      return this;
    }
    return ShapeThemeData(
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      largeIncreased: largeIncreased ?? this.largeIncreased,
      extraLarge: extraLarge ?? this.extraLarge,
      extraLargeIncreased: extraLargeIncreased ?? this.extraLargeIncreased,
      extraExtraLarge: extraExtraLarge ?? this.extraExtraLarge,
      full: full ?? this.full,
    );
  }

  @override
  ShapeThemeData merge(ShapeThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      none: other.none,
      extraSmall: other.extraSmall,
      small: other.small,
      medium: other.medium,
      large: other.large,
      largeIncreased: other.largeIncreased,
      extraLarge: other.extraLarge,
      extraLargeIncreased: other.extraLargeIncreased,
      extraExtraLarge: other.extraExtraLarge,
      full: other.full,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("none", none));
    properties.add(DiagnosticsProperty("extraSmall", extraSmall));
    properties.add(DiagnosticsProperty("small", small));
    properties.add(DiagnosticsProperty("medium", medium));
    properties.add(DiagnosticsProperty("large", large));
    properties.add(DiagnosticsProperty("largeIncreased", largeIncreased));
    properties.add(DiagnosticsProperty("extraLarge", extraLarge));
    properties.add(
      DiagnosticsProperty("extraLargeIncreased", extraLargeIncreased),
    );
    properties.add(DiagnosticsProperty("extraExtraLarge", extraExtraLarge));
    properties.add(DiagnosticsProperty("full", full));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ShapeThemeData &&
            none == other.none &&
            extraSmall == other.extraSmall &&
            small == other.small &&
            medium == other.medium &&
            large == other.large &&
            largeIncreased == other.largeIncreased &&
            extraLarge == other.extraLarge &&
            extraLargeIncreased == other.extraLargeIncreased &&
            extraExtraLarge == other.extraExtraLarge &&
            full == other.full;
  }

  @override
  int get hashCode => Object.hash(
    none,
    extraSmall,
    small,
    medium,
    large,
    largeIncreased,
    extraLarge,
    extraLargeIncreased,
    extraExtraLarge,
    full,
  );
}

class _ShapeThemeData with Diagnosticable, ShapeThemeDataMixin {
  const _ShapeThemeData({
    required this.none,
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.largeIncreased,
    required this.extraLarge,
    required this.extraLargeIncreased,
    required this.extraExtraLarge,
    required this.full,
  });

  const _ShapeThemeData.fallback()
    : none = Corner.none,
      extraSmall = const Corner.circular(4.0),
      small = const Corner.circular(8.0),
      medium = const Corner.circular(12.0),
      large = const Corner.circular(16.0),
      largeIncreased = const Corner.circular(20.0),
      extraLarge = const Corner.circular(28.0),
      extraLargeIncreased = const Corner.circular(32.0),
      extraExtraLarge = const Corner.circular(48.0),
      full = Corner.full;

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
  final Corner largeIncreased;

  @override
  final Corner extraLarge;

  @override
  final Corner extraLargeIncreased;

  @override
  final Corner extraExtraLarge;

  @override
  final Corner full;
}
