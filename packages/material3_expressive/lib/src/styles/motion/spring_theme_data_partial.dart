part of 'spring.dart';

abstract class SpringThemeDataPartial with Diagnosticable {
  const factory SpringThemeDataPartial({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  }) = _SpringThemeDataPartial;

  SpringPartial? get fastSpatial;
  SpringPartial? get fastEffects;
  SpringPartial? get defaultSpatial;
  SpringPartial? get defaultEffects;
  SpringPartial? get slowSpatial;
  SpringPartial? get slowEffects;

  SpringThemeDataPartial copyWith({
    covariant SpringPartial? fastSpatial,
    covariant SpringPartial? fastEffects,
    covariant SpringPartial? defaultSpatial,
    covariant SpringPartial? defaultEffects,
    covariant SpringPartial? slowSpatial,
    covariant SpringPartial? slowEffects,
  });

  SpringThemeDataPartial mergeWith({
    SpringPartial? fastSpatial,
    SpringPartial? fastEffects,
    SpringPartial? defaultSpatial,
    SpringPartial? defaultEffects,
    SpringPartial? slowSpatial,
    SpringPartial? slowEffects,
  });

  SpringThemeDataPartial merge(SpringThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin SpringThemeDataPartialMixin on Diagnosticable
    implements SpringThemeDataPartial {
  @override
  SpringThemeDataPartial copyWith({
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
    return SpringThemeDataPartial(
      fastSpatial: fastSpatial ?? this.fastSpatial,
      fastEffects: fastEffects ?? this.fastEffects,
      defaultSpatial: defaultSpatial ?? this.defaultSpatial,
      defaultEffects: defaultEffects ?? this.defaultEffects,
      slowSpatial: slowSpatial ?? this.slowSpatial,
      slowEffects: slowEffects ?? this.slowEffects,
    );
  }

  @override
  SpringThemeDataPartial mergeWith({
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
    return SpringThemeDataPartial(
      fastSpatial: this.fastSpatial?.merge(fastSpatial) ?? fastSpatial,
      fastEffects: this.fastEffects?.merge(fastEffects) ?? fastEffects,
      defaultSpatial:
          this.defaultSpatial?.merge(defaultSpatial) ?? defaultSpatial,
      defaultEffects:
          this.defaultEffects?.merge(defaultEffects) ?? defaultEffects,
      slowSpatial: this.slowSpatial?.merge(slowSpatial) ?? slowSpatial,
      slowEffects: this.slowEffects?.merge(slowEffects) ?? slowEffects,
    );
  }

  @override
  SpringThemeDataPartial merge(SpringThemeDataPartial? other) {
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
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "fastSpatial",
        fastSpatial,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "fastEffects",
        fastEffects,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "defaultSpatial",
        defaultSpatial,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "defaultEffects",
        defaultEffects,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "slowSpatial",
        slowSpatial,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<SpringPartial>(
        "slowEffects",
        slowEffects,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpringThemeDataPartial &&
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

class _SpringThemeDataPartial with Diagnosticable, SpringThemeDataPartialMixin {
  const _SpringThemeDataPartial({
    this.fastSpatial,
    this.fastEffects,
    this.defaultSpatial,
    this.defaultEffects,
    this.slowSpatial,
    this.slowEffects,
  });

  @override
  final SpringPartial? fastSpatial;

  @override
  final SpringPartial? fastEffects;

  @override
  final SpringPartial? defaultSpatial;

  @override
  final SpringPartial? defaultEffects;

  @override
  final SpringPartial? slowSpatial;

  @override
  final SpringPartial? slowEffects;
}
