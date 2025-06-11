import '../dynamiccolor/dynamic_scheme.dart';
import '../dynamiccolor/variant.dart';

/// A playful theme - the source color's hue does not appear in the theme.
class SchemeFruitSalad extends DynamicScheme {
  SchemeFruitSalad({
    required super.sourceColorHct,
    required super.isDark,
    required super.contrastLevel,
    super.specVersion = DynamicScheme.defaultSpecVersion,
    super.platform = DynamicScheme.defaultPlatform,
  }) : super.fromVariant(variant: Variant.fruitSalad);
}
