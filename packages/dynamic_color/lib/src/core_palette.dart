import 'package:material/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension CorePaletteToColorThemeData on CorePalette {
  /// Create a [ColorThemeData] from the given `palette` obtained from the Android OS.
  ColorThemeData toColorScheme({Brightness brightness = Brightness.light}) =>
      switch (brightness) {
        Brightness.light => _toLightColorTheme(this),
        Brightness.dark => _toDarkColorTheme(this),
      };
}

ColorThemeData _toLightColorTheme(CorePalette corePalette) {
  final primary = Color(corePalette.primary.get(40));
  final surface = _guessTone(corePalette.neutral, 98);
  final onSurface = Color(corePalette.neutral.get(10));
  final surfaceContainerHighest = Color(corePalette.neutral.get(90));
  return ColorThemeData(
    brightness: Brightness.light,
    primary: Color(corePalette.primary.get(40)),
    onPrimary: Color(corePalette.primary.get(100)),
    primaryContainer: Color(corePalette.primary.get(90)),
    onPrimaryContainer: Color(corePalette.primary.get(10)),
    primaryFixed: Color(corePalette.primary.get(90)),
    primaryFixedDim: Color(corePalette.primary.get(80)),
    onPrimaryFixed: Color(corePalette.primary.get(10)),
    onPrimaryFixedVariant: Color(corePalette.primary.get(30)),
    secondary: Color(corePalette.secondary.get(40)),
    onSecondary: Color(corePalette.secondary.get(100)),
    secondaryContainer: Color(corePalette.secondary.get(90)),
    onSecondaryContainer: Color(corePalette.secondary.get(10)),
    secondaryFixed: Color(corePalette.secondary.get(90)),
    secondaryFixedDim: Color(corePalette.secondary.get(80)),
    onSecondaryFixed: Color(corePalette.secondary.get(10)),
    onSecondaryFixedVariant: Color(corePalette.secondary.get(30)),
    tertiary: Color(corePalette.tertiary.get(40)),
    onTertiary: Color(corePalette.tertiary.get(100)),
    tertiaryContainer: Color(corePalette.tertiary.get(90)),
    onTertiaryContainer: Color(corePalette.tertiary.get(10)),
    tertiaryFixed: Color(corePalette.tertiary.get(90)),
    tertiaryFixedDim: Color(corePalette.tertiary.get(80)),
    onTertiaryFixed: Color(corePalette.tertiary.get(10)),
    onTertiaryFixedVariant: Color(corePalette.tertiary.get(30)),
    error: Color(corePalette.error.get(40)),
    onError: Color(corePalette.error.get(100)),
    errorContainer: Color(corePalette.error.get(90)),
    onErrorContainer: Color(corePalette.error.get(10)),
    surface: surface,
    onSurface: onSurface,
    surfaceDim: _guessTone(corePalette.neutral, 87),
    surfaceBright: _guessTone(corePalette.neutral, 98),
    onSurfaceVariant: Color(corePalette.neutralVariant.get(30)),
    surfaceContainerLowest: Color(corePalette.neutral.get(100)),
    surfaceContainerLow: _guessTone(corePalette.neutral, 96),
    surfaceContainer: _guessTone(corePalette.neutral, 94),
    surfaceContainerHigh: _guessTone(corePalette.neutral, 92),
    surfaceContainerHighest: surfaceContainerHighest,
    inverseSurface: Color(corePalette.neutral.get(20)),
    inverseOnSurface: Color(corePalette.neutral.get(95)),
    inversePrimary: Color(corePalette.primary.get(80)),
    outline: Color(corePalette.neutralVariant.get(50)),
    outlineVariant: Color(corePalette.neutralVariant.get(80)),
    // Deprecated colors
    surfaceTint: primary,
    surfaceVariant: surfaceContainerHighest,
    background: surface,
    onBackground: onSurface,
    // TODO: investigate light theme scrim and shadow colors
    scrim: Colors.black,
    shadow: Colors.black,
  );
}

