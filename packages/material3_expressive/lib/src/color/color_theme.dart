import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:material_color_utilities/material_color_utilities.dart'
    as mcu_legacy;

import 'package:mcu/mcu.dart' as mcu;
import 'package:mcu/src/quantize/quantizer_result.dart' as mcu;
import 'package:mcu/src/quantize/quantizer_celebi.dart' as mcu;
import 'package:mcu/src/score/score.dart' as mcu;
// import 'package:material_color_utilities/quantize/qa'

enum DynamicSchemeVariant {
  monochrome(mcu.Variant.monochrome),
  neutral(mcu.Variant.neutral),
  tonalSpot(mcu.Variant.tonalSpot),
  vibrant(mcu.Variant.vibrant),
  expressive(mcu.Variant.expressive),
  fidelity(mcu.Variant.fidelity),
  content(mcu.Variant.content),
  rainbow(mcu.Variant.rainbow),
  fruitSalad(mcu.Variant.fruitSalad);

  const DynamicSchemeVariant(this._variant);

  // TODO: find a use or remove
  final mcu.Variant _variant;
}

// TODO: migrate these constants into some class and make them public
const double _contrastLevelLow = -1.0;
const double _contrastLevelNormal = 0.0;
const double _contrastLevelMedium = 0.5;
const double _contrastLevelHigh = 1.0;

mcu.DynamicScheme _buildDynamicScheme({
  required DynamicSchemeVariant variant,
  required Color sourceColor,
  required Brightness brightness,
  double contrastLevel = _contrastLevelNormal,
  mcu.SpecVersion? specVersion,
  mcu.Platform? platform,
}) {
  final sourceColorHct = mcu.Hct.fromInt(sourceColor.toARGB32());
  final isDark = brightness == Brightness.dark;
  return switch (variant) {
    DynamicSchemeVariant.monochrome => mcu.SchemeMonochrome(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
    ),
    DynamicSchemeVariant.neutral => mcu.SchemeNeutral(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
      specVersion: specVersion ?? mcu.SchemeNeutral.defaultSpecVersion,
      platform: platform ?? mcu.SchemeNeutral.defaultPlatform,
    ),
    DynamicSchemeVariant.tonalSpot => mcu.SchemeTonalSpot(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
      specVersion: specVersion ?? mcu.SchemeTonalSpot.defaultSpecVersion,
      platform: platform ?? mcu.SchemeTonalSpot.defaultPlatform,
    ),
    DynamicSchemeVariant.vibrant => mcu.SchemeVibrant(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
      specVersion: specVersion ?? mcu.SchemeVibrant.defaultSpecVersion,
      platform: platform ?? mcu.SchemeVibrant.defaultPlatform,
    ),
    DynamicSchemeVariant.expressive => mcu.SchemeExpressive(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
      specVersion: specVersion ?? mcu.SchemeExpressive.defaultSpecVersion,
      platform: platform ?? mcu.SchemeExpressive.defaultPlatform,
    ),
    DynamicSchemeVariant.fidelity => mcu.SchemeFidelity(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
    ),
    DynamicSchemeVariant.content => mcu.SchemeContent(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
    ),
    DynamicSchemeVariant.rainbow => mcu.SchemeRainbow(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
    ),
    DynamicSchemeVariant.fruitSalad => mcu.SchemeFruitSalad(
      sourceColorHct: sourceColorHct,
      isDark: isDark,
      contrastLevel: contrastLevel,
    ),
  };
}

extension on mcu.Hct {
  Color _toColor() => Color(toInt());
}

extension on Color {
  mcu.Hct _toHct() => mcu.Hct.fromInt(toARGB32());
}

extension on mcu.DynamicColor {
  Color _getColor(mcu.DynamicScheme scheme) => getHct(scheme)._toColor();
}

