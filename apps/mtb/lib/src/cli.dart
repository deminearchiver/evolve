import 'dart:async';
import 'dart:convert';

import 'package:change_case/change_case.dart';
import 'package:intl/intl.dart';
import 'package:promptly/promptly.dart';
import 'package:mtb/src/json.dart';

import 'package:mcu/mcu.dart' as mcu;

import 'color.dart';

const double contrastLevelLow = -1.0;
const contrastLevelNormal = 0.0;
const contrastLevelMedium = 0.5;
const contrastLevelHigh = 1.0;

Future<void> run(List<String> args) async {
  await Runner().safeRun(args);
}

class Runner extends CommandRunner {
  Runner()
    : super(
        "mtb",
        "Material Theme Builder",
        version: "0.0.1",
        theme: Theme.defaultTheme,
      ) {
    addCommand(CreateCommand());
  }
}

class MessageValidator<T extends Object?> implements Validator<T> {
  const MessageValidator(this.validator);

  final String? Function(T value) validator;

  @override
  RegExp? get pattern => null;

  @override
  set pattern(RegExp? _) {}

  @override
  String get message => "Value is not allowed";

  @override
  void call(T value) {
    if (validator(value) case final message?) {
      throw ValidationError(message);
    }
  }
}

class CreateCommand extends Command<int> {
  CreateCommand() : super("create", "Create a new Material Theme");

