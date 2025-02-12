import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class MotionThemeDataPartial with Diagnosticable {
  const MotionThemeDataPartial({
    this.easingLinear,
    this.easingEmphasized,
    this.easingEmphasizedAccelerate,
    this.easingEmphasizedDecelerate,
    this.easingStandard,
    this.easingStandardAccelerate,
    this.easingStandardDecelerate,
    this.easingLegacy,
    this.easingLegacyAccelerate,
    this.easingLegacyDecelerate,
    this.durationShort1,
    this.durationShort2,
    this.durationShort3,
    this.durationShort4,
    this.durationMedium1,
    this.durationMedium2,
    this.durationMedium3,
    this.durationMedium4,
    this.durationLong1,
    this.durationLong2,
    this.durationLong3,
    this.durationLong4,
    this.durationExtraLong1,
    this.durationExtraLong2,
    this.durationExtraLong3,
    this.durationExtraLong4,
  });

  final Curve? easingLinear;
  final Curve? easingEmphasized;
  final Curve? easingEmphasizedAccelerate;
  final Curve? easingEmphasizedDecelerate;
  final Curve? easingStandard;
  final Curve? easingStandardAccelerate;
  final Curve? easingStandardDecelerate;
  final Curve? easingLegacy;
  final Curve? easingLegacyAccelerate;
  final Curve? easingLegacyDecelerate;
  final Duration? durationShort1;
  final Duration? durationShort2;
  final Duration? durationShort3;
  final Duration? durationShort4;
  final Duration? durationMedium1;
  final Duration? durationMedium2;
  final Duration? durationMedium3;
  final Duration? durationMedium4;
  final Duration? durationLong1;
  final Duration? durationLong2;
  final Duration? durationLong3;
  final Duration? durationLong4;
  final Duration? durationExtraLong1;
  final Duration? durationExtraLong2;
  final Duration? durationExtraLong3;
  final Duration? durationExtraLong4;

  MotionThemeDataPartial copyWith({
    Curve? easingLinear,
    Curve? easingEmphasized,
    Curve? easingEmphasizedAccelerate,
    Curve? easingEmphasizedDecelerate,
    Curve? easingStandard,
    Curve? easingStandardAccelerate,
    Curve? easingStandardDecelerate,
    Curve? easingLegacy,
    Curve? easingLegacyAccelerate,
    Curve? easingLegacyDecelerate,
    Duration? durationShort1,
    Duration? durationShort2,
    Duration? durationShort3,
    Duration? durationShort4,
    Duration? durationMedium1,
    Duration? durationMedium2,
    Duration? durationMedium3,
    Duration? durationMedium4,
    Duration? durationLong1,
    Duration? durationLong2,
    Duration? durationLong3,
    Duration? durationLong4,
    Duration? durationExtraLong1,
    Duration? durationExtraLong2,
    Duration? durationExtraLong3,
    Duration? durationExtraLong4,
  }) {
    return MotionThemeDataPartial(
      easingLinear: easingLinear ?? this.easingLinear,
      easingEmphasized: easingEmphasized ?? this.easingEmphasized,
      easingEmphasizedAccelerate:
          easingEmphasizedAccelerate ?? this.easingEmphasizedAccelerate,
      easingEmphasizedDecelerate:
          easingEmphasizedDecelerate ?? this.easingEmphasizedDecelerate,
      easingStandard: easingStandard ?? this.easingStandard,
      easingStandardAccelerate:
          easingStandardAccelerate ?? this.easingStandardAccelerate,
      easingStandardDecelerate:
          easingStandardDecelerate ?? this.easingStandardDecelerate,
      easingLegacy: easingLegacy ?? this.easingLegacy,
      easingLegacyAccelerate:
          easingLegacyAccelerate ?? this.easingLegacyAccelerate,
      easingLegacyDecelerate:
          easingLegacyDecelerate ?? this.easingLegacyDecelerate,
      durationShort1: durationShort1 ?? this.durationShort1,
      durationShort2: durationShort2 ?? this.durationShort2,
      durationShort3: durationShort3 ?? this.durationShort3,
      durationShort4: durationShort4 ?? this.durationShort4,
      durationMedium1: durationMedium1 ?? this.durationMedium1,
      durationMedium2: durationMedium2 ?? this.durationMedium2,
      durationMedium3: durationMedium3 ?? this.durationMedium3,
      durationMedium4: durationMedium4 ?? this.durationMedium4,
      durationLong1: durationLong1 ?? this.durationLong1,
      durationLong2: durationLong2 ?? this.durationLong2,
      durationLong3: durationLong3 ?? this.durationLong3,
      durationLong4: durationLong4 ?? this.durationLong4,
      durationExtraLong1: durationExtraLong1 ?? this.durationExtraLong1,
      durationExtraLong2: durationExtraLong2 ?? this.durationExtraLong2,
      durationExtraLong3: durationExtraLong3 ?? this.durationExtraLong3,
      durationExtraLong4: durationExtraLong4 ?? this.durationExtraLong4,
    );
  }

  MotionThemeDataPartial merge(MotionThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      easingLinear: other.easingLinear,
      easingEmphasized: other.easingEmphasized,
      easingEmphasizedAccelerate: other.easingEmphasizedAccelerate,
      easingEmphasizedDecelerate: other.easingEmphasizedDecelerate,
      easingStandard: other.easingStandard,
      easingStandardAccelerate: other.easingStandardAccelerate,
      easingStandardDecelerate: other.easingStandardDecelerate,
      easingLegacy: other.easingLegacy,
      easingLegacyAccelerate: other.easingLegacyAccelerate,
      easingLegacyDecelerate: other.easingLegacyDecelerate,
      durationShort1: other.durationShort1,
      durationShort2: other.durationShort2,
      durationShort3: other.durationShort3,
      durationShort4: other.durationShort4,
      durationMedium1: other.durationMedium1,
      durationMedium2: other.durationMedium2,
      durationMedium3: other.durationMedium3,
      durationMedium4: other.durationMedium4,
      durationLong1: other.durationLong1,
      durationLong2: other.durationLong2,
      durationLong3: other.durationLong3,
      durationLong4: other.durationLong4,
      durationExtraLong1: other.durationExtraLong1,
      durationExtraLong2: other.durationExtraLong2,
      durationExtraLong3: other.durationExtraLong3,
      durationExtraLong4: other.durationExtraLong4,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingLinear",
        easingLinear,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingEmphasized",
        easingEmphasized,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingEmphasizedAccelerate",
        easingEmphasizedAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingEmphasizedDecelerate",
        easingEmphasizedDecelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingStandard",
        easingStandard,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingStandardAccelerate",
        easingStandardAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingStandardDecelerate",
        easingStandardDecelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingLegacy",
        easingLegacy,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingLegacyAccelerate",
        easingLegacyAccelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve?>(
        "easingLegacyDecelerate",
        easingLegacyDecelerate,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationShort1",
        durationShort1,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationShort2",
        durationShort2,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationShort3",
        durationShort3,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationShort4",
        durationShort4,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationMedium1",
        durationMedium1,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationMedium2",
        durationMedium2,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationMedium3",
        durationMedium3,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationMedium4",
        durationMedium4,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationLong1",
        durationLong1,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationLong2",
        durationLong2,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationLong3",
        durationLong3,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationLong4",
        durationLong4,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationExtraLong1",
        durationExtraLong1,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationExtraLong2",
        durationExtraLong2,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationExtraLong3",
        durationExtraLong3,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration?>(
        "durationExtraLong4",
        durationExtraLong4,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionThemeDataPartial &&
            easingLinear == other.easingLinear &&
            easingEmphasized == other.easingEmphasized &&
            easingEmphasizedAccelerate == other.easingEmphasizedAccelerate &&
            easingEmphasizedDecelerate == other.easingEmphasizedDecelerate &&
            easingStandard == other.easingStandard &&
            easingStandardAccelerate == other.easingStandardAccelerate &&
            easingStandardDecelerate == other.easingStandardDecelerate &&
            easingLegacy == other.easingLegacy &&
            easingLegacyAccelerate == other.easingLegacyAccelerate &&
            easingLegacyDecelerate == other.easingLegacyDecelerate &&
            durationShort1 == other.durationShort1 &&
            durationShort2 == other.durationShort2 &&
            durationShort3 == other.durationShort3 &&
            durationShort4 == other.durationShort4 &&
            durationMedium1 == other.durationMedium1 &&
            durationMedium2 == other.durationMedium2 &&
            durationMedium3 == other.durationMedium3 &&
            durationMedium4 == other.durationMedium4 &&
            durationLong1 == other.durationLong1 &&
            durationLong2 == other.durationLong2 &&
            durationLong3 == other.durationLong3 &&
            durationLong4 == other.durationLong4 &&
            durationExtraLong1 == other.durationExtraLong1 &&
            durationExtraLong2 == other.durationExtraLong2 &&
            durationExtraLong3 == other.durationExtraLong3 &&
            durationExtraLong4 == other.durationExtraLong4;
  }

  @override
  int get hashCode => Object.hashAll([
    easingLinear,
    easingEmphasized,
    easingEmphasizedAccelerate,
    easingEmphasizedDecelerate,
    easingStandard,
    easingStandardAccelerate,
    easingStandardDecelerate,
    easingLegacy,
    easingLegacyAccelerate,
    easingLegacyDecelerate,
    durationShort1,
    durationShort2,
    durationShort3,
    durationShort4,
    durationMedium1,
    durationMedium2,
    durationMedium3,
    durationMedium4,
    durationLong1,
    durationLong2,
    durationLong3,
    durationLong4,
    durationExtraLong1,
    durationExtraLong2,
    durationExtraLong3,
    durationExtraLong4,
  ]);
}

@immutable
abstract class MotionThemeData
    with Diagnosticable
    implements MotionThemeDataPartial {
  const MotionThemeData._();
  const factory MotionThemeData({
    required Curve easingLinear,
    required Curve easingEmphasized,
    required Curve easingEmphasizedAccelerate,
    required Curve easingEmphasizedDecelerate,
    required Curve easingStandard,
    required Curve easingStandardAccelerate,
    required Curve easingStandardDecelerate,
    required Curve easingLegacy,
    required Curve easingLegacyAccelerate,
    required Curve easingLegacyDecelerate,
    required Duration durationShort1,
    required Duration durationShort2,
    required Duration durationShort3,
    required Duration durationShort4,
    required Duration durationMedium1,
    required Duration durationMedium2,
    required Duration durationMedium3,
    required Duration durationMedium4,
    required Duration durationLong1,
    required Duration durationLong2,
    required Duration durationLong3,
    required Duration durationLong4,
    required Duration durationExtraLong1,
    required Duration durationExtraLong2,
    required Duration durationExtraLong3,
    required Duration durationExtraLong4,
  }) = _MotionThemeData;
  const factory MotionThemeData.fallback() = _MotionThemeDataFallback;

  @override
  Curve get easingLinear;

  @override
  Curve get easingEmphasized;

  @override
  Curve get easingEmphasizedAccelerate;

  @override
  Curve get easingEmphasizedDecelerate;

  @override
  Curve get easingStandard;

  @override
  Curve get easingStandardAccelerate;

  @override
  Curve get easingStandardDecelerate;

  @override
  Curve get easingLegacy;

  @override
  Curve get easingLegacyAccelerate;

  @override
  Curve get easingLegacyDecelerate;

  @override
  Duration get durationShort1;

  @override
  Duration get durationShort2;

  @override
  Duration get durationShort3;

  @override
  Duration get durationShort4;

  @override
  Duration get durationMedium1;

  @override
  Duration get durationMedium2;

  @override
  Duration get durationMedium3;

  @override
  Duration get durationMedium4;

  @override
  Duration get durationLong1;

  @override
  Duration get durationLong2;

  @override
  Duration get durationLong3;

  @override
  Duration get durationLong4;

  @override
  Duration get durationExtraLong1;

  @override
  Duration get durationExtraLong2;

  @override
  Duration get durationExtraLong3;

  @override
  Duration get durationExtraLong4;

  @override
  MotionThemeData copyWith({
    Curve? easingLinear,
    Curve? easingEmphasized,
    Curve? easingEmphasizedAccelerate,
    Curve? easingEmphasizedDecelerate,
    Curve? easingStandard,
    Curve? easingStandardAccelerate,
    Curve? easingStandardDecelerate,
    Curve? easingLegacy,
    Curve? easingLegacyAccelerate,
    Curve? easingLegacyDecelerate,
    Duration? durationShort1,
    Duration? durationShort2,
    Duration? durationShort3,
    Duration? durationShort4,
    Duration? durationMedium1,
    Duration? durationMedium2,
    Duration? durationMedium3,
    Duration? durationMedium4,
    Duration? durationLong1,
    Duration? durationLong2,
    Duration? durationLong3,
    Duration? durationLong4,
    Duration? durationExtraLong1,
    Duration? durationExtraLong2,
    Duration? durationExtraLong3,
    Duration? durationExtraLong4,
  }) {
    return MotionThemeData(
      easingLinear: easingLinear ?? this.easingLinear,
      easingEmphasized: easingEmphasized ?? this.easingEmphasized,
      easingEmphasizedAccelerate:
          easingEmphasizedAccelerate ?? this.easingEmphasizedAccelerate,
      easingEmphasizedDecelerate:
          easingEmphasizedDecelerate ?? this.easingEmphasizedDecelerate,
      easingStandard: easingStandard ?? this.easingStandard,
      easingStandardAccelerate:
          easingStandardAccelerate ?? this.easingStandardAccelerate,
      easingStandardDecelerate:
          easingStandardDecelerate ?? this.easingStandardDecelerate,
      easingLegacy: easingLegacy ?? this.easingLegacy,
      easingLegacyAccelerate:
          easingLegacyAccelerate ?? this.easingLegacyAccelerate,
      easingLegacyDecelerate:
          easingLegacyDecelerate ?? this.easingLegacyDecelerate,
      durationShort1: durationShort1 ?? this.durationShort1,
      durationShort2: durationShort2 ?? this.durationShort2,
      durationShort3: durationShort3 ?? this.durationShort3,
      durationShort4: durationShort4 ?? this.durationShort4,
      durationMedium1: durationMedium1 ?? this.durationMedium1,
      durationMedium2: durationMedium2 ?? this.durationMedium2,
      durationMedium3: durationMedium3 ?? this.durationMedium3,
      durationMedium4: durationMedium4 ?? this.durationMedium4,
      durationLong1: durationLong1 ?? this.durationLong1,
      durationLong2: durationLong2 ?? this.durationLong2,
      durationLong3: durationLong3 ?? this.durationLong3,
      durationLong4: durationLong4 ?? this.durationLong4,
      durationExtraLong1: durationExtraLong1 ?? this.durationExtraLong1,
      durationExtraLong2: durationExtraLong2 ?? this.durationExtraLong2,
      durationExtraLong3: durationExtraLong3 ?? this.durationExtraLong3,
      durationExtraLong4: durationExtraLong4 ?? this.durationExtraLong4,
    );
  }

  @override
  MotionThemeData merge(MotionThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      easingLinear: other.easingLinear,
      easingEmphasized: other.easingEmphasized,
      easingEmphasizedAccelerate: other.easingEmphasizedAccelerate,
      easingEmphasizedDecelerate: other.easingEmphasizedDecelerate,
      easingStandard: other.easingStandard,
      easingStandardAccelerate: other.easingStandardAccelerate,
      easingStandardDecelerate: other.easingStandardDecelerate,
      easingLegacy: other.easingLegacy,
      easingLegacyAccelerate: other.easingLegacyAccelerate,
      easingLegacyDecelerate: other.easingLegacyDecelerate,
      durationShort1: other.durationShort1,
      durationShort2: other.durationShort2,
      durationShort3: other.durationShort3,
      durationShort4: other.durationShort4,
      durationMedium1: other.durationMedium1,
      durationMedium2: other.durationMedium2,
      durationMedium3: other.durationMedium3,
      durationMedium4: other.durationMedium4,
      durationLong1: other.durationLong1,
      durationLong2: other.durationLong2,
      durationLong3: other.durationLong3,
      durationLong4: other.durationLong4,
      durationExtraLong1: other.durationExtraLong1,
      durationExtraLong2: other.durationExtraLong2,
      durationExtraLong3: other.durationExtraLong3,
      durationExtraLong4: other.durationExtraLong4,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Curve>("easingLinear", easingLinear));
    properties.add(
      DiagnosticsProperty<Curve>("easingEmphasized", easingEmphasized),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingEmphasizedAccelerate",
        easingEmphasizedAccelerate,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingEmphasizedDecelerate",
        easingEmphasizedDecelerate,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>("easingStandard", easingStandard),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingStandardAccelerate",
        easingStandardAccelerate,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingStandardDecelerate",
        easingStandardDecelerate,
      ),
    );
    properties.add(DiagnosticsProperty<Curve>("easingLegacy", easingLegacy));
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingLegacyAccelerate",
        easingLegacyAccelerate,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        "easingLegacyDecelerate",
        easingLegacyDecelerate,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationShort1", durationShort1),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationShort2", durationShort2),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationShort3", durationShort3),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationShort4", durationShort4),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationMedium1", durationMedium1),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationMedium2", durationMedium2),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationMedium3", durationMedium3),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationMedium4", durationMedium4),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationLong1", durationLong1),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationLong2", durationLong2),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationLong3", durationLong3),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationLong4", durationLong4),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationExtraLong1", durationExtraLong1),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationExtraLong2", durationExtraLong2),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationExtraLong3", durationExtraLong3),
    );
    properties.add(
      DiagnosticsProperty<Duration>("durationExtraLong4", durationExtraLong4),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MotionThemeData &&
            easingLinear == other.easingLinear &&
            easingEmphasized == other.easingEmphasized &&
            easingEmphasizedAccelerate == other.easingEmphasizedAccelerate &&
            easingEmphasizedDecelerate == other.easingEmphasizedDecelerate &&
            easingStandard == other.easingStandard &&
            easingStandardAccelerate == other.easingStandardAccelerate &&
            easingStandardDecelerate == other.easingStandardDecelerate &&
            easingLegacy == other.easingLegacy &&
            easingLegacyAccelerate == other.easingLegacyAccelerate &&
            easingLegacyDecelerate == other.easingLegacyDecelerate &&
            durationShort1 == other.durationShort1 &&
            durationShort2 == other.durationShort2 &&
            durationShort3 == other.durationShort3 &&
            durationShort4 == other.durationShort4 &&
            durationMedium1 == other.durationMedium1 &&
            durationMedium2 == other.durationMedium2 &&
            durationMedium3 == other.durationMedium3 &&
            durationMedium4 == other.durationMedium4 &&
            durationLong1 == other.durationLong1 &&
            durationLong2 == other.durationLong2 &&
            durationLong3 == other.durationLong3 &&
            durationLong4 == other.durationLong4 &&
            durationExtraLong1 == other.durationExtraLong1 &&
            durationExtraLong2 == other.durationExtraLong2 &&
            durationExtraLong3 == other.durationExtraLong3 &&
            durationExtraLong4 == other.durationExtraLong4;
  }

  @override
  int get hashCode => Object.hashAll([
    easingLinear,
    easingEmphasized,
    easingEmphasizedAccelerate,
    easingEmphasizedDecelerate,
    easingStandard,
    easingStandardAccelerate,
    easingStandardDecelerate,
    easingLegacy,
    easingLegacyAccelerate,
    easingLegacyDecelerate,
    durationShort1,
    durationShort2,
    durationShort3,
    durationShort4,
    durationMedium1,
    durationMedium2,
    durationMedium3,
    durationMedium4,
    durationLong1,
    durationLong2,
    durationLong3,
    durationLong4,
    durationExtraLong1,
    durationExtraLong2,
    durationExtraLong3,
    durationExtraLong4,
  ]);
}

