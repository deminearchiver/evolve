part of 'shape.dart';

// extension on double {
//   double? get finiteOrNull => isFinite || isNegative ? this : null;
// }

double? _clampCorner(double? x, double? min, double? max) {
  // x = x?.finiteOrNull;
  // min = min?.finiteOrNull;
  // max = max?.finiteOrNull;

  assert(
    (min == null || max == null) || (min <= max && !max.isNaN && !min.isNaN),
  );

  if (x == null) {
    return max;
  }
  if (min == null) return null;
  if (max == null) {
    return x < min ? min : x;
  }
  return x > max ? max : x;
}

extension RadiusExtension on Radius {
  @Deprecated("Use Corner.fromRadius instead")
  Corner toCorner() => Corner.fromRadius(this);
}

@immutable
class Corner {
  const Corner.circular(double? radius) : this.elliptical(radius, radius);
  const Corner.elliptical(this.x, this.y);

  Corner.fromRadius(Radius radius) : this.elliptical(radius.x, radius.y);

  final double? x;
  final double? y;

  Corner clamp({Corner minimum = Corner.none, Corner maximum = Corner.full}) {
    return Corner.elliptical(
      _clampCorner(x, minimum.x, maximum.x),
      _clampCorner(y, minimum.y, maximum.y),
    );
  }

  Corner clampValues({
    double? minimumX = -double.infinity,
    double? minimumY = -double.infinity,
    // ignore: avoid_init_to_null
    double? maximumX = null,
    // ignore: avoid_init_to_null
    double? maximumY = null,
  }) {
    return Corner.elliptical(
      _clampCorner(x, minimumX, maximumX),
      _clampCorner(y, minimumY, maximumY),
    );
  }

  Corner operator -() =>
      Corner.elliptical(x != null ? -x! : null, y != null ? -y! : null);

  Corner operator -(Corner other) => Corner.elliptical(
    x != null && other.x != null ? x! - other.x! : null,
    y != null && other.y != null ? y! - other.y! : null,
  );

  Corner operator +(Corner other) => Corner.elliptical(
    x != null && other.x != null ? x! + other.x! : null,
    y != null && other.y != null ? y! + other.y! : null,
  );

  Corner operator *(double operand) => Corner.elliptical(
    x != null ? x! * operand : null,
    y != null ? y! * operand : null,
  );

  Corner operator /(double operand) => Corner.elliptical(
    x != null ? x! / operand : null,
    y != null ? y! / operand : null,
  );

  Corner operator ~/(double operand) => Corner.elliptical(
    x != null ? (x! ~/ operand).toDouble() : null,
    y != null ? (y! ~/ operand).toDouble() : null,
  );

  Corner operator %(double operand) => Corner.elliptical(
    x != null ? x! % operand : null,
    y != null ? y! % operand : null,
  );

  static Corner? lerp(Corner? a, Corner? b, double t) {
    if (b == null) {
      if (a == null) {
        return null;
      } else {
        final double k = 1.0 - t;
        return Corner.elliptical(
          a.x != null ? a.x! * k : null,
          a.y != null ? a.y! * k : null,
        );
      }
    } else {
      if (a == null) {
        return Corner.elliptical(
          b.x != null ? b.x! * t : null,
          b.y != null ? b.y! * t : null,
        );
      } else {
        return Corner.elliptical(
          ui.lerpDouble(a.x, b.x, t),
          ui.lerpDouble(a.y, b.y, t),
        );
      }
    }
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Corner &&
            runtimeType == other.runtimeType &&
            other.x == x &&
            other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() {
    return x == y
        ? "Corner.circular(${x?.toStringAsFixed(1) ?? "full"})"
        : "Corner.elliptical(${x?.toStringAsFixed(1) ?? "full"}, "
              "${y?.toStringAsFixed(1) ?? "full"})";
  }

  static const Corner none = Corner.circular(0.0);
  static const Corner full = Corner.circular(null);
}

@immutable
abstract class CornersGeometry {
  const CornersGeometry();