  @override
  Future<int> run() async {
    header(name, message: description);

    warning("Material Theme Builder");
    message(
      "Build a Material color scheme to map dynamic color, use as fallback colors, or implement a branded theme.",
    );
    line();
    message(
      "The color library automatically handles critical adjustments to the chroma and tone of inputs to create key colors.",
    );
    // line();
    // link(
    //   "https://m3.material.io/styles/color/roles/color-roles",
    //   // label: "Learn more about color roles",
    // );

    line();

    final template = selectOne(
      "Template",
      choices: PromptTemplate.values,
      defaultValue: PromptTemplate.none,
      display: PromptTemplate.display,
    );

    final Validator<String> validator = GenericValidator(
      "Invalid CSS color",
      (value) => Color.tryParse(value) != null,
    );
    final Validator<String> optionalValidator = GenericValidator(
      "Invalid CSS color",
      (value) => value.isEmpty || Color.tryParse(value) != null,
    );
    line();
    section("Source");
    final sourceColor = Color.parse(
      prompt(
        "Source color",
        defaultValue: switch (template) {
          PromptTemplate.baseline => "#6750A4",
          PromptTemplate.nowInAndroid => "#8C4190",
          _ => null,
        },
        validator: validator,
      ),
    );
    line();
    success("Source chosen");
    line();
    line();
    section(
      "Core colors",
      message:
          "Override or set key colors that will be used to generate tonal palettes and schemes.",
    );
    final primaryPaletteKeyColor = Color.tryParse(
      prompt(
        "Primary",
        defaultValue: switch (template) {
          PromptTemplate.nowInAndroid => "#8C4190",
          _ => null,
        },
        validator: optionalValidator,
      ),
    );
    line();
    final secondaryPaletteKeyColor = Color.tryParse(
      prompt(
        "Secondary",
        defaultValue: switch (template) {
          PromptTemplate.nowInAndroid => "#FF8456",
          _ => null,
        },
        validator: optionalValidator,
      ),
    );
    line();
    final tertiaryPaletteKeyColor = Color.tryParse(
      prompt(
        "Tertiary",
        defaultValue: switch (template) {
          PromptTemplate.nowInAndroid => "#B3E9FF",
          _ => null,
        },
        validator: optionalValidator,
      ),
    );
    line();
    final neutralPaletteKeyColor = Color.tryParse(
      prompt(
        "Neutral",
        defaultValue: switch (template) {
          PromptTemplate.nowInAndroid => "#201A1B",
          _ => null,
        },
        validator: optionalValidator,
      ),
    );
    line();
    final neutralVariantPaletteKeyColor = Color.tryParse(
      prompt(
        "Neutral variant",
        defaultValue: null,
        validator: optionalValidator,
      ),
    );
    line();
    final errorPaletteKeyColor = Color.tryParse(
      prompt("Error", defaultValue: null, validator: optionalValidator),
    );
    line();
    success("Core colors chosen");
    line();
    line();
    // info("Extended colors");
    // message(
    //   "Input a custom color that automatically gets assigned a set of complementary tones. Edit the source custom color to rename or delete. Harmonizing shifts the extended color towards the source color.",
    // );
    // line();
    // line();
    // selectOne("Edit extended colors", choices: ["Skip", "Add a color"]);
    final variant = selectOne(
      "Variant",
      choices: PromptVariant.values,
      defaultValue: PromptVariant.tonalSpot,
      display: PromptVariant.display,
    );
    line();
    final specVersion = selectOne(
      "Spec version",
      choices: PromptSpecVersion.values,
      defaultValue: PromptSpecVersion.spec2021,
      display: PromptSpecVersion.display,
    );
    line();
    final platform = selectOne(
      "Platform",
      choices: PromptPlatform.values,
      defaultValue: PromptPlatform.phone,
      display: PromptPlatform.display,
    );
    line();
    success("Parameters chosen");
    line();
    line();

    final schemes = DynamicSchemes.fromKeyColors(
      sourceColor: sourceColor,
      variant: variant.value,
      specVersion: specVersion.value,
      platform: platform.value,
      primary: primaryPaletteKeyColor,
      secondary: secondaryPaletteKeyColor,
      tertiary: tertiaryPaletteKeyColor,
      neutral: neutralPaletteKeyColor,
      neutralVariant: neutralVariantPaletteKeyColor,
      error: errorPaletteKeyColor,
    );
    line();
    line();
    section("Output", message: "Choose how the generated data will be saved");
    // final output = selectOne(
    //   "Write into",
    //   choices: PromptOutput.values,
    //   defaultValue: PromptOutput.console,
    //   display: PromptOutput.display,
    // );
    // line();
    final formats = selectAny(
      "Formats",
      choices: PromptFormat.values,
      defaultValues: [PromptFormat.materialThemeJson],
      display: PromptFormat.display,
    );
    line();
    if (formats.isEmpty) {
      return finishWithError(
        "Must select at least one format",
        message: "No formats were selected to export to",
        exitCode: 64,
      );
    }

    for (final format in formats) {
      switch (format) {
        case PromptFormat.materialThemeJson:
          // line();
          // section(
          //   "Material Theme (JSON)",
          //   message: "Configure the Material Theme (JSON) format",
          // );
          final exportedAt = DateTime.now();
          final dateFormat = DateFormat("y-MM-dd HH:mm:ss");
          final date = dateFormat.format(exportedAt);
          final data = Figma(
            description:
                "TYPE: CUSTOM\n"
                "Material Theme Builder export $date",
            seed: sourceColor,
            coreColors: FigmaCoreColors(
              primary: primaryPaletteKeyColor ?? sourceColor,
              secondary: secondaryPaletteKeyColor,
              tertiary: tertiaryPaletteKeyColor,
              neutral: neutralPaletteKeyColor,
              neutralVariant: neutralVariantPaletteKeyColor,
              error: errorPaletteKeyColor,
            ),
            extendedColors: [],
            schemes: schemes.toFigmaSchemes(),
            palettes: FigmaPalettes(),
          );
          final json = data.toJson();
          final encoder = JsonEncoder.withIndent(" " * 2);
          final encoded = encoder.convert(json);
          success("Successfully encoded into Material Theme (JSON) format");
          line();
          message(encoded);
        case PromptFormat.webCss:
          line();
          section(
            "Web (CSS)",
            message: "Configuration for the Web (CSS) format",
          );
          final modes = selectAny(
            "Modes",
            choices: PromptMode.values,
            defaultValues: [PromptMode.light, PromptMode.dark],
            display: PromptMode.display,
          );
          line();
          final contrastLevels = selectAny(
            "Contrast levels",
            choices: PromptContrastLevel.values,
            defaultValues: [PromptContrastLevel.normal],
            display: PromptContrastLevel.display,
          );
          line();
          final buffer = StringBuffer();
          bool firstIteration = true;
          final dynamicColors =
              const mcu.MaterialDynamicColors().allDynamicColors;
          for (final mode in modes) {
            final modePrefix = switch (mode) {
              PromptMode.light => "light",
              PromptMode.dark => "dark",
            };
            for (final contrastLevel in contrastLevels) {
              final contrastLevelSuffix = switch (contrastLevel) {
                PromptContrastLevel.normal => null,
                PromptContrastLevel.medium => "medium-contrast",
                PromptContrastLevel.high => "high-contrast",
              };
              final className = [modePrefix, ?contrastLevelSuffix].join("-");
              final selector = ".$className";
              final scheme = mcu.DynamicScheme.fromKeyColors(
                sourceColorHct: sourceColor.hct,
                isDark: mode.isDark,
                contrastLevel: contrastLevel.value,
                variant: variant.value,
                specVersion: specVersion.value,
                platform: platform.value,
                primaryPaletteKeyColor: primaryPaletteKeyColor?.hct,
                secondaryPaletteKeyColor: secondaryPaletteKeyColor?.hct,
                tertiaryPaletteKeyColor: tertiaryPaletteKeyColor?.hct,
                neutralPaletteKeyColor: neutralPaletteKeyColor?.hct,
                neutralVariantPaletteKeyColor:
                    neutralVariantPaletteKeyColor?.hct,
                errorPaletteKeyColor: errorPaletteKeyColor?.hct,
              );
              if (!firstIteration) {
                buffer.write("\n");
              }
              buffer.writeln("$selector {");
              for (final dynamicColor in dynamicColors) {
                final color = Color.argb(dynamicColor.getArgb(scheme));
                final name = dynamicColor.name.toKebabCase();
                final prefix = "md-sys-color";
                final fullName = "$prefix-$name";
                final propertyName = "--$fullName";
                final propertyDeclaration = "$propertyName: #${color.hex};";
                final line = " " * 2 + propertyDeclaration;
                buffer.writeln(line);
              }
              buffer.writeln("}");
              firstIteration = false;
            }
          }
          message(buffer.toString());
        default:
          break;
      }
    }

    line();

    return finishSuccesfuly(
      "Done",
      message: "Finished work",
      suggestion:
          "Import the generated JSON into Figma using the Material Theme Builder plugin.",
    );
  }
}

