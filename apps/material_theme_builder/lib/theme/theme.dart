import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:material3_expressive/material3_expressive.dart';

@immutable
class ColorThemeFactory {
  const ColorThemeFactory({
    this.sourceColor = sourceColorBaseline,
    this.variant = DynamicSchemeVariant.tonalSpot,
    this.version = DynamicSchemeVersion.spec2021,
    this.platform = DynamicSchemePlatform.phone,
  });

  final Color sourceColor;
  final DynamicSchemeVariant variant;
  final DynamicSchemeVersion version;
  final DynamicSchemePlatform platform;

  ColorThemeData build({
    required Brightness brightness,
    double contrastLevel = contrastLevelNormal,
  }) => ColorThemeData.fromSourceColor(
    sourceColor: sourceColor,
    brightness: brightness,
    contrastLevel: contrastLevel,
    variant: variant,
    platform: platform,
    version: version,
  );

  ColorThemeData get light =>
      build(brightness: Brightness.light, contrastLevel: contrastLevelNormal);

  ColorThemeData get lightMediumContrast =>
      build(brightness: Brightness.light, contrastLevel: contrastLevelMedium);

  ColorThemeData get lightHighContrast =>
      build(brightness: Brightness.light, contrastLevel: contrastLevelHigh);

  ColorThemeData get dark =>
      build(brightness: Brightness.dark, contrastLevel: contrastLevelNormal);

  ColorThemeData get darkMediumContrast =>
      build(brightness: Brightness.dark, contrastLevel: contrastLevelMedium);

  ColorThemeData get darkHighContrast =>
      build(brightness: Brightness.dark, contrastLevel: contrastLevelHigh);

  static const Color sourceColorBaseline = Color(0xFF6750A4);
  static const double contrastLevelNormal = 0.0;
  static const double contrastLevelMedium = 0.5;
  static const double contrastLevelHigh = 1.0;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ColorThemeFactory &&
            sourceColor == other.sourceColor &&
            variant == other.variant &&
            version == other.version &&
            platform == other.platform;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sourceColor, variant, version, platform);
}

class LegacyThemeFactory {
  const LegacyThemeFactory({required this.colorThemeFactory});

  final ColorThemeFactory colorThemeFactory;

  ThemeData get light => from(colorTheme: colorThemeFactory.light);

  ThemeData get lightMediumContrast =>
      from(colorTheme: colorThemeFactory.lightMediumContrast);

  ThemeData get lightHighContrast =>
      from(colorTheme: colorThemeFactory.lightHighContrast);

  ThemeData get dark => from(colorTheme: colorThemeFactory.dark);

  ThemeData get darkMediumContrast =>
      from(colorTheme: colorThemeFactory.darkMediumContrast);

  ThemeData get darkHighContrast =>
      from(colorTheme: colorThemeFactory.darkHighContrast);

  static ThemeData from({
    required ColorThemeData colorTheme,
    TypescaleThemeDataPartial? typescaleTheme,
  }) {
    final colorScheme = colorTheme.toColorScheme();
    return fromLegacy(
      colorScheme: colorScheme,
      textTheme: typescaleTheme?.toTextTheme(),
    );
  }

  static ThemeData fromLegacy({
    required ColorScheme colorScheme,
    TextTheme? textTheme,
  }) {
    return ThemeData(
      platform: kDebugMode ? TargetPlatform.android : null,
      colorScheme: colorScheme,
      textTheme: textTheme,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
