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

part 'color_theme.dart';
part 'color_theme_data.dart';
part 'color_theme_data_partial.dart';

extension on mcu.Hct {
  Color _toColor() => Color(toInt());
}

extension on Color {
  mcu.Hct _toHct() => mcu.Hct.fromInt(toARGB32());
}

extension on mcu.DynamicColor {
  Color _getColor(mcu.DynamicScheme scheme) => getHct(scheme)._toColor();
}

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
  final sourceColorHct = sourceColor._toHct();
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

Future<ColorThemeData> _fromImageProvider({
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