enum PromptTemplate {
  none,
  baseline,
  nowInAndroid;

  static String display(PromptTemplate value) => switch (value) {
    none => "None",
    baseline => "Baseline",
    nowInAndroid => "Now in Android",
  };
}

enum PromptMode {
  light,
  dark;

  bool get isDark => switch (this) {
    PromptMode.light => false,
    PromptMode.dark => true,
  };

  static String display(PromptMode value) => switch (value) {
    PromptMode.light => "Light",
    PromptMode.dark => "Dark",
  };
}

enum PromptContrastLevel {
  normal(0.0),
  medium(0.5),
  high(1.0);

  const PromptContrastLevel(this.value);

  final double value;

  static String display(PromptContrastLevel value) => switch (value) {
    PromptContrastLevel.normal => "Normal",
    PromptContrastLevel.medium => "Medium",
    PromptContrastLevel.high => "High",
  };
}

enum PromptSource {
  color,
  image;

  static String display(PromptSource value) => switch (value) {
    color => "Color",
    image => "Image",
  };
}

enum PromptOutput {
  console,
  file;

  static String display(PromptOutput value) => switch (value) {
    console => "Console",
    file => "File",
  };
}

enum PromptFormat {
  materialThemeJson,
  webCss,
  webSass,
  flutterDart,
  jetpackComposeKotlin,
  androidViewsXml;

  static String display(PromptFormat value) => switch (value) {
    materialThemeJson => "Material Theme (JSON)",
    webCss => "Web (CSS)",
    webSass => "Web (Sass)",
    flutterDart => "Flutter (Dart)",
    jetpackComposeKotlin => "Jetpack Compose (Kotlin)",
    androidViewsXml => "Android Views (XML)",
  };
}

enum PromptVariant {
  monochrome(mcu.Variant.monochrome),
  neutral(mcu.Variant.neutral),
  tonalSpot(mcu.Variant.tonalSpot),
  vibrant(mcu.Variant.vibrant),
  expressive(mcu.Variant.expressive),
  fidelity(mcu.Variant.fidelity),
  content(mcu.Variant.content),
  rainbow(mcu.Variant.rainbow),
  fruitSalad(mcu.Variant.fruitSalad);

  const PromptVariant(this.value);

  final mcu.Variant value;

