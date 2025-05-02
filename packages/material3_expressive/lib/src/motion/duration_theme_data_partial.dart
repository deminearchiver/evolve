part of 'motion.dart';

abstract class DurationThemeDataPartial with Diagnosticable {
  const factory DurationThemeDataPartial({
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
  }) = _DurationThemeDataPartial;

  Duration? get short1;
  Duration? get short2;
  Duration? get short3;
  Duration? get short4;
  Duration? get medium1;
  Duration? get medium2;
  Duration? get medium3;
  Duration? get medium4;
  Duration? get long1;
  Duration? get long2;
  Duration? get long3;
  Duration? get long4;
  Duration? get extraLong1;
  Duration? get extraLong2;
  Duration? get extraLong3;
  Duration? get extraLong4;

  DurationThemeDataPartial copyWith({
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
  });

  DurationThemeDataPartial merge(DurationThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin DurationThemeDataPartialMixin on Diagnosticable
    implements DurationThemeDataPartial {
  @override
  DurationThemeDataPartial copyWith({
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
    return DurationThemeDataPartial(
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
  DurationThemeDataPartial merge(DurationThemeDataPartial? other) {
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
        runtimeType == other.runtimeType &&
            other is DurationThemeDataPartial &&
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

class _DurationThemeDataPartial
    with Diagnosticable, DurationThemeDataPartialMixin {
  const _DurationThemeDataPartial({
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

  @override
  final Duration? short1;

  @override
  final Duration? short2;

  @override
  final Duration? short3;

  @override
  final Duration? short4;

  @override
  final Duration? medium1;

  @override
  final Duration? medium2;

  @override
  final Duration? medium3;

  @override
  final Duration? medium4;

  @override
  final Duration? long1;

  @override
  final Duration? long2;

  @override
  final Duration? long3;

  @override
  final Duration? long4;

  @override
  final Duration? extraLong1;

  @override
  final Duration? extraLong2;

  @override
  final Duration? extraLong3;

  @override
  final Duration? extraLong4;
}
