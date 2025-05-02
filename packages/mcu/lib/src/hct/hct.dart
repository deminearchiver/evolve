import '../utils/color_utils.dart' as color_utils;
import 'cam16.dart';
import 'hct_solver.dart';
import 'viewing_conditions.dart';

final class Hct {
  Hct._(int argb) {
    _setInternalState(argb);
  }

  late double _hue;
  double get hue => _hue;
  set hue(double newHue) {
    _setInternalState(HctSolver.solveToInt(newHue, chroma, tone));
  }

  late double _chroma;
  double get chroma => _chroma;
  set chroma(double newChroma) {
    _setInternalState(HctSolver.solveToInt(hue, newChroma, tone));
  }

  late double _tone;
  double get tone => _tone;
  set tone(double newTone) {
    _setInternalState(HctSolver.solveToInt(hue, chroma, newTone));
  }

  late int _argb;
  int toInt() => _argb;

  bool get isBlue => hue >= 250 && hue < 270;

  bool get isYellow => hue >= 105 && hue < 125;

  bool get isCyan => hue >= 170 && hue < 207;

  Hct inViewingConditions(ViewingConditions vc) {
    // 1. Use CAM16 to find XYZ coordinates of color in specified VC.
    final cam16 = Cam16.fromInt(toInt());
    final viewedInVc = cam16.xyzInViewingConditions(vc, null);

    // 2. Create CAM16 of those XYZ coordinates in default VC.
    final recastInVc = Cam16.fromXyzInViewingConditions(
      viewedInVc[0],
      viewedInVc[1],
      viewedInVc[2],
      ViewingConditions.sRgb,
    );

    // 3. Create HCT from:
    // - CAM16 using default VC with XYZ coordinates in specified VC.
    // - L* converted from Y in XYZ coordinates in specified VC.
    return Hct.from(
      recastInVc.hue,
      recastInVc.chroma,
      color_utils.lstarFromY(viewedInVc[1]),
    );
  }

  void _setInternalState(int argb) {
    _argb = argb;
    final cam = Cam16.fromInt(argb);
    _hue = cam.hue;
    _chroma = cam.chroma;
    _tone = color_utils.lstarFromArgb(argb);
  }

  @override
  String toString() {
    return "HCT(${hue.round()}, ${chroma.round()}, ${tone.round()})";
  }

  static Hct from(double hue, double chroma, double tone) {
    int argb = HctSolver.solveToInt(hue, chroma, tone);
    return Hct._(argb);
  }

  static Hct fromInt(int argb) {
    return Hct._(argb);
  }
}
