part of 'shapes.dart';

class Cubic {
  const Cubic._(List<double> points)
    : assert(points.length == 8, "Points array size should be 8"),
      _points = points;

  Cubic._fromPoints(
    Offset anchor0,
    Offset control0,
    Offset control1,
    Offset anchor1,
  ) : this._([
        anchor0.dx,
        anchor0.dy,
        control0.dx,
        control0.dy,
        control1.dx,
        control1.dy,
        anchor1.dx,
        anchor1.dy,
      ]);

  Cubic(
    double anchor0X,
    double anchor0Y,
    double control0X,
    double control0Y,
    double control1X,
    double control1Y,
    double anchor1X,
    double anchor1Y,
  ) : this._([
        anchor0X,
        anchor0Y,
        control0X,
        control0Y,
        control1X,
        control1Y,
        anchor1X,
        anchor1Y,
      ]);

  final List<double> _points;

  double get anchor0X => _points[0];
  double get anchor0Y => _points[1];
  double get control0X => _points[2];
  double get control0Y => _points[3];
  double get control1X => _points[4];
  double get control1Y => _points[5];
  double get anchor1X => _points[6];
  double get anchor1Y => _points[7];

  Offset _pointOnCurve(double t) {
    final u = 1.0 - t;
    return Offset(
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

  bool get _zeroLength =>
      (anchor0X - anchor1X).abs() < _distanceEpsilon &&
      (anchor0Y - anchor1Y).abs() < _distanceEpsilon;

  bool _convexTo(Cubic next) {
    final prevVertex = Offset(anchor0X, anchor0Y);
    final currVertex = Offset(anchor1X, anchor1Y);
    final nextVertex = Offset(next.anchor1X, next.anchor1Y);
    return convex(prevVertex, currVertex, nextVertex);
  }

  static bool _zeroIsh(double value) => value.abs() < _distanceEpsilon;

  Rect _calculateBounds({bool approximate = false}) {
    if (_zeroLength) {
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
    final xa = -anchor0X + 3.0 * control0X - 3.0 * control1X + anchor1X;
    final xb = 2.0 * anchor0X - 4.0 * control0X + 2.0 * control1X;
    final xc = -anchor0X + control0X;

    if (_zeroIsh(xa)) {
      // Try Muller's method instead; it can find a single root when a is 0
      if (xb != 0.0) {
        final t = 2.0 * xc / (-2.0 * xb);
        if (0.0 <= t && t <= 1.0) {
          final x = _pointOnCurve(t).dx;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }
      }
    } else {
      final xs = xb * xb - 4.0 * xa * xc;
      if (xs >= 0.0) {
        final t1 = (-xb + math.sqrt(xs)) / (2.0 * xa);
        if (0.0 <= t1 && t1 <= 1.0) {
          final x = _pointOnCurve(t1).dx;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }

        final t2 = (-xb - math.sqrt(xs)) / (2.0 * xa);
        if (0.0 <= t2 && t2 <= 1.0) {
          final x = _pointOnCurve(t2).dx;
          if (x < minX) minX = x;
          if (x > maxX) maxX = x;
        }
      }
    }

    // Repeat the above for y coordinate
    final ya = -anchor0Y + 3 * control0Y - 3 * control1Y + anchor1Y;
    final yb = 2 * anchor0Y - 4 * control0Y + 2 * control1Y;
    final yc = -anchor0Y + control0Y;

    if (_zeroIsh(ya)) {
      if (yb != 0.0) {
        final t = 2.0 * yc / (-2.0 * yb);
        if (0.0 <= t && t <= 1.0) {
          final y = _pointOnCurve(t).dy;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }
      }
    } else {
      final ys = yb * yb - 4 * ya * yc;
      if (ys >= 0) {
        final t1 = (-yb + math.sqrt(ys)) / (2 * ya);
        if (0.0 <= t1 && t1 <= 1.0) {
          final y = _pointOnCurve(t1).dy;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }

        final t2 = (-yb - math.sqrt(ys)) / (2 * ya);
        if (0.0 <= t2 && t2 <= 1.0) {
          final y = _pointOnCurve(t2).dy;
          if (y < minY) minY = y;
          if (y > maxY) maxY = y;
        }
      }
    }
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }

  // TODO: cartesian optimization?
  (Cubic, Cubic) split(double t) {
    final u = 1.0 - t;
    final pointOnCurve = _pointOnCurve(t);
    return (
      Cubic(
        anchor0X,
        anchor0Y,
        anchor0X * u + control0X * t,
        anchor0Y * u + control0Y * t,
        anchor0X * (u * u) + control0X * (2 * u * t) + control1X * (t * t),
        anchor0Y * (u * u) + control0Y * (2 * u * t) + control1Y * (t * t),
        pointOnCurve.dx,
        pointOnCurve.dy,
      ),
      Cubic(
        // TODO: should calculate once and share the result
        pointOnCurve.dx,
        pointOnCurve.dy,
        control0X * (u * u) + control1X * (2 * u * t) + anchor1X * (t * t),
        control0Y * (u * u) + control1Y * (2 * u * t) + anchor1Y * (t * t),
        control1X * u + anchor1X * t,
        control1Y * u + anchor1Y * t,
        anchor1X,
        anchor1Y,
      ),
    );
  }

  factory Cubic.straightLine(double x0, double y0, double x1, double y1) =>
      Cubic(
        x0,
        y0,
        utils.interpolate(x0, x1, 1.0 / 3.0),
        utils.interpolate(y0, y1, 1.0 / 3.0),
        utils.interpolate(x0, x1, 2.0 / 3.0),
        utils.interpolate(y0, y1, 2.0 / 3.0),
        x1,
        y1,
      );
  factory Cubic.circularArc(
    double centerX,
    double centerY,
    double x0,
    double y0,
    double x1,
    double y1,
  ) {
                final p0d = directionVector(x0 - centerX, y0 - centerY)
            final p1d = directionVector(x1 - centerX, y1 - centerY)
            final rotatedP0 = p0d.rotate90()
            final rotatedP1 = p1d.rotate90()
            final clockwise = rotatedP0.dotProduct(x1 - centerX, y1 - centerY) >= 0
            final cosa = p0d.dotProduct(p1d)
            if (cosa > 0.999f) /* p0 ~= p1 */ return straightLine(x0, y0, x1, y1)
            final k =
                distance(x0 - centerX, y0 - centerY) * 4f / 3f *
                    (sqrt(2 * (1 - cosa)) - sqrt(1 - cosa * cosa)) / (1 - cosa) *
                    if (clockwise) 1f else -1f
            return Cubic(
                x0,
                y0,
                x0 + rotatedP0.x * k,
                y0 + rotatedP0.y * k,
                x1 - rotatedP1.x * k,
                y1 - rotatedP1.y * k,
                x1,
                y1
            )
  }

  factory Cubic._empty(double x0, double y0) =>
      Cubic(x0, y0, x0, y0, x0, y0, x0, y0);
}

abstract class _Cubic {
  Offset get anchor0;
  Offset get control0;
  Offset get control1;
  Offset get anchor1;
}

typedef PointTransformer = (double, double) Function(double x, double y);

class MutableCubic extends Cubic {
  MutableCubic(
    super.anchor0X,
    super.anchor0Y,
    super.control0X,
    super.control0Y,
    super.control1X,
    super.control1Y,
    super.anchor1X,
    super.anchor1Y,
  );

  void _transformOnePoint(PointTransformer transformer, int index) {
    final result = transformer(_points[index], _points[index + 1]);
    _points[index] = result.$1;
    _points[index + 1] = result.$2;
  }

  void transform(PointTransformer transformer) {
    _transformOnePoint(transformer, 0);
    _transformOnePoint(transformer, 2);
    _transformOnePoint(transformer, 4);
    _transformOnePoint(transformer, 6);
  }

  void interpolate(Cubic c1, Cubic c2, double progress) {
    for (int i = 0; i < 8; i++) {
      _points[i] = utils.interpolate(c1._points[i], c2._points[i], progress);
    }
  }
}
