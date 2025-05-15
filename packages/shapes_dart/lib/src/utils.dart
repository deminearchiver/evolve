import 'dart:math' as math;
import 'dart:ui';

const double distanceEpsilon = 1.0e-4;
const double angleEpsilon = 1.0e-6;

double distance(double x, double y) => math.sqrt(x * x + y * y);

double distanceSquared(double x, double y) => x * x + y * y;

Offset directionVector(double x, double y) {
  final d = distance(x, y);
  assert(d > 0.0, "Required distance greater than zero");
  return Offset(x / d, y / d);
}

double interpolate(double start, double stop, double fraction) {
  return (1.0 - fraction) * start + fraction * stop;
}
