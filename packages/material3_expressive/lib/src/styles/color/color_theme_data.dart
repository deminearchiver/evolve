part of 'color.dart';

@immutable
abstract class ColorThemeData
    with Diagnosticable
    implements ColorThemeDataPartial {
  const factory ColorThemeData({
    required Brightness brightness,
    required Color primaryPaletteKeyColor,
    required Color secondaryPaletteKeyColor,
    required Color tertiaryPaletteKeyColor,
    required Color neutralPaletteKeyColor,
    required Color neutralVariantPaletteKeyColor,
    required Color errorPaletteKeyColor,
    required Color background,
    required Color onBackground,
    required Color surface,
    required Color surfaceDim,
    required Color surfaceBright,
    required Color surfaceContainerLowest,
    required Color surfaceContainerLow,
    required Color surfaceContainer,
    required Color surfaceContainerHigh,
    required Color surfaceContainerHighest,
    required Color onSurface,
    required Color surfaceVariant,
    required Color onSurfaceVariant,
    required Color outline,
    required Color outlineVariant,
    required Color inverseSurface,
    required Color inverseOnSurface,
    required Color shadow,
    required Color scrim,
    required Color surfaceTint,
    required Color primary,
    required Color primaryDim,
    required Color onPrimary,
    required Color primaryContainer,
    required Color onPrimaryContainer,
    required Color primaryFixed,
    required Color primaryFixedDim,
    required Color onPrimaryFixed,
    required Color onPrimaryFixedVariant,
    required Color inversePrimary,
    required Color secondary,
    required Color secondaryDim,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color onSecondaryContainer,
    required Color secondaryFixed,
    required Color secondaryFixedDim,
    required Color onSecondaryFixed,
    required Color onSecondaryFixedVariant,
    required Color tertiary,
    required Color tertiaryDim,
    required Color onTertiary,
    required Color tertiaryContainer,
    required Color onTertiaryContainer,
    required Color tertiaryFixed,
    required Color tertiaryFixedDim,
    required Color onTertiaryFixed,
    required Color onTertiaryFixedVariant,
    required Color error,
    required Color errorDim,
    required Color onError,
    required Color errorContainer,
    required Color onErrorContainer,
    required Color controlActivated,
    required Color controlNormal,
    required Color controlHighlight,
    required Color textPrimaryInverse,
    required Color textSecondaryAndTertiaryInverse,
    required Color textPrimaryInverseDisableOnly,
    required Color textSecondaryAndTertiaryInverseDisabled,
    required Color textHintInverse,
  }) = _ColorThemeData;

  factory ColorThemeData.fromDynamicScheme(mcu.DynamicScheme scheme) {
    const colors = mcu.MaterialDynamicColors();
    return ColorThemeData(
      brightness: scheme.isDark ? Brightness.dark : Brightness.light,
      primaryPaletteKeyColor: colors.primaryPaletteKeyColor()._getColor(scheme),
      secondaryPaletteKeyColor: colors.secondaryPaletteKeyColor()._getColor(
        scheme,
      ),
      tertiaryPaletteKeyColor: colors.tertiaryPaletteKeyColor()._getColor(
        scheme,
      ),
      neutralPaletteKeyColor: colors.neutralPaletteKeyColor()._getColor(scheme),
      neutralVariantPaletteKeyColor: colors
          .neutralVariantPaletteKeyColor()
          ._getColor(scheme),
      errorPaletteKeyColor: colors.errorPaletteKeyColor()._getColor(scheme),
      background: colors.background()._getColor(scheme),
      onBackground: colors.onBackground()._getColor(scheme),
      surface: colors.surface()._getColor(scheme),
      surfaceDim: colors.surfaceDim()._getColor(scheme),
      surfaceBright: colors.surfaceBright()._getColor(scheme),
      surfaceContainerLowest: colors.surfaceContainerLowest()._getColor(scheme),
      surfaceContainerLow: colors.surfaceContainerLow()._getColor(scheme),
      surfaceContainer: colors.surfaceContainer()._getColor(scheme),
      surfaceContainerHigh: colors.surfaceContainerHigh()._getColor(scheme),
      surfaceContainerHighest: colors.surfaceContainerHighest()._getColor(
        scheme,
      ),
      onSurface: colors.onSurface()._getColor(scheme),
      surfaceVariant: colors.surfaceVariant()._getColor(scheme),
      onSurfaceVariant: colors.onSurfaceVariant()._getColor(scheme),
      outline: colors.outline()._getColor(scheme),
      outlineVariant: colors.outlineVariant()._getColor(scheme),
      inverseSurface: colors.inverseSurface()._getColor(scheme),
      inverseOnSurface: colors.inverseOnSurface()._getColor(scheme),
      shadow: colors.shadow()._getColor(scheme),
      scrim: colors.scrim()._getColor(scheme),
      surfaceTint: colors.surfaceTint()._getColor(scheme),
      primary: colors.primary()._getColor(scheme),
      primaryDim: colors.primaryDim()._getColor(scheme),
      onPrimary: colors.onPrimary()._getColor(scheme),
      primaryContainer: colors.primaryContainer()._getColor(scheme),
      onPrimaryContainer: colors.onPrimaryContainer()._getColor(scheme),
      primaryFixed: colors.primaryFixed()._getColor(scheme),
      primaryFixedDim: colors.primaryFixedDim()._getColor(scheme),
      onPrimaryFixed: colors.onPrimaryFixed()._getColor(scheme),
      onPrimaryFixedVariant: colors.onPrimaryFixedVariant()._getColor(scheme),
      inversePrimary: colors.inversePrimary()._getColor(scheme),
      secondary: colors.secondary()._getColor(scheme),
      secondaryDim: colors.secondaryDim()._getColor(scheme),
      onSecondary: colors.onSecondary()._getColor(scheme),
      secondaryContainer: colors.secondaryContainer()._getColor(scheme),
      onSecondaryContainer: colors.onSecondaryContainer()._getColor(scheme),
      secondaryFixed: colors.secondaryFixed()._getColor(scheme),
      secondaryFixedDim: colors.secondaryFixedDim()._getColor(scheme),
      onSecondaryFixed: colors.onSecondaryFixed()._getColor(scheme),
      onSecondaryFixedVariant: colors.onSecondaryFixedVariant()._getColor(
        scheme,
      ),
      tertiary: colors.tertiary()._getColor(scheme),
      tertiaryDim: colors.tertiaryDim()._getColor(scheme),
      onTertiary: colors.onTertiary()._getColor(scheme),
      tertiaryContainer: colors.tertiaryContainer()._getColor(scheme),
      onTertiaryContainer: colors.onTertiaryContainer()._getColor(scheme),
      tertiaryFixed: colors.tertiaryFixed()._getColor(scheme),
      tertiaryFixedDim: colors.tertiaryFixedDim()._getColor(scheme),
      onTertiaryFixed: colors.onTertiaryFixed()._getColor(scheme),
      onTertiaryFixedVariant: colors.onTertiaryFixedVariant()._getColor(scheme),
      error: colors.error()._getColor(scheme),
      errorDim: colors.errorDim()._getColor(scheme),
      onError: colors.onError()._getColor(scheme),
      errorContainer: colors.errorContainer()._getColor(scheme),
      onErrorContainer: colors.onErrorContainer()._getColor(scheme),
      controlActivated: colors.controlActivated()._getColor(scheme),
      controlNormal: colors.controlNormal()._getColor(scheme),
      controlHighlight: colors.controlHighlight()._getColor(scheme),
      textPrimaryInverse: colors.textPrimaryInverse()._getColor(scheme),
      textSecondaryAndTertiaryInverse: colors
          .textSecondaryAndTertiaryInverse()
          ._getColor(scheme),
      textPrimaryInverseDisableOnly: colors
          .textPrimaryInverseDisableOnly()
          ._getColor(scheme),
      textSecondaryAndTertiaryInverseDisabled: colors
          .textSecondaryAndTertiaryInverseDisabled()
          ._getColor(scheme),
      textHintInverse: colors.textHintInverse()._getColor(scheme),
    );
  }

  factory ColorThemeData.fromSourceColor({
    required DynamicSchemeVariant variant,
    required Color sourceColor,
    required Brightness brightness,
    double contrastLevel = ContrastLevel.normal,
    DynamicSchemeVersion? version,
    DynamicSchemePlatform? platform,
  }) {
    final scheme = _buildDynamicScheme(
      variant: variant,
      sourceColor: sourceColor,
      brightness: brightness,
      contrastLevel: contrastLevel,
      version: version,
      platform: platform,
    );
    return ColorThemeData.fromDynamicScheme(scheme);
  }

  factory ColorThemeData.baseline({
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
    Color sourceColor = _baselineSourceColor,
    required Brightness brightness,
    double contrastLevel = 0.0,
    DynamicSchemeVersion? version,
    DynamicSchemePlatform? platform,
  }) => ColorThemeData.fromSourceColor(
    variant: variant,
    sourceColor: sourceColor,
    brightness: brightness,
    contrastLevel: contrastLevel,
    version: version,
    platform: platform,
  );

  @override
  Brightness get brightness;

  @override
  Color get primaryPaletteKeyColor;

  @override
  Color get secondaryPaletteKeyColor;

  @override
  Color get tertiaryPaletteKeyColor;

  @override
  Color get neutralPaletteKeyColor;

  @override
  Color get neutralVariantPaletteKeyColor;

  @override
  Color get errorPaletteKeyColor;

  @override
  Color get background;

  @override
  Color get onBackground;

  @override
  Color get surface;

  @override
  Color get surfaceDim;

  @override
  Color get surfaceBright;

  @override
  Color get surfaceContainerLowest;

  @override
  Color get surfaceContainerLow;

  @override
  Color get surfaceContainer;

  @override
  Color get surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest;

  @override
  Color get onSurface;

  @override
  Color get surfaceVariant;

  @override
  Color get onSurfaceVariant;

  @override
  Color get outline;

  @override
  Color get outlineVariant;

  @override
  Color get inverseSurface;

  @override
  Color get inverseOnSurface;

  @override
  Color get shadow;

  @override
  Color get scrim;

  @override
  Color get surfaceTint;

  @override
  Color get primary;

  @override
  Color get primaryDim;

  @override
  Color get onPrimary;

  @override
  Color get primaryContainer;

  @override
  Color get onPrimaryContainer;

  @override
  Color get primaryFixed;

  @override
  Color get primaryFixedDim;

  @override
  Color get onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant;

  @override
  Color get inversePrimary;

  @override
  Color get secondary;

  @override
  Color get secondaryDim;

  @override
  Color get onSecondary;

  @override
  Color get secondaryContainer;

  @override
  Color get onSecondaryContainer;

  @override
  Color get secondaryFixed;

  @override
  Color get secondaryFixedDim;

  @override
  Color get onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant;

  @override
  Color get tertiary;

  @override
  Color get tertiaryDim;

  @override
  Color get onTertiary;

  @override
  Color get tertiaryContainer;

  @override
  Color get onTertiaryContainer;

  @override
  Color get tertiaryFixed;

  @override
  Color get tertiaryFixedDim;

  @override
  Color get onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant;

  @override
  Color get error;

  @override
  Color get errorDim;

  @override
  Color get onError;

  @override
  Color get errorContainer;

  @override
  Color get onErrorContainer;

  @override
  Color get controlActivated;

  @override
  Color get controlNormal;

  @override
  Color get controlHighlight;

  @override
  Color get textPrimaryInverse;

  @override
  Color get textSecondaryAndTertiaryInverse;

  @override
  Color get textPrimaryInverseDisableOnly;

  @override
  Color get textSecondaryAndTertiaryInverseDisabled;

  @override
  Color get textHintInverse;

  @override
  ColorThemeData copyWith({
    Brightness? brightness,
    Color? primaryPaletteKeyColor,
    Color? secondaryPaletteKeyColor,
    Color? tertiaryPaletteKeyColor,
    Color? neutralPaletteKeyColor,
    Color? neutralVariantPaletteKeyColor,
    Color? errorPaletteKeyColor,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? primary,
    Color? primaryDim,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
    Color? secondary,
    Color? secondaryDim,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? tertiaryDim,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? errorDim,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? controlActivated,
    Color? controlNormal,
    Color? controlHighlight,
    Color? textPrimaryInverse,
    Color? textSecondaryAndTertiaryInverse,
    Color? textPrimaryInverseDisableOnly,
    Color? textSecondaryAndTertiaryInverseDisabled,
    Color? textHintInverse,
  });

  @override
  ColorThemeData merge(ColorThemeDataPartial? other);

  flutter_material.ColorScheme toColorScheme();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

  static const Color _baselineSourceColor = Color(0xFF6750A4);
}

