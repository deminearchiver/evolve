import 'dart:math' as math;

import 'point.dart';

double distance(double x, double y) => math.sqrt(x * x + y * y);

double distanceSquared(double x, double y) => x * x + y * y;

Point directionVector(double x, double y) {
  final d = distance(x, y);
  assert(d > 0.0, "Required distance greater than zero.");
  return Point(x / d, y / d);
}

Point directionVectorRadians(double angleRadians) {
  return Point(math.cos(angleRadians), math.sin(angleRadians));
}

Point radialToCartesian(
  double radius,
  double angleRadians, [
  Point center = zero,
]) {
  return directionVectorRadians(angleRadians) * radius + center;
}

const double distanceEpsilon = 1.0e-4;
const double angleEpsilon = 1.0e-6;
const double relaxedDistanceEpsilon = 5.0e-3;

const Point zero = Point(0.0, 0.0);
const double twoPi = 2 * math.pi;
double square(double x) => x * x;

double interpolate(double start, double stop, double fraction) {
  return (1.0 - fraction) * start + fraction * stop;
}

double positiveModulo(double x, double operand) =>
    (x % operand + operand) % operand;

bool collinearIsh(
  double aX,
  double aY,
  double bX,
  double bY,
  double cX,
  double cY, [
  double tolerance = distanceEpsilon,
]) {
  final ab = Point(bX - aX, bY - aY).rotated90;
  final ac = Point(cX - aX, cY - aY);
  final dotProduct = ab.dotProduct(ac).abs();
  final relativeTolerance = tolerance * ab.distance * ac.distance;
  return dotProduct < tolerance || dotProduct < relativeTolerance;
}

bool convex(Point previous, Point current, Point next) {
  // TODO: This is a fast, but not reliable calculation
  return (current - previous).clockwise(next - current);
}

double findMinimum(
  double v0,
  double v1,
  double Function(double value) f, [
  double tolerance = 1.0e-3,
]) {
  double a = v0;
  double b = v1;
  while (b - a > tolerance) {
    final c1 = (2.0 * a + b) / 3.0;
    final c2 = (2 * b + a) / 3.0;
    if (f(c1) < f(c2)) {
      b = c2;
    } else {
      a = c1;
    }
  }
  return (a + b) / 2.0;
}
