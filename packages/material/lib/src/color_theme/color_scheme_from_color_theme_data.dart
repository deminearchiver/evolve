part of 'color_theme_data.dart';

class _ColorSchemeFromColorThemeData
    with Diagnosticable
    implements ColorScheme {
  const _ColorSchemeFromColorThemeData(ColorThemeData colorTheme)
    : this._(colorTheme: colorTheme);

  const _ColorSchemeFromColorThemeData._({
    required ColorThemeData colorTheme,
    Brightness? brightness,
    Color? background,
    Color? error,
    Color? errorContainer,
    Color? inversePrimary,
    Color? inverseSurface,
    Color? onBackground,
    Color? onError,
    Color? onErrorContainer,
    Color? onInverseSurface,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? onTertiary,
    Color? onTertiaryContainer,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
    Color? outline,
    Color? outlineVariant,
    Color? primary,
    Color? primaryContainer,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? scrim,
    Color? secondary,
    Color? secondaryContainer,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? shadow,
    Color? surface,
    Color? surfaceBright,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? surfaceDim,
    Color? surfaceTint,
    Color? surfaceVariant,
    Color? tertiary,
    Color? tertiaryContainer,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
  }) : _color = colorTheme,
       _brightness = brightness,
       _background = background,
       _error = error,
       _errorContainer = errorContainer,
       _inversePrimary = inversePrimary,
       _inverseSurface = inverseSurface,
       _onBackground = onBackground,
       _onError = onError,
       _onErrorContainer = onErrorContainer,
       _onInverseSurface = onInverseSurface,
       _onPrimary = onPrimary,
       _onPrimaryContainer = onPrimaryContainer,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _onSecondary = onSecondary,
       _onSecondaryContainer = onSecondaryContainer,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _onSurface = onSurface,
       _onSurfaceVariant = onSurfaceVariant,
       _onTertiary = onTertiary,
       _onTertiaryContainer = onTertiaryContainer,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _primary = primary,
       _primaryContainer = primaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _scrim = scrim,
       _secondary = secondary,
       _secondaryContainer = secondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _shadow = shadow,
       _surface = surface,
       _surfaceBright = surfaceBright,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceDim = surfaceDim,
       _surfaceTint = surfaceTint,
       _surfaceVariant = surfaceVariant,
       _tertiary = tertiary,
       _tertiaryContainer = tertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim;

  final ColorThemeData _color;

  // TODO: sort getters to match the order of ColorScheme fields

  final Brightness? _brightness;
  final Color? _background;
  final Color? _error;
  final Color? _errorContainer;
  final Color? _inversePrimary;
  final Color? _inverseSurface;
  final Color? _onBackground;
  final Color? _onError;
  final Color? _onErrorContainer;
  final Color? _onInverseSurface;
  final Color? _onPrimary;
  final Color? _onPrimaryContainer;
  final Color? _onPrimaryFixed;
  final Color? _onPrimaryFixedVariant;
  final Color? _onSecondary;
  final Color? _onSecondaryContainer;
  final Color? _onSecondaryFixed;
  final Color? _onSecondaryFixedVariant;
  final Color? _onSurface;
  final Color? _onSurfaceVariant;
  final Color? _onTertiary;
  final Color? _onTertiaryContainer;
  final Color? _onTertiaryFixed;
  final Color? _onTertiaryFixedVariant;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _primary;
  final Color? _primaryContainer;
  final Color? _primaryFixed;
  final Color? _primaryFixedDim;
  final Color? _scrim;
  final Color? _secondary;
  final Color? _secondaryContainer;
  final Color? _secondaryFixed;
  final Color? _secondaryFixedDim;
  final Color? _shadow;
  final Color? _surface;
  final Color? _surfaceBright;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceDim;
  final Color? _surfaceTint;
  final Color? _surfaceVariant;
  final Color? _tertiary;
  final Color? _tertiaryContainer;
  final Color? _tertiaryFixed;
  final Color? _tertiaryFixedDim;

  @override
  Brightness get brightness => _brightness ?? _color.brightness;

  @override
  // ignore: deprecated_member_use_from_same_package
  Color get background => _background ?? _color.background;

  @override
  Color get error => _error ?? _color.error;

  @override
  Color get errorContainer => _errorContainer ?? _color.errorContainer;

  @override
  Color get inversePrimary => _inversePrimary ?? _color.inversePrimary;

  @override
  Color get inverseSurface => _inverseSurface ?? _color.inverseSurface;

  @override
  // ignore: deprecated_member_use_from_same_package
  Color get onBackground => _onBackground ?? _color.onBackground;

  @override
  Color get onError => _onError ?? _color.onError;

  @override
  Color get onErrorContainer => _onErrorContainer ?? _color.onErrorContainer;

  @override
  Color get onInverseSurface => _onInverseSurface ?? _color.inverseOnSurface;

  @override
  Color get onPrimary => _onPrimary ?? _color.onPrimary;

  @override
  Color get onPrimaryContainer =>
      _onPrimaryContainer ?? _color.onPrimaryContainer;

  @override
  Color get onPrimaryFixed => _onPrimaryFixed ?? _color.onPrimaryFixed;

  @override
  Color get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _color.onPrimaryFixedVariant;

  @override
  Color get onSecondary => _onSecondary ?? _color.onSecondary;

  @override
  Color get onSecondaryContainer =>
      _onSecondaryContainer ?? _color.onSecondaryContainer;

  @override
  Color get onSecondaryFixed => _onSecondaryFixed ?? _color.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _color.onSecondaryFixedVariant;

  @override
  Color get onSurface => _onSurface ?? _color.onSurface;

  @override
  Color get onSurfaceVariant => _onSurfaceVariant ?? _color.onSurfaceVariant;

  @override
  Color get onTertiary => _onTertiary ?? _color.onTertiary;

  @override
  Color get onTertiaryContainer =>
      _onTertiaryContainer ?? _color.onTertiaryContainer;

  @override
  Color get onTertiaryFixed => _onTertiaryFixed ?? _color.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _color.onTertiaryFixedVariant;

  @override
  Color get outline => _outline ?? _color.outline;

  @override
  Color get outlineVariant => _outlineVariant ?? _color.outlineVariant;

  @override
  Color get primary => _primary ?? _color.primary;

  @override
  Color get primaryContainer => _primaryContainer ?? _color.primaryContainer;

  @override
  Color get primaryFixed => _primaryFixed ?? _color.primaryFixed;

  @override
  Color get primaryFixedDim => _primaryFixedDim ?? _color.primaryFixedDim;

  @override
  Color get scrim => _scrim ?? _color.scrim;

  @override
  Color get secondary => _secondary ?? _color.secondary;

  @override
  Color get secondaryContainer =>
      _secondaryContainer ?? _color.secondaryContainer;

  @override
  Color get secondaryFixed => _secondaryFixed ?? _color.secondaryFixed;

  @override
  Color get secondaryFixedDim => _secondaryFixedDim ?? _color.secondaryFixedDim;

  @override
  Color get shadow => _shadow ?? _color.shadow;

  @override
  Color get surface => _surface ?? _color.surface;

  @override
  Color get surfaceBright => _surfaceBright ?? _color.surfaceBright;

  @override
  Color get surfaceContainer => _surfaceContainer ?? _color.surfaceContainer;

  @override
  Color get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _color.surfaceContainerHigh;

  @override
  Color get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _color.surfaceContainerHighest;

  @override
  Color get surfaceContainerLow =>
      _surfaceContainerLow ?? _color.surfaceContainerLow;

  @override
  Color get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _color.surfaceContainerLowest;

  @override
  Color get surfaceDim => _surfaceDim ?? _color.surfaceDim;

  @override
  Color get surfaceTint => _surfaceTint ?? _color.surfaceTint;

  @override
  Color get surfaceVariant => _surfaceVariant ?? _color.surfaceVariant;

  @override
  Color get tertiary => _tertiary ?? _color.tertiary;

  @override
  Color get tertiaryContainer => _tertiaryContainer ?? _color.tertiaryContainer;

  @override
  Color get tertiaryFixed => _tertiaryFixed ?? _color.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => _tertiaryFixedDim ?? _color.tertiaryFixedDim;

  @override
  ColorScheme copyWith({
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
    if (brightness != null &&
        background != null &&
        error != null &&
        errorContainer != null &&
        inversePrimary != null &&
        inverseSurface != null &&
        onBackground != null &&
        onError != null &&
        onErrorContainer != null &&
        onInverseSurface != null &&
        onPrimary != null &&
        onPrimaryContainer != null &&
        onPrimaryFixed != null &&
        onPrimaryFixedVariant != null &&
        onSecondary != null &&
        onSecondaryContainer != null &&
        onSecondaryFixed != null &&
        onSecondaryFixedVariant != null &&
        onSurface != null &&
        onSurfaceVariant != null &&
        onTertiary != null &&
        onTertiaryContainer != null &&
        onTertiaryFixed != null &&
        onTertiaryFixedVariant != null &&
        outline != null &&
        outlineVariant != null &&
        primary != null &&
        primaryContainer != null &&
        primaryFixed != null &&
        primaryFixedDim != null &&
        scrim != null &&
        secondary != null &&
        secondaryContainer != null &&
        secondaryFixed != null &&
        secondaryFixedDim != null &&
        shadow != null &&
        surface != null &&
        surfaceBright != null &&
        surfaceContainer != null &&
        surfaceContainerHigh != null &&
        surfaceContainerHighest != null &&
        surfaceContainerLow != null &&
        surfaceContainerLowest != null &&
        surfaceDim != null &&
        surfaceTint != null &&
        surfaceVariant != null &&
        tertiary != null &&
        tertiaryContainer != null &&
        tertiaryFixed != null &&
        tertiaryFixedDim != null) {
      return ColorScheme(
        brightness: brightness,
        // ignore: deprecated_member_use
        background: background,
        error: error,
        errorContainer: errorContainer,
        inversePrimary: inversePrimary,
        inverseSurface: inverseSurface,
        // ignore: deprecated_member_use
        onBackground: onBackground,
        onError: onError,
        onErrorContainer: onErrorContainer,
        onInverseSurface: onInverseSurface,
        onPrimary: onPrimary,
        onPrimaryContainer: onPrimaryContainer,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        onSecondary: onSecondary,
        onSecondaryContainer: onSecondaryContainer,
        onSecondaryFixed: onSecondaryFixed,
        onSecondaryFixedVariant: onSecondaryFixedVariant,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        onTertiary: onTertiary,
        onTertiaryContainer: onTertiaryContainer,
        onTertiaryFixed: onTertiaryFixed,
        onTertiaryFixedVariant: onTertiaryFixedVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        primary: primary,
        primaryContainer: primaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        scrim: scrim,
        secondary: secondary,
        secondaryContainer: secondaryContainer,
        secondaryFixed: secondaryFixed,
        secondaryFixedDim: secondaryFixedDim,
        shadow: shadow,
        surface: surface,
        surfaceBright: surfaceBright,
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceDim: surfaceDim,
        surfaceTint: surfaceTint,
        // ignore: deprecated_member_use
        surfaceVariant: surfaceVariant,
        tertiary: tertiary,
        tertiaryContainer: tertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        tertiaryFixedDim: tertiaryFixedDim,
      );
    }
    return _ColorSchemeFromColorThemeData._(
      colorTheme: _color,
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
      // DEPRECATED (newest deprecations at the bottom)
      // ignore: deprecated_member_use
      background: background,
      // ignore: deprecated_member_use
      onBackground: onBackground,
      // ignore: deprecated_member_use
      surfaceVariant: surfaceVariant,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    const ColorScheme defaultScheme = ColorScheme.light();
    properties.add(
      DiagnosticsProperty<Brightness>(
        "brightness",
        brightness,
        defaultValue: defaultScheme.brightness,
      ),
    );
    properties.add(
      ColorProperty("primary", primary, defaultValue: defaultScheme.primary),
    );
    properties.add(
      ColorProperty(
        "onPrimary",
        onPrimary,
        defaultValue: defaultScheme.onPrimary,
      ),
    );
    properties.add(
      ColorProperty(
        "primaryContainer",
        primaryContainer,
        defaultValue: defaultScheme.primaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "onPrimaryContainer",
        onPrimaryContainer,
        defaultValue: defaultScheme.onPrimaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "primaryFixed",
        primaryFixed,
        defaultValue: defaultScheme.primaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "primaryFixedDim",
        primaryFixedDim,
        defaultValue: defaultScheme.primaryFixedDim,
      ),
    );
    properties.add(
      ColorProperty(
        "onPrimaryFixed",
        onPrimaryFixed,
        defaultValue: defaultScheme.onPrimaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "onPrimaryFixedVariant",
        onPrimaryFixedVariant,
        defaultValue: defaultScheme.onPrimaryFixedVariant,
      ),
    );
    properties.add(
      ColorProperty(
        "secondary",
        secondary,
        defaultValue: defaultScheme.secondary,
      ),
    );
    properties.add(
      ColorProperty(
        "onSecondary",
        onSecondary,
        defaultValue: defaultScheme.onSecondary,
      ),
    );
    properties.add(
      ColorProperty(
        "secondaryContainer",
        secondaryContainer,
        defaultValue: defaultScheme.secondaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "onSecondaryContainer",
        onSecondaryContainer,
        defaultValue: defaultScheme.onSecondaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "secondaryFixed",
        secondaryFixed,
        defaultValue: defaultScheme.secondaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "secondaryFixedDim",
        secondaryFixedDim,
        defaultValue: defaultScheme.secondaryFixedDim,
      ),
    );
    properties.add(
      ColorProperty(
        "onSecondaryFixed",
        onSecondaryFixed,
        defaultValue: defaultScheme.onSecondaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "onSecondaryFixedVariant",
        onSecondaryFixedVariant,
        defaultValue: defaultScheme.onSecondaryFixedVariant,
      ),
    );
    properties.add(
      ColorProperty("tertiary", tertiary, defaultValue: defaultScheme.tertiary),
    );
    properties.add(
      ColorProperty(
        "onTertiary",
        onTertiary,
        defaultValue: defaultScheme.onTertiary,
      ),
    );
    properties.add(
      ColorProperty(
        "tertiaryContainer",
        tertiaryContainer,
        defaultValue: defaultScheme.tertiaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "onTertiaryContainer",
        onTertiaryContainer,
        defaultValue: defaultScheme.onTertiaryContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "tertiaryFixed",
        tertiaryFixed,
        defaultValue: defaultScheme.tertiaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "tertiaryFixedDim",
        tertiaryFixedDim,
        defaultValue: defaultScheme.tertiaryFixedDim,
      ),
    );
    properties.add(
      ColorProperty(
        "onTertiaryFixed",
        onTertiaryFixed,
        defaultValue: defaultScheme.onTertiaryFixed,
      ),
    );
    properties.add(
      ColorProperty(
        "onTertiaryFixedVariant",
        onTertiaryFixedVariant,
        defaultValue: defaultScheme.onTertiaryFixedVariant,
      ),
    );
    properties.add(
      ColorProperty("error", error, defaultValue: defaultScheme.error),
    );
    properties.add(
      ColorProperty("onError", onError, defaultValue: defaultScheme.onError),
    );
    properties.add(
      ColorProperty(
        "errorContainer",
        errorContainer,
        defaultValue: defaultScheme.errorContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "onErrorContainer",
        onErrorContainer,
        defaultValue: defaultScheme.onErrorContainer,
      ),
    );
    properties.add(
      ColorProperty("surface", surface, defaultValue: defaultScheme.surface),
    );
    properties.add(
      ColorProperty(
        "onSurface",
        onSurface,
        defaultValue: defaultScheme.onSurface,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceDim",
        surfaceDim,
        defaultValue: defaultScheme.surfaceDim,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceBright",
        surfaceBright,
        defaultValue: defaultScheme.surfaceBright,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerLowest",
        surfaceContainerLowest,
        defaultValue: defaultScheme.surfaceContainerLowest,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerLow",
        surfaceContainerLow,
        defaultValue: defaultScheme.surfaceContainerLow,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainer",
        surfaceContainer,
        defaultValue: defaultScheme.surfaceContainer,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerHigh",
        surfaceContainerHigh,
        defaultValue: defaultScheme.surfaceContainerHigh,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerHighest",
        surfaceContainerHighest,
        defaultValue: defaultScheme.surfaceContainerHighest,
      ),
    );
    properties.add(
      ColorProperty(
        "onSurfaceVariant",
        onSurfaceVariant,
        defaultValue: defaultScheme.onSurfaceVariant,
      ),
    );
    properties.add(
      ColorProperty("outline", outline, defaultValue: defaultScheme.outline),
    );
    properties.add(
      ColorProperty(
        "outlineVariant",
        outlineVariant,
        defaultValue: defaultScheme.outlineVariant,
      ),
    );
    properties.add(
      ColorProperty("shadow", shadow, defaultValue: defaultScheme.shadow),
    );
    properties.add(
      ColorProperty("scrim", scrim, defaultValue: defaultScheme.scrim),
    );
    properties.add(
      ColorProperty(
        "inverseSurface",
        inverseSurface,
        defaultValue: defaultScheme.inverseSurface,
      ),
    );
    properties.add(
      ColorProperty(
        "onInverseSurface",
        onInverseSurface,
        defaultValue: defaultScheme.onInverseSurface,
      ),
    );
    properties.add(
      ColorProperty(
        "inversePrimary",
        inversePrimary,
        defaultValue: defaultScheme.inversePrimary,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceTint",
        surfaceTint,
        defaultValue: defaultScheme.surfaceTint,
      ),
    );
    // DEPRECATED (newest deprecations at the bottom)
    properties.add(
      ColorProperty(
        "background",
        background,
        // ignore: deprecated_member_use
        defaultValue: defaultScheme.background,
      ),
    );
    properties.add(
      ColorProperty(
        "onBackground",
        onBackground,
        // ignore: deprecated_member_use
        defaultValue: defaultScheme.onBackground,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceVariant",
        surfaceVariant,
        // ignore: deprecated_member_use
        defaultValue: defaultScheme.surfaceVariant,
      ),
    );
  }
}