mixin ColorThemeDataMixin on Diagnosticable implements ColorThemeData {
  @override
  ColorThemeData copyWith({
    Brightness? brightness,
    Color? primaryPaletteKeyColor,
    Color? secondaryPaletteKeyColor,
    Color? tertiaryPaletteKeyColor,
    Color? neutralPaletteKeyColor,
    Color? neutralVariantPaletteKeyColor,
    Color? errorPaletteKeyColor,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? primary,
    Color? primaryDim,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
    Color? secondary,
    Color? secondaryDim,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? tertiaryDim,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? errorDim,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? controlActivated,
    Color? controlNormal,
    Color? controlHighlight,
    Color? textPrimaryInverse,
    Color? textSecondaryAndTertiaryInverse,
    Color? textPrimaryInverseDisableOnly,
    Color? textSecondaryAndTertiaryInverseDisabled,
    Color? textHintInverse,
  }) {
    if (brightness != null &&
        primaryPaletteKeyColor == null &&
        secondaryPaletteKeyColor == null &&
        tertiaryPaletteKeyColor == null &&
        neutralPaletteKeyColor == null &&
        neutralVariantPaletteKeyColor == null &&
        errorPaletteKeyColor == null &&
        background == null &&
        onBackground == null &&
        surface == null &&
        surfaceDim == null &&
        surfaceBright == null &&
        surfaceContainerLowest == null &&
        surfaceContainerLow == null &&
        surfaceContainer == null &&
        surfaceContainerHigh == null &&
        surfaceContainerHighest == null &&
        onSurface == null &&
        surfaceVariant == null &&
        onSurfaceVariant == null &&
        outline == null &&
        outlineVariant == null &&
        inverseSurface == null &&
        inverseOnSurface == null &&
        shadow == null &&
        scrim == null &&
        surfaceTint == null &&
        primary == null &&
        primaryDim == null &&
        onPrimary == null &&
        primaryContainer == null &&
        onPrimaryContainer == null &&
        primaryFixed == null &&
        primaryFixedDim == null &&
        onPrimaryFixed == null &&
        onPrimaryFixedVariant == null &&
        inversePrimary == null &&
        secondary == null &&
        secondaryDim == null &&
        onSecondary == null &&
        secondaryContainer == null &&
        onSecondaryContainer == null &&
        secondaryFixed == null &&
        secondaryFixedDim == null &&
        onSecondaryFixed == null &&
        onSecondaryFixedVariant == null &&
        tertiary == null &&
        tertiaryDim == null &&
        onTertiary == null &&
        tertiaryContainer == null &&
        onTertiaryContainer == null &&
        tertiaryFixed == null &&
        tertiaryFixedDim == null &&
        onTertiaryFixed == null &&
        onTertiaryFixedVariant == null &&
        error == null &&
        errorDim == null &&
        onError == null &&
        errorContainer == null &&
        onErrorContainer == null &&
        controlActivated == null &&
        controlNormal == null &&
        controlHighlight == null &&
        textPrimaryInverse == null &&
        textSecondaryAndTertiaryInverse == null &&
        textPrimaryInverseDisableOnly == null &&
        textSecondaryAndTertiaryInverseDisabled == null &&
        textHintInverse == null) {
      return this;
    }
    return ColorThemeData(
      brightness: brightness ?? this.brightness,
      primaryPaletteKeyColor:
          primaryPaletteKeyColor ?? this.primaryPaletteKeyColor,
      secondaryPaletteKeyColor:
          secondaryPaletteKeyColor ?? this.secondaryPaletteKeyColor,
      tertiaryPaletteKeyColor:
          tertiaryPaletteKeyColor ?? this.tertiaryPaletteKeyColor,
      neutralPaletteKeyColor:
          neutralPaletteKeyColor ?? this.neutralPaletteKeyColor,
      neutralVariantPaletteKeyColor:
          neutralVariantPaletteKeyColor ?? this.neutralVariantPaletteKeyColor,
      errorPaletteKeyColor: errorPaletteKeyColor ?? this.errorPaletteKeyColor,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      primary: primary ?? this.primary,
      primaryDim: primaryDim ?? this.primaryDim,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
      onPrimaryFixedVariant:
          onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      secondary: secondary ?? this.secondary,
      secondaryDim: secondaryDim ?? this.secondaryDim,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      secondaryFixed: secondaryFixed ?? this.secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
      tertiary: tertiary ?? this.tertiary,
      tertiaryDim: tertiaryDim ?? this.tertiaryDim,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
      onTertiaryFixedVariant:
          onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
      error: error ?? this.error,
      errorDim: errorDim ?? this.errorDim,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      controlActivated: controlActivated ?? this.controlActivated,
      controlNormal: controlNormal ?? this.controlNormal,
      controlHighlight: controlHighlight ?? this.controlHighlight,
      textPrimaryInverse: textPrimaryInverse ?? this.textPrimaryInverse,
      textSecondaryAndTertiaryInverse:
          textSecondaryAndTertiaryInverse ??
          this.textSecondaryAndTertiaryInverse,
      textPrimaryInverseDisableOnly:
          textPrimaryInverseDisableOnly ?? this.textPrimaryInverseDisableOnly,
      textSecondaryAndTertiaryInverseDisabled:
          textSecondaryAndTertiaryInverseDisabled ??
          this.textSecondaryAndTertiaryInverseDisabled,
      textHintInverse: textHintInverse ?? this.textHintInverse,
    );
  }

  @override
  ColorThemeData merge(ColorThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      brightness: other.brightness,
      primaryPaletteKeyColor: other.primaryPaletteKeyColor,
      secondaryPaletteKeyColor: other.secondaryPaletteKeyColor,
      tertiaryPaletteKeyColor: other.tertiaryPaletteKeyColor,
      neutralPaletteKeyColor: other.neutralPaletteKeyColor,
      neutralVariantPaletteKeyColor: other.neutralVariantPaletteKeyColor,
      errorPaletteKeyColor: other.errorPaletteKeyColor,
      background: other.background,
      onBackground: other.onBackground,
      surface: other.surface,
      surfaceDim: other.surfaceDim,
      surfaceBright: other.surfaceBright,
      surfaceContainerLowest: other.surfaceContainerLowest,
      surfaceContainerLow: other.surfaceContainerLow,
      surfaceContainer: other.surfaceContainer,
      surfaceContainerHigh: other.surfaceContainerHigh,
      surfaceContainerHighest: other.surfaceContainerHighest,
      onSurface: other.onSurface,
      surfaceVariant: other.surfaceVariant,
      onSurfaceVariant: other.onSurfaceVariant,
      outline: other.outline,
      outlineVariant: other.outlineVariant,
      inverseSurface: other.inverseSurface,
      inverseOnSurface: other.inverseOnSurface,
      shadow: other.shadow,
      scrim: other.scrim,
      surfaceTint: other.surfaceTint,
      primary: other.primary,
      primaryDim: other.primaryDim,
      onPrimary: other.onPrimary,
      primaryContainer: other.primaryContainer,
      onPrimaryContainer: other.onPrimaryContainer,
      primaryFixed: other.primaryFixed,
      primaryFixedDim: other.primaryFixedDim,
      onPrimaryFixed: other.onPrimaryFixed,
      onPrimaryFixedVariant: other.onPrimaryFixedVariant,
      inversePrimary: other.inversePrimary,
      secondary: other.secondary,
      secondaryDim: other.secondaryDim,
      onSecondary: other.onSecondary,
      secondaryContainer: other.secondaryContainer,
      onSecondaryContainer: other.onSecondaryContainer,
      secondaryFixed: other.secondaryFixed,
      secondaryFixedDim: other.secondaryFixedDim,
      onSecondaryFixed: other.onSecondaryFixed,
      onSecondaryFixedVariant: other.onSecondaryFixedVariant,
      tertiary: other.tertiary,
      tertiaryDim: other.tertiaryDim,
      onTertiary: other.onTertiary,
      tertiaryContainer: other.tertiaryContainer,
      onTertiaryContainer: other.onTertiaryContainer,
      tertiaryFixed: other.tertiaryFixed,
      tertiaryFixedDim: other.tertiaryFixedDim,
      onTertiaryFixed: other.onTertiaryFixed,
      onTertiaryFixedVariant: other.onTertiaryFixedVariant,
      error: other.error,
      errorDim: other.errorDim,
      onError: other.onError,
      errorContainer: other.errorContainer,
      onErrorContainer: other.onErrorContainer,
      controlActivated: other.controlActivated,
      controlNormal: other.controlNormal,
      controlHighlight: other.controlHighlight,
      textPrimaryInverse: other.textPrimaryInverse,
      textSecondaryAndTertiaryInverse: other.textSecondaryAndTertiaryInverse,
      textPrimaryInverseDisableOnly: other.textPrimaryInverseDisableOnly,
      textSecondaryAndTertiaryInverseDisabled:
          other.textSecondaryAndTertiaryInverseDisabled,
      textHintInverse: other.textHintInverse,
    );
  }

  @override
  flutter_material.ColorScheme toColorScheme() =>
      _ColorSchemeFromColorThemeData(this);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Brightness>("brightness", brightness));
    properties.add(
      ColorProperty("primaryPaletteKeyColor", primaryPaletteKeyColor),
    );
    properties.add(
      ColorProperty("secondaryPaletteKeyColor", secondaryPaletteKeyColor),
    );
    properties.add(
      ColorProperty("tertiaryPaletteKeyColor", tertiaryPaletteKeyColor),
    );
    properties.add(
      ColorProperty("neutralPaletteKeyColor", neutralPaletteKeyColor),
    );
    properties.add(
      ColorProperty(
        "neutralVariantPaletteKeyColor",
        neutralVariantPaletteKeyColor,
      ),
    );
    properties.add(ColorProperty("errorPaletteKeyColor", errorPaletteKeyColor));
    properties.add(ColorProperty("background", background));
    properties.add(ColorProperty("onBackground", onBackground));
    properties.add(ColorProperty("surface", surface));
    properties.add(ColorProperty("surfaceDim", surfaceDim));
    properties.add(ColorProperty("surfaceBright", surfaceBright));
    properties.add(
      ColorProperty("surfaceContainerLowest", surfaceContainerLowest),
    );
    properties.add(ColorProperty("surfaceContainerLow", surfaceContainerLow));
    properties.add(ColorProperty("surfaceContainer", surfaceContainer));
    properties.add(ColorProperty("surfaceContainerHigh", surfaceContainerHigh));
    properties.add(
      ColorProperty("surfaceContainerHighest", surfaceContainerHighest),
    );
    properties.add(ColorProperty("onSurface", onSurface));
    properties.add(ColorProperty("surfaceVariant", surfaceVariant));
    properties.add(ColorProperty("onSurfaceVariant", onSurfaceVariant));
    properties.add(ColorProperty("outline", outline));
    properties.add(ColorProperty("outlineVariant", outlineVariant));
    properties.add(ColorProperty("inverseSurface", inverseSurface));
    properties.add(ColorProperty("inverseOnSurface", inverseOnSurface));
    properties.add(ColorProperty("shadow", shadow));
    properties.add(ColorProperty("scrim", scrim));
    properties.add(ColorProperty("surfaceTint", surfaceTint));
    properties.add(ColorProperty("primary", primary));
    properties.add(ColorProperty("primaryDim", primaryDim));
    properties.add(ColorProperty("onPrimary", onPrimary));
    properties.add(ColorProperty("primaryContainer", primaryContainer));
    properties.add(ColorProperty("onPrimaryContainer", onPrimaryContainer));
    properties.add(ColorProperty("primaryFixed", primaryFixed));
    properties.add(ColorProperty("primaryFixedDim", primaryFixedDim));
    properties.add(ColorProperty("onPrimaryFixed", onPrimaryFixed));
    properties.add(
      ColorProperty("onPrimaryFixedVariant", onPrimaryFixedVariant),
    );
    properties.add(ColorProperty("inversePrimary", inversePrimary));
    properties.add(ColorProperty("secondary", secondary));
    properties.add(ColorProperty("secondaryDim", secondaryDim));
    properties.add(ColorProperty("onSecondary", onSecondary));
    properties.add(ColorProperty("secondaryContainer", secondaryContainer));
    properties.add(ColorProperty("onSecondaryContainer", onSecondaryContainer));
    properties.add(ColorProperty("secondaryFixed", secondaryFixed));
    properties.add(ColorProperty("secondaryFixedDim", secondaryFixedDim));
    properties.add(ColorProperty("onSecondaryFixed", onSecondaryFixed));
    properties.add(
      ColorProperty("onSecondaryFixedVariant", onSecondaryFixedVariant),
    );
    properties.add(ColorProperty("tertiary", tertiary));
    properties.add(ColorProperty("tertiaryDim", tertiaryDim));
    properties.add(ColorProperty("onTertiary", onTertiary));
    properties.add(ColorProperty("tertiaryContainer", tertiaryContainer));
    properties.add(ColorProperty("onTertiaryContainer", onTertiaryContainer));
    properties.add(ColorProperty("tertiaryFixed", tertiaryFixed));
    properties.add(ColorProperty("tertiaryFixedDim", tertiaryFixedDim));
    properties.add(ColorProperty("onTertiaryFixed", onTertiaryFixed));
    properties.add(
      ColorProperty("onTertiaryFixedVariant", onTertiaryFixedVariant),
    );
    properties.add(ColorProperty("error", error));
    properties.add(ColorProperty("errorDim", errorDim));
    properties.add(ColorProperty("onError", onError));
    properties.add(ColorProperty("errorContainer", errorContainer));
    properties.add(ColorProperty("onErrorContainer", onErrorContainer));
    properties.add(ColorProperty("controlActivated", controlActivated));
    properties.add(ColorProperty("controlNormal", controlNormal));
    properties.add(ColorProperty("controlHighlight", controlHighlight));
    properties.add(ColorProperty("textPrimaryInverse", textPrimaryInverse));
    properties.add(
      ColorProperty(
        "textSecondaryAndTertiaryInverse",
        textSecondaryAndTertiaryInverse,
      ),
    );
    properties.add(
      ColorProperty(
        "textPrimaryInverseDisableOnly",
        textPrimaryInverseDisableOnly,
      ),
    );
    properties.add(
      ColorProperty(
        "textSecondaryAndTertiaryInverseDisabled",
        textSecondaryAndTertiaryInverseDisabled,
      ),
    );
    properties.add(ColorProperty("textHintInverse", textHintInverse));
  }
}