class _MotionThemeData extends MotionThemeData {
  const _MotionThemeData({
    required this.easingLinear,
    required this.easingEmphasized,
    required this.easingEmphasizedAccelerate,
    required this.easingEmphasizedDecelerate,
    required this.easingStandard,
    required this.easingStandardAccelerate,
    required this.easingStandardDecelerate,
    required this.easingLegacy,
    required this.easingLegacyAccelerate,
    required this.easingLegacyDecelerate,
    required this.durationShort1,
    required this.durationShort2,
    required this.durationShort3,
    required this.durationShort4,
    required this.durationMedium1,
    required this.durationMedium2,
    required this.durationMedium3,
    required this.durationMedium4,
    required this.durationLong1,
    required this.durationLong2,
    required this.durationLong3,
    required this.durationLong4,
    required this.durationExtraLong1,
    required this.durationExtraLong2,
    required this.durationExtraLong3,
    required this.durationExtraLong4,
  }) : super._();

  @override
  final Curve easingLinear;

  @override
  final Curve easingEmphasized;

  @override
  final Curve easingEmphasizedAccelerate;

  @override
  final Curve easingEmphasizedDecelerate;

  @override
  final Curve easingStandard;

  @override
  final Curve easingStandardAccelerate;

  @override
  final Curve easingStandardDecelerate;

