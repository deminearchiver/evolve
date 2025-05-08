// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Figma _$FigmaFromJson(Map<String, dynamic> json) => _Figma(
  description: json['description'] as String? ?? "",
  seed: const ColorConverter().fromJson(json['seed'] as String),
  coreColors: FigmaCoreColors.fromJson(
    json['coreColors'] as Map<String, dynamic>,
  ),
  extendedColors:
      (json['extendedColors'] as List<dynamic>?)
          ?.map((e) => FigmaExtendedColor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  schemes: FigmaSchemes.fromJson(json['schemes'] as Map<String, dynamic>),
  palettes: FigmaPalettes.fromJson(json['palettes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FigmaToJson(_Figma instance) => <String, dynamic>{
  'description': instance.description,
  'seed': const ColorConverter().toJson(instance.seed),
  'coreColors': instance.coreColors,
  'extendedColors': instance.extendedColors,
  'schemes': instance.schemes,
  'palettes': instance.palettes,
};

_FigmaCoreColors _$FigmaCoreColorsFromJson(Map<String, dynamic> json) =>
    _FigmaCoreColors(
      primary: _$JsonConverterFromJson<String, Color>(
        json['primary'],
        const ColorConverter().fromJson,
      ),
      secondary: _$JsonConverterFromJson<String, Color>(
        json['secondary'],
        const ColorConverter().fromJson,
      ),
      tertiary: _$JsonConverterFromJson<String, Color>(
        json['tertiary'],
        const ColorConverter().fromJson,
      ),
      neutral: _$JsonConverterFromJson<String, Color>(
        json['neutral'],
        const ColorConverter().fromJson,
      ),
      neutralVariant: _$JsonConverterFromJson<String, Color>(
        json['neutralVariant'],
        const ColorConverter().fromJson,
      ),
      error: _$JsonConverterFromJson<String, Color>(
        json['error'],
        const ColorConverter().fromJson,
      ),
    );

Map<String, dynamic> _$FigmaCoreColorsToJson(_FigmaCoreColors instance) =>
    <String, dynamic>{
      if (_$JsonConverterToJson<String, Color>(
            instance.primary,
            const ColorConverter().toJson,
          )
          case final value?)
        'primary': value,
      if (_$JsonConverterToJson<String, Color>(
            instance.secondary,
            const ColorConverter().toJson,
          )
          case final value?)
        'secondary': value,
      if (_$JsonConverterToJson<String, Color>(
            instance.tertiary,
            const ColorConverter().toJson,
          )
          case final value?)
        'tertiary': value,
      if (_$JsonConverterToJson<String, Color>(
            instance.neutral,
            const ColorConverter().toJson,
          )
          case final value?)
        'neutral': value,
      if (_$JsonConverterToJson<String, Color>(
            instance.neutralVariant,
            const ColorConverter().toJson,
          )
          case final value?)
        'neutralVariant': value,
      if (_$JsonConverterToJson<String, Color>(
            instance.error,
            const ColorConverter().toJson,
          )
          case final value?)
        'error': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_FigmaExtendedColor _$FigmaExtendedColorFromJson(Map<String, dynamic> json) =>
    _FigmaExtendedColor(
      name: json['name'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
      description: json['description'] as String? ?? "",
      harmonized: json['harmonized'] as bool? ?? false,
    );

Map<String, dynamic> _$FigmaExtendedColorToJson(_FigmaExtendedColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'description': instance.description,
      'harmonized': instance.harmonized,
    };

_FigmaSchemes _$FigmaSchemesFromJson(Map<String, dynamic> json) =>
    _FigmaSchemes(
      light: FigmaScheme.fromJson(json['light'] as Map<String, dynamic>),
      lightMediumContrast: FigmaScheme.fromJson(
        json['light-medium-contrast'] as Map<String, dynamic>,
      ),
      lightHighContrast: FigmaScheme.fromJson(
        json['light-high-contrast'] as Map<String, dynamic>,
      ),
      dark: FigmaScheme.fromJson(json['dark'] as Map<String, dynamic>),
      darkMediumContrast: FigmaScheme.fromJson(
        json['dark-medium-contrast'] as Map<String, dynamic>,
      ),
      darkHighContrast: FigmaScheme.fromJson(
        json['dark-high-contrast'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FigmaSchemesToJson(_FigmaSchemes instance) =>
    <String, dynamic>{
      'light': instance.light,
      'light-medium-contrast': instance.lightMediumContrast,
      'light-high-contrast': instance.lightHighContrast,
      'dark': instance.dark,
      'dark-medium-contrast': instance.darkMediumContrast,
      'dark-high-contrast': instance.darkHighContrast,
    };

_FigmaScheme _$FigmaSchemeFromJson(Map<String, dynamic> json) => _FigmaScheme(
  primary: const ColorConverter().fromJson(json['primary'] as String),
  surfaceTint: const ColorConverter().fromJson(json['surfaceTint'] as String),
  onPrimary: const ColorConverter().fromJson(json['onPrimary'] as String),
  primaryContainer: const ColorConverter().fromJson(
    json['primaryContainer'] as String,
  ),
  onPrimaryContainer: const ColorConverter().fromJson(
    json['onPrimaryContainer'] as String,
  ),
  secondary: const ColorConverter().fromJson(json['secondary'] as String),
  onSecondary: const ColorConverter().fromJson(json['onSecondary'] as String),
  secondaryContainer: const ColorConverter().fromJson(
    json['secondaryContainer'] as String,
  ),
  onSecondaryContainer: const ColorConverter().fromJson(
    json['onSecondaryContainer'] as String,
  ),
  tertiary: const ColorConverter().fromJson(json['tertiary'] as String),
  onTertiary: const ColorConverter().fromJson(json['onTertiary'] as String),
  tertiaryContainer: const ColorConverter().fromJson(
    json['tertiaryContainer'] as String,
  ),
  onTertiaryContainer: const ColorConverter().fromJson(
    json['onTertiaryContainer'] as String,
  ),
  error: const ColorConverter().fromJson(json['error'] as String),
  onError: const ColorConverter().fromJson(json['onError'] as String),
  errorContainer: const ColorConverter().fromJson(
    json['errorContainer'] as String,
  ),
  onErrorContainer: const ColorConverter().fromJson(
    json['onErrorContainer'] as String,
  ),
  background: const ColorConverter().fromJson(json['background'] as String),
  onBackground: const ColorConverter().fromJson(json['onBackground'] as String),
  surface: const ColorConverter().fromJson(json['surface'] as String),
  onSurface: const ColorConverter().fromJson(json['onSurface'] as String),
  surfaceVariant: const ColorConverter().fromJson(
    json['surfaceVariant'] as String,
  ),
  onSurfaceVariant: const ColorConverter().fromJson(
    json['onSurfaceVariant'] as String,
  ),
  outline: const ColorConverter().fromJson(json['outline'] as String),
  outlineVariant: const ColorConverter().fromJson(
    json['outlineVariant'] as String,
  ),
  shadow: const ColorConverter().fromJson(json['shadow'] as String),
  scrim: const ColorConverter().fromJson(json['scrim'] as String),
  inverseSurface: const ColorConverter().fromJson(
    json['inverseSurface'] as String,
  ),
  inverseOnSurface: const ColorConverter().fromJson(
    json['inverseOnSurface'] as String,
  ),
  inversePrimary: const ColorConverter().fromJson(
    json['inversePrimary'] as String,
  ),
  primaryFixed: const ColorConverter().fromJson(json['primaryFixed'] as String),
  onPrimaryFixed: const ColorConverter().fromJson(
    json['onPrimaryFixed'] as String,
  ),
  primaryFixedDim: const ColorConverter().fromJson(
    json['primaryFixedDim'] as String,
  ),
  onPrimaryFixedVariant: const ColorConverter().fromJson(
    json['onPrimaryFixedVariant'] as String,
  ),
  secondaryFixed: const ColorConverter().fromJson(
    json['secondaryFixed'] as String,
  ),
  onSecondaryFixed: const ColorConverter().fromJson(
    json['onSecondaryFixed'] as String,
  ),
  secondaryFixedDim: const ColorConverter().fromJson(
    json['secondaryFixedDim'] as String,
  ),
  onSecondaryFixedVariant: const ColorConverter().fromJson(
    json['onSecondaryFixedVariant'] as String,
  ),
  tertiaryFixed: const ColorConverter().fromJson(
    json['tertiaryFixed'] as String,
  ),
  onTertiaryFixed: const ColorConverter().fromJson(
    json['onTertiaryFixed'] as String,
  ),
  tertiaryFixedDim: const ColorConverter().fromJson(
    json['tertiaryFixedDim'] as String,
  ),
  onTertiaryFixedVariant: const ColorConverter().fromJson(
    json['onTertiaryFixedVariant'] as String,
  ),
  surfaceDim: const ColorConverter().fromJson(json['surfaceDim'] as String),
  surfaceBright: const ColorConverter().fromJson(
    json['surfaceBright'] as String,
  ),
  surfaceContainerLowest: const ColorConverter().fromJson(
    json['surfaceContainerLowest'] as String,
  ),
  surfaceContainerLow: const ColorConverter().fromJson(
    json['surfaceContainerLow'] as String,
  ),
  surfaceContainer: const ColorConverter().fromJson(
    json['surfaceContainer'] as String,
  ),
  surfaceContainerHigh: const ColorConverter().fromJson(
    json['surfaceContainerHigh'] as String,
  ),
  surfaceContainerHighest: const ColorConverter().fromJson(
    json['surfaceContainerHighest'] as String,
  ),
);

Map<String, dynamic> _$FigmaSchemeToJson(
  _FigmaScheme instance,
) => <String, dynamic>{
  'primary': const ColorConverter().toJson(instance.primary),
  'surfaceTint': const ColorConverter().toJson(instance.surfaceTint),
  'onPrimary': const ColorConverter().toJson(instance.onPrimary),
  'primaryContainer': const ColorConverter().toJson(instance.primaryContainer),
  'onPrimaryContainer': const ColorConverter().toJson(
    instance.onPrimaryContainer,
  ),
  'secondary': const ColorConverter().toJson(instance.secondary),
  'onSecondary': const ColorConverter().toJson(instance.onSecondary),
  'secondaryContainer': const ColorConverter().toJson(
    instance.secondaryContainer,
  ),
  'onSecondaryContainer': const ColorConverter().toJson(
    instance.onSecondaryContainer,
  ),
  'tertiary': const ColorConverter().toJson(instance.tertiary),
  'onTertiary': const ColorConverter().toJson(instance.onTertiary),
  'tertiaryContainer': const ColorConverter().toJson(
    instance.tertiaryContainer,
  ),
  'onTertiaryContainer': const ColorConverter().toJson(
    instance.onTertiaryContainer,
  ),
  'error': const ColorConverter().toJson(instance.error),
  'onError': const ColorConverter().toJson(instance.onError),
  'errorContainer': const ColorConverter().toJson(instance.errorContainer),
  'onErrorContainer': const ColorConverter().toJson(instance.onErrorContainer),
  'background': const ColorConverter().toJson(instance.background),
  'onBackground': const ColorConverter().toJson(instance.onBackground),
  'surface': const ColorConverter().toJson(instance.surface),
  'onSurface': const ColorConverter().toJson(instance.onSurface),
  'surfaceVariant': const ColorConverter().toJson(instance.surfaceVariant),
  'onSurfaceVariant': const ColorConverter().toJson(instance.onSurfaceVariant),
  'outline': const ColorConverter().toJson(instance.outline),
  'outlineVariant': const ColorConverter().toJson(instance.outlineVariant),
  'shadow': const ColorConverter().toJson(instance.shadow),
  'scrim': const ColorConverter().toJson(instance.scrim),
  'inverseSurface': const ColorConverter().toJson(instance.inverseSurface),
  'inverseOnSurface': const ColorConverter().toJson(instance.inverseOnSurface),
  'inversePrimary': const ColorConverter().toJson(instance.inversePrimary),
  'primaryFixed': const ColorConverter().toJson(instance.primaryFixed),
  'onPrimaryFixed': const ColorConverter().toJson(instance.onPrimaryFixed),
  'primaryFixedDim': const ColorConverter().toJson(instance.primaryFixedDim),
  'onPrimaryFixedVariant': const ColorConverter().toJson(
    instance.onPrimaryFixedVariant,
  ),
  'secondaryFixed': const ColorConverter().toJson(instance.secondaryFixed),
  'onSecondaryFixed': const ColorConverter().toJson(instance.onSecondaryFixed),
  'secondaryFixedDim': const ColorConverter().toJson(
    instance.secondaryFixedDim,
  ),
  'onSecondaryFixedVariant': const ColorConverter().toJson(
    instance.onSecondaryFixedVariant,
  ),
  'tertiaryFixed': const ColorConverter().toJson(instance.tertiaryFixed),
  'onTertiaryFixed': const ColorConverter().toJson(instance.onTertiaryFixed),
  'tertiaryFixedDim': const ColorConverter().toJson(instance.tertiaryFixedDim),
  'onTertiaryFixedVariant': const ColorConverter().toJson(
    instance.onTertiaryFixedVariant,
  ),
  'surfaceDim': const ColorConverter().toJson(instance.surfaceDim),
  'surfaceBright': const ColorConverter().toJson(instance.surfaceBright),
  'surfaceContainerLowest': const ColorConverter().toJson(
    instance.surfaceContainerLowest,
  ),
  'surfaceContainerLow': const ColorConverter().toJson(
    instance.surfaceContainerLow,
  ),
  'surfaceContainer': const ColorConverter().toJson(instance.surfaceContainer),
  'surfaceContainerHigh': const ColorConverter().toJson(
    instance.surfaceContainerHigh,
  ),
  'surfaceContainerHighest': const ColorConverter().toJson(
    instance.surfaceContainerHighest,
  ),
};

_FigmaPalettes _$FigmaPalettesFromJson(Map<String, dynamic> json) =>
    _FigmaPalettes(
      primary:
          json['primary'] == null
              ? null
              : FigmaPalette.fromJson(json['primary'] as Map<String, dynamic>),
      secondary:
          json['secondary'] == null
              ? null
              : FigmaPalette.fromJson(
                json['secondary'] as Map<String, dynamic>,
              ),
      tertiary:
          json['tertiary'] == null
              ? null
              : FigmaPalette.fromJson(json['tertiary'] as Map<String, dynamic>),
      neutral:
          json['neutral'] == null
              ? null
              : FigmaPalette.fromJson(json['neutral'] as Map<String, dynamic>),
      neutralVariant:
          json['neutral-variant'] == null
              ? null
              : FigmaPalette.fromJson(
                json['neutral-variant'] as Map<String, dynamic>,
              ),
      error:
          json['error'] == null
              ? null
              : FigmaPalette.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FigmaPalettesToJson(_FigmaPalettes instance) =>
    <String, dynamic>{
      if (instance.primary case final value?) 'primary': value,
      if (instance.secondary case final value?) 'secondary': value,
      if (instance.tertiary case final value?) 'tertiary': value,
      if (instance.neutral case final value?) 'neutral': value,
      if (instance.neutralVariant case final value?) 'neutral-variant': value,
      if (instance.error case final value?) 'error': value,
    };

_FigmaPalette _$FigmaPaletteFromJson(Map<String, dynamic> json) =>
    _FigmaPalette(
      t0: const ColorConverter().fromJson(json['0'] as String),
      t5: const ColorConverter().fromJson(json['5'] as String),
      t10: const ColorConverter().fromJson(json['10'] as String),
      t15: const ColorConverter().fromJson(json['15'] as String),
      t20: const ColorConverter().fromJson(json['20'] as String),
      t25: const ColorConverter().fromJson(json['25'] as String),
      t30: const ColorConverter().fromJson(json['30'] as String),
      t35: const ColorConverter().fromJson(json['35'] as String),
      t40: const ColorConverter().fromJson(json['40'] as String),
      t50: const ColorConverter().fromJson(json['50'] as String),
      t60: const ColorConverter().fromJson(json['60'] as String),
      t70: const ColorConverter().fromJson(json['70'] as String),
      t80: const ColorConverter().fromJson(json['80'] as String),
      t90: const ColorConverter().fromJson(json['90'] as String),
      t95: const ColorConverter().fromJson(json['95'] as String),
      t98: const ColorConverter().fromJson(json['98'] as String),
      t99: const ColorConverter().fromJson(json['99'] as String),
      t100: const ColorConverter().fromJson(json['100'] as String),
    );

Map<String, dynamic> _$FigmaPaletteToJson(_FigmaPalette instance) =>
    <String, dynamic>{
      '0': const ColorConverter().toJson(instance.t0),
      '5': const ColorConverter().toJson(instance.t5),
      '10': const ColorConverter().toJson(instance.t10),
      '15': const ColorConverter().toJson(instance.t15),
      '20': const ColorConverter().toJson(instance.t20),
      '25': const ColorConverter().toJson(instance.t25),
      '30': const ColorConverter().toJson(instance.t30),
      '35': const ColorConverter().toJson(instance.t35),
      '40': const ColorConverter().toJson(instance.t40),
      '50': const ColorConverter().toJson(instance.t50),
      '60': const ColorConverter().toJson(instance.t60),
      '70': const ColorConverter().toJson(instance.t70),
      '80': const ColorConverter().toJson(instance.t80),
      '90': const ColorConverter().toJson(instance.t90),
      '95': const ColorConverter().toJson(instance.t95),
      '98': const ColorConverter().toJson(instance.t98),
      '99': const ColorConverter().toJson(instance.t99),
      '100': const ColorConverter().toJson(instance.t100),
    };

_Template _$TemplateFromJson(Map<String, dynamic> json) => _Template(
  sourceColor: _$JsonConverterFromJson<String, Color>(
    json['sourceColor'],
    const ColorConverter().fromJson,
  ),
  primaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['primaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  secondaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['secondaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  tertiaryPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['tertiaryPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  neutralVariantPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['neutralVariantPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
  errorPaletteKeyColor: _$JsonConverterFromJson<String, Color>(
    json['errorPaletteKeyColor'],
    const ColorConverter().fromJson,
  ),
);

Map<String, dynamic> _$TemplateToJson(_Template instance) => <String, dynamic>{
  if (_$JsonConverterToJson<String, Color>(
        instance.sourceColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'sourceColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.primaryPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'primaryPaletteKeyColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.secondaryPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'secondaryPaletteKeyColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.tertiaryPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'tertiaryPaletteKeyColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.neutralPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'neutralPaletteKeyColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.neutralVariantPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'neutralVariantPaletteKeyColor': value,
  if (_$JsonConverterToJson<String, Color>(
        instance.errorPaletteKeyColor,
        const ColorConverter().toJson,
      )
      case final value?)
    'errorPaletteKeyColor': value,
};
