import 'dart:math' as math;
import '../utils/math_utils.dart' as math_utils;
import '../utils/color_utils.dart' as color_utils;
import 'viewing_conditions.dart';

/// CAM16, a color appearance model. Colors are not just defined by their hex code, but rather, a hex
/// code and viewing conditions.
///
/// <p>CAM16 instances also have coordinates in the CAM16-UCS space, called J*, a*, b*, or jstar,
/// astar, bstar in code. CAM16-UCS is included in the CAM16 specification, and should be used when
/// measuring distances between colors.
///
/// <p>In traditional color spaces, a color can be identified solely by the observer's measurement of
/// the color. Color appearance models such as CAM16 also use information about the environment where
/// the color was observed, known as the viewing conditions.
///
/// <p>For example, white under the traditional assumption of a midday sun white point is accurately
/// measured as a slightly chromatic blue by CAM16. (roughly, hue 203, chroma 3, lightness 100)
final class Cam16 {
  Cam16(
    this.hue,
    this.chroma,
    this.j,
    this.q,
    this.m,
    this.s,
    this.jstar,
    this.astar,
    this.bstar,
  );

  // CAM16 color dimensions, see getters for documentation.
  final double hue;
  final double chroma;
  final double j;
  final double q;
  final double m;
  final double s;

  // Coordinates in UCS space. Used to determine color distance, like delta E equations in L*a*b*.
  final double jstar;
  final double astar;
  final double bstar;

  final List<double> _tempArray = [0.0, 0.0, 0.0];

  double distance(Cam16 other) {
    final dJ = jstar - other.jstar;
    final dA = astar - other.astar;
    final dB = bstar - other.bstar;
    final dEPrime = math.sqrt(dJ * dJ + dA * dA + dB * dB);
    final dE = 1.41 * math.pow(dEPrime, 0.63).toDouble();
    return dE;
  }

  int toInt() {
    return viewed(ViewingConditions.sRgb);
  }

  int viewed(ViewingConditions viewingConditions) {
    final xyz = xyzInViewingConditions(viewingConditions, _tempArray);
    return color_utils.argbFromXyz(xyz[0], xyz[1], xyz[2]);
  }

  List<double> xyzInViewingConditions(
    ViewingConditions viewingConditions, [
    List<double>? returnArray,
  ]) {
    final alpha = (chroma == 0.0 || j == 0.0)
        ? 0.0
        : chroma / math.sqrt(j / 100.0);

    final t = math
        .pow(
          alpha /
              math.pow(
                1.64 - math.pow(0.29, viewingConditions.n).toDouble(),
                0.73,
              ),
          1.0 / 0.9,
        )
        .toDouble();
    final hRad = math_utils.toRadians(hue);

    final eHue = 0.25 * (math.cos(hRad + 2.0) + 3.8);
    final ac =
        viewingConditions.aw *
        math.pow(j / 100.0, 1.0 / viewingConditions.c / viewingConditions.z);
    final p1 =
        eHue * (50000.0 / 13.0) * viewingConditions.nc * viewingConditions.ncb;
    final p2 = (ac / viewingConditions.nbb);

    final hSin = math.sin(hRad);
    final hCos = math.cos(hRad);

    final gamma =
        23.0 *
        (p2 + 0.305) *
        t /
        (23.0 * p1 + 11.0 * t * hCos + 108.0 * t * hSin);
    final a = gamma * hCos;
    final b = gamma * hSin;
    final rA = (460.0 * p2 + 451.0 * a + 288.0 * b) / 1403.0;
    final gA = (460.0 * p2 - 891.0 * a - 261.0 * b) / 1403.0;
    final bA = (460.0 * p2 - 220.0 * a - 6300.0 * b) / 1403.0;

    final rCBase = math.max(0, (27.13 * rA.abs()) / (400.0 - rA.abs()));
    final rC =
        math_utils.signum(rA) *
        (100.0 / viewingConditions.fl) *
        math.pow(rCBase, 1.0 / 0.42);
    final gCBase = math.max(0, (27.13 * gA.abs()) / (400.0 - gA.abs()));
    final gC =
        math_utils.signum(gA) *
        (100.0 / viewingConditions.fl) *
        math.pow(gCBase, 1.0 / 0.42);
    final bCBase = math.max(0, (27.13 * bA.abs()) / (400.0 - bA.abs()));
    final bC =
        math_utils.signum(bA) *
        (100.0 / viewingConditions.fl) *
        math.pow(bCBase, 1.0 / 0.42);
    final rF = rC / viewingConditions.rgbD[0];
    final gF = gC / viewingConditions.rgbD[1];
    final bF = bC / viewingConditions.rgbD[2];

    final matrix = _cam16RgbToXyz;
    final x = (rF * matrix[0][0]) + (gF * matrix[0][1]) + (bF * matrix[0][2]);
    final y = (rF * matrix[1][0]) + (gF * matrix[1][1]) + (bF * matrix[1][2]);
    final z = (rF * matrix[2][0]) + (gF * matrix[2][1]) + (bF * matrix[2][2]);

    if (returnArray != null) {
      returnArray[0] = x;
      returnArray[1] = y;
      returnArray[2] = z;
      return returnArray;
    } else {
      return [x, y, z];
    }
  }