  @override
  final Curve easingLegacy;

  @override
  final Curve easingLegacyAccelerate;

  @override
  final Curve easingLegacyDecelerate;

  @override
  final Duration durationShort1;

  @override
  final Duration durationShort2;

  @override
  final Duration durationShort3;

  @override
  final Duration durationShort4;

  @override
  final Duration durationMedium1;

  @override
  final Duration durationMedium2;

  @override
  final Duration durationMedium3;

  @override
  final Duration durationMedium4;

  @override
  final Duration durationLong1;

  @override
  final Duration durationLong2;

  @override
  final Duration durationLong3;

  @override
  final Duration durationLong4;

  @override
  final Duration durationExtraLong1;

  @override
  final Duration durationExtraLong2;

  @override
  final Duration durationExtraLong3;

  @override
  final Duration durationExtraLong4;
}

class _MotionThemeDataFallback extends MotionThemeData {
  const _MotionThemeDataFallback() : super._();

  @override
  Curve get easingLinear => Easing.linear;

  @override
  Curve get easingEmphasized => Curves.easeInOutCubicEmphasized;

  @override
  Curve get easingEmphasizedAccelerate => Easing.emphasizedAccelerate;

  @override
  Curve get easingEmphasizedDecelerate => Easing.emphasizedDecelerate;

