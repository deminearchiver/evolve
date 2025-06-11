import '../hct/hct.dart';

abstract final class DislikeAnalyzer {
  static bool isDisliked(Hct hct) {
    final huePasses =
        hct.hue.roundToDouble() >= 90.0 && hct.hue.roundToDouble() <= 111.0;
    final chromaPasses = hct.chroma.roundToDouble() > 16.0;
    final tonePasses = hct.tone.roundToDouble() < 65.0;
    return huePasses && chromaPasses && tonePasses;
  }

  static Hct fixIfDisliked(Hct hct) {
    if (isDisliked(hct)) {
      return Hct.from(hct.hue, hct.chroma, 70.0);
    }
    return hct;
  }
}
