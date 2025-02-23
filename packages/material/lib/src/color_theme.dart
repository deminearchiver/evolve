import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

@immutable
abstract class ColorThemeData with Diagnosticable {
  const ColorThemeData._();

  const factory ColorThemeData({
    required Brightness brightness,

    // Primary
    required Color primary,
    required Color onPrimary,
    required Color primaryContainer,
    required Color onPrimaryContainer,

    // Add-on primary
    required Color primaryFixed,
    required Color onPrimaryFixed,
    required Color primaryFixedDim,
    required Color onPrimaryFixedVariant,
    required Color inversePrimary,

    // Secondary
    required Color secondary,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color onSecondaryContainer,

    // Add-on secondary
    required Color secondaryFixed,
    required Color secondaryFixedDim,
    required Color onSecondaryFixed,
    required Color onSecondaryFixedVariant,

    // Tertiary
    required Color tertiary,
    required Color onTertiary,
    required Color tertiaryContainer,
    required Color onTertiaryContainer,

    // Add-on tertiary
    required Color tertiaryFixed,
    required Color tertiaryFixedDim,
    required Color onTertiaryFixed,
    required Color onTertiaryFixedVariant,

    // Error
    required Color error,
    required Color onError,
    required Color errorContainer,
    required Color onErrorContainer,

    // Surface
    required Color surface,
    required Color onSurface,
    required Color surfaceVariant,
    required Color onSurfaceVariant,
    required Color surfaceContainerHighest,
    required Color surfaceContainerHigh,
    required Color surfaceContainer,
    required Color surfaceContainerLow,
    required Color surfaceContainerLowest,
    required Color inverseSurface,
    required Color inverseOnSurface,
    required Color surfaceTint,

    // Add-on surface
    @Deprecated("Use surface instead") required Color background,
    @Deprecated("Use onSurface instead") required Color onBackground,
    required Color surfaceBright,
    required Color surfaceDim,
    required Color scrim,
    required Color shadow,

    // Outline
    required Color outline,
    required Color outlineVariant,
  }) = _ColorThemeData;

  @Deprecated("Use ColorThemeData.baseline instead")
  factory ColorThemeData.static({required Brightness brightness}) {
    return ColorThemeData.baseline(brightness: brightness);
  }

  /// ### Baseline colors
  /// ![Baseline scheme colors in light theme](https://lh3.googleusercontent.com/rfxJv95pIoJ3cEZ9ypfimJFC5Ps8sEEVBNWD36C-fy3DYvec8J_VLRosBkwTNsnpSCgSpxWXBypOXT8Ydm4fJOQ2ajWoy7SjocrzJcK7KA8=s0)
  /// ![Baseline scheme colors in dark theme](https://lh3.googleusercontent.com/S-tgf061eUWcbEBhyicTYR9PWVDeXSsSgZ2e2yYSr6Jn4W-F9z5czZCG6sv58wgJQODQakVRBDvUX5gaotfq3BuqMDLROrCO4D0Kz9F494LW=s0)
  factory ColorThemeData.baseline({required Brightness brightness}) {
    // TODO(deminearchiver): decide if we should use:
    //  1. Baseline color tokens from the Material Design 3 website
    //  2. Implement and use md-ref-palette tokens
    //  3. Use ColorThemeData.fromSeed with the seed color #6750A4
    return switch (brightness) {
      Brightness.light => _baselineLight,
      Brightness.dark => _baselineDark,
    };
  }