  Corner get _topLeft;
  Corner get _topRight;
  Corner get _bottomLeft;
  Corner get _bottomRight;
  Corner get _topStart;
  Corner get _topEnd;
  Corner get _bottomStart;
  Corner get _bottomEnd;

  Corners resolve(TextDirection? textDirection);

  CornersGeometry add(CornersGeometry other) {
    return _CornersMixed(
      _topLeft + other._topLeft,
      _topRight + other._topRight,
      _bottomLeft + other._bottomLeft,
      _bottomRight + other._bottomRight,
      _topStart + other._topStart,
      _topEnd + other._topEnd,
      _bottomStart + other._bottomStart,
      _bottomEnd + other._bottomEnd,
    );
  }

  CornersGeometry subtract(CornersGeometry other) {
    return _CornersMixed(
      _topLeft - other._topLeft,
      _topRight - other._topRight,
      _bottomLeft - other._bottomLeft,
      _bottomRight - other._bottomRight,
      _topStart - other._topStart,
      _topEnd - other._topEnd,
      _bottomStart - other._bottomStart,
      _bottomEnd - other._bottomEnd,
    );
  }

  CornersGeometry operator -();
  CornersGeometry operator *(double other);
  CornersGeometry operator /(double other);
  CornersGeometry operator ~/(double other);
  CornersGeometry operator %(double other);

  @override
  String toString() {
    String? visual, logical;
    if (_topLeft == _topRight &&
        _topRight == _bottomLeft &&
        _bottomLeft == _bottomRight) {
      if (_topLeft != Corner.none) {
        if (_topLeft.x == _topLeft.y) {
          visual =
              "Corners.circular(${_topLeft.x?.toStringAsFixed(1) ?? "full"})";
        } else {
          visual = "Corners.all($_topLeft)";
        }
      }
    } else {
      // visuals aren't the same and at least one isn't none
      final StringBuffer result = StringBuffer();
      result.write("Corners.only(");
      bool comma = false;
      if (_topLeft != Corner.none) {
        result.write("topLeft: $_topLeft");
        comma = true;
      }
      if (_topRight != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("topRight: $_topRight");
        comma = true;
      }
      if (_bottomLeft != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomLeft: $_bottomLeft");
        comma = true;
      }
      if (_bottomRight != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomRight: $_bottomRight");
      }
      result.write(")");
      visual = result.toString();
    }
    if (_topStart == _topEnd &&
        _topEnd == _bottomEnd &&
        _bottomEnd == _bottomStart) {
      if (_topStart != Corner.none) {
        if (_topStart.x == _topStart.y) {
          logical =
              "CornersDirectional.circular(${_topStart.x?.toStringAsFixed(1) ?? "full"})";
        } else {
          logical = "CornersDirectional.all($_topStart)";
        }
      }
    } else {
      // logicals aren't the same and at least one isn't none
      final StringBuffer result = StringBuffer();
      result.write("CornersDirectional.only(");
      bool comma = false;
      if (_topStart != Corner.none) {
        result.write("topStart: $_topStart");
        comma = true;
      }
      if (_topEnd != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("topEnd: $_topEnd");
        comma = true;
      }
      if (_bottomStart != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomStart: $_bottomStart");
        comma = true;
      }
      if (_bottomEnd != Corner.none) {
        if (comma) {
          result.write(", ");
        }
        result.write("bottomEnd: $_bottomEnd");
      }
      result.write(")");
      logical = result.toString();
    }
    if (visual != null && logical != null) {
      return "$visual + $logical";
    }
    return visual ?? logical ?? "Corners.none";
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CornersGeometry &&
            runtimeType == other.runtimeType &&
            _topLeft == other._topLeft &&
            _topRight == other._topRight &&
            _bottomLeft == other._bottomLeft &&
            _bottomRight == other._bottomRight &&
            _topStart == other._topStart &&
            _topEnd == other._topEnd &&
            _bottomStart == other._bottomStart &&
            _bottomEnd == other._bottomEnd;
  }