ColorThemeData _toDarkColorTheme(CorePalette corePalette) {
  final primary = Color(corePalette.primary.get(80));
  final surface = _guessTone(corePalette.neutral, 6);
  final onSurface = Color(corePalette.neutral.get(90));
  final surfaceContainerHighest = _guessTone(corePalette.neutral, 22);
  return ColorThemeData(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: Color(corePalette.primary.get(20)),
    primaryContainer: Color(corePalette.primary.get(30)),
    onPrimaryContainer: Color(corePalette.primary.get(90)),
    primaryFixed: Color(corePalette.primary.get(90)),
    primaryFixedDim: Color(corePalette.primary.get(80)),
    onPrimaryFixed: Color(corePalette.primary.get(10)),
    onPrimaryFixedVariant: Color(corePalette.primary.get(30)),
    secondary: Color(corePalette.secondary.get(80)),
    onSecondary: Color(corePalette.secondary.get(20)),
    secondaryContainer: Color(corePalette.secondary.get(30)),
    onSecondaryContainer: Color(corePalette.secondary.get(90)),
    secondaryFixed: Color(corePalette.secondary.get(90)),
    secondaryFixedDim: Color(corePalette.secondary.get(80)),
    onSecondaryFixed: Color(corePalette.secondary.get(10)),
    onSecondaryFixedVariant: Color(corePalette.secondary.get(30)),
    tertiary: Color(corePalette.tertiary.get(80)),
    onTertiary: Color(corePalette.tertiary.get(20)),
    tertiaryContainer: Color(corePalette.tertiary.get(30)),
    onTertiaryContainer: Color(corePalette.tertiary.get(90)),
    tertiaryFixed: Color(corePalette.tertiary.get(90)),
    tertiaryFixedDim: Color(corePalette.tertiary.get(80)),
    onTertiaryFixed: Color(corePalette.tertiary.get(10)),
    onTertiaryFixedVariant: Color(corePalette.tertiary.get(30)),
    error: Color(corePalette.error.get(80)),
    onError: Color(corePalette.error.get(20)),
    errorContainer: Color(corePalette.error.get(30)),
    onErrorContainer: Color(corePalette.error.get(90)),
    surface: surface,
    onSurface: onSurface,
    surfaceDim: _guessTone(corePalette.neutral, 6),
    surfaceBright: _guessTone(corePalette.neutral, 24),
    onSurfaceVariant: Color(corePalette.neutralVariant.get(80)),
    surfaceContainerLowest: _guessTone(corePalette.neutral, 4),
    surfaceContainerLow: Color(corePalette.neutral.get(10)),
    surfaceContainer: _guessTone(corePalette.neutral, 12),
    surfaceContainerHigh: _guessTone(corePalette.neutral, 17),
    surfaceContainerHighest: surfaceContainerHighest,
    inverseSurface: Color(corePalette.neutral.get(90)),
    inverseOnSurface: Color(corePalette.neutral.get(20)),
    inversePrimary: Color(corePalette.primary.get(40)),
    outline: Color(corePalette.neutralVariant.get(60)),
    outlineVariant: Color(corePalette.neutralVariant.get(30)),
    // Deprecated colors
    surfaceTint: primary,
    surfaceVariant: surfaceContainerHighest,
    background: surface,
    onBackground: onSurface,
    // TODO: investigate dark theme scrim and shadow colors
    scrim: Colors.black,
    shadow: Colors.black,
  );
}

// This logic is taken from material_color_utilities 0.12 - https://github.com/material-foundation/material-color-utilities/blob/be615fc90286787bbe0c04ef58a6987e0e8fdc29/dart/lib/palettes/tonal_palette.dart#L93C5-L111.
// Once flutter updates to the latest version, this workaround can be removed.
Color _guessTone(TonalPalette palette, double tone) {
  // Approximately deduces the original hue and chroma that generated this
  // list of colors.
  // Uses the hue and chroma of the provided color with the highest chroma.

  var bestHue = 0.0, bestChroma = 0.0;
  for (final argb in palette.asList) {
    final hct = Hct.fromInt(argb);
    if (hct.tone == tone) {
      return Color(hct.toInt());
    }

    // If the color is too close to white, its chroma may have been
    // affected by a known issue, so we ignore it.
    // https://github.com/material-foundation/material-color-utilities/issues/140

    if (hct.tone > 98.0) continue;

    if (hct.chroma > bestChroma) {
      bestHue = hct.hue;
      bestChroma = hct.chroma;
    }
  }
  return Color(Hct.from(bestHue, bestChroma, tone).toInt());
}
