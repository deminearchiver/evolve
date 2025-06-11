import 'dart:math' as math;

int signum(double num) => switch (num) {
  < 0 => -1,
  == 0 => 0,
  _ => 1,
};

double lerp(double start, double stop, double amount) {
  return (1 - amount) * start + amount * stop;
}

int clampInt(int min, int max, int input) {
  if (input < min) return min;
  if (input > max) return max;
  return input;
}

double clampDouble(double min, double max, double input) {
  if (input < min) return min;
  if (input > max) return max;
  return input;
}

int sanitizeDegreesInt(int degrees) {
  degrees = degrees % 360;
  if (degrees < 0) degrees = degrees + 360;
  return degrees;
}

double sanitizeDegreesDouble(double degrees) {
  degrees = degrees % 360;
  if (degrees < 0) degrees = degrees + 360;
  return degrees;
}

double rotationDirection(double from, double to) {
  final increasingDifference = sanitizeDegreesDouble(to - from);
  return increasingDifference <= 180 ? 1 : -1;
}

double differenceDegrees(double a, double b) {
  return 180 - ((a - b).abs() - 180);
}

List<double> matrixMultiply(List<double> row, List<List<double>> matrix) {
  final a =
      row[0] * matrix[0][0] + row[1] * matrix[0][1] + row[2] * matrix[0][2];
  final b =
      row[0] * matrix[1][0] + row[1] * matrix[1][1] + row[2] * matrix[1][2];
  final c =
      row[0] * matrix[2][0] + row[1] * matrix[2][1] + row[2] * matrix[2][2];
  return [a, b, c];
}

double toDegrees(double radians) {
  return radians * (180 / math.pi);
}

double toRadians(double degrees) {
  return degrees / 180 * math.pi;
}

double hypot(double a, double c) {
  return math.sqrt(a * a + c * c);
}

double log1p(double value) {
  return math.log(1.0 + value);
}

double expm1(double value) {
  return math.exp(value) - 1.0;
}