  static String display(PromptVariant value) => switch (value) {
    monochrome => "Monochrome",
    neutral => "Neutral",
    tonalSpot => "Tonal spot",
    vibrant => "Vibrant",
    expressive => "Expressive",
    fidelity => "Fidelity",
    content => "Content",
    rainbow => "Rainbow",
    fruitSalad => "Fruit salad",
  };
}

enum PromptSpecVersion {
  spec2021(mcu.SpecVersion.spec2021),
  spec2025(mcu.SpecVersion.spec2025);

  const PromptSpecVersion(this.value);
  final mcu.SpecVersion value;

  static String display(PromptSpecVersion value) => switch (value) {
    spec2021 => "2021",
    spec2025 => "2025",
  };
}

enum PromptPlatform {
  phone(mcu.Platform.phone),
  watch(mcu.Platform.watch);

  const PromptPlatform(this.value);
  final mcu.Platform value;

  static String display(PromptPlatform value) => switch (value) {
    phone => "Phone",
    watch => "Watch",
  };
}

class DynamicSchemes {
  const DynamicSchemes({
    required this.sourceColor,
    this.variant = mcu.Variant.tonalSpot,
    this.specVersion = mcu.SpecVersion.spec2021,
    this.platform = mcu.Platform.phone,
    this.primaryPaletteKeyColor,
    this.secondaryPaletteKeyColor,
    this.tertiaryPaletteKeyColor,
    this.neutralPaletteKeyColor,
    this.neutralVariantPaletteKeyColor,
    this.errorPaletteKeyColor,
    required this.light,
    required this.lightMediumContrast,
    required this.lightHighContrast,
    required this.dark,
    required this.darkMediumContrast,
    required this.darkHighContrast,
  });

