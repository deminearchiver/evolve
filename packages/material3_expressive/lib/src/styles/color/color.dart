import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter_material;
import 'package:mcu/mcu.dart' as mcu;

part 'color_theme.dart';
part 'color_theme_data.dart';
part 'color_theme_data_partial.dart';

extension on Color {
  mcu.Hct _toHct() => mcu.Hct.fromInt(toARGB32());
}

extension on mcu.DynamicColor {
  Color _getColor(mcu.DynamicScheme scheme) => Color(getArgb(scheme));
}

// enum _DynamicSchemeMode {
//   light(Brightness.light),
//   dark(Brightness.dark);

//   const _DynamicSchemeMode(this._brightness);
//   final Brightness _brightness;

//   bool get _isDark => switch (this) {
//     light => false,
//     dark => true,
//   };

//   static _DynamicSchemeMode _from(Brightness brightness) =>
//       switch (brightness) {
//         Brightness.light => light,
//         Brightness.dark => dark,
//       };
// }

enum DynamicSchemeVariant {
  monochrome(mcu.Variant.monochrome),
  neutral(mcu.Variant.neutral),
  tonalSpot(mcu.Variant.tonalSpot),
  vibrant(mcu.Variant.vibrant),
  expressive(mcu.Variant.expressive),
  fidelity(mcu.Variant.fidelity),
  content(mcu.Variant.content),
  rainbow(mcu.Variant.rainbow),
  fruitSalad(mcu.Variant.fruitSalad);

  const DynamicSchemeVariant(this.value);

  final mcu.Variant value;

  static DynamicSchemeVariant from(mcu.Variant variant) => switch (variant) {
    mcu.Variant.monochrome => monochrome,
    mcu.Variant.neutral => neutral,
    mcu.Variant.tonalSpot => tonalSpot,
    mcu.Variant.vibrant => vibrant,
    mcu.Variant.expressive => expressive,
    mcu.Variant.fidelity => fidelity,
    mcu.Variant.content => content,
    mcu.Variant.rainbow => rainbow,
    mcu.Variant.fruitSalad => fruitSalad,
  };
}

enum DynamicSchemeVersion implements Comparable<DynamicSchemeVersion> {
  spec2021(mcu.SpecVersion.spec2021),
  spec2025(mcu.SpecVersion.spec2025);

  const DynamicSchemeVersion(this.value);

  final mcu.SpecVersion value;

  int get _year => switch (this) {
    spec2021 => 2021,
    spec2025 => 2025,
  };

  bool supportsPlatform(DynamicSchemePlatform platform) {
    return platform._since >= this;
  }

  @override
  int compareTo(DynamicSchemeVersion other) {
    return _year.compareTo(other._year);
  }

  bool operator >(DynamicSchemeVersion other) => _year > other._year;
  bool operator >=(DynamicSchemeVersion other) => _year >= other._year;
  bool operator <(DynamicSchemeVersion other) => _year < other._year;
  bool operator <=(DynamicSchemeVersion other) => _year <= other._year;

  static DynamicSchemeVersion from(mcu.SpecVersion specVersion) =>
      switch (specVersion) {
        mcu.SpecVersion.spec2021 => spec2021,
        mcu.SpecVersion.spec2025 => spec2025,
      };
}

enum DynamicSchemePlatform {
  phone(mcu.Platform.phone),
  watch(mcu.Platform.watch);

  const DynamicSchemePlatform(this.value);

  final mcu.Platform value;

  DynamicSchemeVersion get _since => switch (this) {
    phone => DynamicSchemeVersion.spec2021,
    watch => DynamicSchemeVersion.spec2025,
  };

  static DynamicSchemePlatform from(mcu.Platform platform) =>
      switch (platform) {
        mcu.Platform.phone => phone,
        mcu.Platform.watch => watch,
      };
}

mcu.DynamicScheme _buildDynamicScheme({
  required DynamicSchemeVariant variant,
  required Color sourceColor,
  required Brightness brightness,
  double contrastLevel = ContrastLevel.normal,
  DynamicSchemeVersion? version,
  DynamicSchemePlatform? platform,
}) {
  final sourceColorHct = sourceColor._toHct();
  final isDark = brightness == Brightness.dark;
  version ??= DynamicSchemeVersion.from(mcu.DynamicScheme.defaultSpecVersion);
  platform ??= DynamicSchemePlatform.from(mcu.DynamicScheme.defaultPlatform);
  return mcu.DynamicScheme.fromVariant(
    sourceColorHct: sourceColorHct,
    isDark: isDark,
    contrastLevel: contrastLevel,
    variant: variant.value,
    specVersion: version.value,
    platform: platform.value,
  );
}

extension type const ContrastLevel._(double _) implements double {
  const ContrastLevel(double value)
    : assert(-1.0 <= value && value <= 1.0),
      _ = value;

  static const ContrastLevel low = -1.0 as ContrastLevel;
  static const ContrastLevel normal = 0.0 as ContrastLevel;
  static const ContrastLevel medium = 0.5 as ContrastLevel;
  static const ContrastLevel high = 1.0 as ContrastLevel;

  static ContrastLevel lerp(ContrastLevel a, ContrastLevel b, double t) {
    return ContrastLevel(lerpDouble(a, b, t)!);
  }
}
