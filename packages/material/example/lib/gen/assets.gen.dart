/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/google_pixel_9_pro_obsidian_rear.svg
  SvgGenImage get googlePixel9ProObsidianRear => const SvgGenImage(
    'assets/images/google_pixel_9_pro_obsidian_rear.svg',
    size: Size(725.0, 1528.0),
  );

  /// File path: assets/images/google_pixel_9_pro_porcelain_rear.svg
  SvgGenImage get googlePixel9ProPorcelainRear => const SvgGenImage(
    'assets/images/google_pixel_9_pro_porcelain_rear.svg',
    size: Size(725.0, 1528.0),
  );

  /// File path: assets/images/material_design.svg
  SvgGenImage get materialDesign => const SvgGenImage(
    'assets/images/material_design.svg',
    size: Size(880.0, 880.0),
  );

  /// List of all assets
  List<SvgGenImage> get values => [
    googlePixel9ProObsidianRear,
    googlePixel9ProPorcelainRear,
    materialDesign,
  ];
}

class $AssetsNowInAndroidGen {
  const $AssetsNowInAndroidGen();

  /// File path: assets/now_in_android/avatar_dark.svg
  SvgGenImage get avatarDark => const SvgGenImage(
    'assets/now_in_android/avatar_dark.svg',
    size: Size(24.0, 24.0),
  );

  /// File path: assets/now_in_android/avatar_light.svg
  SvgGenImage get avatarLight => const SvgGenImage(
    'assets/now_in_android/avatar_light.svg',
    size: Size(24.0, 24.0),
  );

  /// File path: assets/now_in_android/error.svg
  SvgGenImage get error => const SvgGenImage(
    'assets/now_in_android/error.svg',
    size: Size(192.0, 192.0),
  );

  /// List of all assets
  List<SvgGenImage> get values => [avatarDark, avatarLight, error];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsNowInAndroidGen nowInAndroid = $AssetsNowInAndroidGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
