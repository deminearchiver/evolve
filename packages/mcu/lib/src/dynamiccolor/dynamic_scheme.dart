import 'dart:math' as math;
import 'package:mcu/src/dynamiccolor/color_specs.dart';

import '../utils/math_utils.dart' as math_utils;
import 'package:mcu/src/dynamiccolor/color_spec.dart';
import 'package:mcu/src/dynamiccolor/variant.dart';
import 'package:mcu/src/palettes/tonal_palette.dart';

import '../hct/hct.dart';
import 'dynamic_color.dart';

enum Platform { phone, watch }

class DynamicScheme {
  final int sourceColorArgb;
  final Hct sourceColorHct;
  final Variant variant;
  final bool isDark;
  final Platform platform;
  final double contrastLevel;
  final SpecVersion specVersion;
  final TonalPalette primaryPalette;
  final TonalPalette secondaryPalette;
  final TonalPalette tertiaryPalette;
  final TonalPalette neutralPalette;
  final TonalPalette neutralVariantPalette;
  final TonalPalette errorPalette;

  DynamicScheme({
    required this.sourceColorHct,
    required this.variant,
    required this.isDark,
    required this.contrastLevel,
    this.platform = defaultPlatform,
    this.specVersion = defaultSpecVersion,
    required this.primaryPalette,
    required this.secondaryPalette,
    required this.tertiaryPalette,
    required this.neutralPalette,
    required this.neutralVariantPalette,
    TonalPalette? errorPalette,
  }) : sourceColorArgb = sourceColorHct.toInt(),
       errorPalette = errorPalette ?? TonalPalette.fromHueAndChroma(25.0, 84.0);

  DynamicScheme.fromVariant({
    required this.sourceColorHct,
    required this.isDark,
    required this.contrastLevel,
    required this.specVersion,
    required this.platform,
    required this.variant,
  }) : sourceColorArgb = sourceColorHct.toInt(),
       primaryPalette = ColorSpecs.get(specVersion).getPrimaryPalette(
         variant,
         sourceColorHct,
         isDark,
         platform,
         contrastLevel,
       ),
       secondaryPalette = ColorSpecs.get(specVersion).getSecondaryPalette(
         variant,
         sourceColorHct,
         isDark,
         platform,
         contrastLevel,
       ),
       tertiaryPalette = ColorSpecs.get(specVersion).getTertiaryPalette(
         variant,
         sourceColorHct,
         isDark,
         platform,
         contrastLevel,
       ),
       neutralPalette = ColorSpecs.get(specVersion).getNeutralPalette(
         variant,
         sourceColorHct,
         isDark,
         platform,
         contrastLevel,
       ),
       neutralVariantPalette = ColorSpecs.get(specVersion)
           .getNeutralVariantPalette(
             variant,
             sourceColorHct,
             isDark,
             platform,
             contrastLevel,
           ),
       errorPalette =
           ColorSpecs.get(specVersion).getErrorPalette(
             variant,
             sourceColorHct,
             isDark,
             platform,
             contrastLevel,
           ) ??
           TonalPalette.fromHueAndChroma(25.0, 84.0);

  Hct getHct(DynamicColor dynamicColor) => dynamicColor.getHct(this);

  int getArgb(DynamicColor dynamicColor) => dynamicColor.getArgb(this);

  @override
  String toString() {
    return "Scheme: variant=${variant.name}, mode=${isDark ? "dark" : "light"}, platform=${platform.name}, contrastLevel=${contrastLevel.toStringAsFixed(1)}, seed=$sourceColorHct, specVersion=$specVersion";
  }

  static const SpecVersion defaultSpecVersion = SpecVersion.spec2021;
  static const Platform defaultPlatform = Platform.phone;

  static DynamicScheme from(DynamicScheme other, bool isDark) {
    return DynamicScheme(
      sourceColorHct: other.sourceColorHct,
      variant: other.variant,
      isDark: isDark,
      contrastLevel: other.contrastLevel,
      platform: other.platform,
      specVersion: other.specVersion,
      primaryPalette: other.primaryPalette,
      secondaryPalette: other.secondaryPalette,
      tertiaryPalette: other.tertiaryPalette,
      neutralPalette: other.neutralPalette,
      neutralVariantPalette: other.neutralVariantPalette,
      errorPalette: other.errorPalette,
    );
  }

  static double getPiecewiseValue(
    Hct sourceColorHct,
    List<double> hueBreakpoints,
    List<double> hues,
  ) {
    final size = math.min(hueBreakpoints.length - 1, hues.length);
    final sourceHue = sourceColorHct.hue;
    for (int i = 0; i < size; i++) {
      if (sourceHue >= hueBreakpoints[i] && sourceHue < hueBreakpoints[i + 1]) {
        return math_utils.sanitizeDegreesDouble(hues[i]);
      }
    }
    // No condition matched, return the source value.
    return sourceHue;
  }

  static double getRotatedHue(
    Hct sourceColorHct,
    List<double> hueBreakpoints,
    List<double> rotations,
  ) {
    double rotation = getPiecewiseValue(
      sourceColorHct,
      hueBreakpoints,
      rotations,
    );
    if (math.min(hueBreakpoints.length - 1, rotations.length) <= 0) {
      // No condition matched, return the source hue.
      rotation = 0;
    }
    return math_utils.sanitizeDegreesDouble(sourceColorHct.hue + rotation);
  }
}
