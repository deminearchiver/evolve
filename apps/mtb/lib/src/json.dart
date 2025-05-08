// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcu/mcu.dart' as mcu;
import 'package:csslib/parser.dart' as css;

import 'color.dart';

part 'json.freezed.dart';
part 'json.g.dart';

@freezed
abstract class Figma with _$Figma {
  const factory Figma({
    @Default("") String description,
    @ColorConverter() required Color seed,
    required FigmaCoreColors coreColors,
    @Default([]) List<FigmaExtendedColor> extendedColors,
    required FigmaSchemes schemes,
    required FigmaPalettes palettes,
  }) = _Figma;

  factory Figma.fromJson(Map<String, Object?> json) => _$FigmaFromJson(json);
}

@freezed
abstract class FigmaCoreColors with _$FigmaCoreColors {
  const factory FigmaCoreColors({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? primary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? secondary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? tertiary,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutral,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? neutralVariant,
    @JsonKey(includeIfNull: false) @ColorConverter() Color? error,
  }) = _FigmaCoreColors;

  factory FigmaCoreColors.fromJson(Map<String, Object?> json) =>
      _$FigmaCoreColorsFromJson(json);
}

@freezed
abstract class FigmaExtendedColor with _$FigmaExtendedColor {
  const factory FigmaExtendedColor({
    required String name,
    @ColorConverter() required Color color,
    @Default("") String description,
    @Default(false) bool harmonized,
  }) = _FigmaExtendedColor;

  factory FigmaExtendedColor.fromJson(Map<String, Object?> json) =>
      _$FigmaExtendedColorFromJson(json);
}

@freezed
abstract class FigmaSchemes with _$FigmaSchemes {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory FigmaSchemes({
    required FigmaScheme light,
    required FigmaScheme lightMediumContrast,
    required FigmaScheme lightHighContrast,
    required FigmaScheme dark,
    required FigmaScheme darkMediumContrast,
    required FigmaScheme darkHighContrast,
  }) = _FigmaSchemes;

  factory FigmaSchemes.fromDynamicSchemes({
    required mcu.DynamicScheme light,
    required mcu.DynamicScheme lightMediumContrast,
    required mcu.DynamicScheme lightHighContrast,
    required mcu.DynamicScheme dark,
    required mcu.DynamicScheme darkMediumContrast,
    required mcu.DynamicScheme darkHighContrast,
  }) {
    return FigmaSchemes(
      light: FigmaScheme.fromDynamicScheme(light),
      lightMediumContrast: FigmaScheme.fromDynamicScheme(lightMediumContrast),
      lightHighContrast: FigmaScheme.fromDynamicScheme(lightHighContrast),
      dark: FigmaScheme.fromDynamicScheme(dark),
      darkMediumContrast: FigmaScheme.fromDynamicScheme(darkMediumContrast),
      darkHighContrast: FigmaScheme.fromDynamicScheme(darkHighContrast),
    );
  }

  factory FigmaSchemes.fromJson(Map<String, Object?> json) =>
      _$FigmaSchemesFromJson(json);
}