  /// Baseline scheme with values taken from the
  /// official Material Design 3 guidelines:
  /// https://m3.material.io/styles/color/static/baseline
  static const ColorThemeData _baselineLight = ColorThemeData(
    brightness: Brightness.light,
    primary: Color(0xFF6750A4),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEADDFF),
    onPrimaryContainer: Color(0xFF4F378B),
    primaryFixed: Color(0xFFEADDFF),
    onPrimaryFixed: Color(0xFF21005D),
    primaryFixedDim: Color(0xFFD0BCFF),
    onPrimaryFixedVariant: Color(0xFF4F378B),
    inversePrimary: Color(0xFFD0BCFF),
    secondary: Color(0xFF625B71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    onSecondaryContainer: Color(0xFF4A4458),
    secondaryFixed: Color(0xFFE8DEF8),
    secondaryFixedDim: Color(0xFFCCC2DC),
    onSecondaryFixed: Color(0xFF1D192B),
    onSecondaryFixedVariant: Color(0xFF4A4458),
    tertiary: Color(0xFF7D5260),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    onTertiaryContainer: Color(0xFF633B48),
    tertiaryFixed: Color(0xFFFFD8E4),
    tertiaryFixedDim: Color(0xFFEFB8C8),
    onTertiaryFixed: Color(0xFF31111D),
    onTertiaryFixedVariant: Color(0xFF633B48),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF8C1D18),
    surface: Color(0xFFFEF7FF),
    onSurface: Color(0xFF1D1B20),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    surfaceContainerHighest: Color(0xFFE6E0E9),
    surfaceContainerHigh: Color(0xFFECE6F0),
    surfaceContainer: Color(0xFFF3EDF7),
    surfaceContainerLow: Color(0xFFF7F2FA),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    inverseSurface: Color(0xFF322F35),
    inverseOnSurface: Color(0xFFF5EFF7),
    surfaceTint: Color(0xFF6750A4),
    background: Color(0xFFFEF7FF),
    onBackground: Color(0xFF1D1B20),
    surfaceBright: Color(0xFFFEF7FF),
    surfaceDim: Color(0xFFDED8E1),
    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC4D0),
  );

  /// Baseline scheme with values taken from the
  /// official Material Design 3 guidelines:
  /// https://m3.material.io/styles/color/static/baseline
  static const ColorThemeData _baselineDark = ColorThemeData(
    brightness: Brightness.light,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    primaryFixed: Color(0xFFEADDFF),
    onPrimaryFixed: Color(0xFF21005D),
    primaryFixedDim: Color(0xFFD0BCFF),
    onPrimaryFixedVariant: Color(0xFF4F378B),
    inversePrimary: Color(0xFF6750A4),
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    secondaryFixed: Color(0xFFE8DEF8),
    secondaryFixedDim: Color(0xFFCCC2DC),
    onSecondaryFixed: Color(0xFF1D192B),
    onSecondaryFixedVariant: Color(0xFF4A4458),
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    tertiaryFixed: Color(0xFFFFD8E4),
    tertiaryFixedDim: Color(0xFFEFB8C8),
    onTertiaryFixed: Color(0xFF31111D),
    onTertiaryFixedVariant: Color(0xFF633B48),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    surface: Color(0xFF141218),
    onSurface: Color(0xFFE6E0E9),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    surfaceContainerHighest: Color(0xFF36343B),
    surfaceContainerHigh: Color(0xFF2B2930),
    surfaceContainer: Color(0xFF211F26),
    surfaceContainerLow: Color(0xFF1D1B20),
    surfaceContainerLowest: Color(0xFF0F0D13),
    inverseSurface: Color(0xFFE6E0E9),
    inverseOnSurface: Color(0xFF322F35),
    surfaceTint: Color(0xFFD0BCFF),
    background: Color(0xFF141218),
    onBackground: Color(0xFFE6E0E9),
    surfaceBright: Color(0xFF3B383E),
    surfaceDim: Color(0xFF141218),
    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
  );

  factory ColorThemeData.fromDynamicScheme(DynamicScheme scheme) {
    return ColorThemeData(
      brightness: scheme.isDark ? Brightness.dark : Brightness.light,
      primary: Color(MaterialDynamicColors.primary.getArgb(scheme)),
      onPrimary: Color(MaterialDynamicColors.onPrimary.getArgb(scheme)),
      primaryContainer: Color(
        MaterialDynamicColors.primaryContainer.getArgb(scheme),
      ),
      onPrimaryContainer: Color(
        MaterialDynamicColors.onPrimaryContainer.getArgb(scheme),
      ),
      primaryFixed: Color(MaterialDynamicColors.primaryFixed.getArgb(scheme)),
      onPrimaryFixed: Color(
        MaterialDynamicColors.onPrimaryFixed.getArgb(scheme),
      ),
      primaryFixedDim: Color(
        MaterialDynamicColors.primaryFixedDim.getArgb(scheme),
      ),
      onPrimaryFixedVariant: Color(
        MaterialDynamicColors.onPrimaryFixedVariant.getArgb(scheme),
      ),
      inversePrimary: Color(
        MaterialDynamicColors.inversePrimary.getArgb(scheme),
      ),
      secondary: Color(MaterialDynamicColors.secondary.getArgb(scheme)),
      onSecondary: Color(MaterialDynamicColors.onSecondary.getArgb(scheme)),
      secondaryContainer: Color(
        MaterialDynamicColors.secondaryContainer.getArgb(scheme),
      ),
      onSecondaryContainer: Color(
        MaterialDynamicColors.onSecondaryContainer.getArgb(scheme),
      ),
      secondaryFixed: Color(
        MaterialDynamicColors.secondaryFixed.getArgb(scheme),
      ),
      secondaryFixedDim: Color(
        MaterialDynamicColors.secondaryFixedDim.getArgb(scheme),
      ),
      onSecondaryFixed: Color(
        MaterialDynamicColors.onSecondaryFixed.getArgb(scheme),
      ),
      onSecondaryFixedVariant: Color(
        MaterialDynamicColors.onSecondaryFixedVariant.getArgb(scheme),
      ),
      tertiary: Color(MaterialDynamicColors.tertiary.getArgb(scheme)),
      onTertiary: Color(MaterialDynamicColors.onTertiary.getArgb(scheme)),
      tertiaryContainer: Color(
        MaterialDynamicColors.tertiaryContainer.getArgb(scheme),
      ),
      onTertiaryContainer: Color(
        MaterialDynamicColors.onTertiaryContainer.getArgb(scheme),
      ),
      tertiaryFixed: Color(MaterialDynamicColors.tertiaryFixed.getArgb(scheme)),
      tertiaryFixedDim: Color(
        MaterialDynamicColors.tertiaryFixedDim.getArgb(scheme),
      ),
      onTertiaryFixed: Color(
        MaterialDynamicColors.onTertiaryFixed.getArgb(scheme),
      ),
      onTertiaryFixedVariant: Color(
        MaterialDynamicColors.onTertiaryFixedVariant.getArgb(scheme),
      ),
      error: Color(MaterialDynamicColors.error.getArgb(scheme)),
      onError: Color(MaterialDynamicColors.onError.getArgb(scheme)),
      errorContainer: Color(
        MaterialDynamicColors.errorContainer.getArgb(scheme),
      ),
      onErrorContainer: Color(
        MaterialDynamicColors.onErrorContainer.getArgb(scheme),
      ),
      surface: Color(MaterialDynamicColors.surface.getArgb(scheme)),
      onSurface: Color(MaterialDynamicColors.onSurface.getArgb(scheme)),
      surfaceVariant: Color(
        MaterialDynamicColors.surfaceVariant.getArgb(scheme),
      ),
      onSurfaceVariant: Color(
        MaterialDynamicColors.onSurfaceVariant.getArgb(scheme),
      ),
      surfaceContainerHighest: Color(
        MaterialDynamicColors.surfaceContainerHighest.getArgb(scheme),
      ),
      surfaceContainerHigh: Color(
        MaterialDynamicColors.surfaceContainerHigh.getArgb(scheme),
      ),
      surfaceContainer: Color(
        MaterialDynamicColors.surfaceContainer.getArgb(scheme),
      ),
      surfaceContainerLow: Color(
        MaterialDynamicColors.surfaceContainerLow.getArgb(scheme),
      ),
      surfaceContainerLowest: Color(
        MaterialDynamicColors.surfaceContainerLowest.getArgb(scheme),
      ),
      inverseSurface: Color(
        MaterialDynamicColors.inverseSurface.getArgb(scheme),
      ),
      inverseOnSurface: Color(
        MaterialDynamicColors.inverseOnSurface.getArgb(scheme),
      ),
      surfaceTint: Color(MaterialDynamicColors.surfaceTint.getArgb(scheme)),
      background: Color(MaterialDynamicColors.background.getArgb(scheme)),
      onBackground: Color(MaterialDynamicColors.onBackground.getArgb(scheme)),
      surfaceBright: Color(MaterialDynamicColors.surfaceBright.getArgb(scheme)),
      surfaceDim: Color(MaterialDynamicColors.surfaceDim.getArgb(scheme)),
      scrim: Color(MaterialDynamicColors.scrim.getArgb(scheme)),
      shadow: Color(MaterialDynamicColors.shadow.getArgb(scheme)),
      outline: Color(MaterialDynamicColors.outline.getArgb(scheme)),
      outlineVariant: Color(
        MaterialDynamicColors.outlineVariant.getArgb(scheme),
      ),
    );
  }

  static const double contrastLevelNormal = 0.0;
  static const double contrastLevelMedium = 0.5;
  static const double contrastLevelHigh = 1.0;

  /// Generate a [ColorThemeData] derived from the given `seedColor`.
  ///
  /// Using the `seedColor` as a starting point, a set of tonal palettes are
  /// constructed. By default, the tonal palettes are based on the Material 3
  /// Color system and provide all of the [ColorThemeData] colors. These colors are
  /// designed to work well together and meet contrast requirements for
  /// accessibility.
  ///
  /// Given the nature of the algorithm, the `seedColor` may not wind up as
  /// one of the ColorScheme colors.
  ///
  /// The `variant` parameter creates different types of
  /// [DynamicScheme]s, which are used to generate different styles of [ColorScheme]s.
  /// By default, `variant` is set to `tonalSpot`. A [ColorScheme]
  /// constructed by [DynamicSchemeVariant.tonalSpot] has pastel palettes and
  /// won't be too "colorful" even if the `seedColor` has a high chroma value.
  /// If the resulting color scheme is too dark, consider setting `variant`
  /// to [DynamicSchemeVariant.fidelity], whose palettes match the seed color.
  ///
  /// The `contrastLevel` parameter indicates the contrast level between color
  /// pairs, such as [primary] and [onPrimary]. 0.0 is the default (normal);
  /// -1.0 is the lowest; 1.0 is the highest. This class contains convenience static members:
  /// [ColorThemeData.contrastLevelNormal], [ColorThemeData.contrastLevelMedium]
  /// and [ColorThemeData.contrastLevelHigh], which correspond to  the respective
  /// contrast levels from Material Design guideline.
  ///
  /// See also:
  ///
  ///  * <https://m3.material.io/styles/color/roles>, the
  ///    Material 3 Color system specification.
  ///  * <https://pub.dev/packages/material_color_utilities>, the package
  ///    used to generate the tonal palettes needed for the scheme.
  factory ColorThemeData.fromSeed({
    required Color seedColor,
    required Brightness brightness,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
  }) {
    final scheme = _buildDynamicScheme(
      brightness,
      seedColor,
      variant,
      contrastLevel,
    );
    return ColorThemeData.fromDynamicScheme(scheme);
  }

  /// Generate a [ColorThemeData] derived from the given `image`.
  ///
  /// Material Color Utilities extracts the dominant color from the
  /// supplied [ImageProvider]. Using this color, a [ColorThemeData] is generated
  /// with harmonious colors that meet contrast requirements for accessibility.
  ///
  /// Given the nature of the algorithm, the most dominant color of the
  /// `image` may not wind up as one of the [ColorThemeData] colors.
  ///
  /// The provided image will be scaled down to a maximum size of 112x112 pixels
  /// during color extraction.
  ///
  /// See also:
  ///
  ///  * [M3 Guidelines: Content-based color](https://m3.material.io/styles/color/dynamic/content-based-source)
  ///  * <https://pub.dev/packages/dynamic_color>, a package to create
  ///    [ColorScheme]s based on a platform's implementation of dynamic color.
  ///  * <https://m3.material.io/styles/color/roles>, the
  ///    Material 3 Color system specification.
  ///  * <https://pub.dev/packages/material_color_utilities>, the package
  ///    used to algorithmically determine the dominant color and to generate
  ///    the [ColorThemeData].
  static Future<ColorThemeData> fromImage({
    required ImageProvider image,
    required Brightness brightness,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
  }) async {
    // Extract dominant colors from image.
    final QuantizerResult quantizerResult =
        await _extractColorsFromImageProvider(image);
    final colorToCount = quantizerResult.colorToCount.map(
      (key, value) => MapEntry<int, int>(_getArgbFromAbgr(key), value),
    );

    // Score colors for color scheme suitability.
    final List<int> scoredResults = Score.score(colorToCount, desired: 1);
    final baseColor = Color(scoredResults.first);
    return ColorThemeData.fromSeed(
      seedColor: baseColor,
      brightness: brightness,
      variant: variant,
      contrastLevel: contrastLevel,
    );
  }

  static int _getArgbFromAbgr(int abgr) {
    const int exceptRMask = 0xFF00FFFF;
    const int onlyRMask = ~exceptRMask;
    const int exceptBMask = 0xFFFFFF00;
    const int onlyBMask = ~exceptBMask;
    final int r = (abgr & onlyRMask) >> 16;
    final int b = abgr & onlyBMask;
    return (abgr & exceptRMask & exceptBMask) | (b << 16) | r;
  }

  static Future<ui.Image> _imageProviderToScaled(
    ImageProvider imageProvider,
  ) async {
    const double maxDimension = 112.0;
    final stream = imageProvider.resolve(
      const ImageConfiguration(size: Size(maxDimension, maxDimension)),
    );
    final imageCompleter = Completer<ui.Image>();
    late ImageStreamListener listener;
    late ui.Image scaledImage;
    Timer? loadFailureTimeout;

    listener = ImageStreamListener(
      (info, sync) async {
        loadFailureTimeout?.cancel();
        stream.removeListener(listener);
        final ui.Image image = info.image;
        final width = image.width;
        final height = image.height;
        double paintWidth = width.toDouble();
        double paintHeight = height.toDouble();
        assert(width > 0 && height > 0);

        final rescale = width > maxDimension || height > maxDimension;
        if (rescale) {
          paintWidth =
              (width > height) ? maxDimension : (maxDimension / height) * width;
          paintHeight =
              (height > width) ? maxDimension : (maxDimension / width) * height;
        }
        final pictureRecorder = ui.PictureRecorder();
        final canvas = Canvas(pictureRecorder);
        paintImage(
          canvas: canvas,
          rect: Rect.fromLTRB(0, 0, paintWidth, paintHeight),
          image: image,
          filterQuality: FilterQuality.none,
        );

        final picture = pictureRecorder.endRecording();
        scaledImage = await picture.toImage(
          paintWidth.toInt(),
          paintHeight.toInt(),
        );
        imageCompleter.complete(info.image);
      },
      onError: (exception, stackTrace) {
        stream.removeListener(listener);
        throw Exception('Failed to render image: $exception');
      },
    );

    loadFailureTimeout = Timer(const Duration(seconds: 5), () {
      stream.removeListener(listener);
      imageCompleter.completeError(
        TimeoutException('Timeout occurred trying to load image'),
      );
    });

    stream.addListener(listener);
    await imageCompleter.future;
    return scaledImage;
  }

  static Future<QuantizerResult> _extractColorsFromImageProvider(
    ImageProvider imageProvider,
  ) async {
    final scaledImage = await _imageProviderToScaled(imageProvider);
    final imageBytes = await scaledImage.toByteData();

    final quantizerResult = await QuantizerCelebi().quantize(
      imageBytes!.buffer.asUint32List(),
      128,
      returnInputPixelToClusterPixel: true,
    );
    return quantizerResult;
  }

  static DynamicScheme _buildDynamicScheme(
    Brightness brightness,
    Color seedColor,
    DynamicSchemeVariant schemeVariant,
    double contrastLevel,
  ) {
    assert(
      contrastLevel >= -1.0 && contrastLevel <= 1.0,
      "contrastLevel must be between -1.0 and 1.0 inclusive.",
    );
    final bool isDark = brightness == Brightness.dark;
    final Hct sourceColor = Hct.fromInt(seedColor.toARGB32());
    return switch (schemeVariant) {
      DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fidelity => SchemeFidelity(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.content => SchemeContent(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.monochrome => SchemeMonochrome(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.neutral => SchemeNeutral(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.vibrant => SchemeVibrant(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.expressive => SchemeExpressive(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.rainbow => SchemeRainbow(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
    };
  }

  const factory ColorThemeData.fromColorScheme({
    required ColorScheme colorScheme,
  }) = _ColorThemeDataFromColorScheme;

  // In case we want to revert back to manually settings values
  // factory ColorThemeData.fromColorScheme({required ColorScheme colorScheme}) {
  //   return ColorThemeData(
  //     brightness: colorScheme.brightness,
  //     primary: colorScheme.primary,
  //     onPrimary: colorScheme.onPrimary,
  //     primaryContainer: colorScheme.primaryContainer,
  //     onPrimaryContainer: colorScheme.onPrimaryContainer,
  //     primaryFixed: colorScheme.primaryFixed,
  //     onPrimaryFixed: colorScheme.onPrimaryFixed,
  //     primaryFixedDim: colorScheme.primaryFixedDim,
  //     onPrimaryFixedVariant: colorScheme.onPrimaryFixedVariant,
  //     inversePrimary: colorScheme.inversePrimary,
  //     secondary: colorScheme.secondary,
  //     onSecondary: colorScheme.onSecondary,
  //     secondaryContainer: colorScheme.secondaryContainer,
  //     onSecondaryContainer: colorScheme.onSecondaryContainer,
  //     secondaryFixed: colorScheme.secondaryFixed,
  //     secondaryFixedDim: colorScheme.secondaryFixedDim,
  //     onSecondaryFixed: colorScheme.onSecondaryFixed,
  //     onSecondaryFixedVariant: colorScheme.onSecondaryFixedVariant,
  //     tertiary: colorScheme.tertiary,
  //     onTertiary: colorScheme.onTertiary,
  //     tertiaryContainer: colorScheme.tertiaryContainer,
  //     onTertiaryContainer: colorScheme.onTertiaryContainer,
  //     tertiaryFixed: colorScheme.tertiaryFixed,
  //     tertiaryFixedDim: colorScheme.tertiaryFixedDim,
  //     onTertiaryFixed: colorScheme.onTertiaryFixed,
  //     onTertiaryFixedVariant: colorScheme.onTertiaryFixedVariant,
  //     error: colorScheme.error,
  //     onError: colorScheme.onError,
  //     errorContainer: colorScheme.errorContainer,
  //     onErrorContainer: colorScheme.onErrorContainer,
  //     surface: colorScheme.surface,
  //     onSurface: colorScheme.onSurface,
  //     // ignore: deprecated_member_use
  //     surfaceVariant: colorScheme.surfaceVariant,
  //     onSurfaceVariant: colorScheme.onSurfaceVariant,
  //     surfaceContainerHighest: colorScheme.surfaceContainerHighest,
  //     surfaceContainerHigh: colorScheme.surfaceContainerHigh,
  //     surfaceContainer: colorScheme.surfaceContainer,
  //     surfaceContainerLow: colorScheme.surfaceContainerLow,
  //     surfaceContainerLowest: colorScheme.surfaceContainerLowest,
  //     inverseSurface: colorScheme.inverseSurface,
  //     inverseOnSurface: colorScheme.onInverseSurface,
  //     surfaceTint: colorScheme.surfaceTint,
  //     // ignore: deprecated_member_use
  //     background: colorScheme.background,
  //     // ignore: deprecated_member_use
  //     onBackground: colorScheme.onBackground,
  //     surfaceBright: colorScheme.surfaceBright,
  //     surfaceDim: colorScheme.surfaceDim,
  //     scrim: colorScheme.scrim,
  //     shadow: colorScheme.shadow,
  //     outline: colorScheme.outline,
  //     outlineVariant: colorScheme.outlineVariant,
  //   );
  // }

  Brightness get brightness;

  // Primary
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;

  // Add-on primary
  Color get primaryFixed;
  Color get onPrimaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixedVariant;
  Color get inversePrimary;

  // Secondary
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;

  // Add-on secondary
  Color get secondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixed;
  Color get onSecondaryFixedVariant;

  // Tertiary
  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;

  // Add-on tertiary
  Color get tertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixed;
  Color get onTertiaryFixedVariant;

  // Error
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;

  // Surface
  Color get surface;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get surfaceContainerHighest;
  Color get surfaceContainerHigh;
  Color get surfaceContainer;
  Color get surfaceContainerLow;
  Color get surfaceContainerLowest;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get surfaceTint;

  // Add-on surface
  @Deprecated("Use surface instead")
  Color get background;
  @Deprecated("Use onSurface instead")
  Color get onBackground;
  Color get surfaceBright;
  Color get surfaceDim;
  Color get scrim;
  Color get shadow;

  // Special surface
  Color get highestSurface => switch (brightness) {
    Brightness.light => surfaceDim,
    Brightness.dark => surfaceBright,
  };

  // Outline
  Color get outline;
  Color get outlineVariant;

  ColorThemeData copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? primaryFixed,
    Color? onPrimaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixedVariant,
    Color? inversePrimary,
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
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainerHighest,
    Color? surfaceContainerHigh,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? surfaceTint,
    Color? background,
    Color? onBackground,
    Color? surfaceBright,
    Color? surfaceDim,
    Color? scrim,
    Color? shadow,
    Color? outline,
    Color? outlineVariant,
  }) {
    return ColorThemeData(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
      primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
      onPrimaryFixedVariant:
          onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      secondaryFixed: secondaryFixed ?? this.secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
      onTertiaryFixedVariant:
          onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      // ignore: deprecated_member_use_from_same_package
      background: background ?? this.background,
      // ignore: deprecated_member_use_from_same_package
      onBackground: onBackground ?? this.onBackground,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      scrim: scrim ?? this.scrim,
      shadow: shadow ?? this.shadow,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
    );
  }

  ColorScheme toColorScheme() => ColorScheme(
    brightness: brightness,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    primaryFixed: primaryFixed,
    onPrimaryFixed: onPrimaryFixed,
    primaryFixedDim: primaryFixedDim,
    onPrimaryFixedVariant: onPrimaryFixedVariant,
    inversePrimary: inversePrimary,
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
    // ignore: deprecated_member_use
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    surfaceContainerHighest: surfaceContainerHighest,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainer: surfaceContainer,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainerLowest: surfaceContainerLowest,
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    surfaceTint: surfaceTint,
    // ignore: deprecated_member_use, deprecated_member_use_from_same_package
    background: background,
    // ignore: deprecated_member_use, deprecated_member_use_from_same_package
    onBackground: onBackground,
    surfaceBright: surfaceBright,
    surfaceDim: surfaceDim,
    scrim: scrim,
    shadow: shadow,
    outline: outline,
    outlineVariant: outlineVariant,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("primary", primary));
    properties.add(ColorProperty("onPrimary", onPrimary));
    properties.add(ColorProperty("primaryContainer", primaryContainer));
    properties.add(ColorProperty("onPrimaryContainer", onPrimaryContainer));
    properties.add(ColorProperty("primaryFixed", primaryFixed));
    properties.add(ColorProperty("onPrimaryFixed", onPrimaryFixed));
    properties.add(ColorProperty("primaryFixedDim", primaryFixedDim));
    properties.add(
      ColorProperty("onPrimaryFixedVariant", onPrimaryFixedVariant),
    );
    properties.add(ColorProperty("inversePrimary", inversePrimary));
    properties.add(ColorProperty("secondary", secondary));
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
    properties.add(ColorProperty("onError", onError));
    properties.add(ColorProperty("errorContainer", errorContainer));
    properties.add(ColorProperty("onErrorContainer", onErrorContainer));
    properties.add(ColorProperty("surface", surface));
    properties.add(ColorProperty("onSurface", onSurface));
    properties.add(ColorProperty("surfaceVariant", surfaceVariant));
    properties.add(ColorProperty("onSurfaceVariant", onSurfaceVariant));
    properties.add(
      ColorProperty("surfaceContainerHighest", surfaceContainerHighest),
    );
    properties.add(ColorProperty("surfaceContainerHigh", surfaceContainerHigh));
    properties.add(ColorProperty("surfaceContainer", surfaceContainer));
    properties.add(ColorProperty("surfaceContainerLow", surfaceContainerLow));
    properties.add(
      ColorProperty("surfaceContainerLowest", surfaceContainerLowest),
    );
    properties.add(ColorProperty("inverseSurface", inverseSurface));
    properties.add(ColorProperty("inverseOnSurface", inverseOnSurface));
    properties.add(ColorProperty("surfaceTint", surfaceTint));
    // ignore: deprecated_member_use_from_same_package
    properties.add(ColorProperty("background", background));
    // ignore: deprecated_member_use_from_same_package
    properties.add(ColorProperty("onBackground", onBackground));
    properties.add(ColorProperty("surfaceBright", surfaceBright));
    properties.add(ColorProperty("surfaceDim", surfaceDim));
    properties.add(ColorProperty("scrim", scrim));
    properties.add(ColorProperty("shadow", shadow));
    properties.add(ColorProperty("outline", outline));
    properties.add(ColorProperty("outlineVariant", outlineVariant));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ColorThemeData &&
            brightness == other.brightness &&
            primary == other.primary &&
            onPrimary == other.onPrimary &&
            primaryContainer == other.primaryContainer &&
            onPrimaryContainer == other.onPrimaryContainer &&
            primaryFixed == other.primaryFixed &&
            onPrimaryFixed == other.onPrimaryFixed &&
            primaryFixedDim == other.primaryFixedDim &&
            onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
            inversePrimary == other.inversePrimary &&
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
            surfaceVariant == other.surfaceVariant &&
            onSurfaceVariant == other.onSurfaceVariant &&
            surfaceContainerHighest == other.surfaceContainerHighest &&
            surfaceContainerHigh == other.surfaceContainerHigh &&
            surfaceContainer == other.surfaceContainer &&
            surfaceContainerLow == other.surfaceContainerLow &&
            surfaceContainerLowest == other.surfaceContainerLowest &&
            inverseSurface == other.inverseSurface &&
            inverseOnSurface == other.inverseOnSurface &&
            surfaceTint == other.surfaceTint &&
            // ignore: deprecated_member_use_from_same_package
            background == other.background &&
            // ignore: deprecated_member_use_from_same_package
            onBackground == other.onBackground &&
            surfaceBright == other.surfaceBright &&
            surfaceDim == other.surfaceDim &&
            scrim == other.scrim &&
            shadow == other.shadow &&
            outline == other.outline &&
            outlineVariant == other.outlineVariant;
  }

  @override
  int get hashCode => Object.hashAll([
    brightness,
    primary,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    primaryFixed,
    onPrimaryFixed,
    primaryFixedDim,
    onPrimaryFixedVariant,
    inversePrimary,
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
    surfaceVariant,
    onSurfaceVariant,
    surfaceContainerHighest,
    surfaceContainerHigh,
    surfaceContainer,
    surfaceContainerLow,
    surfaceContainerLowest,
    inverseSurface,
    inverseOnSurface,
    surfaceTint,
    // ignore: deprecated_member_use_from_same_package
    background,
    // ignore: deprecated_member_use_from_same_package
    onBackground,
    surfaceBright,
    surfaceDim,
    scrim,
    shadow,
    outline,
    outlineVariant,
  ]);
}

class _ColorThemeData extends ColorThemeData {
  const _ColorThemeData({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.inversePrimary,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceContainerHighest,
    required this.surfaceContainerHigh,
    required this.surfaceContainer,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.surfaceTint,
    @Deprecated("Use surface instead") required this.background,
    @Deprecated("Use onSurface instead") required this.onBackground,
    required this.surfaceBright,
    required this.surfaceDim,
    required this.scrim,
    required this.shadow,
    required this.outline,
    required this.outlineVariant,
  }) : super._();

  @override
  final Brightness brightness;

  @override
  final Color primary;

  @override
  final Color onPrimary;

  @override
  final Color primaryContainer;

  @override
  final Color onPrimaryContainer;

  @override
  final Color primaryFixed;

  @override
  final Color onPrimaryFixed;

  @override
  final Color primaryFixedDim;

  @override
  final Color onPrimaryFixedVariant;

  @override
  final Color inversePrimary;

  @override
  final Color secondary;

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
  final Color onError;

  @override
  final Color errorContainer;

  @override
  final Color onErrorContainer;

  @override
  final Color surface;

  @override
  final Color onSurface;

  @override
  final Color surfaceVariant;

  @override
  final Color onSurfaceVariant;

  @override
  final Color surfaceContainerHighest;

  @override
  final Color surfaceContainerHigh;

  @override
  final Color surfaceContainer;

  @override
  final Color surfaceContainerLow;

  @override
  final Color surfaceContainerLowest;

  @override
  final Color inverseSurface;

  @override
  final Color inverseOnSurface;

  @override
  final Color surfaceTint;

  @override
  final Color background;

  @override
  final Color onBackground;

  @override
  final Color surfaceBright;

  @override
  final Color surfaceDim;

  @override
  final Color scrim;

  @override
  final Color shadow;

  @override
  final Color outline;

  @override
  final Color outlineVariant;
}

class _ColorThemeDataFromColorScheme extends ColorThemeData {
  const _ColorThemeDataFromColorScheme({required this.colorScheme}) : super._();

  final ColorScheme colorScheme;

  @override
  Brightness get brightness => colorScheme.brightness;

  @override
  Color get primary => colorScheme.primary;

  @override
  Color get onPrimary => colorScheme.onPrimary;

  @override
  Color get primaryContainer => colorScheme.primaryContainer;

  @override
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  @override
  Color get primaryFixed => colorScheme.primaryFixed;

  @override
  Color get onPrimaryFixed => colorScheme.onPrimaryFixed;

  @override
  Color get primaryFixedDim => colorScheme.primaryFixedDim;

  @override
  Color get onPrimaryFixedVariant => colorScheme.onPrimaryFixedVariant;

  @override
  Color get inversePrimary => colorScheme.inversePrimary;

  @override
  Color get secondary => colorScheme.secondary;

  @override
  Color get onSecondary => colorScheme.onSecondary;

  @override
  Color get secondaryContainer => colorScheme.secondaryContainer;

  @override
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  @override
  Color get secondaryFixed => colorScheme.secondaryFixed;

  @override
  Color get secondaryFixedDim => colorScheme.secondaryFixedDim;

  @override
  Color get onSecondaryFixed => colorScheme.onSecondaryFixed;

  @override
  Color get onSecondaryFixedVariant => colorScheme.onSecondaryFixedVariant;

  @override
  Color get tertiary => colorScheme.tertiary;

  @override
  Color get onTertiary => colorScheme.onTertiary;

  @override
  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  @override
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  @override
  Color get tertiaryFixed => colorScheme.tertiaryFixed;

  @override
  Color get tertiaryFixedDim => colorScheme.tertiaryFixedDim;

  @override
  Color get onTertiaryFixed => colorScheme.onTertiaryFixed;

  @override
  Color get onTertiaryFixedVariant => colorScheme.onTertiaryFixedVariant;

  @override
  Color get error => colorScheme.error;

  @override
  Color get onError => colorScheme.onError;

  @override
  Color get errorContainer => colorScheme.errorContainer;

  @override
  Color get onErrorContainer => colorScheme.onErrorContainer;

  @override
  Color get surface => colorScheme.surface;

  @override
  Color get onSurface => colorScheme.onSurface;

  @override
  // ignore: deprecated_member_use
  Color get surfaceVariant => colorScheme.surfaceVariant;

  @override
  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;

  @override
  Color get surfaceContainerHighest => colorScheme.surfaceContainerHighest;

  @override
  Color get surfaceContainerHigh => colorScheme.surfaceContainerHigh;

  @override
  Color get surfaceContainer => colorScheme.surfaceContainer;

  @override
  Color get surfaceContainerLow => colorScheme.surfaceContainerLow;

  @override
  Color get surfaceContainerLowest => colorScheme.surfaceContainerLowest;

  @override
  Color get inverseSurface => colorScheme.inverseSurface;

  @override
  Color get inverseOnSurface => colorScheme.onInverseSurface;

  @override
  Color get surfaceTint => colorScheme.surfaceTint;

  @override
  // ignore: deprecated_member_use
  Color get background => colorScheme.background;

  @override
  // ignore: deprecated_member_use
  Color get onBackground => colorScheme.onBackground;

  @override
  Color get surfaceBright => colorScheme.surfaceBright;

  @override
  Color get surfaceDim => colorScheme.surfaceDim;

  @override
  Color get scrim => colorScheme.scrim;

  @override
  Color get shadow => colorScheme.shadow;

  @override
  Color get outline => colorScheme.outline;

  @override
  Color get outlineVariant => colorScheme.outlineVariant;

  @override
  ColorScheme toColorScheme() => colorScheme;
}

class ColorTheme extends InheritedTheme {
  const ColorTheme({super.key, required this.data, required super.child});

  final ColorThemeData data;

  @override
  bool updateShouldNotify(covariant ColorTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ColorTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ColorThemeData>("data", data));
  }

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final ColorThemeData? colorTheme = ColorTheme.maybeOf(context);
  /// ```
  ///
  /// Will return null if there is no ancestor [ColorTheme] in the `context`.
  static ColorThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorTheme>()?.data;
  }

  /// The data from the closest [ColorTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to creating an instance of [ColorThemeData] from the closest
  /// [ColorScheme] that encloses the given context if there is no
  /// [ColorTheme] in the given build context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final ColorThemeData colorTheme = ColorTheme.of(context);
  /// ```
  static ColorThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;

    final colorScheme = ColorScheme.of(context);
    return ColorThemeData.fromColorScheme(colorScheme: colorScheme);
  }
}