  factory DynamicSchemes.fromSourceColor({
    required Color sourceColor,
    mcu.Variant variant = mcu.Variant.tonalSpot,
    mcu.SpecVersion specVersion = mcu.SpecVersion.spec2021,
    mcu.Platform platform = mcu.Platform.phone,
  }) {
    final sourceColorHct = sourceColor.hct;
    return DynamicSchemes(
      sourceColor: sourceColor,
      variant: variant,
      specVersion: specVersion,
      platform: platform,
      light: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelNormal,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
      lightMediumContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelMedium,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
      lightHighContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelHigh,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
      dark: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelNormal,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
      darkMediumContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelMedium,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
      darkHighContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelHigh,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
      ),
    );
  }
  factory DynamicSchemes.fromTonalPalettes({
    required Color sourceColor,
    mcu.Variant variant = mcu.Variant.tonalSpot,
    mcu.SpecVersion specVersion = mcu.SpecVersion.spec2021,
    mcu.Platform platform = mcu.Platform.phone,
    mcu.TonalPalette? primaryPalette,
    mcu.TonalPalette? secondaryPalette,
    mcu.TonalPalette? tertiaryPalette,
    mcu.TonalPalette? neutralPalette,
    mcu.TonalPalette? neutralVariantPalette,
    mcu.TonalPalette? errorPalette,
  }) {
    final sourceColorHct = sourceColor.hct;
    return DynamicSchemes(
      sourceColor: sourceColor,
      variant: variant,
      specVersion: specVersion,
      platform: platform,
      primaryPaletteKeyColor: primaryPalette != null
          ? Color.hct(primaryPalette.keyColor)
          : null,
      secondaryPaletteKeyColor: secondaryPalette != null
          ? Color.hct(secondaryPalette.keyColor)
          : null,
      tertiaryPaletteKeyColor: tertiaryPalette != null
          ? Color.hct(tertiaryPalette.keyColor)
          : null,
      neutralPaletteKeyColor: neutralPalette != null
          ? Color.hct(neutralPalette.keyColor)
          : null,
      neutralVariantPaletteKeyColor: neutralVariantPalette != null
          ? Color.hct(neutralVariantPalette.keyColor)
          : null,
      errorPaletteKeyColor: errorPalette != null
          ? Color.hct(errorPalette.keyColor)
          : null,
      light: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelNormal,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
      lightMediumContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelMedium,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
      lightHighContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelHigh,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
      dark: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelNormal,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
      darkMediumContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelMedium,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
      darkHighContrast: mcu.DynamicScheme.fromVariant(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelHigh,
        specVersion: specVersion,
        platform: platform,
        variant: variant,
        primaryPalette: primaryPalette,
        secondaryPalette: secondaryPalette,
        tertiaryPalette: tertiaryPalette,
        neutralPalette: neutralPalette,
        neutralVariantPalette: neutralVariantPalette,
        errorPalette: errorPalette,
      ),
    );
  }

  factory DynamicSchemes.fromKeyColors({
    required Color sourceColor,
    mcu.Variant variant = mcu.Variant.tonalSpot,
    mcu.SpecVersion specVersion = mcu.SpecVersion.spec2021,
    mcu.Platform platform = mcu.Platform.phone,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? neutral,
    Color? neutralVariant,
    Color? error,
  }) {
    final sourceColorHct = sourceColor.hct;
    final primaryPaletteKeyColor = primary?.hct;
    final secondaryPaletteKeyColor = secondary?.hct;
    final tertiaryPaletteKeyColor = tertiary?.hct;
    final neutralPaletteKeyColor = neutral?.hct;
    final neutralVariantPaletteKeyColor = neutralVariant?.hct;
    final errorPaletteKeyColor = error?.hct;
    return DynamicSchemes(
      sourceColor: sourceColor,
      variant: variant,
      specVersion: specVersion,
      platform: platform,
      primaryPaletteKeyColor: primary,
      secondaryPaletteKeyColor: secondary,
      tertiaryPaletteKeyColor: tertiary,
      neutralPaletteKeyColor: neutral,
      neutralVariantPaletteKeyColor: neutralVariant,
      errorPaletteKeyColor: error,
      light: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelNormal,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
      lightMediumContrast: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelMedium,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
      lightHighContrast: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: false,
        contrastLevel: contrastLevelHigh,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
      dark: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelNormal,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
      darkMediumContrast: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelMedium,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
      darkHighContrast: mcu.DynamicScheme.fromKeyColors(
        sourceColorHct: sourceColorHct,
        isDark: true,
        contrastLevel: contrastLevelHigh,
        variant: variant,
        specVersion: specVersion,
        platform: platform,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
      ),
    );
  }

  factory DynamicSchemes.fromDynamicScheme(mcu.DynamicScheme scheme) {
    return DynamicSchemes.fromKeyColors(
      sourceColor: Color.hct(scheme.sourceColorHct),
      variant: scheme.variant,
      specVersion: scheme.specVersion,
      platform: scheme.platform,
      primary: Color.hct(scheme.primaryPalette.keyColor),
      secondary: Color.hct(scheme.secondaryPalette.keyColor),
      tertiary: Color.hct(scheme.tertiaryPalette.keyColor),
      neutral: Color.hct(scheme.neutralPalette.keyColor),
      neutralVariant: Color.hct(scheme.neutralVariantPalette.keyColor),
      error: Color.hct(scheme.errorPalette.keyColor),
    );
  }

  final Color sourceColor;
  final mcu.Variant variant;
  final mcu.SpecVersion specVersion;
  final mcu.Platform platform;

  final Color? primaryPaletteKeyColor;
  final Color? secondaryPaletteKeyColor;
  final Color? tertiaryPaletteKeyColor;
  final Color? neutralPaletteKeyColor;
  final Color? neutralVariantPaletteKeyColor;
  final Color? errorPaletteKeyColor;

  final mcu.DynamicScheme light;
  final mcu.DynamicScheme lightMediumContrast;
  final mcu.DynamicScheme lightHighContrast;
  final mcu.DynamicScheme dark;
  final mcu.DynamicScheme darkMediumContrast;
  final mcu.DynamicScheme darkHighContrast;

  FigmaSchemes toFigmaSchemes() => FigmaSchemes.fromDynamicSchemes(
    light: light,
    lightMediumContrast: lightMediumContrast,
    lightHighContrast: lightHighContrast,
    dark: dark,
    darkMediumContrast: darkMediumContrast,
    darkHighContrast: darkHighContrast,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is DynamicSchemes &&
            light == other.light &&
            lightMediumContrast == other.lightMediumContrast &&
            lightHighContrast == other.lightHighContrast &&
            dark == other.dark &&
            darkMediumContrast == other.darkMediumContrast &&
            darkHighContrast == other.darkHighContrast;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    light,
    lightMediumContrast,
    lightHighContrast,
    dark,
    darkMediumContrast,
    darkHighContrast,
  );
}