@freezed
abstract class FigmaScheme with _$FigmaScheme {
  const factory FigmaScheme({
    @ColorConverter() required Color primary,
    @ColorConverter() required Color surfaceTint,
    @ColorConverter() required Color onPrimary,
    @ColorConverter() required Color primaryContainer,
    @ColorConverter() required Color onPrimaryContainer,
    @ColorConverter() required Color secondary,
    @ColorConverter() required Color onSecondary,
    @ColorConverter() required Color secondaryContainer,
    @ColorConverter() required Color onSecondaryContainer,
    @ColorConverter() required Color tertiary,
    @ColorConverter() required Color onTertiary,
    @ColorConverter() required Color tertiaryContainer,
    @ColorConverter() required Color onTertiaryContainer,
    @ColorConverter() required Color error,
    @ColorConverter() required Color onError,
    @ColorConverter() required Color errorContainer,
    @ColorConverter() required Color onErrorContainer,
    @ColorConverter() required Color background,
    @ColorConverter() required Color onBackground,
    @ColorConverter() required Color surface,
    @ColorConverter() required Color onSurface,
    @ColorConverter() required Color surfaceVariant,
    @ColorConverter() required Color onSurfaceVariant,
    @ColorConverter() required Color outline,
    @ColorConverter() required Color outlineVariant,
    @ColorConverter() required Color shadow,
    @ColorConverter() required Color scrim,
    @ColorConverter() required Color inverseSurface,
    @ColorConverter() required Color inverseOnSurface,
    @ColorConverter() required Color inversePrimary,
    @ColorConverter() required Color primaryFixed,
    @ColorConverter() required Color onPrimaryFixed,
    @ColorConverter() required Color primaryFixedDim,
    @ColorConverter() required Color onPrimaryFixedVariant,
    @ColorConverter() required Color secondaryFixed,
    @ColorConverter() required Color onSecondaryFixed,
    @ColorConverter() required Color secondaryFixedDim,
    @ColorConverter() required Color onSecondaryFixedVariant,
    @ColorConverter() required Color tertiaryFixed,
    @ColorConverter() required Color onTertiaryFixed,
    @ColorConverter() required Color tertiaryFixedDim,
    @ColorConverter() required Color onTertiaryFixedVariant,
    @ColorConverter() required Color surfaceDim,
    @ColorConverter() required Color surfaceBright,
    @ColorConverter() required Color surfaceContainerLowest,
    @ColorConverter() required Color surfaceContainerLow,
    @ColorConverter() required Color surfaceContainer,
    @ColorConverter() required Color surfaceContainerHigh,
    @ColorConverter() required Color surfaceContainerHighest,
  }) = _FigmaScheme;

  factory FigmaScheme.fromDynamicScheme(mcu.DynamicScheme scheme) {
    const colors = mcu.MaterialDynamicColors();
    return FigmaScheme(
      primary: Color.argb(colors.primary().getArgb(scheme)),
      surfaceTint: Color.argb(colors.surfaceTint().getArgb(scheme)),
      onPrimary: Color.argb(colors.onPrimary().getArgb(scheme)),
      primaryContainer: Color.argb(colors.primaryContainer().getArgb(scheme)),
      onPrimaryContainer: Color.argb(
        colors.onPrimaryContainer().getArgb(scheme),
      ),
      secondary: Color.argb(colors.secondary().getArgb(scheme)),
      onSecondary: Color.argb(colors.onSecondary().getArgb(scheme)),
      secondaryContainer: Color.argb(
        colors.secondaryContainer().getArgb(scheme),
      ),
      onSecondaryContainer: Color.argb(
        colors.onSecondaryContainer().getArgb(scheme),
      ),
      tertiary: Color.argb(colors.tertiary().getArgb(scheme)),
      onTertiary: Color.argb(colors.onTertiary().getArgb(scheme)),
      tertiaryContainer: Color.argb(colors.tertiaryContainer().getArgb(scheme)),
      onTertiaryContainer: Color.argb(
        colors.onTertiaryContainer().getArgb(scheme),
      ),
      error: Color.argb(colors.error().getArgb(scheme)),
      onError: Color.argb(colors.onError().getArgb(scheme)),
      errorContainer: Color.argb(colors.errorContainer().getArgb(scheme)),
      onErrorContainer: Color.argb(colors.onErrorContainer().getArgb(scheme)),
      background: Color.argb(colors.background().getArgb(scheme)),
      onBackground: Color.argb(colors.onBackground().getArgb(scheme)),
      surface: Color.argb(colors.surface().getArgb(scheme)),
      onSurface: Color.argb(colors.onSurface().getArgb(scheme)),
      surfaceVariant: Color.argb(colors.surfaceVariant().getArgb(scheme)),
      onSurfaceVariant: Color.argb(colors.onSurfaceVariant().getArgb(scheme)),
      outline: Color.argb(colors.outline().getArgb(scheme)),
      outlineVariant: Color.argb(colors.outlineVariant().getArgb(scheme)),
      shadow: Color.argb(colors.shadow().getArgb(scheme)),
      scrim: Color.argb(colors.scrim().getArgb(scheme)),
      inverseSurface: Color.argb(colors.inverseSurface().getArgb(scheme)),
      inverseOnSurface: Color.argb(colors.inverseOnSurface().getArgb(scheme)),
      inversePrimary: Color.argb(colors.inversePrimary().getArgb(scheme)),
      primaryFixed: Color.argb(colors.primaryFixed().getArgb(scheme)),
      onPrimaryFixed: Color.argb(colors.onPrimaryFixed().getArgb(scheme)),
      primaryFixedDim: Color.argb(colors.primaryFixedDim().getArgb(scheme)),
      onPrimaryFixedVariant: Color.argb(
        colors.onPrimaryFixedVariant().getArgb(scheme),
      ),
      secondaryFixed: Color.argb(colors.secondaryFixed().getArgb(scheme)),
      onSecondaryFixed: Color.argb(colors.onSecondaryFixed().getArgb(scheme)),
      secondaryFixedDim: Color.argb(colors.secondaryFixedDim().getArgb(scheme)),
      onSecondaryFixedVariant: Color.argb(
        colors.onSecondaryFixedVariant().getArgb(scheme),
      ),
      tertiaryFixed: Color.argb(colors.tertiaryFixed().getArgb(scheme)),
      onTertiaryFixed: Color.argb(colors.onTertiaryFixed().getArgb(scheme)),
      tertiaryFixedDim: Color.argb(colors.tertiaryFixedDim().getArgb(scheme)),
      onTertiaryFixedVariant: Color.argb(
        colors.onTertiaryFixedVariant().getArgb(scheme),
      ),
      surfaceDim: Color.argb(colors.surfaceDim().getArgb(scheme)),
      surfaceBright: Color.argb(colors.surfaceBright().getArgb(scheme)),
      surfaceContainerLowest: Color.argb(
        colors.surfaceContainerLowest().getArgb(scheme),
      ),
      surfaceContainerLow: Color.argb(
        colors.surfaceContainerLow().getArgb(scheme),
      ),
      surfaceContainer: Color.argb(colors.surfaceContainer().getArgb(scheme)),
      surfaceContainerHigh: Color.argb(
        colors.surfaceContainerHigh().getArgb(scheme),
      ),
      surfaceContainerHighest: Color.argb(
        colors.surfaceContainerHighest().getArgb(scheme),
      ),
    );
  }