@immutable
class _ColorThemeData with Diagnosticable, ColorThemeDataMixin {
  const _ColorThemeData({
    required this.brightness,
    required this.primaryPaletteKeyColor,
    required this.secondaryPaletteKeyColor,
    required this.tertiaryPaletteKeyColor,
    required this.neutralPaletteKeyColor,
    required this.neutralVariantPaletteKeyColor,
    required this.errorPaletteKeyColor,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.shadow,
    required this.scrim,
    required this.surfaceTint,
    required this.primary,
    required this.primaryDim,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.inversePrimary,
    required this.secondary,
    required this.secondaryDim,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiary,
    required this.tertiaryDim,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.error,
    required this.errorDim,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.controlActivated,
    required this.controlNormal,
    required this.controlHighlight,
    required this.textPrimaryInverse,
    required this.textSecondaryAndTertiaryInverse,
    required this.textPrimaryInverseDisableOnly,
    required this.textSecondaryAndTertiaryInverseDisabled,
    required this.textHintInverse,
  });

  @override
  final Brightness brightness;

  @override
  final Color primaryPaletteKeyColor;

  @override
  final Color secondaryPaletteKeyColor;

  @override
  final Color tertiaryPaletteKeyColor;

  @override
  final Color neutralPaletteKeyColor;

