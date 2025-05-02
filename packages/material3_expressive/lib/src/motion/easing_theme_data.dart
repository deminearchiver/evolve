part of 'motion.dart';

abstract class EasingThemeData
    with Diagnosticable
    implements EasingThemeDataPartial {
  const factory EasingThemeData({
    required Curve linear,
    required Curve emphasized,
    required Curve emphasizedAccelerate,
    required Curve emphasizedDecelerate,
    required Curve standard,
    required Curve standardAccelerate,
    required Curve standardDecelerate,
    required Curve legacy,
    required Curve legacyAccelerate,
    required Curve legacyDecelerate,
  }) = _EasingThemeData;

  const factory EasingThemeData.fallback() = _EasingThemeData.fallback;

  @override
  Curve get linear;

  @override
  Curve get emphasized;

  @override
  Curve get emphasizedAccelerate;

  @override
  Curve get emphasizedDecelerate;

  @override
  Curve get standard;

  @override
  Curve get standardAccelerate;

  @override
  Curve get standardDecelerate;

  @override
  Curve get legacy;

  @override
  Curve get legacyAccelerate;

  @override
  Curve get legacyDecelerate;

  @override
  EasingThemeData copyWith({
    Curve? linear,
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
  });

  @override
  EasingThemeData merge(EasingThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin EasingThemeDataMixin on Diagnosticable implements EasingThemeData {
  @override
  EasingThemeData copyWith({
    Curve? linear,
    Curve? emphasized,
    Curve? emphasizedAccelerate,
    Curve? emphasizedDecelerate,
    Curve? standard,
    Curve? standardAccelerate,
    Curve? standardDecelerate,
    Curve? legacy,
    Curve? legacyAccelerate,
    Curve? legacyDecelerate,
  }) {
    if (linear == null &&
        emphasized == null &&
        emphasizedAccelerate == null &&
        emphasizedDecelerate == null &&
        standard == null &&
        standardAccelerate == null &&
        standardDecelerate == null &&
        legacy == null &&
        legacyAccelerate == null &&
        legacyDecelerate == null) {
      return this;
    }
    return EasingThemeData(
      linear: linear ?? this.linear,
      emphasized: emphasized ?? this.emphasized,
      emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
      emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
      standard: standard ?? this.standard,
      standardAccelerate: standardAccelerate ?? this.standardAccelerate,
      standardDecelerate: standardDecelerate ?? this.standardDecelerate,
      legacy: legacy ?? this.legacy,
      legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
      legacyDecelerate: legacyDecelerate ?? this.legacyDecelerate,
    );
  }

  @override
  EasingThemeData merge(EasingThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      linear: other.linear,
      emphasized: other.emphasized,
      emphasizedAccelerate: other.emphasizedAccelerate,
      emphasizedDecelerate: other.emphasizedDecelerate,
      standard: other.standard,
      standardAccelerate: other.standardAccelerate,
      standardDecelerate: other.standardDecelerate,
      legacy: other.legacy,
      legacyAccelerate: other.legacyAccelerate,
      legacyDecelerate: other.legacyDecelerate,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Curve>("linear", linear));
    properties.add(DiagnosticsProperty<Curve>("emphasized", emphasized));
    properties.add(
      DiagnosticsProperty<Curve>("emphasizedAccelerate", emphasizedAccelerate),
    );
    properties.add(
      DiagnosticsProperty<Curve>("emphasizedDecelerate", emphasizedDecelerate),
    );
    properties.add(DiagnosticsProperty<Curve>("standard", standard));
    properties.add(
      DiagnosticsProperty<Curve>("standardAccelerate", standardAccelerate),
    );
    properties.add(
      DiagnosticsProperty<Curve>("standardDecelerate", standardDecelerate),
    );
    properties.add(DiagnosticsProperty<Curve>("legacy", legacy));
    properties.add(
      DiagnosticsProperty<Curve>("legacyAccelerate", legacyAccelerate),
    );
    properties.add(
      DiagnosticsProperty<Curve>("legacyDecelerate", legacyDecelerate),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is EasingThemeData &&
            linear == other.linear &&
            emphasized == other.emphasized &&
            emphasizedAccelerate == other.emphasizedAccelerate &&
            emphasizedDecelerate == other.emphasizedDecelerate &&
            standard == other.standard &&
            standardAccelerate == other.standardAccelerate &&
            standardDecelerate == other.standardDecelerate &&
            legacy == other.legacy &&
            legacyAccelerate == other.legacyAccelerate &&
            legacyDecelerate == other.legacyDecelerate;
  }

  @override
  int get hashCode => Object.hash(
    linear,
    emphasized,
    emphasizedAccelerate,
    emphasizedDecelerate,
    standard,
    standardAccelerate,
    standardDecelerate,
    legacy,
    legacyAccelerate,
    legacyDecelerate,
  );
}

class _Linear extends Curve {
  const _Linear();

  @override
  double transformInternal(double t) => t;
}

class _EasingThemeData with Diagnosticable, EasingThemeDataMixin {
  const _EasingThemeData({
    required this.linear,
    required this.emphasized,
    required this.emphasizedAccelerate,
    required this.emphasizedDecelerate,
    required this.standard,
    required this.standardAccelerate,
    required this.standardDecelerate,
    required this.legacy,
    required this.legacyAccelerate,
    required this.legacyDecelerate,
  });

  const _EasingThemeData.fallback()
    : linear = const _Linear(),
      emphasized = const ThreePointCubic(
        Offset(0.05, 0),
        Offset(0.133333, 0.06),
        Offset(0.166666, 0.4),
        Offset(0.208333, 0.82),
        Offset(0.25, 1),
      ),
      emphasizedAccelerate = const Cubic(0.3, 0.0, 0.8, 0.15),
      emphasizedDecelerate = const Cubic(0.05, 0.7, 0.1, 1.0),
      standard = const Cubic(0.2, 0.0, 0.0, 1.0),
      standardAccelerate = const Cubic(0.3, 0.0, 1.0, 1.0),
      standardDecelerate = const Cubic(0.0, 0.0, 0.0, 1.0),
      legacy = const Cubic(0.4, 0.0, 0.2, 1.0),
      legacyAccelerate = const Cubic(0.4, 0.0, 1.0, 1.0),
      legacyDecelerate = const Cubic(0.0, 0.0, 0.2, 1.0);

  @override
  final Curve linear;

  @override
  final Curve emphasized;

  @override
  final Curve emphasizedAccelerate;

  @override
  final Curve emphasizedDecelerate;

  @override
  final Curve standard;

  @override
  final Curve standardAccelerate;

  @override
  final Curve standardDecelerate;

  @override
  final Curve legacy;

  @override
  final Curve legacyAccelerate;

  @override
  final Curve legacyDecelerate;
}