  @override
  int get hashCode => Object.hash(
    _topLeft,
    _topRight,
    _bottomLeft,
    _bottomRight,
    _topStart,
    _topEnd,
    _bottomStart,
    _bottomEnd,
  );

  static CornersGeometry? lerp(
    CornersGeometry? a,
    CornersGeometry? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    a ??= Corners.none;
    b ??= Corners.none;
    // return a.add((b.subtract(a)) * t);

    return _CornersGeometryLerp(a, b, t);
  }
}

@immutable
class _CornersGeometryLerp extends CornersGeometry {
  const _CornersGeometryLerp(this.a, this.b, this.t);

  final CornersGeometry a;
  final CornersGeometry b;
  final double t;

  @override
  Corner get _topLeft => Corner.none;

  @override
  Corner get _topRight => Corner.none;

  @override
  Corner get _bottomLeft => Corner.none;

  @override
  Corner get _bottomRight => Corner.none;

  @override
  Corner get _topStart => Corner.none;

  @override
  Corner get _topEnd => Corner.none;

  @override
  Corner get _bottomStart => Corner.none;

  @override
  Corner get _bottomEnd => Corner.none;

  @override
  Corners resolve(TextDirection? textDirection) {
    return _CornersLerp(a.resolve(textDirection), b.resolve(textDirection), t);
  }

  @override
  CornersGeometry operator -() {
    return _CornersGeometryLerp(-a, -b, t);
  }

  @override
  CornersGeometry operator *(double other) {
    return _CornersGeometryLerp(a * other, b * other, t);
  }

  @override
  CornersGeometry operator /(double other) {
    return _CornersGeometryLerp(a / other, b / other, t);
  }

  @override
  CornersGeometry operator ~/(double other) {
    return _CornersGeometryLerp(a ~/ other, b ~/ other, t);
  }

  @override
  CornersGeometry operator %(double other) {
    return _CornersGeometryLerp(a % other, b % other, t);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _CornersGeometryLerp &&
            runtimeType == other.runtimeType &&
            a == other.a &&
            b == other.b &&
            t == other.t;
  }

  @override
  int get hashCode => Object.hash(a, b, t);
}

@immutable
class Corners extends CornersGeometry {
  const Corners.all(Corner corner)
    : this.only(
        topLeft: corner,
        topRight: corner,
        bottomLeft: corner,
        bottomRight: corner,
      );

  Corners.circular(double radius) : this.all(Corner.circular(radius));

  const Corners.vertical({
    Corner top = Corner.none,
    Corner bottom = Corner.none,
  }) : this.only(
         topLeft: top,
         topRight: top,
         bottomLeft: bottom,
         bottomRight: bottom,
       );

  /// sides of the rectangle have the same radii.
  const Corners.horizontal({
    Corner left = Corner.none,
    Corner right = Corner.none,
  }) : this.only(
         topLeft: left,
         topRight: right,
         bottomLeft: left,
         bottomRight: right,
       );

  /// Creates corners with only the given non-none values. The other
  /// corners will be right angles.
  const Corners.only({
    this.topLeft = Corner.none,
    this.topRight = Corner.none,
    this.bottomLeft = Corner.none,
    this.bottomRight = Corner.none,
  });