  @override
  final Color neutralVariantPaletteKeyColor;

  @override
  final Color errorPaletteKeyColor;

  @override
  final Color background;

  @override
  final Color onBackground;

  @override
  final Color surface;

  @override
  final Color surfaceDim;

  @override
  final Color surfaceBright;

  @override
  final Color surfaceContainerLowest;

  @override
  final Color surfaceContainerLow;

  @override
  final Color surfaceContainer;

  @override
  final Color surfaceContainerHigh;

  @override
  final Color surfaceContainerHighest;

  @override
  final Color onSurface;

  @override
  final Color surfaceVariant;

  @override
  final Color onSurfaceVariant;

  @override
  final Color outline;

  @override
  final Color outlineVariant;

  @override
  final Color inverseSurface;

  @override
  final Color inverseOnSurface;

  @override
  final Color shadow;

  @override
  final Color scrim;

  @override
  final Color surfaceTint;

  @override
  final Color primary;

  @override
  final Color primaryDim;

  @override
  final Color onPrimary;

  @override
  final Color primaryContainer;

  @override
  final Color onPrimaryContainer;

  @override
  final Color primaryFixed;

  @override
  final Color primaryFixedDim;

  @override
  final Color onPrimaryFixed;

  @override
  final Color onPrimaryFixedVariant;

