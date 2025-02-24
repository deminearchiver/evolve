import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:meta/meta.dart';

// Overoptimized version for the md-sys-motion-easing-linear curve,
// should be preferred over Cubic(0.0, 0.0, 0.0, 0.0).
class _Linear extends Curve {
  const _Linear._();

  @override
  double transformInternal(double t) => t;

  @override
  String toString() {
    return objectRuntimeType(this, "Linear");
  }
}

// Extracted from the [Curves] class to be kept in sync with M3 guidelines,
// until Flutter receives support for this easing type in the [Easings] class,
// something like [Easings.emphasized].
const Curve _easingEmphasized = ThreePointCubic(
  Offset(0.05, 0),
  Offset(0.133333, 0.06),
  Offset(0.166666, 0.4),
  Offset(0.208333, 0.82),
  Offset(0.25, 1),
);

@experimental
@immutable
class MotionEasingThemeDataPartial with Diagnosticable {
  const MotionEasingThemeDataPartial({
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

  final Curve? linear;
  final Curve? emphasized;
  final Curve? emphasizedAccelerate;
  final Curve? emphasizedDecelerate;
  final Curve? standard;
  final Curve? standardAccelerate;
  final Curve? standardDecelerate;
  final Curve? legacy;
  final Curve? legacyAccelerate;
  final Curve? legacyDecelerate;

  MotionEasingThemeDataPartial copyWith({
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
    return MotionEasingThemeDataPartial(
      linear: linear ?? this.linear,
      emphasized: emphasized ?? this.emphasized,
      emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
      emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
      standard: standard ?? this.standard,
      standardAccelerate: standardAccelerate ?? this.standardAccelerate,
      standardDecelerate: standardDecelerate ?? this.standardDecelerate,
      legacy: legacy ?? this.legacy,
      legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
      legacyDecelerate: legacyDecelerate ?? this.linear,
    );
  }

  MotionEasingThemeDataPartial merge(MotionEasingThemeDataPartial? other) {
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
        other is MotionEasingThemeDataPartial &&
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

@experimental
@immutable
class MotionEasingThemeData
    with Diagnosticable
    implements MotionEasingThemeDataPartial {
  const MotionEasingThemeData({
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

  const MotionEasingThemeData.fallback()
    : linear = const _Linear._(),
      emphasized = _easingEmphasized,
      emphasizedAccelerate = Easing.emphasizedAccelerate,
      emphasizedDecelerate = Easing.emphasizedDecelerate,
      standard = Easing.standard,
      standardAccelerate = Easing.standardAccelerate,
      standardDecelerate = Easing.standardDecelerate,
      legacy = Easing.legacy,
      legacyAccelerate = Easing.legacyAccelerate,
      legacyDecelerate = Easing.legacyDecelerate;

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

  @override
  MotionEasingThemeData copyWith({
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
    return MotionEasingThemeData(
      linear: linear ?? this.linear,
      emphasized: emphasized ?? this.emphasized,
      emphasizedAccelerate: emphasizedAccelerate ?? this.emphasizedAccelerate,
      emphasizedDecelerate: emphasizedDecelerate ?? this.emphasizedDecelerate,
      standard: standard ?? this.standard,
      standardAccelerate: standardAccelerate ?? this.standardAccelerate,
      standardDecelerate: standardDecelerate ?? this.standardDecelerate,
      legacy: legacy ?? this.legacy,
      legacyAccelerate: legacyAccelerate ?? this.legacyAccelerate,
      legacyDecelerate: legacyDecelerate ?? this.linear,
    );
  }

  @override
  MotionEasingThemeData merge(MotionEasingThemeDataPartial? other) {
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
        other is MotionEasingThemeData &&
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

@experimental
@immutable
class MotionDurationThemeDataPartial with Diagnosticable {
  const MotionDurationThemeDataPartial({
    this.short1,
    this.short2,
    this.short3,
    this.short4,
    this.medium1,
    this.medium2,
    this.medium3,
    this.medium4,
    this.long1,
    this.long2,
    this.long3,
    this.long4,
    this.extraLong1,
    this.extraLong2,
    this.extraLong3,
    this.extraLong4,
  });

  final Duration? short1;
  final Duration? short2;
  final Duration? short3;
  final Duration? short4;
  final Duration? medium1;
  final Duration? medium2;
  final Duration? medium3;
  final Duration? medium4;
  final Duration? long1;
  final Duration? long2;
  final Duration? long3;
  final Duration? long4;
  final Duration? extraLong1;
  final Duration? extraLong2;
  final Duration? extraLong3;
  final Duration? extraLong4;

  MotionDurationThemeDataPartial copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) {
    if (short1 == null &&
        short2 == null &&
        short3 == null &&
        short4 == null &&
        medium1 == null &&
        medium2 == null &&
        medium3 == null &&
        medium4 == null &&
        long1 == null &&
        long2 == null &&
        long3 == null &&
        long4 == null &&
        extraLong1 == null &&
        extraLong2 == null &&
        extraLong3 == null &&
        extraLong4 == null) {
      return this;
    }
    return MotionDurationThemeDataPartial(
      short1: short1 ?? this.short1,
      short2: short2 ?? this.short2,
      short3: short3 ?? this.short3,
      short4: short4 ?? this.short4,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      medium3: medium3 ?? this.medium3,
      medium4: medium4 ?? this.medium4,
      long1: long1 ?? this.long1,
      long2: long2 ?? this.long2,
      long3: long3 ?? this.long3,
      long4: long4 ?? this.long4,
      extraLong1: extraLong1 ?? this.extraLong1,
      extraLong2: extraLong2 ?? this.extraLong2,
      extraLong3: extraLong3 ?? this.extraLong3,
      extraLong4: extraLong4 ?? this.extraLong4,
    );
  }

  MotionDurationThemeDataPartial merge(MotionDurationThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      short1: other.short1,
      short2: other.short2,
      short3: other.short3,
      short4: other.short4,
      medium1: other.medium1,
      medium2: other.medium2,
      medium3: other.medium3,
      medium4: other.medium4,
      long1: other.long1,
      long2: other.long2,
      long3: other.long3,
      long4: other.long4,
      extraLong1: other.extraLong1,
      extraLong2: other.extraLong2,
      extraLong3: other.extraLong3,
      extraLong4: other.extraLong4,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Duration>("short1", short1, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("short2", short2, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("short3", short3, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("short4", short4, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("medium1", medium1, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("medium2", medium2, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("medium3", medium3, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("medium4", medium4, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("long1", long1, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("long2", long2, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("long3", long3, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>("long4", long4, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        "extraLong1",
        extraLong1,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        "extraLong2",
        extraLong2,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        "extraLong3",
        extraLong3,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        "extraLong4",
        extraLong4,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionDurationThemeDataPartial &&
            short1 == other.short1 &&
            short2 == other.short2 &&
            short3 == other.short3 &&
            short4 == other.short4 &&
            medium1 == other.medium1 &&
            medium2 == other.medium2 &&
            medium3 == other.medium3 &&
            medium4 == other.medium4 &&
            long1 == other.long1 &&
            long2 == other.long2 &&
            long3 == other.long3 &&
            long4 == other.long4 &&
            extraLong1 == other.extraLong1 &&
            extraLong2 == other.extraLong2 &&
            extraLong3 == other.extraLong3 &&
            extraLong4 == other.extraLong4;
  }

  @override
  int get hashCode => Object.hash(
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

@experimental
@immutable
class MotionDurationThemeData
    with Diagnosticable
    implements MotionDurationThemeDataPartial {
  const MotionDurationThemeData({
    required this.short1,
    required this.short2,
    required this.short3,
    required this.short4,
    required this.medium1,
    required this.medium2,
    required this.medium3,
    required this.medium4,
    required this.long1,
    required this.long2,
    required this.long3,
    required this.long4,
    required this.extraLong1,
    required this.extraLong2,
    required this.extraLong3,
    required this.extraLong4,
  });

  const MotionDurationThemeData.fallback()
    : short1 = Durations.short1,
      short2 = Durations.short2,
      short3 = Durations.short3,
      short4 = Durations.short4,
      medium1 = Durations.medium1,
      medium2 = Durations.medium2,
      medium3 = Durations.medium3,
      medium4 = Durations.medium4,
      long1 = Durations.long1,
      long2 = Durations.long2,
      long3 = Durations.long3,
      long4 = Durations.long4,
      extraLong1 = Durations.extralong1,
      extraLong2 = Durations.extralong2,
      extraLong3 = Durations.extralong3,
      extraLong4 = Durations.extralong4;

  @override
  final Duration short1;

  @override
  final Duration short2;

  @override
  final Duration short3;

  @override
  final Duration short4;

  @override
  final Duration medium1;

  @override
  final Duration medium2;

  @override
  final Duration medium3;

  @override
  final Duration medium4;

  @override
  final Duration long1;

  @override
  final Duration long2;

  @override
  final Duration long3;

  @override
  final Duration long4;

  @override
  final Duration extraLong1;

  @override
  final Duration extraLong2;

  @override
  final Duration extraLong3;

  @override
  final Duration extraLong4;

  @override
  MotionDurationThemeData copyWith({
    Duration? short1,
    Duration? short2,
    Duration? short3,
    Duration? short4,
    Duration? medium1,
    Duration? medium2,
    Duration? medium3,
    Duration? medium4,
    Duration? long1,
    Duration? long2,
    Duration? long3,
    Duration? long4,
    Duration? extraLong1,
    Duration? extraLong2,
    Duration? extraLong3,
    Duration? extraLong4,
  }) {
    if (short1 == null &&
        short2 == null &&
        short3 == null &&
        short4 == null &&
        medium1 == null &&
        medium2 == null &&
        medium3 == null &&
        medium4 == null &&
        long1 == null &&
        long2 == null &&
        long3 == null &&
        long4 == null &&
        extraLong1 == null &&
        extraLong2 == null &&
        extraLong3 == null &&
        extraLong4 == null) {
      return this;
    }
    return MotionDurationThemeData(
      short1: short1 ?? this.short1,
      short2: short2 ?? this.short2,
      short3: short3 ?? this.short3,
      short4: short4 ?? this.short4,
      medium1: medium1 ?? this.medium1,
      medium2: medium2 ?? this.medium2,
      medium3: medium3 ?? this.medium3,
      medium4: medium4 ?? this.medium4,
      long1: long1 ?? this.long1,
      long2: long2 ?? this.long2,
      long3: long3 ?? this.long3,
      long4: long4 ?? this.long4,
      extraLong1: extraLong1 ?? this.extraLong1,
      extraLong2: extraLong2 ?? this.extraLong2,
      extraLong3: extraLong3 ?? this.extraLong3,
      extraLong4: extraLong4 ?? this.extraLong4,
    );
  }

  @override
  MotionDurationThemeData merge(MotionDurationThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      short1: other.short1,
      short2: other.short2,
      short3: other.short3,
      short4: other.short4,
      medium1: other.medium1,
      medium2: other.medium2,
      medium3: other.medium3,
      medium4: other.medium4,
      long1: other.long1,
      long2: other.long2,
      long3: other.long3,
      long4: other.long4,
      extraLong1: other.extraLong1,
      extraLong2: other.extraLong2,
      extraLong3: other.extraLong3,
      extraLong4: other.extraLong4,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Duration>("short1", short1));
    properties.add(DiagnosticsProperty<Duration>("short2", short2));
    properties.add(DiagnosticsProperty<Duration>("short3", short3));
    properties.add(DiagnosticsProperty<Duration>("short4", short4));
    properties.add(DiagnosticsProperty<Duration>("medium1", medium1));
    properties.add(DiagnosticsProperty<Duration>("medium2", medium2));
    properties.add(DiagnosticsProperty<Duration>("medium3", medium3));
    properties.add(DiagnosticsProperty<Duration>("medium4", medium4));
    properties.add(DiagnosticsProperty<Duration>("long1", long1));
    properties.add(DiagnosticsProperty<Duration>("long2", long2));
    properties.add(DiagnosticsProperty<Duration>("long3", long3));
    properties.add(DiagnosticsProperty<Duration>("long4", long4));
    properties.add(DiagnosticsProperty<Duration>("extraLong1", extraLong1));
    properties.add(DiagnosticsProperty<Duration>("extraLong2", extraLong2));
    properties.add(DiagnosticsProperty<Duration>("extraLong3", extraLong3));
    properties.add(DiagnosticsProperty<Duration>("extraLong4", extraLong4));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionDurationThemeData &&
            short1 == other.short1 &&
            short2 == other.short2 &&
            short3 == other.short3 &&
            short4 == other.short4 &&
            medium1 == other.medium1 &&
            medium2 == other.medium2 &&
            medium3 == other.medium3 &&
            medium4 == other.medium4 &&
            long1 == other.long1 &&
            long2 == other.long2 &&
            long3 == other.long3 &&
            long4 == other.long4 &&
            extraLong1 == other.extraLong1 &&
            extraLong2 == other.extraLong2 &&
            extraLong3 == other.extraLong3 &&
            extraLong4 == other.extraLong4;
  }

  @override
  int get hashCode => Object.hash(
    short1,
    short2,
    short3,
    short4,
    medium1,
    medium2,
    medium3,
    medium4,
    long1,
    long2,
    long3,
    long4,
    extraLong1,
    extraLong2,
    extraLong3,
    extraLong4,
  );
}

@experimental
@immutable
class MotionThemeDataPartial with Diagnosticable {
  const MotionThemeDataPartial({this.easing, this.duration});

  final MotionEasingThemeDataPartial? easing;
  final MotionDurationThemeDataPartial? duration;

  MotionThemeDataPartial copyWith({
    covariant MotionEasingThemeDataPartial? easing,
    covariant MotionDurationThemeDataPartial? duration,
  }) {
    if (easing == null && duration == null) return this;
    return MotionThemeDataPartial(
      easing: easing ?? this.easing,
      duration: duration ?? this.duration,
    );
  }

  MotionThemeDataPartial merge(MotionThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(easing: other.easing, duration: other.duration);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<MotionEasingThemeDataPartial>(
        "easing",
        easing,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<MotionDurationThemeDataPartial>(
        "duration",
        duration,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionThemeDataPartial &&
            easing == other.easing &&
            duration == other.duration;
  }

  @override
  int get hashCode => Object.hash(easing, duration);
}

@experimental
@immutable
class MotionThemeData with Diagnosticable implements MotionThemeDataPartial {
  const MotionThemeData({required this.easing, required this.duration});

  const MotionThemeData.fallback()
    : easing = const MotionEasingThemeData.fallback(),
      duration = const MotionDurationThemeData.fallback();

  @override
  final MotionEasingThemeData easing;

  @override
  final MotionDurationThemeData duration;

  @override
  MotionThemeData copyWith({
    covariant MotionEasingThemeData? easing,
    covariant MotionDurationThemeData? duration,
  }) {
    if (easing == null && duration == null) return this;
    return MotionThemeData(
      easing: easing ?? this.easing,
      duration: duration ?? this.duration,
    );
  }

  @override
  MotionThemeData merge(MotionThemeDataPartial? other) {
    if (other == null) return this;
    return MotionThemeData(
      easing: easing.merge(other.easing),
      duration: duration.merge(other.duration),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<MotionEasingThemeData>("easing", easing),
    );
    properties.add(
      DiagnosticsProperty<MotionDurationThemeData>("duration", duration),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionThemeData &&
            easing == other.easing &&
            duration == other.duration;
  }

  @override
  int get hashCode => Object.hash(easing, duration);
}

class MotionTheme extends InheritedTheme {
  const MotionTheme({super.key, required this.data, required super.child});

  final MotionThemeData data;

  @override
  bool updateShouldNotify(covariant MotionTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MotionTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<MotionThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required MotionThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        return MotionTheme(
          key: key,
          data: of(context).merge(data),
          child: child,
        );
      },
    );
  }

  static MotionThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MotionTheme>()?.data;
  }

  static MotionThemeData of(BuildContext context) {
    return maybeOf(context) ?? const MotionThemeData.fallback();
  }
}

// @immutable
// class MotionThemeDataPartial with Diagnosticable {
//   const MotionThemeDataPartial({
//     this.easingLinear,
//     this.easingEmphasized,
//     this.easingEmphasizedAccelerate,
//     this.easingEmphasizedDecelerate,
//     this.easingStandard,
//     this.easingStandardAccelerate,
//     this.easingStandardDecelerate,
//     this.easingLegacy,
//     this.easingLegacyAccelerate,
//     this.easingLegacyDecelerate,
//     this.durationShort1,
//     this.durationShort2,
//     this.durationShort3,
//     this.durationShort4,
//     this.durationMedium1,
//     this.durationMedium2,
//     this.durationMedium3,
//     this.durationMedium4,
//     this.durationLong1,
//     this.durationLong2,
//     this.durationLong3,
//     this.durationLong4,
//     this.durationExtraLong1,
//     this.durationExtraLong2,
//     this.durationExtraLong3,
//     this.durationExtraLong4,
//   });

//   final Curve? easingLinear;
//   final Curve? easingEmphasized;
//   final Curve? easingEmphasizedAccelerate;
//   final Curve? easingEmphasizedDecelerate;
//   final Curve? easingStandard;
//   final Curve? easingStandardAccelerate;
//   final Curve? easingStandardDecelerate;
//   final Curve? easingLegacy;
//   final Curve? easingLegacyAccelerate;
//   final Curve? easingLegacyDecelerate;
//   final Duration? durationShort1;
//   final Duration? durationShort2;
//   final Duration? durationShort3;
//   final Duration? durationShort4;
//   final Duration? durationMedium1;
//   final Duration? durationMedium2;
//   final Duration? durationMedium3;
//   final Duration? durationMedium4;
//   final Duration? durationLong1;
//   final Duration? durationLong2;
//   final Duration? durationLong3;
//   final Duration? durationLong4;
//   final Duration? durationExtraLong1;
//   final Duration? durationExtraLong2;
//   final Duration? durationExtraLong3;
//   final Duration? durationExtraLong4;

//   MotionThemeDataPartial copyWith({
//     Curve? easingLinear,
//     Curve? easingEmphasized,
//     Curve? easingEmphasizedAccelerate,
//     Curve? easingEmphasizedDecelerate,
//     Curve? easingStandard,
//     Curve? easingStandardAccelerate,
//     Curve? easingStandardDecelerate,
//     Curve? easingLegacy,
//     Curve? easingLegacyAccelerate,
//     Curve? easingLegacyDecelerate,
//     Duration? durationShort1,
//     Duration? durationShort2,
//     Duration? durationShort3,
//     Duration? durationShort4,
//     Duration? durationMedium1,
//     Duration? durationMedium2,
//     Duration? durationMedium3,
//     Duration? durationMedium4,
//     Duration? durationLong1,
//     Duration? durationLong2,
//     Duration? durationLong3,
//     Duration? durationLong4,
//     Duration? durationExtraLong1,
//     Duration? durationExtraLong2,
//     Duration? durationExtraLong3,
//     Duration? durationExtraLong4,
//   }) {
//     return MotionThemeDataPartial(
//       easingLinear: easingLinear ?? this.easingLinear,
//       easingEmphasized: easingEmphasized ?? this.easingEmphasized,
//       easingEmphasizedAccelerate:
//           easingEmphasizedAccelerate ?? this.easingEmphasizedAccelerate,
//       easingEmphasizedDecelerate:
//           easingEmphasizedDecelerate ?? this.easingEmphasizedDecelerate,
//       easingStandard: easingStandard ?? this.easingStandard,
//       easingStandardAccelerate:
//           easingStandardAccelerate ?? this.easingStandardAccelerate,
//       easingStandardDecelerate:
//           easingStandardDecelerate ?? this.easingStandardDecelerate,
//       easingLegacy: easingLegacy ?? this.easingLegacy,
//       easingLegacyAccelerate:
//           easingLegacyAccelerate ?? this.easingLegacyAccelerate,
//       easingLegacyDecelerate:
//           easingLegacyDecelerate ?? this.easingLegacyDecelerate,
//       durationShort1: durationShort1 ?? this.durationShort1,
//       durationShort2: durationShort2 ?? this.durationShort2,
//       durationShort3: durationShort3 ?? this.durationShort3,
//       durationShort4: durationShort4 ?? this.durationShort4,
//       durationMedium1: durationMedium1 ?? this.durationMedium1,
//       durationMedium2: durationMedium2 ?? this.durationMedium2,
//       durationMedium3: durationMedium3 ?? this.durationMedium3,
//       durationMedium4: durationMedium4 ?? this.durationMedium4,
//       durationLong1: durationLong1 ?? this.durationLong1,
//       durationLong2: durationLong2 ?? this.durationLong2,
//       durationLong3: durationLong3 ?? this.durationLong3,
//       durationLong4: durationLong4 ?? this.durationLong4,
//       durationExtraLong1: durationExtraLong1 ?? this.durationExtraLong1,
//       durationExtraLong2: durationExtraLong2 ?? this.durationExtraLong2,
//       durationExtraLong3: durationExtraLong3 ?? this.durationExtraLong3,
//       durationExtraLong4: durationExtraLong4 ?? this.durationExtraLong4,
//     );
//   }

//   MotionThemeDataPartial merge(MotionThemeDataPartial? other) {
//     if (other == null) return this;
//     return copyWith(
//       easingLinear: other.easingLinear,
//       easingEmphasized: other.easingEmphasized,
//       easingEmphasizedAccelerate: other.easingEmphasizedAccelerate,
//       easingEmphasizedDecelerate: other.easingEmphasizedDecelerate,
//       easingStandard: other.easingStandard,
//       easingStandardAccelerate: other.easingStandardAccelerate,
//       easingStandardDecelerate: other.easingStandardDecelerate,
//       easingLegacy: other.easingLegacy,
//       easingLegacyAccelerate: other.easingLegacyAccelerate,
//       easingLegacyDecelerate: other.easingLegacyDecelerate,
//       durationShort1: other.durationShort1,
//       durationShort2: other.durationShort2,
//       durationShort3: other.durationShort3,
//       durationShort4: other.durationShort4,
//       durationMedium1: other.durationMedium1,
//       durationMedium2: other.durationMedium2,
//       durationMedium3: other.durationMedium3,
//       durationMedium4: other.durationMedium4,
//       durationLong1: other.durationLong1,
//       durationLong2: other.durationLong2,
//       durationLong3: other.durationLong3,
//       durationLong4: other.durationLong4,
//       durationExtraLong1: other.durationExtraLong1,
//       durationExtraLong2: other.durationExtraLong2,
//       durationExtraLong3: other.durationExtraLong3,
//       durationExtraLong4: other.durationExtraLong4,
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingLinear",
//         easingLinear,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingEmphasized",
//         easingEmphasized,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingEmphasizedAccelerate",
//         easingEmphasizedAccelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingEmphasizedDecelerate",
//         easingEmphasizedDecelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingStandard",
//         easingStandard,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingStandardAccelerate",
//         easingStandardAccelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingStandardDecelerate",
//         easingStandardDecelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingLegacy",
//         easingLegacy,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingLegacyAccelerate",
//         easingLegacyAccelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve?>(
//         "easingLegacyDecelerate",
//         easingLegacyDecelerate,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationShort1",
//         durationShort1,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationShort2",
//         durationShort2,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationShort3",
//         durationShort3,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationShort4",
//         durationShort4,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationMedium1",
//         durationMedium1,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationMedium2",
//         durationMedium2,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationMedium3",
//         durationMedium3,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationMedium4",
//         durationMedium4,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationLong1",
//         durationLong1,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationLong2",
//         durationLong2,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationLong3",
//         durationLong3,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationLong4",
//         durationLong4,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationExtraLong1",
//         durationExtraLong1,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationExtraLong2",
//         durationExtraLong2,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationExtraLong3",
//         durationExtraLong3,
//         defaultValue: null,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration?>(
//         "durationExtraLong4",
//         durationExtraLong4,
//         defaultValue: null,
//       ),
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         other is MotionThemeDataPartial &&
//             easingLinear == other.easingLinear &&
//             easingEmphasized == other.easingEmphasized &&
//             easingEmphasizedAccelerate == other.easingEmphasizedAccelerate &&
//             easingEmphasizedDecelerate == other.easingEmphasizedDecelerate &&
//             easingStandard == other.easingStandard &&
//             easingStandardAccelerate == other.easingStandardAccelerate &&
//             easingStandardDecelerate == other.easingStandardDecelerate &&
//             easingLegacy == other.easingLegacy &&
//             easingLegacyAccelerate == other.easingLegacyAccelerate &&
//             easingLegacyDecelerate == other.easingLegacyDecelerate &&
//             durationShort1 == other.durationShort1 &&
//             durationShort2 == other.durationShort2 &&
//             durationShort3 == other.durationShort3 &&
//             durationShort4 == other.durationShort4 &&
//             durationMedium1 == other.durationMedium1 &&
//             durationMedium2 == other.durationMedium2 &&
//             durationMedium3 == other.durationMedium3 &&
//             durationMedium4 == other.durationMedium4 &&
//             durationLong1 == other.durationLong1 &&
//             durationLong2 == other.durationLong2 &&
//             durationLong3 == other.durationLong3 &&
//             durationLong4 == other.durationLong4 &&
//             durationExtraLong1 == other.durationExtraLong1 &&
//             durationExtraLong2 == other.durationExtraLong2 &&
//             durationExtraLong3 == other.durationExtraLong3 &&
//             durationExtraLong4 == other.durationExtraLong4;
//   }

//   @override
//   int get hashCode => Object.hashAll([
//     easingLinear,
//     easingEmphasized,
//     easingEmphasizedAccelerate,
//     easingEmphasizedDecelerate,
//     easingStandard,
//     easingStandardAccelerate,
//     easingStandardDecelerate,
//     easingLegacy,
//     easingLegacyAccelerate,
//     easingLegacyDecelerate,
//     durationShort1,
//     durationShort2,
//     durationShort3,
//     durationShort4,
//     durationMedium1,
//     durationMedium2,
//     durationMedium3,
//     durationMedium4,
//     durationLong1,
//     durationLong2,
//     durationLong3,
//     durationLong4,
//     durationExtraLong1,
//     durationExtraLong2,
//     durationExtraLong3,
//     durationExtraLong4,
//   ]);
// }

// @immutable
// abstract class MotionThemeData
//     with Diagnosticable
//     implements MotionThemeDataPartial {
//   const MotionThemeData._();
//   const factory MotionThemeData({
//     required Curve easingLinear,
//     required Curve easingEmphasized,
//     required Curve easingEmphasizedAccelerate,
//     required Curve easingEmphasizedDecelerate,
//     required Curve easingStandard,
//     required Curve easingStandardAccelerate,
//     required Curve easingStandardDecelerate,
//     required Curve easingLegacy,
//     required Curve easingLegacyAccelerate,
//     required Curve easingLegacyDecelerate,
//     required Duration durationShort1,
//     required Duration durationShort2,
//     required Duration durationShort3,
//     required Duration durationShort4,
//     required Duration durationMedium1,
//     required Duration durationMedium2,
//     required Duration durationMedium3,
//     required Duration durationMedium4,
//     required Duration durationLong1,
//     required Duration durationLong2,
//     required Duration durationLong3,
//     required Duration durationLong4,
//     required Duration durationExtraLong1,
//     required Duration durationExtraLong2,
//     required Duration durationExtraLong3,
//     required Duration durationExtraLong4,
//   }) = _MotionThemeData;
//   const factory MotionThemeData.fallback() = _MotionThemeDataFallback;

//   @override
//   Curve get easingLinear;

//   @override
//   Curve get easingEmphasized;

//   @override
//   Curve get easingEmphasizedAccelerate;

//   @override
//   Curve get easingEmphasizedDecelerate;

//   @override
//   Curve get easingStandard;

//   @override
//   Curve get easingStandardAccelerate;

//   @override
//   Curve get easingStandardDecelerate;

//   @override
//   Curve get easingLegacy;

//   @override
//   Curve get easingLegacyAccelerate;

//   @override
//   Curve get easingLegacyDecelerate;

//   @override
//   Duration get durationShort1;

//   @override
//   Duration get durationShort2;

//   @override
//   Duration get durationShort3;

//   @override
//   Duration get durationShort4;

//   @override
//   Duration get durationMedium1;

//   @override
//   Duration get durationMedium2;

//   @override
//   Duration get durationMedium3;

//   @override
//   Duration get durationMedium4;

//   @override
//   Duration get durationLong1;

//   @override
//   Duration get durationLong2;

//   @override
//   Duration get durationLong3;

//   @override
//   Duration get durationLong4;

//   @override
//   Duration get durationExtraLong1;

//   @override
//   Duration get durationExtraLong2;

//   @override
//   Duration get durationExtraLong3;

//   @override
//   Duration get durationExtraLong4;

//   @override
//   MotionThemeData copyWith({
//     Curve? easingLinear,
//     Curve? easingEmphasized,
//     Curve? easingEmphasizedAccelerate,
//     Curve? easingEmphasizedDecelerate,
//     Curve? easingStandard,
//     Curve? easingStandardAccelerate,
//     Curve? easingStandardDecelerate,
//     Curve? easingLegacy,
//     Curve? easingLegacyAccelerate,
//     Curve? easingLegacyDecelerate,
//     Duration? durationShort1,
//     Duration? durationShort2,
//     Duration? durationShort3,
//     Duration? durationShort4,
//     Duration? durationMedium1,
//     Duration? durationMedium2,
//     Duration? durationMedium3,
//     Duration? durationMedium4,
//     Duration? durationLong1,
//     Duration? durationLong2,
//     Duration? durationLong3,
//     Duration? durationLong4,
//     Duration? durationExtraLong1,
//     Duration? durationExtraLong2,
//     Duration? durationExtraLong3,
//     Duration? durationExtraLong4,
//   }) {
//     return MotionThemeData(
//       easingLinear: easingLinear ?? this.easingLinear,
//       easingEmphasized: easingEmphasized ?? this.easingEmphasized,
//       easingEmphasizedAccelerate:
//           easingEmphasizedAccelerate ?? this.easingEmphasizedAccelerate,
//       easingEmphasizedDecelerate:
//           easingEmphasizedDecelerate ?? this.easingEmphasizedDecelerate,
//       easingStandard: easingStandard ?? this.easingStandard,
//       easingStandardAccelerate:
//           easingStandardAccelerate ?? this.easingStandardAccelerate,
//       easingStandardDecelerate:
//           easingStandardDecelerate ?? this.easingStandardDecelerate,
//       easingLegacy: easingLegacy ?? this.easingLegacy,
//       easingLegacyAccelerate:
//           easingLegacyAccelerate ?? this.easingLegacyAccelerate,
//       easingLegacyDecelerate:
//           easingLegacyDecelerate ?? this.easingLegacyDecelerate,
//       durationShort1: durationShort1 ?? this.durationShort1,
//       durationShort2: durationShort2 ?? this.durationShort2,
//       durationShort3: durationShort3 ?? this.durationShort3,
//       durationShort4: durationShort4 ?? this.durationShort4,
//       durationMedium1: durationMedium1 ?? this.durationMedium1,
//       durationMedium2: durationMedium2 ?? this.durationMedium2,
//       durationMedium3: durationMedium3 ?? this.durationMedium3,
//       durationMedium4: durationMedium4 ?? this.durationMedium4,
//       durationLong1: durationLong1 ?? this.durationLong1,
//       durationLong2: durationLong2 ?? this.durationLong2,
//       durationLong3: durationLong3 ?? this.durationLong3,
//       durationLong4: durationLong4 ?? this.durationLong4,
//       durationExtraLong1: durationExtraLong1 ?? this.durationExtraLong1,
//       durationExtraLong2: durationExtraLong2 ?? this.durationExtraLong2,
//       durationExtraLong3: durationExtraLong3 ?? this.durationExtraLong3,
//       durationExtraLong4: durationExtraLong4 ?? this.durationExtraLong4,
//     );
//   }

//   @override
//   MotionThemeData merge(MotionThemeDataPartial? other) {
//     if (other == null) return this;
//     return copyWith(
//       easingLinear: other.easingLinear,
//       easingEmphasized: other.easingEmphasized,
//       easingEmphasizedAccelerate: other.easingEmphasizedAccelerate,
//       easingEmphasizedDecelerate: other.easingEmphasizedDecelerate,
//       easingStandard: other.easingStandard,
//       easingStandardAccelerate: other.easingStandardAccelerate,
//       easingStandardDecelerate: other.easingStandardDecelerate,
//       easingLegacy: other.easingLegacy,
//       easingLegacyAccelerate: other.easingLegacyAccelerate,
//       easingLegacyDecelerate: other.easingLegacyDecelerate,
//       durationShort1: other.durationShort1,
//       durationShort2: other.durationShort2,
//       durationShort3: other.durationShort3,
//       durationShort4: other.durationShort4,
//       durationMedium1: other.durationMedium1,
//       durationMedium2: other.durationMedium2,
//       durationMedium3: other.durationMedium3,
//       durationMedium4: other.durationMedium4,
//       durationLong1: other.durationLong1,
//       durationLong2: other.durationLong2,
//       durationLong3: other.durationLong3,
//       durationLong4: other.durationLong4,
//       durationExtraLong1: other.durationExtraLong1,
//       durationExtraLong2: other.durationExtraLong2,
//       durationExtraLong3: other.durationExtraLong3,
//       durationExtraLong4: other.durationExtraLong4,
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<Curve>("easingLinear", easingLinear));
//     properties.add(
//       DiagnosticsProperty<Curve>("easingEmphasized", easingEmphasized),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingEmphasizedAccelerate",
//         easingEmphasizedAccelerate,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingEmphasizedDecelerate",
//         easingEmphasizedDecelerate,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>("easingStandard", easingStandard),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingStandardAccelerate",
//         easingStandardAccelerate,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingStandardDecelerate",
//         easingStandardDecelerate,
//       ),
//     );
//     properties.add(DiagnosticsProperty<Curve>("easingLegacy", easingLegacy));
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingLegacyAccelerate",
//         easingLegacyAccelerate,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Curve>(
//         "easingLegacyDecelerate",
//         easingLegacyDecelerate,
//       ),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationShort1", durationShort1),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationShort2", durationShort2),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationShort3", durationShort3),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationShort4", durationShort4),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationMedium1", durationMedium1),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationMedium2", durationMedium2),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationMedium3", durationMedium3),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationMedium4", durationMedium4),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationLong1", durationLong1),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationLong2", durationLong2),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationLong3", durationLong3),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationLong4", durationLong4),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationExtraLong1", durationExtraLong1),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationExtraLong2", durationExtraLong2),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationExtraLong3", durationExtraLong3),
//     );
//     properties.add(
//       DiagnosticsProperty<Duration>("durationExtraLong4", durationExtraLong4),
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         other is MotionThemeData &&
//             easingLinear == other.easingLinear &&
//             easingEmphasized == other.easingEmphasized &&
//             easingEmphasizedAccelerate == other.easingEmphasizedAccelerate &&
//             easingEmphasizedDecelerate == other.easingEmphasizedDecelerate &&
//             easingStandard == other.easingStandard &&
//             easingStandardAccelerate == other.easingStandardAccelerate &&
//             easingStandardDecelerate == other.easingStandardDecelerate &&
//             easingLegacy == other.easingLegacy &&
//             easingLegacyAccelerate == other.easingLegacyAccelerate &&
//             easingLegacyDecelerate == other.easingLegacyDecelerate &&
//             durationShort1 == other.durationShort1 &&
//             durationShort2 == other.durationShort2 &&
//             durationShort3 == other.durationShort3 &&
//             durationShort4 == other.durationShort4 &&
//             durationMedium1 == other.durationMedium1 &&
//             durationMedium2 == other.durationMedium2 &&
//             durationMedium3 == other.durationMedium3 &&
//             durationMedium4 == other.durationMedium4 &&
//             durationLong1 == other.durationLong1 &&
//             durationLong2 == other.durationLong2 &&
//             durationLong3 == other.durationLong3 &&
//             durationLong4 == other.durationLong4 &&
//             durationExtraLong1 == other.durationExtraLong1 &&
//             durationExtraLong2 == other.durationExtraLong2 &&
//             durationExtraLong3 == other.durationExtraLong3 &&
//             durationExtraLong4 == other.durationExtraLong4;
//   }

//   @override
//   int get hashCode => Object.hashAll([
//     easingLinear,
//     easingEmphasized,
//     easingEmphasizedAccelerate,
//     easingEmphasizedDecelerate,
//     easingStandard,
//     easingStandardAccelerate,
//     easingStandardDecelerate,
//     easingLegacy,
//     easingLegacyAccelerate,
//     easingLegacyDecelerate,
//     durationShort1,
//     durationShort2,
//     durationShort3,
//     durationShort4,
//     durationMedium1,
//     durationMedium2,
//     durationMedium3,
//     durationMedium4,
//     durationLong1,
//     durationLong2,
//     durationLong3,
//     durationLong4,
//     durationExtraLong1,
//     durationExtraLong2,
//     durationExtraLong3,
//     durationExtraLong4,
//   ]);
// }

// class _MotionThemeData extends MotionThemeData {
//   const _MotionThemeData({
//     required this.easingLinear,
//     required this.easingEmphasized,
//     required this.easingEmphasizedAccelerate,
//     required this.easingEmphasizedDecelerate,
//     required this.easingStandard,
//     required this.easingStandardAccelerate,
//     required this.easingStandardDecelerate,
//     required this.easingLegacy,
//     required this.easingLegacyAccelerate,
//     required this.easingLegacyDecelerate,
//     required this.durationShort1,
//     required this.durationShort2,
//     required this.durationShort3,
//     required this.durationShort4,
//     required this.durationMedium1,
//     required this.durationMedium2,
//     required this.durationMedium3,
//     required this.durationMedium4,
//     required this.durationLong1,
//     required this.durationLong2,
//     required this.durationLong3,
//     required this.durationLong4,
//     required this.durationExtraLong1,
//     required this.durationExtraLong2,
//     required this.durationExtraLong3,
//     required this.durationExtraLong4,
//   }) : super._();

//   @override
//   final Curve easingLinear;

//   @override
//   final Curve easingEmphasized;

//   @override
//   final Curve easingEmphasizedAccelerate;

//   @override
//   final Curve easingEmphasizedDecelerate;

//   @override
//   final Curve easingStandard;

//   @override
//   final Curve easingStandardAccelerate;

//   @override
//   final Curve easingStandardDecelerate;

//   @override
//   final Curve easingLegacy;

//   @override
//   final Curve easingLegacyAccelerate;

//   @override
//   final Curve easingLegacyDecelerate;

//   @override
//   final Duration durationShort1;

//   @override
//   final Duration durationShort2;

//   @override
//   final Duration durationShort3;

//   @override
//   final Duration durationShort4;

//   @override
//   final Duration durationMedium1;

//   @override
//   final Duration durationMedium2;

//   @override
//   final Duration durationMedium3;

//   @override
//   final Duration durationMedium4;

//   @override
//   final Duration durationLong1;

//   @override
//   final Duration durationLong2;

//   @override
//   final Duration durationLong3;

//   @override
//   final Duration durationLong4;

//   @override
//   final Duration durationExtraLong1;

//   @override
//   final Duration durationExtraLong2;

//   @override
//   final Duration durationExtraLong3;

//   @override
//   final Duration durationExtraLong4;
// }

// class _MotionThemeDataFallback extends MotionThemeData {
//   const _MotionThemeDataFallback() : super._();

//   @override
//   Curve get easingLinear => Easing.linear;

//   @override
//   Curve get easingEmphasized => Curves.easeInOutCubicEmphasized;

//   @override
//   Curve get easingEmphasizedAccelerate => Easing.emphasizedAccelerate;

//   @override
//   Curve get easingEmphasizedDecelerate => Easing.emphasizedDecelerate;

//   @override
//   Curve get easingStandard => Easing.standard;

//   @override
//   Curve get easingStandardAccelerate => Easing.standardAccelerate;

//   @override
//   Curve get easingStandardDecelerate => Easing.standardDecelerate;

//   @override
//   Curve get easingLegacy => Easing.legacy;

//   @override
//   Curve get easingLegacyAccelerate => Easing.legacyAccelerate;

//   @override
//   Curve get easingLegacyDecelerate => Easing.legacyDecelerate;

//   @override
//   Duration get durationShort1 => Durations.short1;

//   @override
//   Duration get durationShort2 => Durations.short2;

//   @override
//   Duration get durationShort3 => Durations.short3;

//   @override
//   Duration get durationShort4 => Durations.short4;

//   @override
//   Duration get durationMedium1 => Durations.medium1;

//   @override
//   Duration get durationMedium2 => Durations.medium2;

//   @override
//   Duration get durationMedium3 => Durations.medium3;

//   @override
//   Duration get durationMedium4 => Durations.medium4;

//   @override
//   Duration get durationLong1 => Durations.long1;

//   @override
//   Duration get durationLong2 => Durations.long2;

//   @override
//   Duration get durationLong3 => Durations.long3;

//   @override
//   Duration get durationLong4 => Durations.long4;

//   @override
//   Duration get durationExtraLong1 => Durations.extralong1;

//   @override
//   Duration get durationExtraLong2 => Durations.extralong2;

//   @override
//   Duration get durationExtraLong3 => Durations.extralong3;

//   @override
//   Duration get durationExtraLong4 => Durations.extralong4;
// }
