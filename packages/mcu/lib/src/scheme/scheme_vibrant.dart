import '../dynamiccolor/color_spec.dart';
import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

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