  @override
  final Color inversePrimary;

  @override
  final Color secondary;

  @override
  final Color secondaryDim;

  @override
  final Color onSecondary;

  @override
  final Color secondaryContainer;

  @override
  final Color onSecondaryContainer;

  @override
  final Color secondaryFixed;

  @override
  final Color secondaryFixedDim;

  @override
  final Color onSecondaryFixed;

  @override
  final Color onSecondaryFixedVariant;

  @override
  final Color tertiary;

  @override
  final Color tertiaryDim;

  @override
  final Color onTertiary;

  @override
  final Color tertiaryContainer;

  @override
  final Color onTertiaryContainer;

  @override
  final Color tertiaryFixed;

  @override
  final Color tertiaryFixedDim;

  @override
  final Color onTertiaryFixed;

  @override
  final Color onTertiaryFixedVariant;

  @override
  final Color error;

  @override
  final Color errorDim;

  @override
  final Color onError;

  @override
  final Color errorContainer;

  @override
  final Color onErrorContainer;

  @override
  final Color controlActivated;

  @override
  final Color controlNormal;

  @override
  final Color controlHighlight;

  @override
  final Color textPrimaryInverse;

  @override
  final Color textSecondaryAndTertiaryInverse;

  @override
  final Color textPrimaryInverseDisableOnly;

