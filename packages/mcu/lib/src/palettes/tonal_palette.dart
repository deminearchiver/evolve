import '../hct/hct.dart';

final class TonalPalette {
  TonalPalette._(this.hue, this.chroma, this.keyColor) : _cache = <int, int>{};

  TonalPalette.fromInt(int argb) : this.fromHct(Hct.fromInt(argb));

  TonalPalette.fromHct(Hct hct) : this._(hct.hue, hct.chroma, hct);

  factory TonalPalette.fromHueAndChroma(double hue, double chroma) {
    final keyColor = KeyColor(hue, chroma).create();
    return TonalPalette._(hue, chroma, keyColor);
  }

  final double hue;
  final double chroma;
  final Hct keyColor;
  final Map<int, int> _cache;

  int tone(int tone) => _cache.putIfAbsent(tone, () {
    return tone == 99 && Hct.isYellow(hue)
        ? _averageArgb(this.tone(98), this.tone(100))
        : Hct.from(hue, chroma, tone.toDouble()).toInt();
  });

  Hct getHct(double tone) => Hct.from(hue, chroma, tone);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is TonalPalette &&
            hue == other.hue &&
            chroma == other.chroma &&
            keyColor == other.keyColor;
  }

  @override
  int get hashCode => Object.hash(runtimeType, hue, chroma, keyColor);

  static int _averageArgb(int argb1, int argb2) {
    int red1 = (argb1 >>> 16) & 0xff;
    int green1 = (argb1 >>> 8) & 0xff;
    int blue1 = argb1 & 0xff;
    int red2 = (argb2 >>> 16) & 0xff;
    int green2 = (argb2 >>> 8) & 0xff;
    int blue2 = argb2 & 0xff;
    int red = ((red1 + red2) / 2.0).round();
    int green = ((green1 + green2) / 2.0).round();
    int blue = ((blue1 + blue2) / 2.0).round();
    return (255 << 24 |
            (red & 255) << 16 |
            (green & 255) << 8 |
            (blue & 255)) >>>
        0;
  }
}

final class KeyColor {
  final double hue;
  final double requestedChroma;
  final Map<int, double> _chromaCache = <int, double>{};
  static const double _maxChromaValue = 200.0;

  KeyColor(this.hue, this.requestedChroma);

  Hct create() {
    // Pivot around T50 because T50 has the most chroma available, on
    // average. Thus it is most likely to have a direct answer.
    const int pivotTone = 50;
    const int toneStepSize = 1;
    // Epsilon to accept values slightly higher than the requested chroma.
    const double epsilon = 0.01;

    // Binary search to find the tone that can provide a chroma that is closest
    // to the requested chroma.
    int lowerTone = 0;
    int upperTone = 100;
    while (lowerTone < upperTone) {
      final int midTone = (lowerTone + upperTone) ~/ 2;
      final isAscending =
          _maxChroma(midTone) < _maxChroma(midTone + toneStepSize);
      final sufficientChroma = _maxChroma(midTone) >= requestedChroma - epsilon;

      if (sufficientChroma) {
        // Either range [lowerTone, midTone] or [midTone, upperTone] has
        // the answer, so search in the range that is closer the pivot tone.
        if ((lowerTone - pivotTone).abs() < (upperTone - pivotTone).abs()) {
          upperTone = midTone;
        } else {
          if (lowerTone == midTone) {
            return Hct.from(hue, requestedChroma, lowerTone.toDouble());
          }
          lowerTone = midTone;
        }
      } else {
        // As there is no sufficient chroma in the midTone, follow the direction to the chroma
        // peak.
        if (isAscending) {
          lowerTone = midTone + toneStepSize;
        } else {
          // Keep midTone for potential chroma peak.
          upperTone = midTone;
        }
      }
    }

    return Hct.from(hue, requestedChroma, lowerTone.toDouble());
  }

  // Find the maximum chroma for a given tone
  double _maxChroma(int tone) => _chromaCache.putIfAbsent(
    tone,
    () => Hct.from(hue, _maxChromaValue, tone.toDouble()).chroma,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is KeyColor &&
            hue == other.hue &&
            requestedChroma == other.requestedChroma;
  }

  @override
  int get hashCode => Object.hash(runtimeType, hue, requestedChroma);
}
