import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  const DynamicSchemeVariant(this._variant);

  final mcu.Variant _variant;

  // static DynamicSchemeVariant _from(mcu.Variant variant) => switch (variant) {
  //   mcu.Variant.monochrome => monochrome,
  //   mcu.Variant.neutral => neutral,
  //   mcu.Variant.tonalSpot => tonalSpot,
  //   mcu.Variant.vibrant => vibrant,
  //   mcu.Variant.expressive => expressive,
  //   mcu.Variant.fidelity => fidelity,
  //   mcu.Variant.content => content,
  //   mcu.Variant.rainbow => rainbow,
  //   mcu.Variant.fruitSalad => fruitSalad,
  // };
}

enum DynamicSchemeVersion implements Comparable<DynamicSchemeVersion> {
  spec2021(mcu.SpecVersion.spec2021),
  spec2025(mcu.SpecVersion.spec2025);

  const DynamicSchemeVersion(this._specVersion);

  final mcu.SpecVersion _specVersion;
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

  static DynamicSchemeVersion _from(mcu.SpecVersion specVersion) =>
      switch (specVersion) {
        mcu.SpecVersion.spec2021 => spec2021,
        mcu.SpecVersion.spec2025 => spec2025,
      };
}

enum DynamicSchemePlatform {
  phone(mcu.Platform.phone),
  watch(mcu.Platform.watch);

  const DynamicSchemePlatform(this._platform);

  final mcu.Platform _platform;
  DynamicSchemeVersion get _since => switch (this) {
    phone => DynamicSchemeVersion.spec2021,
    watch => DynamicSchemeVersion.spec2025,
  };

  static DynamicSchemePlatform _from(mcu.Platform specVersion) =>
      switch (specVersion) {
        mcu.Platform.phone => phone,
        mcu.Platform.watch => watch,
      };
}

mcu.DynamicScheme _buildDynamicScheme({
  required DynamicSchemeVariant variant,
  required Color sourceColor,
  required Brightness brightness,
  double contrastLevel = _contrastLevelNormal,
  DynamicSchemeVersion? version,
  DynamicSchemePlatform? platform,
}) {
  final sourceColorHct = sourceColor._toHct();
  final isDark = brightness == Brightness.dark;
  version ??= DynamicSchemeVersion._from(mcu.DynamicScheme.defaultSpecVersion);
  platform ??= DynamicSchemePlatform._from(mcu.DynamicScheme.defaultPlatform);
  return mcu.DynamicScheme.fromVariant(
    sourceColorHct: sourceColorHct,
    isDark: isDark,
    contrastLevel: contrastLevel,
    variant: variant._variant,
    specVersion: version._specVersion,
    platform: platform._platform,
  );
}

// TODO: migrate these constants into some class and make them public
const double _contrastLevelLow = -1.0;
const double _contrastLevelNormal = 0.0;
const double _contrastLevelMedium = 0.5;
const double _contrastLevelHigh = 1.0;

// class ContrastLevel {
//   const ContrastLevel(this.value);

//   final double value;

//   static const ContrastLevel low = ContrastLevel(-1.0);
//   static const ContrastLevel normal = ContrastLevel(0.0);
//   static const ContrastLevel medium = ContrastLevel(0.5);
//   static const ContrastLevel high = ContrastLevel(1.0);

//   static ContrastLevel lerp(ContrastLevel a, ContrastLevel b, double t) {
//     return ContrastLevel(lerpDouble(a.value, b.value, t)!);
//   }
// }
