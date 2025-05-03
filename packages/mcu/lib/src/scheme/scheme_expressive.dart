import '../dynamiccolor/color_spec.dart';
import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

/// A playful theme - the source color's hue does not appear in the theme.
class SchemeExpressive extends DynamicScheme {
  SchemeExpressive({
    required super.sourceColorHct,
    required super.isDark,
    required super.contrastLevel,
    super.specVersion = defaultSpecVersion,
    super.platform = defaultPlatform,
  }) : super.fromVariant(variant: Variant.expressive);

  static const SpecVersion defaultSpecVersion = SpecVersion.spec2021;
  static const Platform defaultPlatform = Platform.phone;
}
