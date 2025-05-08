import 'dart:math' as math;
import 'math_utils.dart' as math_utils;

const List<List<double>> _srgbToXyz = [
  [0.41233895, 0.35762064, 0.18051042],
  [0.2126, 0.7152, 0.0722],
  [0.01932141, 0.11916382, 0.95034478],
];

const List<List<double>> _xyzToSrgb = [
  [3.2413774792388685, -1.5376652402851851, -0.49885366846268053],
  [-0.9691452513005321, 1.8758853451067872, 0.04156585616912061],
  [0.05562093689691305, -0.20395524564742123, 1.0571799111220335],
];

const List<double> _whitePointD65 = [95.047, 100.0, 108.883];

int argbFromRgb(int red, int green, int blue) {
  return (255 << 24) |
      ((red & 255) << 16) |
      ((green & 255) << 8) |
      (blue & 255);
}

int argbFromLinrgb(List<double> linrgb) {
  final r = delinearized(linrgb[0]);
  final g = delinearized(linrgb[1]);
  final b = delinearized(linrgb[2]);
  return argbFromRgb(r, g, b);
}

int alphaFromArgb(int argb) => (argb >> 24) & 255;

int redFromArgb(int argb) => (argb >> 16) & 255;

int greenFromArgb(int argb) => (argb >> 8) & 255;

int blueFromArgb(int argb) => argb & 255;

bool isOpaque(int argb) => alphaFromArgb(argb) >= 255;

int argbFromXyz(double x, double y, double z) {
  final matrix = _xyzToSrgb;
  final linearR = matrix[0][0] * x + matrix[0][1] * y + matrix[0][2] * z;
  final linearG = matrix[1][0] * x + matrix[1][1] * y + matrix[1][2] * z;
  final linearB = matrix[2][0] * x + matrix[2][1] * y + matrix[2][2] * z;
  final r = delinearized(linearR);
  final g = delinearized(linearG);
  final b = delinearized(linearB);
  return argbFromRgb(r, g, b);
}

List<double> xyzFromArgb(int argb) {
  final r = linearized(redFromArgb(argb));
  final g = linearized(greenFromArgb(argb));
  final b = linearized(blueFromArgb(argb));
  return math_utils.matrixMultiply([r, g, b], _srgbToXyz);
}

int argbFromLab(double l, double a, double b) {
  List<double> whitePoint = _whitePointD65;
  final fy = (l + 16.0) / 116.0;
  final fx = a / 500.0 + fy;
  final fz = fy - b / 200.0;
  final xNormalized = _labInvf(fx);
  final yNormalized = _labInvf(fy);
  final zNormalized = _labInvf(fz);
  final x = xNormalized * whitePoint[0];
  final y = yNormalized * whitePoint[1];
  final z = zNormalized * whitePoint[2];
  return argbFromXyz(x, y, z);
}

List<double> labFromArgb(int argb) {
  final linearR = linearized(redFromArgb(argb));
  final linearG = linearized(greenFromArgb(argb));
  final linearB = linearized(blueFromArgb(argb));
  final matrix = _srgbToXyz;
  final x =
      matrix[0][0] * linearR + matrix[0][1] * linearG + matrix[0][2] * linearB;
  final y =
      matrix[1][0] * linearR + matrix[1][1] * linearG + matrix[1][2] * linearB;
  final z =
      matrix[2][0] * linearR + matrix[2][1] * linearG + matrix[2][2] * linearB;
  final whitePoint = _whitePointD65;
  final xNormalized = x / whitePoint[0];
  final yNormalized = y / whitePoint[1];
  final zNormalized = z / whitePoint[2];
  final fx = _labF(xNormalized);
  final fy = _labF(yNormalized);
  final fz = _labF(zNormalized);
  final l = 116.0 * fy - 16;
  final a = 500.0 * (fx - fy);
  final b = 200.0 * (fy - fz);
  return [l, a, b];
}

int argbFromLstar(double lstar) {
  final y = yFromLstar(lstar);
  final component = delinearized(y);
  return argbFromRgb(component, component, component);
}

double lstarFromArgb(int argb) {
  final y = xyzFromArgb(argb)[1];
  return 116.0 * _labF(y / 100.0) - 16.0;
}

double yFromLstar(double lstar) {
  return 100.0 * _labInvf((lstar + 16.0) / 116.0);
}

double lstarFromY(double y) {
  return _labF(y / 100.0) * 116.0 - 16.0;
}

double linearized(int rgbComponent) {
  double normalized = rgbComponent / 255.0;
  if (normalized <= 0.040449936) {
    return normalized / 12.92 * 100.0;
  } else {
    return math.pow((normalized + 0.055) / 1.055, 2.4).toDouble() * 100.0;
  }
}

int delinearized(double rgbComponent) {
  double normalized = rgbComponent / 100.0;
  double delinearized = 0.0;
  if (normalized <= 0.0031308) {
    delinearized = normalized * 12.92;
  } else {
    delinearized = 1.055 * math.pow(normalized, 1.0 / 2.4).toDouble() - 0.055;
  }
  return math_utils.clampInt(0, 255, (delinearized * 255.0).round());
}

List<double> whitePointD65() => _whitePointD65;

double _labF(double t) {
  final e = 216.0 / 24389.0;
  final kappa = 24389.0 / 27.0;
  if (t > e) {
    return math.pow(t, 1.0 / 3.0).toDouble();
  } else {
    return (kappa * t + 16) / 116;
  }
}

double _labInvf(double ft) {
  final e = 216.0 / 24389.0;
  final kappa = 24389.0 / 27.0;
  final ft3 = ft * ft * ft;
  if (ft3 > e) {
    return ft3;
  } else {
    return (116 * ft - 16) / kappa;
  }
}
