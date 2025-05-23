import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'utils.dart' as utils;

@immutable
class Point {
  const Point(this.x, this.y);

  final double x;
  final double y;

  Point copyWith({double? x, double? y}) {
    if (x == null && y == null) {
      return this;
    }
    return Point(x ?? this.x, y ?? this.y);
  }

  double get distance => math.sqrt(x * x + y * y);
  double get distanceSquared => x * x + y * y;

  double dotProduct(Point other) => x * other.x + y * other.y;

  bool clockwise(Point other) => x * other.y - y * other.x > 0;

  Point get direction {
    final d = distance;
    assert(d > 0.0, "Can't get the direction of a 0-length vector.");
    return this / d;
  }

  Point get rotated90 => Point(-y, x);
  Point transformed(PointTransformer f) {
    final result = f(x, y);
    return Point(result.$1, result.$2);
  }

  Point operator -() => Point(-x, -y);
  Point operator -(Point other) => Point(x - other.x, y - other.y);
  Point operator +(Point other) => Point(x + other.x, y + other.y);
  Point operator *(double operand) => Point(x * operand, y * operand);
  Point operator /(double operand) => Point(x / operand, y / operand);
  Point operator ~/(double operand) =>
      Point((x ~/ operand).toDouble(), (y ~/ operand).toDouble());
  Point operator %(double operand) => Point(x % operand, y % operand);

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

  static const Point zero = Point(0.0, 0.0);
  static Point interpolate(Point start, Point stop, double fraction) {
    return Point(
      utils.interpolate(start.x, stop.x, fraction),
      utils.interpolate(start.y, stop.y, fraction),
    );
  }
}

typedef PointTransformer = (double x, double y) Function(double x, double y);
