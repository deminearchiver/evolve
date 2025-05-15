import 'dart:math' as math;

import 'utils.dart' as utils;

class Point {
  const Point(this.x, this.y);

  final double x;
  final double y;

  double get distance => math.sqrt(x * x + y * y);
  double get distanceSquared => x * x + y * y;
  double dotProduct(Point other) => x * other.x + y * other.y;
  bool clockwise(Point other) => x * other.y - y * other.x > 0.0;
  Point get direction {
    final d = distance;
    assert(d > 0.0, "Can't get the direction of a 0-length vector");
    return this / d;
  }

  Point operator -() => Point(-x, -y);
  Point operator -(Point other) => Point(x - other.x, y - other.y);
  Point operator +(Point other) => Point(x + other.x, y + other.y);
  Point operator *(double operand) => Point(x * operand, y * operand);
  Point operator /(double operand) => Point(x / operand, y / operand);
  Point operator ~/(double operand) =>
      Point((x ~/ operand).toDouble(), (y ~/ operand).toDouble());
  Point operator %(double operand) => Point(x % operand, y % operand);

  static Point interpolate(Point start, Point stop, double fraction) {
    return Point(
      utils.interpolate(start.x, stop.x, fraction),
      utils.interpolate(start.y, stop.y, fraction),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is Point &&
            x == other.x &&
            y == other.y;
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);
}
