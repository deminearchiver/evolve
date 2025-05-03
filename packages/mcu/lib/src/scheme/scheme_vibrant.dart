import '../dynamiccolor/color_spec.dart';
import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

/// A loud theme, colorfulness is maximum for Primary palette, increased for others.
///
/// A Dynamic Color theme that maxes out colorfulness at each position in the
/// Primary Tonal Palette.
class SchemeVibrant extends DynamicScheme {
  SchemeVibrant({
    required super.sourceColorHct,
    required super.isDark,
    required super.contrastLevel,
    super.specVersion = defaultSpecVersion,
    super.platform = defaultPlatform,
  }) : super.fromVariant(variant: Variant.vibrant);

  static const SpecVersion defaultSpecVersion = SpecVersion.spec2021;
  static const Platform defaultPlatform = Platform.phone;
}
