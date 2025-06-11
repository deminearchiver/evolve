part of 'motion.dart';

@immutable
abstract class EasingThemeDataPartial with Diagnosticable {
  const factory EasingThemeDataPartial({
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
  }) = _EasingThemeDataPartial;

  Curve? get linear;
  Curve? get emphasized;
  Curve? get emphasizedAccelerate;
  Curve? get emphasizedDecelerate;
  Curve? get standard;
  Curve? get standardAccelerate;
  Curve? get standardDecelerate;
  Curve? get legacy;
  Curve? get legacyAccelerate;
  Curve? get legacyDecelerate;

  EasingThemeDataPartial copyWith({
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

  EasingThemeDataPartial merge(EasingThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin EasingThemeDataPartialMixin on Diagnosticable
    implements EasingThemeDataPartial {
  @override
  EasingThemeDataPartial copyWith({
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
    return EasingThemeDataPartial(
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
  EasingThemeDataPartial merge(EasingThemeDataPartial? other) {
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
    properties.add(
      DiagnosticsProperty<Curve>("linear", linear, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Curve>("emphasized", emphasized, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "emphasizedAccelerate",
        emphasizedAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "emphasizedDecelerate",
        emphasizedDecelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>("standard", standard, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "standardAccelerate",
        standardAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "standardDecelerate",
        standardDecelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>("legacy", legacy, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "legacyAccelerate",
        legacyAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "legacyDecelerate",
        legacyDecelerate,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is EasingThemeDataPartial &&
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

@immutable
class _EasingThemeDataPartial with Diagnosticable, EasingThemeDataPartialMixin {
  const _EasingThemeDataPartial({
    this.linear,
    this.emphasized,
    this.emphasizedAccelerate,
    this.emphasizedDecelerate,
    this.standard,
    this.standardAccelerate,
    this.standardDecelerate,
    this.legacy,
    this.legacyAccelerate,
    this.legacyDecelerate,
  });

  @override
  final Curve? linear;

  @override
  final Curve? emphasized;

  @override
  final Curve? emphasizedAccelerate;

  @override
  final Curve? emphasizedDecelerate;

  @override
  final Curve? standard;

  @override
  final Curve? standardAccelerate;

  @override
  final Curve? standardDecelerate;

  @override
  final Curve? legacy;

  @override
  final Curve? legacyAccelerate;

  @override
  final Curve? legacyDecelerate;
}