  static const List<List<double>> _xyzToCam16Rgb = [
    [0.401288, 0.650173, -0.051461],
    [-0.250268, 1.204414, 0.045854],
    [-0.002079, 0.048952, 0.953127],
  ];
  static const List<List<double>> _cam16RgbToXyz = [
    [1.8620678, -1.0112547, 0.14918678],
    [0.38752654, 0.62144744, -0.00897398],
    [-0.01584150, -0.03412294, 1.0499644],
  ];

  static Cam16 fromInt(int argb) {
    return fromIntInViewingConditions(argb, ViewingConditions.sRgb);
  }

  static Cam16 fromIntInViewingConditions(
    int argb,
    ViewingConditions viewingConditions,
  ) {
    // Transform ARGB int to XYZ
    final red = (argb & 0x00ff0000) >> 16;
    final green = (argb & 0x0000ff00) >> 8;
    final blue = (argb & 0x000000ff);
    final redL = color_utils.linearized(red);
    final greenL = color_utils.linearized(green);
    final blueL = color_utils.linearized(blue);
    final x = 0.41233895 * redL + 0.35762064 * greenL + 0.18051042 * blueL;
    final y = 0.2126 * redL + 0.7152 * greenL + 0.0722 * blueL;
    final z = 0.01932141 * redL + 0.11916382 * greenL + 0.95034478 * blueL;

    return fromXyzInViewingConditions(x, y, z, viewingConditions);
  }

