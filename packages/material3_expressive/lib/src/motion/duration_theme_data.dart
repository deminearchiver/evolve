part of 'motion.dart';

abstract class DurationThemeData
    with Diagnosticable
    implements DurationThemeDataPartial {
  const factory DurationThemeData({
    required Duration short1,
    required Duration short2,
    required Duration short3,
    required Duration short4,
    required Duration medium1,
    required Duration medium2,
    required Duration medium3,
    required Duration medium4,
    required Duration long1,
    required Duration long2,
    required Duration long3,
    required Duration long4,
    required Duration extraLong1,
    required Duration extraLong2,
    required Duration extraLong3,
    required Duration extraLong4,
  }) = _DurationThemeData;

  const factory DurationThemeData.fallback() = _DurationThemeData.fallback;

  @override
  Duration get short1;

  @override
  Duration get short2;

  @override
  Duration get short3;

  @override
  Duration get short4;

  @override
  Duration get medium1;

  @override
  Duration get medium2;

  @override
  Duration get medium3;

  @override
  Duration get medium4;

  @override
  Duration get long1;

  @override
  Duration get long2;

  @override
  Duration get long3;

  @override
  Duration get long4;

  @override
  Duration get extraLong1;

  @override
  Duration get extraLong2;

  @override
  Duration get extraLong3;

  @override
  Duration get extraLong4;

  @override
  DurationThemeData copyWith({
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

  @override
  DurationThemeData merge(DurationThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin DurationThemeDataMixin on Diagnosticable implements DurationThemeData {
  @override
  DurationThemeData copyWith({
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
    return DurationThemeData(
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
  DurationThemeData merge(DurationThemeDataPartial? other) {
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
        runtimeType == other.runtimeType &&
            other is DurationThemeData &&
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

class _DurationThemeData with Diagnosticable, DurationThemeDataMixin {
  const _DurationThemeData({
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

  const _DurationThemeData.fallback()
    : short1 = const Duration(milliseconds: 50),
      short2 = const Duration(milliseconds: 100),
      short3 = const Duration(milliseconds: 150),
      short4 = const Duration(milliseconds: 200),
      medium1 = const Duration(milliseconds: 250),
      medium2 = const Duration(milliseconds: 300),
      medium3 = const Duration(milliseconds: 350),
      medium4 = const Duration(milliseconds: 400),
      long1 = const Duration(milliseconds: 450),
      long2 = const Duration(milliseconds: 500),
      long3 = const Duration(milliseconds: 550),
      long4 = const Duration(milliseconds: 600),
      extraLong1 = const Duration(milliseconds: 700),
      extraLong2 = const Duration(milliseconds: 800),
      extraLong3 = const Duration(milliseconds: 900),
      extraLong4 = const Duration(milliseconds: 1000);

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
}
