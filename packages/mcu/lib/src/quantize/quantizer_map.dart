import 'dart:collection';

import 'package:mcu/src/quantize/quantizer.dart';
import 'package:mcu/src/quantize/quantizer_result.dart';

final class QuantizerMap implements Quantizer {
  QuantizerMap();

  late Map<int, int> _colorToCount;
  Map<int, int> get colorToCount => _colorToCount;

  @override
  QuantizerResult quantize(List<int> pixels, int maxColors) {
    final Map<int, int> pixelByCount = <int, int>{};
    for (final pixel in pixels) {
      final currentPixelCount = pixelByCount[pixel];
      final newPixelCount = currentPixelCount == null
          ? 1
          : currentPixelCount + 1;
      pixelByCount[pixel] = newPixelCount;
    }
    _colorToCount = pixelByCount;
    return QuantizerResult(pixelByCount);
  }
}