  static Cam16 fromXyzInViewingConditions(
    double x,
    double y,
    double z,
    ViewingConditions viewingConditions,
  ) {
    // Transform XYZ to 'cone'/'rgb' responses
    final matrix = _xyzToCam16Rgb;
    final rT = (x * matrix[0][0]) + (y * matrix[0][1]) + (z * matrix[0][2]);
    final gT = (x * matrix[1][0]) + (y * matrix[1][1]) + (z * matrix[1][2]);
    final bT = (x * matrix[2][0]) + (y * matrix[2][1]) + (z * matrix[2][2]);

    // Discount illuminant
    final rD = viewingConditions.rgbD[0] * rT;
    final gD = viewingConditions.rgbD[1] * gT;
    final bD = viewingConditions.rgbD[2] * bT;

    // Chromatic adaptation
    final rAF = math
        .pow(viewingConditions.fl * rD.abs() / 100.0, 0.42)
        .toDouble();
    final gAF = math
        .pow(viewingConditions.fl * gD.abs() / 100.0, 0.42)
        .toDouble();
    final bAF = math
        .pow(viewingConditions.fl * bD.abs() / 100.0, 0.42)
        .toDouble();
    final rA = math_utils.signum(rD) * 400.0 * rAF / (rAF + 27.13);
    final gA = math_utils.signum(gD) * 400.0 * gAF / (gAF + 27.13);
    final bA = math_utils.signum(bD) * 400.0 * bAF / (bAF + 27.13);

    // redness-greenness
    final a = (11.0 * rA + -12.0 * gA + bA) / 11.0;
    // yellowness-blueness
    final b = (rA + gA - 2.0 * bA) / 9.0;

    // auxiliary components
    final u = (20.0 * rA + 20.0 * gA + 21.0 * bA) / 20.0;
    final p2 = (40.0 * rA + 20.0 * gA + bA) / 20.0;

    // hue
    final atan2 = math.atan2(b, a);
    final atanDegrees = math_utils.toDegrees(atan2);
    final hue = atanDegrees < 0
        ? atanDegrees + 360.0
        : atanDegrees >= 360
        ? atanDegrees - 360.0
        : atanDegrees;
    final hueRadians = math_utils.toRadians(hue);

    // achromatic response to color
    final ac = p2 * viewingConditions.nbb;

    // CAM16 lightness and brightness
    final j =
        100.0 *
        math.pow(
          ac / viewingConditions.aw,
          viewingConditions.c * viewingConditions.z,
        );
    final q =
        4.0 /
        viewingConditions.c *
        math.sqrt(j / 100.0) *
        (viewingConditions.aw + 4.0) *
        viewingConditions.flRoot;

    // CAM16 chroma, colorfulness, and saturation.
    final huePrime = (hue < 20.14) ? hue + 360 : hue;
    final eHue = 0.25 * (math.cos(math_utils.toRadians(huePrime) + 2.0) + 3.8);
    final p1 =
        50000.0 / 13.0 * eHue * viewingConditions.nc * viewingConditions.ncb;
    final t = p1 * math_utils.hypot(a, b) / (u + 0.305);
    final alpha =
        math
            .pow(1.64 - math.pow(0.29, viewingConditions.n).toDouble(), 0.73)
            .toDouble() *
        math.pow(t, 0.9).toDouble();
    // CAM16 chroma, colorfulness, saturation
    final c = alpha * math.sqrt(j / 100.0);
    final m = c * viewingConditions.flRoot;
    final s =
        50.0 *
        math.sqrt((alpha * viewingConditions.c) / (viewingConditions.aw + 4.0));

    // CAM16-UCS components
    final jstar = (1.0 + 100.0 * 0.007) * j / (1.0 + 0.007 * j);
    final mstar = 1.0 / 0.0228 * math_utils.log1p(0.0228 * m);
    final astar = mstar * math.cos(hueRadians);
    final bstar = mstar * math.sin(hueRadians);

    return Cam16(hue, c, j, q, m, s, jstar, astar, bstar);
  }

  static Cam16 fromJch(double j, double c, double h) {
    return fromJchInViewingConditions(j, c, h, ViewingConditions.sRgb);
  }

  static Cam16 fromJchInViewingConditions(
    double j,
    double c,
    double h,
    ViewingConditions viewingConditions,
  ) {
    final q =
        4.0 /
        viewingConditions.c *
        math.sqrt(j / 100.0) *
        (viewingConditions.aw + 4.0) *
        viewingConditions.flRoot;
    final m = c * viewingConditions.flRoot;
    final alpha = c / math.sqrt(j / 100.0);
    final s =
        50.0 *
        math.sqrt((alpha * viewingConditions.c) / (viewingConditions.aw + 4.0));

    final hueRadians = math_utils.toRadians(h);
    final jstar = (1.0 + 100.0 * 0.007) * j / (1.0 + 0.007 * j);
    final mstar = 1.0 / 0.0228 * math_utils.log1p(0.0228 * m);
    final astar = mstar * math.cos(hueRadians);
    final bstar = mstar * math.sin(hueRadians);
    return Cam16(h, c, j, q, m, s, jstar, astar, bstar);
  }

  static Cam16 fromUcs(double jstar, double astar, double bstar) {
    return fromUcsInViewingConditions(
      jstar,
      astar,
      bstar,
      ViewingConditions.sRgb,
    );
  }

  static Cam16 fromUcsInViewingConditions(
    double jstar,
    double astar,
    double bstar,
    ViewingConditions viewingConditions,
  ) {
    final m = math_utils.hypot(astar, bstar);
    final m2 = math_utils.expm1(m * 0.0228) / 0.0228;
    final c = m2 / viewingConditions.flRoot;
    double h = math.atan2(bstar, astar) * (180.0 / math.pi);
    if (h < 0.0) {
      h += 360.0;
    }
    final j = jstar / (1.0 - (jstar - 100.0) * 0.007);
    return fromJchInViewingConditions(j, c, h, viewingConditions);
  }
}
