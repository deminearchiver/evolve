part of 'shape.dart';

abstract class ShapeThemeDataPartial with Diagnosticable {
  const factory ShapeThemeDataPartial({
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
  }) = _ShapeThemeDataPartial;

  Corner? get none;
  Corner? get extraSmall;
  Corner? get small;
  Corner? get medium;
  Corner? get large;
  Corner? get largeIncreased;
  Corner? get extraLarge;
  Corner? get extraLargeIncreased;
  Corner? get extraExtraLarge;
  Corner? get full;

  ShapeThemeDataPartial copyWith({
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

  ShapeThemeDataPartial merge(ShapeThemeDataPartial? other);
}

mixin ShapeThemeDataPartialMixin on Diagnosticable
    implements ShapeThemeDataPartial {
  @override
  ShapeThemeDataPartial copyWith({
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
    return ShapeThemeDataPartial(
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
  ShapeThemeDataPartial merge(ShapeThemeDataPartial? other) {
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
    properties.add(DiagnosticsProperty("none", none, defaultValue: null));
    properties.add(
      DiagnosticsProperty("extraSmall", extraSmall, defaultValue: null),
    );
    properties.add(DiagnosticsProperty("small", small, defaultValue: null));
    properties.add(DiagnosticsProperty("medium", medium, defaultValue: null));
    properties.add(DiagnosticsProperty("large", large, defaultValue: null));
    properties.add(
      DiagnosticsProperty("largeIncreased", largeIncreased, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty("extraLarge", extraLarge, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty(
        "extraLargeIncreased",
        extraLargeIncreased,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty(
        "extraExtraLarge",
        extraExtraLarge,
        defaultValue: null,
      ),
    );
    properties.add(DiagnosticsProperty("full", full, defaultValue: null));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ShapeThemeDataPartial &&
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

class _ShapeThemeDataPartial with Diagnosticable, ShapeThemeDataPartialMixin {
  const _ShapeThemeDataPartial({
    this.none,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    this.largeIncreased,
    this.extraLarge,
    this.extraLargeIncreased,
    this.extraExtraLarge,
    this.full,
  });

  @override
  final Corner? none;

  @override
  final Corner? extraSmall;

  @override
  final Corner? small;

  @override
  final Corner? medium;

  @override
  final Corner? large;

  @override
  final Corner? largeIncreased;

  @override
  final Corner? extraLarge;

  @override
  final Corner? extraLargeIncreased;

  @override
  final Corner? extraExtraLarge;

  @override
  final Corner? full;
}
