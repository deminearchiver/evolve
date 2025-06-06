part of 'spring.dart';

abstract class SpringThemeData
    with Diagnosticable
    implements SpringThemeDataPartial {
  const factory SpringThemeData({
    required Spring fastSpatial,
    required Spring fastEffects,
    required Spring defaultSpatial,
    required Spring defaultEffects,
    required Spring slowSpatial,
    required Spring slowEffects,
  }) = _SpringThemeData;

  const factory SpringThemeData.fallback() = _SpringThemeData.expressive;
  const factory SpringThemeData.standard() = _SpringThemeData.standard;
  const factory SpringThemeData.expressive() = _SpringThemeData.expressive;

  @override
  Spring get fastSpatial;

  @override
  Spring get fastEffects;

  @override
  Spring get defaultSpatial;

  @override
  Spring get defaultEffects;

  @override
  Spring get slowSpatial;

  @override
  Spring get slowEffects;

  @override
  SpringThemeData copyWith({
    covariant Spring? fastSpatial,
    covariant Spring? fastEffects,
    covariant Spring? defaultSpatial,
    covariant Spring? defaultEffects,
    covariant Spring? slowSpatial,
    covariant Spring? slowEffects,
  });

  @override
  SpringThemeData mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  });

  @override
  SpringThemeData merge(SpringThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin SpringThemeDataMixin on Diagnosticable implements SpringThemeData {
  @override
  SpringThemeData copyWith({
    Spring? fastSpatial,
    Spring? fastEffects,
    Spring? defaultSpatial,
    Spring? defaultEffects,
    Spring? slowSpatial,
    Spring? slowEffects,
  }) {
    if (fastSpatial == null &&
        fastEffects == null &&
        defaultSpatial == null &&
        defaultEffects == null &&
        slowSpatial == null &&
        slowEffects == null) {
      return this;
    }
    return SpringThemeData(
      fastSpatial: fastSpatial ?? this.fastSpatial,
      fastEffects: fastEffects ?? this.fastEffects,
      defaultSpatial: defaultSpatial ?? this.defaultSpatial,
      defaultEffects: defaultEffects ?? this.defaultEffects,
      slowSpatial: slowSpatial ?? this.slowSpatial,
      slowEffects: slowEffects ?? this.slowEffects,
    );
  }

  @override
  SpringThemeData mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) {
    if (fastSpatial == null &&
        fastEffects == null &&
        defaultSpatial == null &&
        defaultEffects == null &&
        slowSpatial == null &&
        slowEffects == null) {
      return this;
    }
    return SpringThemeData(
      fastSpatial: this.fastSpatial.merge(fastSpatial),
      fastEffects: this.fastEffects.merge(fastEffects),
      defaultSpatial: this.defaultSpatial.merge(defaultSpatial),
      defaultEffects: this.defaultEffects.merge(defaultEffects),
      slowSpatial: this.slowSpatial.merge(slowSpatial),
      slowEffects: this.slowEffects.merge(slowEffects),
    );
  }

  @override
  SpringThemeData merge(SpringThemeDataPartial? other) {
    if (other == null) return this;
    return mergeWith(
      fastSpatial: other.fastSpatial,
      fastEffects: other.fastEffects,
      defaultSpatial: other.defaultSpatial,
      defaultEffects: other.defaultEffects,
      slowSpatial: other.slowSpatial,
      slowEffects: other.slowEffects,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Spring>("fastSpatial", fastSpatial));
    properties.add(DiagnosticsProperty<Spring>("fastEffects", fastEffects));
    properties.add(
      DiagnosticsProperty<Spring>("defaultSpatial", defaultSpatial),
    );
    properties.add(
      DiagnosticsProperty<Spring>("defaultEffects", defaultEffects),
    );
    properties.add(DiagnosticsProperty<Spring>("slowSpatial", slowSpatial));
    properties.add(DiagnosticsProperty<Spring>("slowEffects", slowEffects));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpringThemeData &&
            runtimeType == other.runtimeType &&
            fastSpatial == other.fastSpatial &&
            fastEffects == other.fastEffects &&
            defaultSpatial == other.defaultSpatial &&
            defaultEffects == other.defaultEffects &&
            slowSpatial == other.slowSpatial &&
            slowEffects == other.slowEffects;
  }

  @override
  int get hashCode => Object.hash(
    fastSpatial,
    fastEffects,
    defaultSpatial,
    defaultEffects,
    slowSpatial,
    slowEffects,
  );
}

class _SpringThemeData with Diagnosticable, SpringThemeDataMixin {
  const _SpringThemeData({
    required this.fastSpatial,
    required this.fastEffects,
    required this.defaultSpatial,
    required this.defaultEffects,
    required this.slowSpatial,
    required this.slowEffects,
  });

  const _SpringThemeData.standard()
    : fastSpatial = const Spring(stiffness: 1400.0, damping: 0.9),
      fastEffects = const Spring(stiffness: 3800.0, damping: 1.0),
      defaultSpatial = const Spring(stiffness: 700.0, damping: 0.9),
      defaultEffects = const Spring(stiffness: 1600.0, damping: 1.0),
      slowSpatial = const Spring(stiffness: 300.0, damping: 0.9),
      slowEffects = const Spring(stiffness: 800.0, damping: 1.0);

  const _SpringThemeData.expressive()
    : fastSpatial = const Spring(stiffness: 800.0, damping: 0.6),
      fastEffects = const Spring(stiffness: 3800.0, damping: 1.0),
      defaultSpatial = const Spring(stiffness: 380.0, damping: 0.8),
      defaultEffects = const Spring(stiffness: 1600.0, damping: 1.0),
      slowSpatial = const Spring(stiffness: 200.0, damping: 0.8),
      slowEffects = const Spring(stiffness: 800.0, damping: 1.0);

  @override
  final Spring fastSpatial;

  @override
  final Spring fastEffects;

  @override
  final Spring defaultSpatial;

  @override
  final Spring defaultEffects;

  @override
  final Spring slowSpatial;

  @override
  final Spring slowEffects;
}