ColorThemeData _fromDynamicScheme(mcu.DynamicScheme scheme) {
  final colors = const mcu.MaterialDynamicColors();
  return ColorThemeData(
    brightness: scheme.isDark ? Brightness.dark : Brightness.light,
    primaryPaletteKeyColor: colors.primaryPaletteKeyColor()._getColor(scheme),
    secondaryPaletteKeyColor: colors.secondaryPaletteKeyColor()._getColor(
      scheme,
    ),
    tertiaryPaletteKeyColor: colors.tertiaryPaletteKeyColor()._getColor(scheme),
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
    surfaceContainerHighest: colors.surfaceContainerHighest()._getColor(scheme),
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
    onSecondaryFixedVariant: colors.onSecondaryFixedVariant()._getColor(scheme),
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

ColorThemeData _fromSourceColor({
  required DynamicSchemeVariant variant,
  required Color sourceColor,
  required Brightness brightness,
  double contrastLevel = _contrastLevelNormal,
}) {
  final scheme = _buildDynamicScheme(
    variant: variant,
    sourceColor: sourceColor,
    brightness: brightness,
    contrastLevel: contrastLevel,
    specVersion: mcu.SpecVersion.spec2025,
    platform: mcu.Platform.phone,
  );
  return ColorThemeData.fromDynamicScheme(scheme);
}

Future<ColorThemeData> _fromImage({
  required ImageProvider image,
  required Brightness brightness,
  DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
  double contrastLevel = 0.0,
}) async {
  // Extract dominant colors from image.
  final quantizerResult = await _extractColorsFromImageProvider(image);
  final colorToCount = quantizerResult.colorToCount.map(
    (key, value) => MapEntry<int, int>(_getArgbFromAbgr(key), value),
  );

  // Score colors for color scheme suitability.
  final List<int> scoredResults = mcu.Score.score(colorToCount, desired: 1);
  final baseColor = Color(scoredResults.first);
  final scheme = _buildDynamicScheme(
    variant: variant,
    sourceColor: baseColor,
    brightness: brightness,
    contrastLevel: contrastLevel,
  );
  return ColorThemeData.fromDynamicScheme(scheme);
  // return ColorThemeData.fromSeed(
  //   seedColor: baseColor,
  //   brightness: brightness,
  //   variant: variant,
  //   contrastLevel: contrastLevel,
  // );
}

int _getArgbFromAbgr(int abgr) {
  const int exceptRMask = 0xFF00FFFF;
  const int onlyRMask = ~exceptRMask;
  const int exceptBMask = 0xFFFFFF00;
  const int onlyBMask = ~exceptBMask;
  final int r = (abgr & onlyRMask) >> 16;
  final int b = abgr & onlyBMask;
  return (abgr & exceptRMask & exceptBMask) | (b << 16) | r;
}

Future<ui.Image> _imageProviderToScaled(ImageProvider imageProvider) async {
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
      final image = info.image;
      final width = image.width;
      final height = image.height;
      double paintWidth = width.toDouble();
      double paintHeight = height.toDouble();
      assert(width > 0 && height > 0);

      final rescale = width > maxDimension || height > maxDimension;
      if (rescale) {
        paintWidth = (width > height)
            ? maxDimension
            : (maxDimension / height) * width;
        paintHeight = (height > width)
            ? maxDimension
            : (maxDimension / width) * height;
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
      throw Exception("Failed to render image: $exception");
    },
  );

  loadFailureTimeout = Timer(const Duration(seconds: 5), () {
    stream.removeListener(listener);
    imageCompleter.completeError(
      TimeoutException("Timeout occurred trying to load image"),
    );
  });

  stream.addListener(listener);
  await imageCompleter.future;
  return scaledImage;
}

Future<mcu.QuantizerResult> _extractColorsFromImageProvider(
  ImageProvider imageProvider,
) async {
  final scaledImage = await _imageProviderToScaled(imageProvider);
  final imageBytes = await scaledImage.toByteData();

  // final quantizerResult = await QuantizerCelebi().quantize(
  //   imageBytes!.buffer.asUint32List(),
  //   128,
  //   returnInputPixelToClusterPixel: true,
  // );
  final quantizerResult = mcu.QuantizerCelebi.quantize(
    imageBytes!.buffer.asUint32List(),
    128,
  );
  return mcu.QuantizerResult(quantizerResult);
}

// class ContrastLevel {
//   const ContrastLevel(this.value);

//   final double value;

//   static const ContrastLevel low = ContrastLevel(-1.0);
//   static const ContrastLevel normal = ContrastLevel(0.0);
//   static const ContrastLevel medium = ContrastLevel(0.5);
//   static const ContrastLevel high = ContrastLevel(1.0);

//   static ContrastLevel lerp(ContrastLevel a, ContrastLevel b, double t) {
//     return ContrastLevel(lerpDouble(a.value, b.value, t)!);
//   }
// }

abstract class ColorThemeDataPartial with Diagnosticable {
  const factory ColorThemeDataPartial({
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
  }) = _ColorThemeDataPartial;

  const factory ColorThemeDataPartial.fromColorScheme(ColorScheme colorScheme) =
      _ColorThemeDataPartialFromColorScheme;

  // TODO: decide if fromDynamicScheme should be exposed on ColorThemeDataPartial,
  //  since ColorThemeData is assignable to ColorThemeDataPartial
  // factory ColorThemeDataPartial.fromDynamicScheme(mcu.DynamicScheme scheme) =
  //     ColorThemeData.fromDynamicScheme;

  // TODO: decide if fromSourceColor should be exposed on ColorThemeDataPartial,
  //  since ColorThemeData is assignable to ColorThemeDataPartial
  // factory ColorThemeDataPartial.fromSourceColor({
  //   required DynamicSchemeVariant variant,
  //   required Color sourceColor,
  //   required Brightness brightness,
  //   double contrastLevel,
  // }) = ColorThemeData.fromSourceColor;

  /// Baseline scheme with values taken from the
  /// official Material Design 3 (2021) guidelines:
  /// https://m3.material.io/styles/color/static/baseline
  factory ColorThemeDataPartial.static({required Brightness brightness}) =>
      switch (brightness) {
        Brightness.light => _staticLight,
        Brightness.dark => _staticDark,
      };

  Brightness? get brightness;

  Color? get primaryPaletteKeyColor;
  Color? get secondaryPaletteKeyColor;
  Color? get tertiaryPaletteKeyColor;
  Color? get neutralPaletteKeyColor;
  Color? get neutralVariantPaletteKeyColor;
  Color? get errorPaletteKeyColor;
  Color? get background;
  Color? get onBackground;
  Color? get surface;
  Color? get surfaceDim;
  Color? get surfaceBright;
  Color? get surfaceContainerLowest;
  Color? get surfaceContainerLow;
  Color? get surfaceContainer;
  Color? get surfaceContainerHigh;
  Color? get surfaceContainerHighest;
  Color? get onSurface;
  Color? get surfaceVariant;
  Color? get onSurfaceVariant;
  Color? get outline;
  Color? get outlineVariant;
  Color? get inverseSurface;
  Color? get inverseOnSurface;
  Color? get shadow;
  Color? get scrim;
  Color? get surfaceTint;
  Color? get primary;
  Color? get primaryDim;
  Color? get onPrimary;
  Color? get primaryContainer;
  Color? get onPrimaryContainer;
  Color? get primaryFixed;
  Color? get primaryFixedDim;
  Color? get onPrimaryFixed;
  Color? get onPrimaryFixedVariant;
  Color? get inversePrimary;
  Color? get secondary;
  Color? get secondaryDim;
  Color? get onSecondary;
  Color? get secondaryContainer;
  Color? get onSecondaryContainer;
  Color? get secondaryFixed;
  Color? get secondaryFixedDim;
  Color? get onSecondaryFixed;
  Color? get onSecondaryFixedVariant;
  Color? get tertiary;
  Color? get tertiaryDim;
  Color? get onTertiary;
  Color? get tertiaryContainer;
  Color? get onTertiaryContainer;
  Color? get tertiaryFixed;
  Color? get tertiaryFixedDim;
  Color? get onTertiaryFixed;
  Color? get onTertiaryFixedVariant;
  Color? get error;
  Color? get errorDim;
  Color? get onError;
  Color? get errorContainer;
  Color? get onErrorContainer;
  Color? get controlActivated;
  Color? get controlNormal;
  Color? get controlHighlight;
  Color? get textPrimaryInverse;
  Color? get textSecondaryAndTertiaryInverse;
  Color? get textPrimaryInverseDisableOnly;
  Color? get textSecondaryAndTertiaryInverseDisabled;
  Color? get textHintInverse;

  ColorThemeDataPartial copyWith({
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

  // ? Should we should have apply
  // ColorThemeDataPartial apply({ ... });

  ColorThemeDataPartial merge(ColorThemeDataPartial? other);

  // TODO: implement
  // bool get isConcrete;
  // ColorThemeData? get concreteOrNull;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

  /// Baseline scheme with values taken from the
  /// official Material Design 3 guidelines:
  /// https://m3.material.io/styles/color/static/baseline
  static const ColorThemeDataPartial _staticLight = ColorThemeDataPartial(
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
  static const ColorThemeDataPartial _staticDark = ColorThemeDataPartial(
    brightness: Brightness.dark,
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
}

mixin ColorThemeDataPartialMixin on Diagnosticable
    implements ColorThemeDataPartial {
  @override
  ColorThemeDataPartial copyWith({
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
    if (brightness == null &&
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
    return ColorThemeDataPartial(
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
  ColorThemeDataPartial merge(ColorThemeDataPartial? other) {
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
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      EnumProperty<Brightness>("brightness", brightness, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "primaryPaletteKeyColor",
        primaryPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "secondaryPaletteKeyColor",
        secondaryPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "tertiaryPaletteKeyColor",
        tertiaryPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "neutralPaletteKeyColor",
        neutralPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "neutralVariantPaletteKeyColor",
        neutralVariantPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "errorPaletteKeyColor",
        errorPaletteKeyColor,
        defaultValue: null,
      ),
    );
    properties.add(ColorProperty("background", background, defaultValue: null));
    properties.add(
      ColorProperty("onBackground", onBackground, defaultValue: null),
    );
    properties.add(ColorProperty("surface", surface, defaultValue: null));
    properties.add(ColorProperty("surfaceDim", surfaceDim, defaultValue: null));
    properties.add(
      ColorProperty("surfaceBright", surfaceBright, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerLowest",
        surfaceContainerLowest,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerLow",
        surfaceContainerLow,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("surfaceContainer", surfaceContainer, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerHigh",
        surfaceContainerHigh,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "surfaceContainerHighest",
        surfaceContainerHighest,
        defaultValue: null,
      ),
    );
    properties.add(ColorProperty("onSurface", onSurface, defaultValue: null));
    properties.add(
      ColorProperty("surfaceVariant", surfaceVariant, defaultValue: null),
    );
    properties.add(
      ColorProperty("onSurfaceVariant", onSurfaceVariant, defaultValue: null),
    );
    properties.add(ColorProperty("outline", outline, defaultValue: null));
    properties.add(
      ColorProperty("outlineVariant", outlineVariant, defaultValue: null),
    );
    properties.add(
      ColorProperty("inverseSurface", inverseSurface, defaultValue: null),
    );
    properties.add(
      ColorProperty("inverseOnSurface", inverseOnSurface, defaultValue: null),
    );
    properties.add(ColorProperty("shadow", shadow, defaultValue: null));
    properties.add(ColorProperty("scrim", scrim, defaultValue: null));
    properties.add(
      ColorProperty("surfaceTint", surfaceTint, defaultValue: null),
    );
    properties.add(ColorProperty("primary", primary, defaultValue: null));
    properties.add(ColorProperty("primaryDim", primaryDim, defaultValue: null));
    properties.add(ColorProperty("onPrimary", onPrimary, defaultValue: null));
    properties.add(
      ColorProperty("primaryContainer", primaryContainer, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "onPrimaryContainer",
        onPrimaryContainer,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("primaryFixed", primaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty("primaryFixedDim", primaryFixedDim, defaultValue: null),
    );
    properties.add(
      ColorProperty("onPrimaryFixed", onPrimaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "onPrimaryFixedVariant",
        onPrimaryFixedVariant,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("inversePrimary", inversePrimary, defaultValue: null),
    );
    properties.add(ColorProperty("secondary", secondary, defaultValue: null));
    properties.add(
      ColorProperty("secondaryDim", secondaryDim, defaultValue: null),
    );
    properties.add(
      ColorProperty("onSecondary", onSecondary, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "secondaryContainer",
        secondaryContainer,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "onSecondaryContainer",
        onSecondaryContainer,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("secondaryFixed", secondaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty("secondaryFixedDim", secondaryFixedDim, defaultValue: null),
    );
    properties.add(
      ColorProperty("onSecondaryFixed", onSecondaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "onSecondaryFixedVariant",
        onSecondaryFixedVariant,
        defaultValue: null,
      ),
    );
    properties.add(ColorProperty("tertiary", tertiary, defaultValue: null));
    properties.add(
      ColorProperty("tertiaryDim", tertiaryDim, defaultValue: null),
    );
    properties.add(ColorProperty("onTertiary", onTertiary, defaultValue: null));
    properties.add(
      ColorProperty("tertiaryContainer", tertiaryContainer, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "onTertiaryContainer",
        onTertiaryContainer,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("tertiaryFixed", tertiaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty("tertiaryFixedDim", tertiaryFixedDim, defaultValue: null),
    );
    properties.add(
      ColorProperty("onTertiaryFixed", onTertiaryFixed, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "onTertiaryFixedVariant",
        onTertiaryFixedVariant,
        defaultValue: null,
      ),
    );
    properties.add(ColorProperty("error", error, defaultValue: null));
    properties.add(ColorProperty("errorDim", errorDim, defaultValue: null));
    properties.add(ColorProperty("onError", onError, defaultValue: null));
    properties.add(
      ColorProperty("errorContainer", errorContainer, defaultValue: null),
    );
    properties.add(
      ColorProperty("onErrorContainer", onErrorContainer, defaultValue: null),
    );
    properties.add(
      ColorProperty("controlActivated", controlActivated, defaultValue: null),
    );
    properties.add(
      ColorProperty("controlNormal", controlNormal, defaultValue: null),
    );
    properties.add(
      ColorProperty("controlHighlight", controlHighlight, defaultValue: null),
    );
    properties.add(
      ColorProperty(
        "textPrimaryInverse",
        textPrimaryInverse,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "textSecondaryAndTertiaryInverse",
        textSecondaryAndTertiaryInverse,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "textPrimaryInverseDisableOnly",
        textPrimaryInverseDisableOnly,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty(
        "textSecondaryAndTertiaryInverseDisabled",
        textSecondaryAndTertiaryInverseDisabled,
        defaultValue: null,
      ),
    );
    properties.add(
      ColorProperty("textHintInverse", textHintInverse, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ColorThemeDataPartial &&
            brightness == other.brightness &&
            primaryPaletteKeyColor == other.primaryPaletteKeyColor &&
            secondaryPaletteKeyColor == other.secondaryPaletteKeyColor &&
            tertiaryPaletteKeyColor == other.tertiaryPaletteKeyColor &&
            neutralPaletteKeyColor == other.neutralPaletteKeyColor &&
            neutralVariantPaletteKeyColor ==
                other.neutralVariantPaletteKeyColor &&
            errorPaletteKeyColor == other.errorPaletteKeyColor &&
            background == other.background &&
            onBackground == other.onBackground &&
            surface == other.surface &&
            surfaceDim == other.surfaceDim &&
            surfaceBright == other.surfaceBright &&
            surfaceContainerLowest == other.surfaceContainerLowest &&
            surfaceContainerLow == other.surfaceContainerLow &&
            surfaceContainer == other.surfaceContainer &&
            surfaceContainerHigh == other.surfaceContainerHigh &&
            surfaceContainerHighest == other.surfaceContainerHighest &&
            onSurface == other.onSurface &&
            surfaceVariant == other.surfaceVariant &&
            onSurfaceVariant == other.onSurfaceVariant &&
            outline == other.outline &&
            outlineVariant == other.outlineVariant &&
            inverseSurface == other.inverseSurface &&
            inverseOnSurface == other.inverseOnSurface &&
            shadow == other.shadow &&
            scrim == other.scrim &&
            surfaceTint == other.surfaceTint &&
            primary == other.primary &&
            primaryDim == other.primaryDim &&
            onPrimary == other.onPrimary &&
            primaryContainer == other.primaryContainer &&
            onPrimaryContainer == other.onPrimaryContainer &&
            primaryFixed == other.primaryFixed &&
            primaryFixedDim == other.primaryFixedDim &&
            onPrimaryFixed == other.onPrimaryFixed &&
            onPrimaryFixedVariant == other.onPrimaryFixedVariant &&
            inversePrimary == other.inversePrimary &&
            secondary == other.secondary &&
            secondaryDim == other.secondaryDim &&
            onSecondary == other.onSecondary &&
            secondaryContainer == other.secondaryContainer &&
            onSecondaryContainer == other.onSecondaryContainer &&
            secondaryFixed == other.secondaryFixed &&
            secondaryFixedDim == other.secondaryFixedDim &&
            onSecondaryFixed == other.onSecondaryFixed &&
            onSecondaryFixedVariant == other.onSecondaryFixedVariant &&
            tertiary == other.tertiary &&
            tertiaryDim == other.tertiaryDim &&
            onTertiary == other.onTertiary &&
            tertiaryContainer == other.tertiaryContainer &&
            onTertiaryContainer == other.onTertiaryContainer &&
            tertiaryFixed == other.tertiaryFixed &&
            tertiaryFixedDim == other.tertiaryFixedDim &&
            onTertiaryFixed == other.onTertiaryFixed &&
            onTertiaryFixedVariant == other.onTertiaryFixedVariant &&
            error == other.error &&
            errorDim == other.errorDim &&
            onError == other.onError &&
            errorContainer == other.errorContainer &&
            onErrorContainer == other.onErrorContainer &&
            controlActivated == other.controlActivated &&
            controlNormal == other.controlNormal &&
            controlHighlight == other.controlHighlight &&
            textPrimaryInverse == other.textPrimaryInverse &&
            textSecondaryAndTertiaryInverse ==
                other.textSecondaryAndTertiaryInverse &&
            textPrimaryInverseDisableOnly ==
                other.textPrimaryInverseDisableOnly &&
            textSecondaryAndTertiaryInverseDisabled ==
                other.textSecondaryAndTertiaryInverseDisabled &&
            textHintInverse == other.textHintInverse;
  }

  @override
  int get hashCode => Object.hashAll([
    brightness,
    primaryPaletteKeyColor,
    secondaryPaletteKeyColor,
    tertiaryPaletteKeyColor,
    neutralPaletteKeyColor,
    neutralVariantPaletteKeyColor,
    errorPaletteKeyColor,
    background,
    onBackground,
    surface,
    surfaceDim,
    surfaceBright,
    surfaceContainerLowest,
    surfaceContainerLow,
    surfaceContainer,
    surfaceContainerHigh,
    surfaceContainerHighest,
    onSurface,
    surfaceVariant,
    onSurfaceVariant,
    outline,
    outlineVariant,
    inverseSurface,
    inverseOnSurface,
    shadow,
    scrim,
    surfaceTint,
    primary,
    primaryDim,
    onPrimary,
    primaryContainer,
    onPrimaryContainer,
    primaryFixed,
    primaryFixedDim,
    onPrimaryFixed,
    onPrimaryFixedVariant,
    inversePrimary,
    secondary,
    secondaryDim,
    onSecondary,
    secondaryContainer,
    onSecondaryContainer,
    secondaryFixed,
    secondaryFixedDim,
    onSecondaryFixed,
    onSecondaryFixedVariant,
    tertiary,
    tertiaryDim,
    onTertiary,
    tertiaryContainer,
    onTertiaryContainer,
    tertiaryFixed,
    tertiaryFixedDim,
    onTertiaryFixed,
    onTertiaryFixedVariant,
    error,
    errorDim,
    onError,
    errorContainer,
    onErrorContainer,
    controlActivated,
    controlNormal,
    controlHighlight,
    textPrimaryInverse,
    textSecondaryAndTertiaryInverse,
    textPrimaryInverseDisableOnly,
    textSecondaryAndTertiaryInverseDisabled,
    textHintInverse,
  ]);
}

class _ColorThemeDataPartial with Diagnosticable, ColorThemeDataPartialMixin {
  const _ColorThemeDataPartial({
    this.brightness,
    this.primaryPaletteKeyColor,
    this.secondaryPaletteKeyColor,
    this.tertiaryPaletteKeyColor,
    this.neutralPaletteKeyColor,
    this.neutralVariantPaletteKeyColor,
    this.errorPaletteKeyColor,
    this.background,
    this.onBackground,
    this.surface,
    this.surfaceDim,
    this.surfaceBright,
    this.surfaceContainerLowest,
    this.surfaceContainerLow,
    this.surfaceContainer,
    this.surfaceContainerHigh,
    this.surfaceContainerHighest,
    this.onSurface,
    this.surfaceVariant,
    this.onSurfaceVariant,
    this.outline,
    this.outlineVariant,
    this.inverseSurface,
    this.inverseOnSurface,
    this.shadow,
    this.scrim,
    this.surfaceTint,
    this.primary,
    this.primaryDim,
    this.onPrimary,
    this.primaryContainer,
    this.onPrimaryContainer,
    this.primaryFixed,
    this.primaryFixedDim,
    this.onPrimaryFixed,
    this.onPrimaryFixedVariant,
    this.inversePrimary,
    this.secondary,
    this.secondaryDim,
    this.onSecondary,
    this.secondaryContainer,
    this.onSecondaryContainer,
    this.secondaryFixed,
    this.secondaryFixedDim,
    this.onSecondaryFixed,
    this.onSecondaryFixedVariant,
    this.tertiary,
    this.tertiaryDim,
    this.onTertiary,
    this.tertiaryContainer,
    this.onTertiaryContainer,
    this.tertiaryFixed,
    this.tertiaryFixedDim,
    this.onTertiaryFixed,
    this.onTertiaryFixedVariant,
    this.error,
    this.errorDim,
    this.onError,
    this.errorContainer,
    this.onErrorContainer,
    this.controlActivated,
    this.controlNormal,
    this.controlHighlight,
    this.textPrimaryInverse,
    this.textSecondaryAndTertiaryInverse,
    this.textPrimaryInverseDisableOnly,
    this.textSecondaryAndTertiaryInverseDisabled,
    this.textHintInverse,
  });

  @override
  final Brightness? brightness;

  @override
  final Color? primaryPaletteKeyColor;

  @override
  final Color? secondaryPaletteKeyColor;

  @override
  final Color? tertiaryPaletteKeyColor;

  @override
  final Color? neutralPaletteKeyColor;

  @override
  final Color? neutralVariantPaletteKeyColor;

  @override
  final Color? errorPaletteKeyColor;

  @override
  final Color? background;

  @override
  final Color? onBackground;

  @override
  final Color? surface;

  @override
  final Color? surfaceDim;

  @override
  final Color? surfaceBright;

  @override
  final Color? surfaceContainerLowest;

  @override
  final Color? surfaceContainerLow;

  @override
  final Color? surfaceContainer;

  @override
  final Color? surfaceContainerHigh;

  @override
  final Color? surfaceContainerHighest;

  @override
  final Color? onSurface;

  @override
  final Color? surfaceVariant;

  @override
  final Color? onSurfaceVariant;

  @override
  final Color? outline;

  @override
  final Color? outlineVariant;

  @override
  final Color? inverseSurface;

  @override
  final Color? inverseOnSurface;

  @override
  final Color? shadow;

  @override
  final Color? scrim;

  @override
  final Color? surfaceTint;

  @override
  final Color? primary;

  @override
  final Color? primaryDim;

  @override
  final Color? onPrimary;

  @override
  final Color? primaryContainer;

  @override
  final Color? onPrimaryContainer;

  @override
  final Color? primaryFixed;

  @override
  final Color? primaryFixedDim;

  @override
  final Color? onPrimaryFixed;

  @override
  final Color? onPrimaryFixedVariant;

  @override
  final Color? inversePrimary;

  @override
  final Color? secondary;

  @override
  final Color? secondaryDim;

  @override
  final Color? onSecondary;

  @override
  final Color? secondaryContainer;

  @override
  final Color? onSecondaryContainer;

  @override
  final Color? secondaryFixed;

  @override
  final Color? secondaryFixedDim;

  @override
  final Color? onSecondaryFixed;

  @override
  final Color? onSecondaryFixedVariant;

  @override
  final Color? tertiary;

  @override
  final Color? tertiaryDim;

  @override
  final Color? onTertiary;

  @override
  final Color? tertiaryContainer;

  @override
  final Color? onTertiaryContainer;

  @override
  final Color? tertiaryFixed;

  @override
  final Color? tertiaryFixedDim;

  @override
  final Color? onTertiaryFixed;

  @override
  final Color? onTertiaryFixedVariant;

  @override
  final Color? error;

  @override
  final Color? errorDim;

  @override
  final Color? onError;

  @override
  final Color? errorContainer;

  @override
  final Color? onErrorContainer;

  @override
  final Color? controlActivated;

  @override
  final Color? controlNormal;

  @override
  final Color? controlHighlight;

  @override
  final Color? textPrimaryInverse;

  @override
  final Color? textSecondaryAndTertiaryInverse;

  @override
  final Color? textPrimaryInverseDisableOnly;

  @override
  final Color? textSecondaryAndTertiaryInverseDisabled;

  @override
  final Color? textHintInverse;
}

class _ColorThemeDataPartialFromColorScheme
    with Diagnosticable, ColorThemeDataPartialMixin {
  const _ColorThemeDataPartialFromColorScheme(
    ColorScheme colorScheme, {
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
  }) : _colorScheme = colorScheme,
       _brightness = brightness,
       _primaryPaletteKeyColor = primaryPaletteKeyColor,
       _secondaryPaletteKeyColor = secondaryPaletteKeyColor,
       _tertiaryPaletteKeyColor = tertiaryPaletteKeyColor,
       _neutralPaletteKeyColor = neutralPaletteKeyColor,
       _neutralVariantPaletteKeyColor = neutralVariantPaletteKeyColor,
       _errorPaletteKeyColor = errorPaletteKeyColor,
       _background = background,
       _onBackground = onBackground,
       _surface = surface,
       _surfaceDim = surfaceDim,
       _surfaceBright = surfaceBright,
       _surfaceContainerLowest = surfaceContainerLowest,
       _surfaceContainerLow = surfaceContainerLow,
       _surfaceContainer = surfaceContainer,
       _surfaceContainerHigh = surfaceContainerHigh,
       _surfaceContainerHighest = surfaceContainerHighest,
       _onSurface = onSurface,
       _surfaceVariant = surfaceVariant,
       _onSurfaceVariant = onSurfaceVariant,
       _outline = outline,
       _outlineVariant = outlineVariant,
       _inverseSurface = inverseSurface,
       _inverseOnSurface = inverseOnSurface,
       _shadow = shadow,
       _scrim = scrim,
       _surfaceTint = surfaceTint,
       _primary = primary,
       _primaryDim = primaryDim,
       _onPrimary = onPrimary,
       _primaryContainer = primaryContainer,
       _onPrimaryContainer = onPrimaryContainer,
       _primaryFixed = primaryFixed,
       _primaryFixedDim = primaryFixedDim,
       _onPrimaryFixed = onPrimaryFixed,
       _onPrimaryFixedVariant = onPrimaryFixedVariant,
       _inversePrimary = inversePrimary,
       _secondary = secondary,
       _secondaryDim = secondaryDim,
       _onSecondary = onSecondary,
       _secondaryContainer = secondaryContainer,
       _onSecondaryContainer = onSecondaryContainer,
       _secondaryFixed = secondaryFixed,
       _secondaryFixedDim = secondaryFixedDim,
       _onSecondaryFixed = onSecondaryFixed,
       _onSecondaryFixedVariant = onSecondaryFixedVariant,
       _tertiary = tertiary,
       _tertiaryDim = tertiaryDim,
       _onTertiary = onTertiary,
       _tertiaryContainer = tertiaryContainer,
       _onTertiaryContainer = onTertiaryContainer,
       _tertiaryFixed = tertiaryFixed,
       _tertiaryFixedDim = tertiaryFixedDim,
       _onTertiaryFixed = onTertiaryFixed,
       _onTertiaryFixedVariant = onTertiaryFixedVariant,
       _error = error,
       _errorDim = errorDim,
       _onError = onError,
       _errorContainer = errorContainer,
       _onErrorContainer = onErrorContainer,
       _controlActivated = controlActivated,
       _controlNormal = controlNormal,
       _controlHighlight = controlHighlight,
       _textPrimaryInverse = textPrimaryInverse,
       _textSecondaryAndTertiaryInverse = textSecondaryAndTertiaryInverse,
       _textPrimaryInverseDisableOnly = textPrimaryInverseDisableOnly,
       _textSecondaryAndTertiaryInverseDisabled =
           textSecondaryAndTertiaryInverseDisabled,
       _textHintInverse = textHintInverse;

  final ColorScheme _colorScheme;

  final Brightness? _brightness;
  final Color? _primaryPaletteKeyColor;
  final Color? _secondaryPaletteKeyColor;
  final Color? _tertiaryPaletteKeyColor;
  final Color? _neutralPaletteKeyColor;
  final Color? _neutralVariantPaletteKeyColor;
  final Color? _errorPaletteKeyColor;
  final Color? _background;
  final Color? _onBackground;
  final Color? _surface;
  final Color? _surfaceDim;
  final Color? _surfaceBright;
  final Color? _surfaceContainerLowest;
  final Color? _surfaceContainerLow;
  final Color? _surfaceContainer;
  final Color? _surfaceContainerHigh;
  final Color? _surfaceContainerHighest;
  final Color? _onSurface;
  final Color? _surfaceVariant;
  final Color? _onSurfaceVariant;
  final Color? _outline;
  final Color? _outlineVariant;
  final Color? _inverseSurface;
  final Color? _inverseOnSurface;
  final Color? _shadow;
  final Color? _scrim;
  final Color? _surfaceTint;
  final Color? _primary;
  final Color? _primaryDim;
  final Color? _onPrimary;
  final Color? _primaryContainer;
  final Color? _onPrimaryContainer;
  final Color? _primaryFixed;
  final Color? _primaryFixedDim;
  final Color? _onPrimaryFixed;
  final Color? _onPrimaryFixedVariant;
  final Color? _inversePrimary;
  final Color? _secondary;
  final Color? _secondaryDim;
  final Color? _onSecondary;
  final Color? _secondaryContainer;
  final Color? _onSecondaryContainer;
  final Color? _secondaryFixed;
  final Color? _secondaryFixedDim;
  final Color? _onSecondaryFixed;
  final Color? _onSecondaryFixedVariant;
  final Color? _tertiary;
  final Color? _tertiaryDim;
  final Color? _onTertiary;
  final Color? _tertiaryContainer;
  final Color? _onTertiaryContainer;
  final Color? _tertiaryFixed;
  final Color? _tertiaryFixedDim;
  final Color? _onTertiaryFixed;
  final Color? _onTertiaryFixedVariant;
  final Color? _error;
  final Color? _errorDim;
  final Color? _onError;
  final Color? _errorContainer;
  final Color? _onErrorContainer;
  final Color? _controlActivated;
  final Color? _controlNormal;
  final Color? _controlHighlight;
  final Color? _textPrimaryInverse;
  final Color? _textSecondaryAndTertiaryInverse;
  final Color? _textPrimaryInverseDisableOnly;
  final Color? _textSecondaryAndTertiaryInverseDisabled;
  final Color? _textHintInverse;

  @override
  Brightness? get brightness => _brightness ?? _colorScheme.brightness;

  @override
  Color? get primaryPaletteKeyColor => _primaryPaletteKeyColor;

  @override
  Color? get secondaryPaletteKeyColor => _secondaryPaletteKeyColor;

  @override
  Color? get tertiaryPaletteKeyColor => _tertiaryPaletteKeyColor;

  @override
  Color? get neutralPaletteKeyColor => _neutralPaletteKeyColor;

  @override
  Color? get neutralVariantPaletteKeyColor => _neutralVariantPaletteKeyColor;

  @override
  Color? get errorPaletteKeyColor => _errorPaletteKeyColor;

  @override
  // ignore: deprecated_member_use
  Color? get background => _background ?? _colorScheme.background;

  @override
  // ignore: deprecated_member_use
  Color? get onBackground => _onBackground ?? _colorScheme.onBackground;

  @override
  Color? get surface => _surface ?? _colorScheme.surface;

  @override
  Color? get surfaceDim => _surfaceDim ?? _colorScheme.surfaceDim;

  @override
  Color? get surfaceBright => _surfaceBright ?? _colorScheme.surfaceBright;

  @override
  Color? get surfaceContainerLowest =>
      _surfaceContainerLowest ?? _colorScheme.surfaceContainerLowest;

  @override
  Color? get surfaceContainerLow =>
      _surfaceContainerLow ?? _colorScheme.surfaceContainerLow;

  @override
  Color? get surfaceContainer =>
      _surfaceContainer ?? _colorScheme.surfaceContainer;

  @override
  Color? get surfaceContainerHigh =>
      _surfaceContainerHigh ?? _colorScheme.surfaceContainerHigh;

  @override
  Color? get surfaceContainerHighest =>
      _surfaceContainerHighest ?? _colorScheme.surfaceContainerHighest;

  @override
  Color? get onSurface => _onSurface ?? _colorScheme.onSurface;

  @override
  // ignore: deprecated_member_use
  Color? get surfaceVariant => _surfaceVariant ?? _colorScheme.surfaceVariant;

  @override
  Color? get onSurfaceVariant =>
      _onSurfaceVariant ?? _colorScheme.onSurfaceVariant;

  @override
  Color? get outline => _outline ?? _colorScheme.outline;

  @override
  Color? get outlineVariant => _outlineVariant ?? _colorScheme.outlineVariant;

  @override
  Color? get inverseSurface => _inverseSurface ?? _colorScheme.inverseSurface;

  @override
  Color? get inverseOnSurface =>
      _inverseOnSurface ?? _colorScheme.onInverseSurface;

  @override
  Color? get shadow => _shadow ?? _colorScheme.shadow;

  @override
  Color? get scrim => _scrim ?? _colorScheme.scrim;

  @override
  Color? get surfaceTint => _surfaceTint ?? _colorScheme.surfaceTint;

  @override
  Color? get primary => _primary ?? _colorScheme.primary;

  @override
  Color? get primaryDim => _primaryDim;

  @override
  Color? get onPrimary => _onPrimary ?? _colorScheme.onPrimary;

  @override
  Color? get primaryContainer =>
      _primaryContainer ?? _colorScheme.primaryContainer;

  @override
  Color? get onPrimaryContainer =>
      _onPrimaryContainer ?? _colorScheme.onPrimaryContainer;

  @override
  Color? get primaryFixed => _primaryFixed ?? _colorScheme.primaryFixed;

  @override
  Color? get primaryFixedDim =>
      _primaryFixedDim ?? _colorScheme.primaryFixedDim;

  @override
  Color? get onPrimaryFixed => _onPrimaryFixed ?? _colorScheme.onPrimaryFixed;

  @override
  Color? get onPrimaryFixedVariant =>
      _onPrimaryFixedVariant ?? _colorScheme.onPrimaryFixedVariant;

  @override
  Color? get inversePrimary => _inversePrimary ?? _colorScheme.inversePrimary;

  @override
  Color? get secondary => _secondary ?? _colorScheme.secondary;

  @override
  Color? get secondaryDim => _secondaryDim;

  @override
  Color? get onSecondary => _onSecondary ?? _colorScheme.onSecondary;

  @override
  Color? get secondaryContainer =>
      _secondaryContainer ?? _colorScheme.secondaryContainer;

  @override
  Color? get onSecondaryContainer =>
      _onSecondaryContainer ?? _colorScheme.onSecondaryContainer;

  @override
  Color? get secondaryFixed => _secondaryFixed ?? _colorScheme.secondaryFixed;

  @override
  Color? get secondaryFixedDim =>
      _secondaryFixedDim ?? _colorScheme.secondaryFixedDim;

  @override
  Color? get onSecondaryFixed =>
      _onSecondaryFixed ?? _colorScheme.onSecondaryFixed;

  @override
  Color? get onSecondaryFixedVariant =>
      _onSecondaryFixedVariant ?? _colorScheme.onSecondaryFixedVariant;

  @override
  Color? get tertiary => _tertiary ?? _colorScheme.tertiary;

  @override
  Color? get tertiaryDim => _tertiaryDim;

  @override
  Color? get onTertiary => _onTertiary ?? _colorScheme.onTertiary;

  @override
  Color? get tertiaryContainer =>
      _tertiaryContainer ?? _colorScheme.tertiaryContainer;

  @override
  Color? get onTertiaryContainer =>
      _onTertiaryContainer ?? _colorScheme.onTertiaryContainer;

  @override
  Color? get tertiaryFixed => _tertiaryFixed ?? _colorScheme.tertiaryFixed;

  @override
  Color? get tertiaryFixedDim =>
      _tertiaryFixedDim ?? _colorScheme.tertiaryFixedDim;

  @override
  Color? get onTertiaryFixed =>
      _onTertiaryFixed ?? _colorScheme.onTertiaryFixed;

  @override
  Color? get onTertiaryFixedVariant =>
      _onTertiaryFixedVariant ?? _colorScheme.onTertiaryFixedVariant;

  @override
  Color? get error => _error ?? _colorScheme.error;

  @override
  Color? get errorDim => _errorDim;

  @override
  Color? get onError => _onError ?? _colorScheme.onError;

  @override
  Color? get errorContainer => _errorContainer ?? _colorScheme.errorContainer;

  @override
  Color? get onErrorContainer =>
      _onErrorContainer ?? _colorScheme.onErrorContainer;

  @override
  Color? get controlActivated => _controlActivated;

  @override
  Color? get controlNormal => _controlNormal;

  @override
  Color? get controlHighlight => _controlHighlight;

  @override
  Color? get textPrimaryInverse => _textPrimaryInverse;

  @override
  Color? get textSecondaryAndTertiaryInverse =>
      _textSecondaryAndTertiaryInverse;

  @override
  Color? get textPrimaryInverseDisableOnly => _textPrimaryInverseDisableOnly;

  @override
  Color? get textSecondaryAndTertiaryInverseDisabled =>
      _textSecondaryAndTertiaryInverseDisabled;

  @override
  Color? get textHintInverse => _textHintInverse;

  @override
  ColorThemeDataPartial copyWith({
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
    if (brightness == null &&
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
    if (brightness != null &&
        primaryPaletteKeyColor != null &&
        secondaryPaletteKeyColor != null &&
        tertiaryPaletteKeyColor != null &&
        neutralPaletteKeyColor != null &&
        neutralVariantPaletteKeyColor != null &&
        errorPaletteKeyColor != null &&
        background != null &&
        onBackground != null &&
        surface != null &&
        surfaceDim != null &&
        surfaceBright != null &&
        surfaceContainerLowest != null &&
        surfaceContainerLow != null &&
        surfaceContainer != null &&
        surfaceContainerHigh != null &&
        surfaceContainerHighest != null &&
        onSurface != null &&
        surfaceVariant != null &&
        onSurfaceVariant != null &&
        outline != null &&
        outlineVariant != null &&
        inverseSurface != null &&
        inverseOnSurface != null &&
        shadow != null &&
        scrim != null &&
        surfaceTint != null &&
        primary != null &&
        primaryDim != null &&
        onPrimary != null &&
        primaryContainer != null &&
        onPrimaryContainer != null &&
        primaryFixed != null &&
        primaryFixedDim != null &&
        onPrimaryFixed != null &&
        onPrimaryFixedVariant != null &&
        inversePrimary != null &&
        secondary != null &&
        secondaryDim != null &&
        onSecondary != null &&
        secondaryContainer != null &&
        onSecondaryContainer != null &&
        secondaryFixed != null &&
        secondaryFixedDim != null &&
        onSecondaryFixed != null &&
        onSecondaryFixedVariant != null &&
        tertiary != null &&
        tertiaryDim != null &&
        onTertiary != null &&
        tertiaryContainer != null &&
        onTertiaryContainer != null &&
        tertiaryFixed != null &&
        tertiaryFixedDim != null &&
        onTertiaryFixed != null &&
        onTertiaryFixedVariant != null &&
        error != null &&
        errorDim != null &&
        onError != null &&
        errorContainer != null &&
        onErrorContainer != null &&
        controlActivated != null &&
        controlNormal != null &&
        controlHighlight != null &&
        textPrimaryInverse != null &&
        textSecondaryAndTertiaryInverse != null &&
        textPrimaryInverseDisableOnly != null &&
        textSecondaryAndTertiaryInverseDisabled != null &&
        textHintInverse != null) {
      return ColorThemeDataPartial(
        brightness: brightness,
        primaryPaletteKeyColor: primaryPaletteKeyColor,
        secondaryPaletteKeyColor: secondaryPaletteKeyColor,
        tertiaryPaletteKeyColor: tertiaryPaletteKeyColor,
        neutralPaletteKeyColor: neutralPaletteKeyColor,
        neutralVariantPaletteKeyColor: neutralVariantPaletteKeyColor,
        errorPaletteKeyColor: errorPaletteKeyColor,
        background: background,
        onBackground: onBackground,
        surface: surface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        inverseSurface: inverseSurface,
        inverseOnSurface: inverseOnSurface,
        shadow: shadow,
        scrim: scrim,
        surfaceTint: surfaceTint,
        primary: primary,
        primaryDim: primaryDim,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        primaryFixed: primaryFixed,
        primaryFixedDim: primaryFixedDim,
        onPrimaryFixed: onPrimaryFixed,
        onPrimaryFixedVariant: onPrimaryFixedVariant,
        inversePrimary: inversePrimary,
        secondary: secondary,
        secondaryDim: secondaryDim,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        secondaryFixed: secondaryFixed,
        secondaryFixedDim: secondaryFixedDim,
        onSecondaryFixed: onSecondaryFixed,
        onSecondaryFixedVariant: onSecondaryFixedVariant,
        tertiary: tertiary,
        tertiaryDim: tertiaryDim,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        tertiaryFixed: tertiaryFixed,
        tertiaryFixedDim: tertiaryFixedDim,
        onTertiaryFixed: onTertiaryFixed,
        onTertiaryFixedVariant: onTertiaryFixedVariant,
        error: error,
        errorDim: errorDim,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        controlActivated: controlActivated,
        controlNormal: controlNormal,
        controlHighlight: controlHighlight,
        textPrimaryInverse: textPrimaryInverse,
        textSecondaryAndTertiaryInverse: textSecondaryAndTertiaryInverse,
        textPrimaryInverseDisableOnly: textPrimaryInverseDisableOnly,
        textSecondaryAndTertiaryInverseDisabled:
            textSecondaryAndTertiaryInverseDisabled,
        textHintInverse: textHintInverse,
      );
    }
    return _ColorThemeDataPartialFromColorScheme(
      _colorScheme,
      brightness: brightness ?? _brightness,
      primaryPaletteKeyColor: primaryPaletteKeyColor ?? _primaryPaletteKeyColor,
      secondaryPaletteKeyColor:
          secondaryPaletteKeyColor ?? _secondaryPaletteKeyColor,
      tertiaryPaletteKeyColor:
          tertiaryPaletteKeyColor ?? _tertiaryPaletteKeyColor,
      neutralPaletteKeyColor: neutralPaletteKeyColor ?? _neutralPaletteKeyColor,
      neutralVariantPaletteKeyColor:
          neutralVariantPaletteKeyColor ?? _neutralVariantPaletteKeyColor,
      errorPaletteKeyColor: errorPaletteKeyColor ?? _errorPaletteKeyColor,
      background: background ?? _background,
      onBackground: onBackground ?? _onBackground,
      surface: surface ?? _surface,
      surfaceDim: surfaceDim ?? _surfaceDim,
      surfaceBright: surfaceBright ?? _surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest ?? _surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? _surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? _surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? _surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? _surfaceContainerHighest,
      onSurface: onSurface ?? _onSurface,
      surfaceVariant: surfaceVariant ?? _surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? _onSurfaceVariant,
      outline: outline ?? _outline,
      outlineVariant: outlineVariant ?? _outlineVariant,
      inverseSurface: inverseSurface ?? _inverseSurface,
      inverseOnSurface: inverseOnSurface ?? _inverseOnSurface,
      shadow: shadow ?? _shadow,
      scrim: scrim ?? _scrim,
      surfaceTint: surfaceTint ?? _surfaceTint,
      primary: primary ?? _primary,
      primaryDim: primaryDim ?? _primaryDim,
      onPrimary: onPrimary ?? _onPrimary,
      primaryContainer: primaryContainer ?? _primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? _onPrimaryContainer,
      primaryFixed: primaryFixed ?? _primaryFixed,
      primaryFixedDim: primaryFixedDim ?? _primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed ?? _onPrimaryFixed,
      onPrimaryFixedVariant: onPrimaryFixedVariant ?? _onPrimaryFixedVariant,
      inversePrimary: inversePrimary ?? _inversePrimary,
      secondary: secondary ?? _secondary,
      secondaryDim: secondaryDim ?? _secondaryDim,
      onSecondary: onSecondary ?? _onSecondary,
      secondaryContainer: secondaryContainer ?? _secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? _onSecondaryContainer,
      secondaryFixed: secondaryFixed ?? _secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? _secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? _onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? _onSecondaryFixedVariant,
      tertiary: tertiary ?? _tertiary,
      tertiaryDim: tertiaryDim ?? _tertiaryDim,
      onTertiary: onTertiary ?? _onTertiary,
      tertiaryContainer: tertiaryContainer ?? _tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? _onTertiaryContainer,
      tertiaryFixed: tertiaryFixed ?? _tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? _tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? _onTertiaryFixed,
      onTertiaryFixedVariant: onTertiaryFixedVariant ?? _onTertiaryFixedVariant,
      error: error ?? _error,
      errorDim: errorDim ?? _errorDim,
      onError: onError ?? _onError,
      errorContainer: errorContainer ?? _errorContainer,
      onErrorContainer: onErrorContainer ?? _onErrorContainer,
      controlActivated: controlActivated ?? _controlActivated,
      controlNormal: controlNormal ?? _controlNormal,
      controlHighlight: controlHighlight ?? _controlHighlight,
      textPrimaryInverse: textPrimaryInverse ?? _textPrimaryInverse,
      textSecondaryAndTertiaryInverse:
          textSecondaryAndTertiaryInverse ?? _textSecondaryAndTertiaryInverse,
      textPrimaryInverseDisableOnly:
          textPrimaryInverseDisableOnly ?? _textPrimaryInverseDisableOnly,
      textSecondaryAndTertiaryInverseDisabled:
          textSecondaryAndTertiaryInverseDisabled ??
          _textSecondaryAndTertiaryInverseDisabled,
      textHintInverse: textHintInverse ?? _textHintInverse,
    );
  }
}

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

  factory ColorThemeData.fromDynamicScheme(mcu.DynamicScheme scheme) =>
      _fromDynamicScheme(scheme);

  factory ColorThemeData.fromSourceColor({
    required DynamicSchemeVariant variant,
    required Color sourceColor,
    required Brightness brightness,
    double contrastLevel = _contrastLevelNormal,
  }) => _fromSourceColor(
    variant: variant,
    sourceColor: sourceColor,
    brightness: brightness,
    contrastLevel: contrastLevel,
  );

  factory ColorThemeData.baseline({
    required Brightness brightness,
    double contrastLevel = _contrastLevelNormal,
  }) {
    const sourceColor = Color(0xFF6750A4);
    final scheme = _buildDynamicScheme(
      variant: DynamicSchemeVariant.tonalSpot,
      sourceColor: sourceColor,
      brightness: brightness,
      contrastLevel: contrastLevel,
      specVersion: mcu.SpecVersion.spec2021,
      platform: mcu.Platform.phone,
    );
    return ColorThemeData.fromDynamicScheme(scheme);
  }

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

  ColorScheme toColorScheme();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
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
  ColorScheme toColorScheme() => _ColorSchemeFromColorThemeData(this);

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

class _ColorSchemeFromColorThemeData
    with Diagnosticable
    implements ColorScheme {
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
      return ColorScheme(
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
            other is ColorScheme &&
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

  static Widget merge({
    Key? key,
    required ColorThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        ColorTheme(key: key, data: of(context).merge(data), child: child),
  );

  static ColorThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorTheme>()?.data;
  }

  static ColorThemeData of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null);
    return result!;
  }
}
