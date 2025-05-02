import '../dynamiccolor/color_spec.dart';
import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

class SchemeRainbow extends DynamicScheme {
  SchemeRainbow({
    required super.sourceColorHct,
    required super.isDark,
    required super.contrastLevel,
  }) : super.fromVariant(
         specVersion: SpecVersion.spec2021,
         platform: Platform.phone,
         variant: Variant.fruitSalad,
       );
}