  /// Returns a copy of this object with the given fields replaced with
  /// the new values.
  Corners copyWith({
    Corner? topLeft,
    Corner? topRight,
    Corner? bottomLeft,
    Corner? bottomRight,
  }) {
    return Corners.only(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  final Corner topLeft;
  final Corner topRight;
  final Corner bottomLeft;
  final Corner bottomRight;

  @override
  Corner get _topLeft => topLeft;

  @override
  Corner get _topRight => topRight;

  @override
  Corner get _bottomLeft => bottomLeft;

  @override
  Corner get _bottomRight => bottomRight;

  @override
  Corner get _topStart => Corner.none;

  @override
  Corner get _topEnd => Corner.none;

  @override
  Corner get _bottomStart => Corner.none;

  @override
  Corner get _bottomEnd => Corner.none;

  BorderRadius toBorderRadius(Rect rect) {
    final topLeft = this.topLeft.clamp();
    final topRight = this.topRight.clamp();
    final bottomLeft = this.bottomLeft.clamp();
    final bottomRight = this.bottomRight.clamp();

    final width = rect.width;
    final height = rect.height;
    final shortestSide = rect.shortestSide;

    double topLeftX;
    double topLeftY;
    double topRightX;
    double topRightY;
    double bottomLeftX;
    double bottomLeftY;
    double bottomRightX;
    double bottomRightY;

    if (topLeft.x == null) {
      if (topRight.x == null) {
        topLeftX = shortestSide / 2;
        topRightX = shortestSide / 2;
      } else {
        topRightX = topRight.x!;
        topLeftX = ui.clampDouble(width - topRightX, 0.0, shortestSide);
      }
    } else {
      topLeftX = topLeft.x!;
      topRightX =
          topRight.x ?? ui.clampDouble(width - topLeftX, 0.0, shortestSide);
    }

    if (topRight.y == null) {
      if (bottomRight.y == null) {
        topRightY = shortestSide / 2;
        bottomRightY = shortestSide / 2;
      } else {
        bottomRightY = bottomRight.y!;
        topRightY = ui.clampDouble(height - bottomRightY, 0.0, shortestSide);
      }
    } else {
      topRightY = topRight.y!;
      bottomRightY =
          bottomRight.y ??
          ui.clampDouble(height - topRightY, 0.0, shortestSide);
    }

    if (bottomRight.x == null) {
      if (bottomLeft.x == null) {
        bottomRightX = shortestSide / 2;
        bottomLeftX = shortestSide / 2;
      } else {
        bottomLeftX = bottomLeft.x!;
        bottomRightX = ui.clampDouble(width - bottomLeftX, 0.0, shortestSide);
      }
    } else {
      bottomRightX = bottomRight.x!;
      bottomLeftX =
          bottomLeft.x ??
          ui.clampDouble(width - bottomRightX, 0.0, shortestSide);
    }

    if (bottomLeft.y == null) {
      if (topLeft.y == null) {
        bottomLeftY = shortestSide / 2;
        topLeftY = shortestSide / 2;
      } else {
        topLeftY = topLeft.y!;
        bottomLeftY = ui.clampDouble(height - topLeftY, 0.0, shortestSide);
      }
    } else {
      bottomLeftY = bottomLeft.y!;
      topLeftY =
          topLeft.y ?? ui.clampDouble(height - bottomLeftY, 0.0, shortestSide);
    }
    if (topLeft.x == null && topLeft.y == null) {
      final min = math.min(topLeftX, topLeftY);
      topLeftX = min;
      topLeftY = min;
    }
    if (topRight.x == null && topRight.y == null) {
      final min = math.min(topRightX, topRightY);
      topRightX = min;
      topRightY = min;
    }
    if (bottomLeft.x == null && bottomLeft.y == null) {
      final min = math.min(bottomLeftX, bottomLeftY);
      bottomLeftX = min;
      bottomLeftY = min;
    }
    if (bottomRight.x == null && bottomRight.y == null) {
      final min = math.min(bottomRightX, bottomRightY);
      bottomRightX = min;
      bottomRightY = min;
    }

    return BorderRadius.only(
      topLeft: Radius.elliptical(topLeftX, topLeftY),
      topRight: Radius.elliptical(topRightX, topRightY),
      bottomLeft: Radius.elliptical(bottomLeftX, bottomLeftY),
      bottomRight: Radius.elliptical(bottomRightX, bottomRightY),
    );
  }

  RRect toRRect(Rect rect) {
    return toBorderRadius(rect).toRRect(rect);
  }

  RSuperellipse toRSuperellipse(Rect rect) {
    return toBorderRadius(rect).toRSuperellipse(rect);
  }

  @override
  Corners resolve(TextDirection? direction) => this;

  @override
  CornersGeometry add(CornersGeometry other) {
    if (other is Corners) {
      return this + other;
    }
    return super.add(other);
  }

  @override
  CornersGeometry subtract(CornersGeometry other) {
    if (other is Corners) {
      return this - other;
    }
    return super.subtract(other);
  }

  Corners operator +(Corners other) {
    return Corners.only(
      topLeft: topLeft + other.topLeft,
      topRight: topRight + other.topRight,
      bottomLeft: bottomLeft + other.bottomLeft,
      bottomRight: bottomRight + other.bottomRight,
    );
  }

  Corners operator -(Corners other) {
    return Corners.only(
      topLeft: topLeft - other.topLeft,
      topRight: topRight - other.topRight,
      bottomLeft: bottomLeft - other.bottomLeft,
      bottomRight: bottomRight - other.bottomRight,
    );
  }

  @override
  Corners operator -() {
    return Corners.only(
      topLeft: -topLeft,
      topRight: -topRight,
      bottomLeft: -bottomLeft,
      bottomRight: -bottomRight,
    );
  }

  @override
  Corners operator *(double other) {
    return Corners.only(
      topLeft: topLeft * other,
      topRight: topRight * other,
      bottomLeft: bottomLeft * other,
      bottomRight: bottomRight * other,
    );
  }

  @override
  Corners operator /(double other) {
    return Corners.only(
      topLeft: topLeft / other,
      topRight: topRight / other,
      bottomLeft: bottomLeft / other,
      bottomRight: bottomRight / other,
    );
  }

  @override
  Corners operator ~/(double other) {
    return Corners.only(
      topLeft: topLeft ~/ other,
      topRight: topRight ~/ other,
      bottomLeft: bottomLeft ~/ other,
      bottomRight: bottomRight ~/ other,
    );
  }

  @override
  Corners operator %(double other) {
    return Corners.only(
      topLeft: topLeft % other,
      topRight: topRight % other,
      bottomLeft: bottomLeft % other,
      bottomRight: bottomRight % other,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Corners &&
            runtimeType == other.runtimeType &&
            topLeft == other.topLeft &&
            topRight == other.topRight &&
            bottomLeft == other.bottomLeft &&
            bottomRight == other.bottomRight;
  }

  @override
  int get hashCode => Object.hash(topLeft, topRight, bottomLeft, bottomRight);

  static const Corners none = Corners.all(Corner.none);
  static const Corners full = Corners.all(Corner.full);

  static Corners? lerp(Corners? a, Corners? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    if (a == null) {
      return b! * t;
    }
    if (b == null) {
      return a * (1.0 - t);
    }
    return _CornersLerp(a, b, t);
  }
}

@immutable
class _CornersLerp extends Corners {
  const _CornersLerp(this.a, this.b, this.t) : super.only();

  final Corners a;
  final Corners b;
  final double t;

  @override
  BorderRadius toBorderRadius(Rect rect) {
    return BorderRadius.lerp(
      a.toBorderRadius(rect),
      b.toBorderRadius(rect),
      t,
    )!;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _CornersLerp &&
            runtimeType == other.runtimeType &&
            a == other.a &&
            b == other.b &&
            t == other.t;
  }

  @override
  int get hashCode => Object.hash(a, b, t);
}

@immutable
class CornersDirectional extends CornersGeometry {
  const CornersDirectional.all(Corner radius)
    : this.only(
        topStart: radius,
        topEnd: radius,
        bottomStart: radius,
        bottomEnd: radius,
      );

  const CornersDirectional.vertical({
    Corner top = Corner.none,
    Corner bottom = Corner.none,
  }) : this.only(
         topStart: top,
         topEnd: top,
         bottomStart: bottom,
         bottomEnd: bottom,
       );

  const CornersDirectional.horizontal({
    Corner start = Corner.none,
    Corner end = Corner.none,
  }) : this.only(
         topStart: start,
         topEnd: end,
         bottomStart: start,
         bottomEnd: end,
       );

  const CornersDirectional.only({
    this.topStart = Corner.none,
    this.topEnd = Corner.none,
    this.bottomStart = Corner.none,
    this.bottomEnd = Corner.none,
  });

  final Corner topStart;
  final Corner topEnd;
  final Corner bottomStart;
  final Corner bottomEnd;

  @override
  Corner get _topLeft => Corner.none;

  @override
  Corner get _topRight => Corner.none;

  @override
  Corner get _bottomLeft => Corner.none;

  @override
  Corner get _bottomRight => Corner.none;

  @override
  Corner get _topStart => topStart;

  @override
  Corner get _topEnd => topEnd;

  @override
  Corner get _bottomStart => bottomStart;

  @override
  Corner get _bottomEnd => bottomEnd;

  @override
  Corners resolve(TextDirection? textDirection) {
    assert(textDirection != null);
    return switch (textDirection!) {
      TextDirection.ltr => Corners.only(
        topLeft: topStart,
        topRight: topEnd,
        bottomLeft: bottomStart,
        bottomRight: bottomEnd,
      ),
      TextDirection.rtl => Corners.only(
        topLeft: topEnd,
        topRight: topStart,
        bottomLeft: bottomEnd,
        bottomRight: bottomStart,
      ),
    };
  }

  @override
  CornersGeometry add(CornersGeometry other) {
    if (other is CornersDirectional) {
      return this + other;
    }
    return super.add(other);
  }

  @override
  CornersGeometry subtract(CornersGeometry other) {
    if (other is CornersDirectional) {
      return this - other;
    }
    return super.subtract(other);
  }

  CornersDirectional operator +(CornersDirectional other) {
    return CornersDirectional.only(
      topStart: topStart + other.topStart,
      topEnd: topEnd + other.topEnd,
      bottomStart: bottomStart + other.bottomStart,
      bottomEnd: bottomEnd + other.bottomEnd,
    );
  }

  CornersDirectional operator -(CornersDirectional other) {
    return CornersDirectional.only(
      topStart: topStart - other.topStart,
      topEnd: topEnd - other.topEnd,
      bottomStart: bottomStart - other.bottomStart,
      bottomEnd: bottomEnd - other.bottomEnd,
    );
  }

  @override
  CornersDirectional operator -() {
    return CornersDirectional.only(
      topStart: -topStart,
      topEnd: -topEnd,
      bottomStart: -bottomStart,
      bottomEnd: -bottomEnd,
    );
  }

  @override
  CornersDirectional operator *(double other) {
    return CornersDirectional.only(
      topStart: topStart * other,
      topEnd: topEnd * other,
      bottomStart: bottomStart * other,
      bottomEnd: bottomEnd * other,
    );
  }

  @override
  CornersDirectional operator /(double other) {
    return CornersDirectional.only(
      topStart: topStart / other,
      topEnd: topEnd / other,
      bottomStart: bottomStart / other,
      bottomEnd: bottomEnd / other,
    );
  }

  @override
  CornersDirectional operator ~/(double other) {
    return CornersDirectional.only(
      topStart: topStart ~/ other,
      topEnd: topEnd ~/ other,
      bottomStart: bottomStart ~/ other,
      bottomEnd: bottomEnd ~/ other,
    );
  }

  @override
  CornersDirectional operator %(double other) {
    return CornersDirectional.only(
      topStart: topStart % other,
      topEnd: topEnd % other,
      bottomStart: bottomStart % other,
      bottomEnd: bottomEnd % other,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CornersDirectional &&
            runtimeType == other.runtimeType &&
            topStart == other.topStart &&
            topEnd == other.topEnd &&
            bottomStart == other.bottomStart &&
            bottomEnd == other.bottomEnd;
  }

  @override
  int get hashCode => Object.hash(topStart, topEnd, bottomStart, bottomEnd);

  static const CornersDirectional none = CornersDirectional.all(Corner.none);
  static const CornersDirectional full = CornersDirectional.all(Corner.full);

  static CornersDirectional? lerp(
    CornersDirectional? a,
    CornersDirectional? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    if (a == null) {
      return b! * t;
    }
    if (b == null) {
      return a * (1.0 - t);
    }
    return _CornersDirectionalLerp(a, b, t);
  }
}

@immutable
class _CornersDirectionalLerp extends CornersDirectional {
  const _CornersDirectionalLerp(this.a, this.b, this.t) : super.only();

  final CornersDirectional a;
  final CornersDirectional b;
  final double t;

  @override
  Corners resolve(TextDirection? textDirection) {
    return _CornersLerp(a.resolve(textDirection), b.resolve(textDirection), t);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _CornersDirectionalLerp &&
            runtimeType == other.runtimeType &&
            a == other.a &&
            b == other.b &&
            t == other.t;
  }

  @override
  int get hashCode => Object.hash(a, b, t);
}

@immutable
class _CornersMixed extends CornersGeometry {
  const _CornersMixed(
    this._topLeft,
    this._topRight,
    this._bottomLeft,
    this._bottomRight,
    this._topStart,
    this._topEnd,
    this._bottomStart,
    this._bottomEnd,
  );

  @override
  final Corner _topLeft;

  @override
  final Corner _topRight;

  @override
  final Corner _bottomLeft;

  @override
  final Corner _bottomRight;

  @override
  final Corner _topStart;

  @override
  final Corner _topEnd;

  @override
  final Corner _bottomStart;

  @override
  final Corner _bottomEnd;

  @override
  Corners resolve(TextDirection? textDirection) {
    assert(textDirection != null);
    return switch (textDirection!) {
      TextDirection.ltr => Corners.only(
        topLeft: _topLeft + _topStart,
        topRight: _topRight + _topEnd,
        bottomLeft: _bottomLeft + _bottomStart,
        bottomRight: _bottomRight + _bottomEnd,
      ),
      TextDirection.rtl => Corners.only(
        topLeft: _topLeft + _topEnd,
        topRight: _topRight + _topStart,
        bottomLeft: _bottomLeft + _bottomEnd,
        bottomRight: _bottomRight + _bottomStart,
      ),
    };
  }

  @override
  _CornersMixed operator -() => _CornersMixed(
    -_topLeft,
    -_topRight,
    -_bottomLeft,
    -_bottomRight,
    -_topStart,
    -_topEnd,
    -_bottomStart,
    -_bottomEnd,
  );

  @override
  _CornersMixed operator *(double other) => _CornersMixed(
    _topLeft * other,
    _topRight * other,
    _bottomLeft * other,
    _bottomRight * other,
    _topStart * other,
    _topEnd * other,
    _bottomStart * other,
    _bottomEnd * other,
  );

  @override
  _CornersMixed operator /(double other) => _CornersMixed(
    _topLeft / other,
    _topRight / other,
    _bottomLeft / other,
    _bottomRight / other,
    _topStart / other,
    _topEnd / other,
    _bottomStart / other,
    _bottomEnd / other,
  );
  @override
  _CornersMixed operator ~/(double other) => _CornersMixed(
    _topLeft ~/ other,
    _topRight ~/ other,
    _bottomLeft ~/ other,
    _bottomRight ~/ other,
    _topStart ~/ other,
    _topEnd ~/ other,
    _bottomStart ~/ other,
    _bottomEnd ~/ other,
  );
  @override
  _CornersMixed operator %(double other) => _CornersMixed(
    _topLeft % other,
    _topRight % other,
    _bottomLeft % other,
    _bottomRight % other,
    _topStart % other,
    _topEnd % other,
    _bottomStart % other,
    _bottomEnd % other,
  );
}
