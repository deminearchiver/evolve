import 'dart:convert';
import 'dart:io';
import 'package:mcu/mcu.dart';
import 'package:mtb/api.dart';
import 'package:change_case/change_case.dart';
import 'package:mtb/src/cli.dart' show DynamicSchemes;
import 'package:mtb/src/color.dart';
import 'package:mtb/src/json.dart';
import 'package:change_case/change_case.dart';

const List<Variant> variants = Variant.values;
const List<SpecVersion> specVersions = SpecVersion.values;
const List<Platform> platforms = Platform.values;

class SeedColors {
  const SeedColors({
    required this.sourceColor,
    this.primaryPaletteKeyColor,
    this.secondaryPaletteKeyColor,
    this.tertiaryPaletteKeyColor,
    this.neutralPaletteKeyColor,
    this.neutralVariantPaletteKeyColor,
    this.errorPaletteKeyColor,
  });

  final Color sourceColor;
  final Color? primaryPaletteKeyColor;
  final Color? secondaryPaletteKeyColor;
  final Color? tertiaryPaletteKeyColor;
  final Color? neutralPaletteKeyColor;
  final Color? neutralVariantPaletteKeyColor;
  final Color? errorPaletteKeyColor;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is SeedColors &&
            sourceColor == other.sourceColor &&
            primaryPaletteKeyColor == other.primaryPaletteKeyColor &&
            secondaryPaletteKeyColor == other.secondaryPaletteKeyColor &&
            tertiaryPaletteKeyColor == other.tertiaryPaletteKeyColor &&
            neutralPaletteKeyColor == other.neutralPaletteKeyColor &&
            neutralVariantPaletteKeyColor ==
                other.neutralVariantPaletteKeyColor &&
            errorPaletteKeyColor == other.errorPaletteKeyColor;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sourceColor,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
  );
}

const String baseline = "baseline";
const String nowInAndroid = "now_in_android";
const String figmaDesign = "figmadesign";
const String figmaDevMode = "figmadevmode";

const Map<String, SeedColors> seedColorsToThemeNameMap = {
  baseline: SeedColors(sourceColor: Color.argb(0xFF6750A4)),
  nowInAndroid: SeedColors(
    sourceColor: Color.argb(0xFF8C4190),
    // primaryPaletteKeyColorArgb: 0xFF8C4190,
    secondaryPaletteKeyColor: Color.argb(0xFFFF8456),
    tertiaryPaletteKeyColor: Color.argb(0xFFB3E9FF),
    neutralPaletteKeyColor: Color.argb(0xFF201A1B),
  ),
  // figmaDesign: SeedColors(sourceColor: Color.argb(0xFF0d99ff)),
  // figmaDevMode: SeedColors(sourceColor: Color.argb(0xFF14ae5c)),
};

final Set<DynamicSchemes> seen = <DynamicSchemes>{};

final allDynamicColors = [
  ...const MaterialDynamicColors().allDynamicColors,
  ...const AndroidDynamicColors().allDynamicColors,
];

void main() async {
  final List<Future<File>> futures = [];
  for (final entry in seedColorsToThemeNameMap.entries) {
    final name = entry.key;
    final seedColors = entry.value;
    for (final variant in variants) {
      for (final specVersion in specVersions) {
        for (final platform in platforms) {
          final schemes = DynamicSchemes.fromKeyColors(
            sourceColor: seedColors.sourceColor,
            primary: seedColors.primaryPaletteKeyColor,
            secondary: seedColors.secondaryPaletteKeyColor,
            tertiary: seedColors.tertiaryPaletteKeyColor,
            neutral: seedColors.neutralPaletteKeyColor,
            neutralVariant: seedColors.neutralVariantPaletteKeyColor,
            error: seedColors.errorPaletteKeyColor,
            variant: variant,
            specVersion: specVersion,
            platform: platform,
          );
          final data = Figma(
            description:
                "TYPE: CUSTOM\n"
                "Material Theme Builder export",
            seed: seedColors.sourceColor,
            coreColors: FigmaCoreColors(
              primary:
                  seedColors.primaryPaletteKeyColor ?? seedColors.sourceColor,
              secondary: seedColors.secondaryPaletteKeyColor,
              tertiary: seedColors.tertiaryPaletteKeyColor,
              neutral: seedColors.neutralPaletteKeyColor,
              neutralVariant: seedColors.neutralVariantPaletteKeyColor,
              error: seedColors.errorPaletteKeyColor,
            ),
            extendedColors: const [],
            schemes: schemes.toFigmaSchemes(),
            palettes: const FigmaPalettes(),
          );
          final json = data.toJson();
          final encoder = JsonEncoder.withIndent(" " * 2);
          final encoded = encoder.convert(json);
          final fileName =
              "${name}_${variant._name}_${specVersion._name}_${platform._name}.json";

          final path = "./example/generated/$fileName";
          final file = File(path);
          print("Writing: $path");
          final future = file
              .create(recursive: true)
              .then((file) => file.writeAsString(encoded));
          futures.add(future);

          final css = StringBuffer();

          // Light

          void write(String selector, DynamicScheme scheme) {
            css.writeln("$selector {");
            for (final dynamicColor in allDynamicColors) {
              final variableName =
                  "md-sys-color-${dynamicColor.name.toKebabCase()}";
              final variableProperty = "--$variableName";
              final variableValue =
                  "#${Color.argb(dynamicColor.getArgb(scheme)).hex}";
              css.writeln("  $variableProperty: $variableValue;");
            }
            css.writeln("}");
          }

          write(".light", schemes.light);
          write(".dark", schemes.dark);

          final cssContents = css.toString();
          final cssFileName =
              "${name}_${variant._name}_${specVersion._name}_${platform._name}.css";
          final cssPath = "./example/css/$cssFileName";
          final cssFile = File(cssPath);
          print("Writing: $cssPath");
          final cssFuture = cssFile
              .create(recursive: true)
              .then((file) => file.writeAsString(cssContents));
          futures.add(cssFuture);
        }
      }
    }
  }
  await Future.wait(futures);
}

// String buildJson({
//   required Variant variant,
//   required SpecVersion specVersion,
//   required Platform platform,
// }) {}

extension on Variant {
  String get _name => switch (this) {
    Variant.monochrome => "monochrome",
    Variant.neutral => "neutral",
    Variant.tonalSpot => "tonalspot",
    Variant.vibrant => "vibrant",
    Variant.expressive => "expressive",
    Variant.fidelity => "fidelity",
    Variant.content => "content",
    Variant.rainbow => "rainbow",
    Variant.fruitSalad => "fruitsalad",
  };
}

extension on SpecVersion {
  String get _name => switch (this) {
    SpecVersion.spec2021 => "2021",
    SpecVersion.spec2025 => "2025",
  };
}

extension on Platform {
  String get _name => switch (this) {
    Platform.phone => "phone",
    Platform.watch => "watch",
  };
}