  factory FigmaScheme.fromJson(Map<String, Object?> json) =>
      _$FigmaSchemeFromJson(json);
}

@freezed
abstract class FigmaPalettes with _$FigmaPalettes {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory FigmaPalettes({
    @JsonKey(includeIfNull: false) FigmaPalette? primary,
    @JsonKey(includeIfNull: false) FigmaPalette? secondary,
    @JsonKey(includeIfNull: false) FigmaPalette? tertiary,
    @JsonKey(includeIfNull: false) FigmaPalette? neutral,
    @JsonKey(includeIfNull: false) FigmaPalette? neutralVariant,
    @JsonKey(includeIfNull: false) FigmaPalette? error,
  }) = _FigmaPalettes;

  factory FigmaPalettes.fromTonalPalettes({
    mcu.TonalPalette? primary,
    mcu.TonalPalette? secondary,
    mcu.TonalPalette? tertiary,
    mcu.TonalPalette? neutral,
    mcu.TonalPalette? neutralVariant,
    mcu.TonalPalette? error,
  }) {
    return FigmaPalettes(
      primary: primary != null ? FigmaPalette.fromTonalPalette(primary) : null,
      secondary: secondary != null
          ? FigmaPalette.fromTonalPalette(secondary)
          : null,
      tertiary: tertiary != null
          ? FigmaPalette.fromTonalPalette(tertiary)
          : null,
      neutral: neutral != null ? FigmaPalette.fromTonalPalette(neutral) : null,
      neutralVariant: neutralVariant != null
          ? FigmaPalette.fromTonalPalette(neutralVariant)
          : null,
      error: error != null ? FigmaPalette.fromTonalPalette(error) : null,
    );
  }

  factory FigmaPalettes.fromDynamicScheme(mcu.DynamicScheme scheme) {
    return FigmaPalettes.fromTonalPalettes(
      primary: scheme.primaryPalette,
      secondary: scheme.secondaryPalette,
      tertiary: scheme.tertiaryPalette,
      neutral: scheme.neutralPalette,
      neutralVariant: scheme.neutralVariantPalette,
      error: scheme.errorPalette,
    );
  }

