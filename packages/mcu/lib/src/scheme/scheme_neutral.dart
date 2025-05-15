import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

/// A theme that's slightly more chromatic than monochrome, which is purely black / white / gray.
class SchemeNeutral extends DynamicScheme {
  SchemeNeutral({
    required super.sourceColorHct,
    required super.isDark,
    required super.contrastLevel,
    super.specVersion = DynamicScheme.defaultSpecVersion,
    super.platform = DynamicScheme.defaultPlatform,
  }) : super.fromVariant(variant: Variant.neutral);
}