  @override
  final Color textSecondaryAndTertiaryInverseDisabled;

  @override
  final Color textHintInverse;
}

@immutable
class _ColorSchemeFromColorThemeData
    with Diagnosticable
    implements flutter_material.ColorScheme {
  const _ColorSchemeFromColorThemeData(
    ColorThemeData colorTheme, {
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
    Color? background,
    Color? onBackground,
    Color? surfaceVariant,
  }) : _color = colorTheme,
       _brightness = brightness,
       _primary = primary,
       _onPrimary = onPrimary,
       _primaryContainer = primaryContainer,
       _onPrimaryContainer = onPrimaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _secondary = secondary,
       _onSecondary = onSecondary,
       _secondaryContainer = secondaryContainer,
       _onSecondaryContainer = onSecondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _tertiary = tertiary,
       _onTertiary = onTertiary,
       _tertiaryContainer = tertiaryContainer,
       _onTertiaryContainer = onTertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _error = error,
       _onError = onError,
       _errorContainer = errorContainer,
       _onErrorContainer = onErrorContainer,
       _surface = surface,
       _onSurface = onSurface,
       _surfaceDim = surfaceDim,
       _surfaceBright = surfaceBright,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _onSurfaceVariant = onSurfaceVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _shadow = shadow,
       _scrim = scrim,
       _inverseSurface = inverseSurface,
       _onInverseSurface = onInverseSurface,
       _inversePrimary = inversePrimary,
       _surfaceTint = surfaceTint,
       _background = background,
       _onBackground = onBackground,
       _surfaceVariant = surfaceVariant;

  final ColorThemeData _color;

  final Brightness? _brightness;
  final Color? _primary;
  final Color? _onPrimary;
  final Color? _primaryContainer;
  final Color? _onPrimaryContainer;
  final Color? _primaryFixed;
  final Color? _primaryFixedDim;
  final Color? _onPrimaryFixed;
  final Color? _onPrimaryFixedVariant;
  final Color? _secondary;
  final Color? _onSecondary;
  final Color? _secondaryContainer;
  final Color? _onSecondaryContainer;
  final Color? _secondaryFixed;
  final Color? _secondaryFixedDim;
  final Color? _onSecondaryFixed;
  final Color? _onSecondaryFixedVariant;
  final Color? _tertiary;
  final Color? _onTertiary;
  final Color? _tertiaryContainer;
  final Color? _onTertiaryContainer;
  final Color? _tertiaryFixed;
  final Color? _tertiaryFixedDim;
  final Color? _onTertiaryFixed;
  final Color? _onTertiaryFixedVariant;
  final Color? _error;
  final Color? _onError;
  final Color? _errorContainer;
  final Color? _onErrorContainer;
  final Color? _surface;
  final Color? _onSurface;
  final Color? _surfaceDim;
  final Color? _surfaceBright;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _onSurfaceVariant;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _shadow;
  final Color? _scrim;
  final Color? _inverseSurface;
  final Color? _onInverseSurface;
  final Color? _inversePrimary;
  final Color? _surfaceTint;
  final Color? _background;
  final Color? _onBackground;
  final Color? _surfaceVariant;

  @override
  Brightness get brightness => _brightness ?? _color.brightness;

  @override
  Color get primary => _primary ?? _color.primary;

  @override
  Color get onPrimary => _onPrimary ?? _color.onPrimary;

  @override
  Color get primaryContainer => _primaryContainer ?? _color.primaryContainer;

  @override
  Color get onPrimaryContainer =>
      _onPrimaryContainer ?? _color.onPrimaryContainer;

  @override
  Color get primaryFixed => _primaryFixed ?? _color.primaryFixed;

  @override
  Color get primaryFixedDim => _primaryFixedDim ?? _color.primaryFixedDim;

  @override
  Color get onPrimaryFixed => _onPrimaryFixed ?? _color.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _color.onPrimaryFixedVariant;

  @override
  Color get secondary => _secondary ?? _color.secondary;

  @override
  Color get onSecondary => _onSecondary ?? _color.onSecondary;

  @override
  Color get secondaryContainer =>
      _secondaryContainer ?? _color.secondaryContainer;

  @override
  Color get onSecondaryContainer =>
      _onSecondaryContainer ?? _color.onSecondaryContainer;

  @override
  Color get secondaryFixed => _secondaryFixed ?? _color.secondaryFixed;

  @override
  Color get secondaryFixedDim => _secondaryFixedDim ?? _color.secondaryFixedDim;

  @override
  Color get onSecondaryFixed => _onSecondaryFixed ?? _color.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _color.onSecondaryFixedVariant;

  @override
  Color get tertiary => _tertiary ?? _color.tertiary;

  @override
  Color get onTertiary => _onTertiary ?? _color.onTertiary;

  @override
  Color get tertiaryContainer => _tertiaryContainer ?? _color.tertiaryContainer;

  @override
  Color get onTertiaryContainer =>
      _onTertiaryContainer ?? _color.onTertiaryContainer;

  @override
  Color get tertiaryFixed => _tertiaryFixed ?? _color.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => _tertiaryFixedDim ?? _color.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => _onTertiaryFixed ?? _color.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _color.onTertiaryFixedVariant;

  @override
  Color get error => _error ?? _color.error;

  @override
  Color get onError => _onError ?? _color.onError;

  @override
  Color get errorContainer => _errorContainer ?? _color.errorContainer;

  @override
  Color get onErrorContainer => _onErrorContainer ?? _color.onErrorContainer;

  @override
  Color get surface => _surface ?? _color.surface;

  @override
  Color get onSurface => _onSurface ?? _color.onSurface;

  @override
  Color get surfaceDim => _surfaceDim ?? _color.surfaceDim;

  @override
  Color get surfaceBright => _surfaceBright ?? _color.surfaceBright;

  @override
  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _color.surfaceContainerLowest;

  @override
  Color get surfaceContainerLow =>
      _surfaceContainerLow ?? _color.surfaceContainerLow;

  @override
  Color get surfaceContainer => _surfaceContainer ?? _color.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _color.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _color.surfaceContainerHighest;

  @override
  Color get onSurfaceVariant => _onSurfaceVariant ?? _color.onSurfaceVariant;

  @override
  Color get outline => _outline ?? _color.outline;

  @override
  Color get outlineVariant => _outlineVariant ?? _color.outlineVariant;

  @override
  Color get shadow => _shadow ?? _color.shadow;

  @override
  Color get scrim => _scrim ?? _color.scrim;

  @override
  Color get inverseSurface => _inverseSurface ?? _color.inverseSurface;

  @override
  Color get onInverseSurface => _onInverseSurface ?? _color.inverseOnSurface;

  @override
  Color get inversePrimary => _inversePrimary ?? _color.inversePrimary;

  @override
  Color get surfaceTint => _surfaceTint ?? _color.surfaceTint;

  @override
  Color get background => _background ?? _color.background;

  @override
  Color get onBackground => _onBackground ?? _color.onBackground;

  @override
  Color get surfaceVariant => _surfaceVariant ?? _color.surfaceVariant;

  @override
  flutter_material.ColorScheme copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? surface,
    Color? onSurface,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? surfaceTint,
    Color? background,
    Color? onBackground,
    Color? surfaceVariant,
  }) {
    if (brightness == null &&
        primary == null &&
        onPrimary == null &&
        primaryContainer == null &&
        onPrimaryContainer == null &&
        primaryFixed == null &&
        primaryFixedDim == null &&
        onPrimaryFixed == null &&
        onPrimaryFixedVariant == null &&
        secondary == null &&
        onSecondary == null &&
        secondaryContainer == null &&
        onSecondaryContainer == null &&
        secondaryFixed == null &&
        secondaryFixedDim == null &&
        onSecondaryFixed == null &&
        onSecondaryFixedVariant == null &&
        tertiary == null &&
        onTertiary == null &&
        tertiaryContainer == null &&
        onTertiaryContainer == null &&
        tertiaryFixed == null &&
        tertiaryFixedDim == null &&
        onTertiaryFixed == null &&
        onTertiaryFixedVariant == null &&
        error == null &&
        onError == null &&
        errorContainer == null &&
        onErrorContainer == null &&
        surface == null &&
        onSurface == null &&
        surfaceDim == null &&
        surfaceBright == null &&
        surfaceContainerLowest == null &&
        surfaceContainerLow == null &&
        surfaceContainer == null &&
        surfaceContainerHigh == null &&
        surfaceContainerHighest == null &&
        onSurfaceVariant == null &&
        outline == null &&
        outlineVariant == null &&
        shadow == null &&
        scrim == null &&
        inverseSurface == null &&
        onInverseSurface == null &&
        inversePrimary == null &&
        surfaceTint == null &&
        background == null &&
        onBackground == null &&
        surfaceVariant == null) {
      return this;
    }
    if (brightness != null &&
        primary != null &&
        onPrimary != null &&
        primaryContainer != null &&
        onPrimaryContainer != null &&
        primaryFixed != null &&
        primaryFixedDim != null &&
        onPrimaryFixed != null &&
        onPrimaryFixedVariant != null &&
        secondary != null &&
        onSecondary != null &&
        secondaryContainer != null &&
        onSecondaryContainer != null &&
        secondaryFixed != null &&
        secondaryFixedDim != null &&
        onSecondaryFixed != null &&
        onSecondaryFixedVariant != null &&
        tertiary != null &&
        onTertiary != null &&
        tertiaryContainer != null &&
        onTertiaryContainer != null &&
        tertiaryFixed != null &&
        tertiaryFixedDim != null &&
        onTertiaryFixed != null &&
        onTertiaryFixedVariant != null &&
        error != null &&
        onError != null &&
        errorContainer != null &&
        onErrorContainer != null &&
        surface != null &&
        onSurface != null &&
        surfaceDim != null &&
        surfaceBright != null &&
        surfaceContainerLowest != null &&
        surfaceContainerLow != null &&
        surfaceContainer != null &&
        surfaceContainerHigh != null &&
        surfaceContainerHighest != null &&
        onSurfaceVariant != null &&
        outline != null &&
        outlineVariant != null &&
        shadow != null &&
        scrim != null &&
        inverseSurface != null &&
        onInverseSurface != null &&
        inversePrimary != null &&
        surfaceTint != null &&
        background != null &&
        onBackground != null &&
        surfaceVariant != null) {
      return flutter_material.ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        secondaryFixed: secondaryFixed,
        secondaryFixedDim: secondaryFixedDim,
        onSecondaryFixed: onSecondaryFixed,
        onSecondaryFixedVariant: onSecondaryFixedVariant,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        tertiaryFixedDim: tertiaryFixedDim,
        onTertiaryFixed: onTertiaryFixed,
        onTertiaryFixedVariant: onTertiaryFixedVariant,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        inversePrimary: inversePrimary,
        surfaceTint: surfaceTint,
        // ignore: deprecated_member_use
        background: background,
        // ignore: deprecated_member_use
        onBackground: onBackground,
        // ignore: deprecated_member_use
        surfaceVariant: surfaceVariant,
      );
    }
    return _ColorSchemeFromColorThemeData(
      _color,
      brightness: brightness ?? _brightness,
      primary: primary ?? _primary,
      onPrimary: onPrimary ?? _onPrimary,
      primaryContainer: primaryContainer ?? _primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? _onPrimaryContainer,
      primaryFixed: primaryFixed ?? _primaryFixed,
      primaryFixedDim: primaryFixedDim ?? _primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed ?? _onPrimaryFixed,
      onPrimaryFixedVariant: onPrimaryFixedVariant ?? _onPrimaryFixedVariant,
      secondary: secondary ?? _secondary,
      onSecondary: onSecondary ?? _onSecondary,
      secondaryContainer: secondaryContainer ?? _secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? _onSecondaryContainer,
      secondaryFixed: secondaryFixed ?? _secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? _secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? _onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? _onSecondaryFixedVariant,
      tertiary: tertiary ?? _tertiary,
      onTertiary: onTertiary ?? _onTertiary,
      tertiaryContainer: tertiaryContainer ?? _tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? _onTertiaryContainer,
      tertiaryFixed: tertiaryFixed ?? _tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? _tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? _onTertiaryFixed,
      onTertiaryFixedVariant: onTertiaryFixedVariant ?? _onTertiaryFixedVariant,
      error: error ?? _error,
      onError: onError ?? _onError,
      errorContainer: errorContainer ?? _errorContainer,
      onErrorContainer: onErrorContainer ?? _onErrorContainer,
      surface: surface ?? _surface,
      onSurface: onSurface ?? _onSurface,
      surfaceDim: surfaceDim ?? _surfaceDim,
      surfaceBright: surfaceBright ?? _surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest ?? _surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? _surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? _surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? _surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? _surfaceContainerHighest,
      onSurfaceVariant: onSurfaceVariant ?? _onSurfaceVariant,
      outline: outline ?? _outline,
      outlineVariant: outlineVariant ?? _outlineVariant,
      shadow: shadow ?? _shadow,
      scrim: scrim ?? _scrim,
      inverseSurface: inverseSurface ?? _inverseSurface,
      onInverseSurface: onInverseSurface ?? _onInverseSurface,
      inversePrimary: inversePrimary ?? _inversePrimary,
      surfaceTint: surfaceTint ?? _surfaceTint,
      background: background ?? _background,
      onBackground: onBackground ?? _onBackground,
      surfaceVariant: surfaceVariant ?? _surfaceVariant,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is flutter_material.ColorScheme &&
            primary == other.primary &&
            onPrimary == other.onPrimary &&
            primaryContainer == other.primaryContainer &&
            onPrimaryContainer == other.onPrimaryContainer &&
            primaryFixed == other.primaryFixed &&
            primaryFixedDim == other.primaryFixedDim &&
            onPrimaryFixed == other.onPrimaryFixed &&
            onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
            secondary == other.secondary &&
            onSecondary == other.onSecondary &&
            secondaryContainer == other.secondaryContainer &&
            onSecondaryContainer == other.onSecondaryContainer &&
            secondaryFixed == other.secondaryFixed &&
            secondaryFixedDim == other.secondaryFixedDim &&
            onSecondaryFixed == other.onSecondaryFixed &&
            onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
            tertiary == other.tertiary &&
            onTertiary == other.onTertiary &&
            tertiaryContainer == other.tertiaryContainer &&
            onTertiaryContainer == other.onTertiaryContainer &&
            tertiaryFixed == other.tertiaryFixed &&
            tertiaryFixedDim == other.tertiaryFixedDim &&
            onTertiaryFixed == other.onTertiaryFixed &&
            onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
            error == other.error &&
            onError == other.onError &&
            errorContainer == other.errorContainer &&
            onErrorContainer == other.onErrorContainer &&
            surface == other.surface &&
            onSurface == other.onSurface &&
            surfaceDim == other.surfaceDim &&
            surfaceBright == other.surfaceBright &&
            surfaceContainerLowest == other.surfaceContainerLowest &&
            surfaceContainerLow == other.surfaceContainerLow &&
            surfaceContainer == other.surfaceContainer &&
            surfaceContainerHigh == other.surfaceContainerHigh &&
            surfaceContainerHighest == other.surfaceContainerHighest &&
            onSurfaceVariant == other.onSurfaceVariant &&
            outline == other.outline &&
            outlineVariant == other.outlineVariant &&
            shadow == other.shadow &&
            scrim == other.scrim &&
            inverseSurface == other.inverseSurface &&
            onInverseSurface == other.onInverseSurface &&
            inversePrimary == other.inversePrimary &&
            surfaceTint == other.surfaceTint &&
            // ignore: deprecated_member_use
            background == other.background &&
            // ignore: deprecated_member_use
            onBackground == other.onBackground &&
            // ignore: deprecated_member_use
            surfaceVariant == other.surfaceVariant;
  }

  @override
  int get hashCode => Object.hashAll([
    primary,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    secondary,
    onSecondary,
    secondaryContainer,
    onSecondaryContainer,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiary,
    onTertiary,
    tertiaryContainer,
    onTertiaryContainer,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    error,
    onError,
    errorContainer,
    onErrorContainer,
    surface,
    onSurface,
    surfaceDim,
    surfaceBright,
    surfaceContainerLowest,
    surfaceContainerLow,
    surfaceContainer,
    surfaceContainerHigh,
    surfaceContainerHighest,
    onSurfaceVariant,
    outline,
    outlineVariant,
    shadow,
    scrim,
    inverseSurface,
    onInverseSurface,
    inversePrimary,
    surfaceTint,
    background,
    onBackground,
    surfaceVariant,
  ]);
}