  factory FigmaPalettes.fromJson(Map<String, Object?> json) =>
      _$FigmaPalettesFromJson(json);
}

@freezed
abstract class FigmaPalette with _$FigmaPalette {
  const FigmaPalette._();
  const factory FigmaPalette({
    @JsonKey(name: "0") @ColorConverter() required Color t0,
    @JsonKey(name: "5") @ColorConverter() required Color t5,
    @JsonKey(name: "10") @ColorConverter() required Color t10,
    @JsonKey(name: "15") @ColorConverter() required Color t15,
    @JsonKey(name: "20") @ColorConverter() required Color t20,
    @JsonKey(name: "25") @ColorConverter() required Color t25,
    @JsonKey(name: "30") @ColorConverter() required Color t30,
    @JsonKey(name: "35") @ColorConverter() required Color t35,
    @JsonKey(name: "40") @ColorConverter() required Color t40,
    @JsonKey(name: "50") @ColorConverter() required Color t50,
    @JsonKey(name: "60") @ColorConverter() required Color t60,
    @JsonKey(name: "70") @ColorConverter() required Color t70,
    @JsonKey(name: "80") @ColorConverter() required Color t80,
    @JsonKey(name: "90") @ColorConverter() required Color t90,
    @JsonKey(name: "95") @ColorConverter() required Color t95,
    @JsonKey(name: "98") @ColorConverter() required Color t98,
    @JsonKey(name: "99") @ColorConverter() required Color t99,
    @JsonKey(name: "100") @ColorConverter() required Color t100,
  }) = _FigmaPalette;

  factory FigmaPalette.fromTonalPalette(mcu.TonalPalette palette) {
    return FigmaPalette(
      t0: Color.argb(palette.getHct(0).toInt()),
      t5: Color.argb(palette.getHct(5).toInt()),
      t10: Color.argb(palette.getHct(10).toInt()),
      t15: Color.argb(palette.getHct(15).toInt()),
      t20: Color.argb(palette.getHct(20).toInt()),
      t25: Color.argb(palette.getHct(25).toInt()),
      t30: Color.argb(palette.getHct(30).toInt()),
      t35: Color.argb(palette.getHct(35).toInt()),
      t40: Color.argb(palette.getHct(40).toInt()),
      t50: Color.argb(palette.getHct(50).toInt()),
      t60: Color.argb(palette.getHct(60).toInt()),
      t70: Color.argb(palette.getHct(70).toInt()),
      t80: Color.argb(palette.getHct(80).toInt()),
      t90: Color.argb(palette.getHct(90).toInt()),
      t95: Color.argb(palette.getHct(95).toInt()),
      t98: Color.argb(palette.getHct(98).toInt()),
      t99: Color.argb(palette.getHct(99).toInt()),
      t100: Color.argb(palette.getHct(100).toInt()),
    );
  }

  factory FigmaPalette.fromJson(Map<String, Object?> json) =>
      _$FigmaPaletteFromJson(json);
}

@freezed
abstract class Template with _$Template {
  const factory Template({
    @JsonKey(includeIfNull: false) @ColorConverter() Color? sourceColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? primaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? secondaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? tertiaryPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? neutralVariantPaletteKeyColor,
    @JsonKey(includeIfNull: false)
    @ColorConverter()
    Color? errorPaletteKeyColor,
  }) = _Template;

  factory Template.fromJson(Map<String, Object?> json) =>
      _$TemplateFromJson(json);

  static const Template baseline = Template(
    sourceColor: Color.argb(0xFF6750A4),
  );
  static const Template nowInAndroid = Template(
    sourceColor: Color.argb(0xFF8C4190),
    primaryPaletteKeyColor: Color.argb(0xFF8C4190),
    secondaryPaletteKeyColor: Color.argb(0xFFFF8456),
    tertiaryPaletteKeyColor: Color.argb(0xFFB3E9FF),
    neutralPaletteKeyColor: Color.argb(0xFF201A1B),
  );
}