  @override
  Curve get easingStandard => Easing.standard;

  @override
  Curve get easingStandardAccelerate => Easing.standardAccelerate;

  @override
  Curve get easingStandardDecelerate => Easing.standardDecelerate;

  @override
  Curve get easingLegacy => Easing.legacy;

  @override
  Curve get easingLegacyAccelerate => Easing.legacyAccelerate;

  @override
  Curve get easingLegacyDecelerate => Easing.legacyDecelerate;

  @override
  Duration get durationShort1 => Durations.short1;

  @override
  Duration get durationShort2 => Durations.short2;

  @override
  Duration get durationShort3 => Durations.short3;

  @override
  Duration get durationShort4 => Durations.short4;

  @override
  Duration get durationMedium1 => Durations.medium1;

  @override
  Duration get durationMedium2 => Durations.medium2;

  @override
  Duration get durationMedium3 => Durations.medium3;

  @override
  Duration get durationMedium4 => Durations.medium4;

  @override
  Duration get durationLong1 => Durations.long1;

  @override
  Duration get durationLong2 => Durations.long2;

  @override
  Duration get durationLong3 => Durations.long3;

  @override
  Duration get durationLong4 => Durations.long4;

  @override
  Duration get durationExtraLong1 => Durations.extralong1;

  @override
  Duration get durationExtraLong2 => Durations.extralong2;

  @override
  Duration get durationExtraLong3 => Durations.extralong3;

  @override
  Duration get durationExtraLong4 => Durations.extralong4;
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
