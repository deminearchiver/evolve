part of 'color_theme_data.dart';

class _ColorThemeDataFromColorScheme extends ColorThemeData {
  const _ColorThemeDataFromColorScheme(ColorScheme colorScheme)
    : _colorScheme = colorScheme,
      super._();

  final ColorScheme _colorScheme;

  @override
  Brightness get brightness => _colorScheme.brightness;

  @override
  Color get primary => _colorScheme.primary;

  @override
  Color get onPrimary => _colorScheme.onPrimary;

  @override
  Color get primaryContainer => _colorScheme.primaryContainer;

  @override
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;

  @override
  Color get primaryFixed => _colorScheme.primaryFixed;

  @override
  Color get onPrimaryFixed => _colorScheme.onPrimaryFixed;

  @override
  Color get primaryFixedDim => _colorScheme.primaryFixedDim;

  @override
  Color get onPrimaryFixedVariant => _colorScheme.onPrimaryFixedVariant;

  @override
  Color get inversePrimary => _colorScheme.inversePrimary;

  @override
  Color get secondary => _colorScheme.secondary;

  @override
  Color get onSecondary => _colorScheme.onSecondary;

  @override
  Color get secondaryContainer => _colorScheme.secondaryContainer;

  @override
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;

  @override
  Color get secondaryFixed => _colorScheme.secondaryFixed;

  @override
  Color get secondaryFixedDim => _colorScheme.secondaryFixedDim;

  @override
  Color get onSecondaryFixed => _colorScheme.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant => _colorScheme.onSecondaryFixedVariant;

  @override
  Color get tertiary => _colorScheme.tertiary;

  @override
  Color get onTertiary => _colorScheme.onTertiary;

  @override
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;

  @override
  Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;

  @override
  Color get tertiaryFixed => _colorScheme.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => _colorScheme.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => _colorScheme.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant => _colorScheme.onTertiaryFixedVariant;

  @override
  Color get error => _colorScheme.error;

  @override
  Color get onError => _colorScheme.onError;

  @override
  Color get errorContainer => _colorScheme.errorContainer;

  @override
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  @override
  Color get surface => _colorScheme.surface;

  @override
  Color get onSurface => _colorScheme.onSurface;

  @override
  // ignore: deprecated_member_use
  Color get surfaceVariant => _colorScheme.surfaceVariant;

  @override
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  @override
  Color get surfaceContainerHighest => _colorScheme.surfaceContainerHighest;

  @override
  Color get surfaceContainerHigh => _colorScheme.surfaceContainerHigh;

  @override
  Color get surfaceContainer => _colorScheme.surfaceContainer;

  @override
  Color get surfaceContainerLow => _colorScheme.surfaceContainerLow;

  @override
  Color get surfaceContainerLowest => _colorScheme.surfaceContainerLowest;

  @override
  Color get inverseSurface => _colorScheme.inverseSurface;

  @override
  Color get inverseOnSurface => _colorScheme.onInverseSurface;

  @override
  Color get surfaceTint => _colorScheme.surfaceTint;

  @override
  // ignore: deprecated_member_use
  Color get background => _colorScheme.background;

  @override
  // ignore: deprecated_member_use
  Color get onBackground => _colorScheme.onBackground;

  @override
  Color get surfaceBright => _colorScheme.surfaceBright;

  @override
  Color get surfaceDim => _colorScheme.surfaceDim;

  @override
  Color get scrim => _colorScheme.scrim;

  @override
  Color get shadow => _colorScheme.shadow;

  @override
  Color get outline => _colorScheme.outline;

  @override
  Color get outlineVariant => _colorScheme.outlineVariant;

  @override
  ColorScheme toColorScheme() => _colorScheme;
}
