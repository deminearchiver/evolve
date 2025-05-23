import 'dart:math' as math;

import 'point.dart';
import 'utils.dart' as utils;

abstract class Cubic {
  const Cubic();
  const factory Cubic.fromPoints(
    double anchor0X,
    double anchor0Y,
    double control0X,
    double control0Y,
    double control1X,
    double control1Y,
    double anchor1X,
    double anchor1Y,
  ) = _CubicFromPoints;

  double get anchor0X;
  double get anchor0Y;
  double get control0X;
  double get control0Y;
  double get control1X;
  double get control1Y;
  double get anchor1X;
  double get anchor1Y;

  Point pointOnCurve(double t) {
    final u = 1.0 - t;
    return Point(
      anchor0X * (u * u * u) +
          control0X * (3.0 * t * u * u) +
          control1X * (3.0 * t * t * u) +
          anchor1X * (t * t * t),
      anchor0Y * (u * u * u) +
          control0Y * (3.0 * t * u * u) +
          control1Y * (3.0 * t * t * u) +
          anchor1Y * (t * t * t),
    );
  }

  bool get zeroLength =>
      (anchor0X - anchor1X).abs() < utils.distanceEpsilon &&
      (anchor0Y - anchor1Y).abs() < utils.distanceEpsilon;

  bool convexTo(Cubic next) {
    final prevVertex = Point(anchor0X, anchor0Y);
    final currVertex = Point(anchor1X, anchor1Y);
    final nextVertex = Point(next.anchor1X, next.anchor1Y);
    return utils.convex(prevVertex, currVertex, nextVertex);
  }

  bool zeroIsh(double value) => value.abs() < utils.distanceEpsilon;

  Rect calculateBounds([bool approximate = false]) {
    // A curve might be of zero-length, with both anchors co-lated.
    // Just return the point itself.
    if (zeroLength) {
      return Rect.fromLTRB(anchor0X, anchor0Y, anchor0X, anchor0Y);
    }

    double minX = math.min(anchor0X, anchor1X);
    double minY = math.min(anchor0Y, anchor1Y);
    double maxX = math.max(anchor0X, anchor1X);
    double maxY = math.max(anchor0Y, anchor1Y);
    if (approximate) {
      // Approximate bounds use the bounding box of all anchors and controls
      return Rect.fromLTRB(
        math.min(minX, math.min(control0X, control1X)),
        math.min(minY, math.min(control0Y, control1Y)),
        math.max(maxX, math.max(control0X, control1X)),
        math.max(maxY, math.max(control0Y, control1Y)),
      );
    }

    // Find the derivative, which is a quadratic Bezier. Then we can solve for t using
    // the quadratic formula
    final xa = -anchor0X + 3 * control0X - 3 * control1X + anchor1X;
    final xb = 2 * anchor0X - 4 * control0X + 2 * control1X;
    final xc = -anchor0X + control0X;

    if (zeroIsh(xa)) {
      // Try Muller's method instead; it can find a single root when a is 0
      if (xb != 0.0) {
        final t = 2.0 * xc / (-2.0 * xb);
        if (0.0 <= t && t <= 1.0) {
          final x = pointOnCurve(t).x;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }
      }
    } else {
      final xs = xb * xb - 4 * xa * xc;
      if (xs >= 0) {
        final t1 = (-xb + math.sqrt(xs)) / (2.0 * xa);
        if (0.0 <= t1 && t1 <= 1.0) {
          final x = pointOnCurve(t1).x;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }

        final t2 = (-xb - math.sqrt(xs)) / (2.0 * xa);
        if (0.0 <= t2 && t2 <= 1.0) {
          final x = pointOnCurve(t2).x;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }
      }
    }

    // Repeat the above for y coordinate
    final ya = -anchor0Y + 3 * control0Y - 3 * control1Y + anchor1Y;
    final yb = 2 * anchor0Y - 4 * control0Y + 2 * control1Y;
    final yc = -anchor0Y + control0Y;

    if (zeroIsh(ya)) {
      if (yb != 0.0) {
        final t = 2.0 * yc / (-2.0 * yb);
        if (0.0 <= t && t <= 1.0) {
          final y = pointOnCurve(t).y;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }
      }
    } else {
      final ys = yb * yb - 4.0 * ya * yc;
      if (ys >= 0) {
        final t1 = (-yb + math.sqrt(ys)) / (2.0 * ya);
        if (0.0 <= t1 && t1 <= 1.0) {
          final y = pointOnCurve(t1).y;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }

        final t2 = (-yb - math.sqrt(ys)) / (2.0 * ya);
        if (0.0 <= t2 && t2 <= 1.0) {
          final y = pointOnCurve(t2).y;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }
      }
    }
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }

  (Cubic, Cubic) split(double t) {
    final u = 1.0 - t;
    final pointOnCurve = this.pointOnCurve(t);
    return (
      Cubic.from(
        anchor0X,
        anchor0Y,
        anchor0X * u + control0X * t,
        anchor0Y * u + control0Y * t,
        anchor0X * (u * u) + control0X * (2.0 * u * t) + control1X * (t * t),
        anchor0Y * (u * u) + control0Y * (2.0 * u * t) + control1Y * (t * t),
        pointOnCurve.x,
        pointOnCurve.y,
      ),
      Cubic.from(
        // TODO: should calculate once and share the result
        pointOnCurve.x,
        pointOnCurve.y,
        control0X * (u * u) + control1X * (2.0 * u * t) + anchor1X * (t * t),
        control0Y * (u * u) + control1Y * (2.0 * u * t) + anchor1Y * (t * t),
        control1X * u + anchor1X * t,
        control1Y * u + anchor1Y * t,
        anchor1X,
        anchor1Y,
      ),
    );
  }

  Cubic get reversed => Cubic.from(
    anchor1X,
    anchor1Y,
    control1X,
    control1Y,
    control0X,
    control0Y,
    anchor0X,
    anchor0Y,
  );

  Cubic transformed(PointTransformer f) {
    final newCubic = MutableCubic();
  }

  Cubic operator +(Cubic other) => Cubic.from(
    anchor0X + other.anchor0X,
    anchor0Y + other.anchor0Y,
    control0X + other.control0X,
    control0Y + other.control0Y,
    control1X + other.control1X,
    control1Y + other.control1Y,
    anchor1X + other.anchor1X,
    anchor1Y + other.anchor1Y,
  );
  Cubic operator *(double operand) => Cubic.from(
    anchor0X * operand,
    anchor0Y * operand,
    control0X * operand,
    control0Y * operand,
    control1X * operand,
    control1Y * operand,
    anchor1X * operand,
    anchor1Y * operand,
  );
  Cubic operator /(double operand) => Cubic.from(
    anchor0X / operand,
    anchor0Y / operand,
    control0X / operand,
    control0Y / operand,
    control1X / operand,
    control1Y / operand,
    anchor1X / operand,
    anchor1Y / operand,
  );

  @override
  String toString() =>
      "anchor0: ($anchor0X, $anchor0Y) control0: ($control0X, $control0Y), "
      "control1: ($control1X, $control1Y), anchor1: ($anchor1X, $anchor1Y)";
}

typedef RectRecord = (double left, double top, double right, double bottom);

extension type const Rect._(RectRecord _record) {
  const Rect.fromLTRB(double left, double top, double right, double bottom)
    : this._((left, top, right, bottom));
  Rect.fromPoints(Point topLeft, Point bottomRight)
    : this.fromLTRB(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);

  double get left => _record.$1;
  double get top => _record.$2;
  double get right => _record.$3;
  double get bottom => _record.$4;
  double get width => right - left;
  double get height => bottom - top;
}

class _CubicFromPoints extends Cubic {
  const _CubicFromPoints(
    this.anchor0X,
    this.anchor0Y,
    this.control0X,
    this.control0Y,
    this.control1X,
    this.control1Y,
    this.anchor1X,
    this.anchor1Y,
  ) : super();

  @override
  final double anchor0X;

  @override
  final double anchor0Y;

  @override
  final double control0X;

  @override
  final double control0Y;

  @override
  final double control1X;

  @override
  final double control1Y;

  @override
  final double anchor1X;

  @override
  final double anchor1Y;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is Cubic &&
            anchor0X == other.anchor0X &&
            anchor0Y == other.anchor0Y &&
            control0X == other.control0X &&
            control0Y == other.control0Y &&
            control1X == other.control1X &&
            control1Y == other.control1Y &&
            anchor1X == other.anchor1X &&
            anchor1Y == other.anchor1Y;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    anchor0X,
    anchor0Y,
    control0X,
    control0Y,
    control1X,
    control1Y,
    anchor1X,
    anchor1Y,
  );
}

class MutableCubic extends Cubic {
  MutableCubic(
    double anchor0X,
    double anchor0Y,
    double control0X,
    double control0Y,
    double control1X,
    double control1Y,
    double anchor1X,
    double anchor1Y,
  ) : _anchor0X = anchor0X,
      _anchor0Y = anchor0Y,
      _control0X = control0X,
      _control0Y = control0Y,
      _control1X = control1X,
      _control1Y = control1Y,
      _anchor1X = anchor1X,
      _anchor1Y = anchor1Y;

  double _anchor0X;
  double _anchor0Y;
  double _control0X;
  double _control0Y;
  double _control1X;
  double _control1Y;
  double _anchor1X;
  double _anchor1Y;

  @override
  double get anchor0X => _anchor0X;

  @override
  double get anchor0Y => _anchor0Y;

  @override
  double get control0X => _control0X;

  @override
  double get control0Y => _control0Y;

  @override
  double get control1X => _control1X;

  @override
  double get control1Y => _control1Y;

  @override
  double get anchor1X => _anchor1X;

  @override
  double get anchor1Y => _anchor1Y;

  set anchor0X(double value) {
    if (_anchor0X == value) {
      return;
    }
    _anchor0X = value;
  }

  set anchor0Y(double value) {
    if (_anchor0Y == value) {
      return;
    }
    _anchor0Y = value;
  }

  set control0X(double value) {
    if (_control0X == value) {
      return;
    }
    _control0X = value;
  }

  set control0Y(double value) {
    if (_control0Y == value) {
      return;
    }
    _control0Y = value;
  }

  set control1X(double value) {
    if (_control1X == value) {
      return;
    }
    _control1X = value;
  }

  set control1Y(double value) {
    if (_control1Y == value) {
      return;
    }
    _control1Y = value;
  }

  set anchor1X(double value) {
    if (_anchor1X == value) {
      return;
    }
    _anchor1X = value;
  }

  set anchor1Y(double value) {
    if (_anchor1Y == value) {
      return;
    }
    _anchor1Y = value;
  }

  void transform(PointTransformer transformer) {
    final control0 = transformer(control0X, control0Y);
    control0X = control0.$1;
    control0Y = control0.$2;

    final anchor0 = transformer(anchor0X, anchor0Y);
    anchor0X = anchor0.$1;
    anchor0Y = anchor0.$2;

    final anchor1 = transformer(anchor1X, anchor1Y);
    anchor1X = anchor1.$1;
    anchor1Y = anchor1.$2;

    final control1 = transformer(control1X, control1Y);
    control1X = control1.$1;
    control1Y = control1.$2;
  }

  void interpolate(Cubic c1, Cubic c2, double progress) {
    anchor0X = utils.interpolate(c1.anchor0X, c2.anchor0X, progress);
    anchor0Y = utils.interpolate(c1.anchor0Y, c2.anchor0Y, progress);
    control0X = utils.interpolate(c1.control0X, c2.control0X, progress);
    control0Y = utils.interpolate(c1.control0Y, c2.control0Y, progress);
    control1X = utils.interpolate(c1.control1X, c2.control1X, progress);
    control1Y = utils.interpolate(c1.control1Y, c2.control1Y, progress);
    anchor1X = utils.interpolate(c1.anchor1X, c2.anchor1X, progress);
    anchor1Y = utils.interpolate(c1.anchor1Y, c2.anchor1Y, progress);
  }
}
