import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

abstract class CornersBorderDelegate {
  const CornersBorderDelegate();

  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  bool get preferPaintInterior => false;

  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  });

  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    assert(
      !preferPaintInterior,
      "$runtimeType.preferPaintInterior returns true but $runtimeType.paintInterior is not implemented.",
    );
    assert(
      false,
      "$runtimeType.preferPaintInterior returns false, so it is an error to call its paintInterior method.",
    );
  }

  CornersBorderDelegate? lerpFrom(CornersBorderDelegate? a, double t);
  CornersBorderDelegate? lerpTo(CornersBorderDelegate? b, double t);

  CornersBorderDelegate scale(double t);

  static CornersBorderDelegate? lerp(
    CornersBorderDelegate? a,
    CornersBorderDelegate? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    final result = b?.lerpFrom(a, t) ?? a?.lerpTo(b, t);
    return result ?? (t < 0.5 ? a : b);
  }
}

@immutable
class RoundedCornersBorderDelegate extends CornersBorderDelegate {
  const RoundedCornersBorderDelegate();

  @override
  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    final RRect borderRect = borderRadius.toRRect(rect);
    final RRect adjustedRect = borderRect.deflate(side.strokeInset);
    return Path()..addRRect(adjustedRect);
  }

  @override
  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    return Path()..addRRect(borderRadius.toRRect(rect));
  }

  @override
  bool get preferPaintInterior => true;

  @override
  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        if (side.width == 0.0) {
          canvas.drawRRect(borderRadius.toRRect(rect), side.toPaint());
        } else {
          final Paint paint = Paint()..color = side.color;
          final RRect borderRect = borderRadius.toRRect(rect);
          final RRect inner = borderRect.deflate(side.strokeInset);
          final RRect outer = borderRect.inflate(side.strokeOutset);
          canvas.drawDRRect(outer, inner, paint);
        }
    }
  }

  @override
  void paintInterior({
    required Canvas canvas,
    required Rect rect,
    required Paint paint,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (borderRadius == BorderRadius.zero ||
        borderRadius == BorderRadiusDirectional.zero) {
      canvas.drawRect(rect, paint);
    } else {
      canvas.drawRRect(borderRadius.toRRect(rect), paint);
    }
  }

  @override
  RoundedCornersBorderDelegate scale(double t) => this;

  @override
  CornersBorderDelegate? lerpFrom(CornersBorderDelegate? a, double t) {
    return this;
  }

  @override
  CornersBorderDelegate? lerpTo(CornersBorderDelegate? b, double t) {
    return this;
  }

  @override
  String toString() {
    return objectRuntimeType(this, "RoundedCornersBorderDelegate");
  }
}

class CutCornersBorderDelegate extends CornersBorderDelegate {
  const CutCornersBorderDelegate();

  Path _getPath(RRect rrect) {
    final Offset centerLeft = Offset(rrect.left, rrect.center.dy);
    final Offset centerRight = Offset(rrect.right, rrect.center.dy);
    final Offset centerTop = Offset(rrect.center.dx, rrect.top);
    final Offset centerBottom = Offset(rrect.center.dx, rrect.bottom);

    final double tlRadiusX = math.max(0.0, rrect.tlRadiusX);
    final double tlRadiusY = math.max(0.0, rrect.tlRadiusY);
    final double trRadiusX = math.max(0.0, rrect.trRadiusX);
    final double trRadiusY = math.max(0.0, rrect.trRadiusY);
    final double blRadiusX = math.max(0.0, rrect.blRadiusX);
    final double blRadiusY = math.max(0.0, rrect.blRadiusY);
    final double brRadiusX = math.max(0.0, rrect.brRadiusX);
    final double brRadiusY = math.max(0.0, rrect.brRadiusY);

    final List<Offset> vertices = <Offset>[
      Offset(rrect.left, math.min(centerLeft.dy, rrect.top + tlRadiusY)),
      Offset(math.min(centerTop.dx, rrect.left + tlRadiusX), rrect.top),
      Offset(math.max(centerTop.dx, rrect.right - trRadiusX), rrect.top),
      Offset(rrect.right, math.min(centerRight.dy, rrect.top + trRadiusY)),
      Offset(rrect.right, math.max(centerRight.dy, rrect.bottom - brRadiusY)),
      Offset(math.max(centerBottom.dx, rrect.right - brRadiusX), rrect.bottom),
      Offset(math.min(centerBottom.dx, rrect.left + blRadiusX), rrect.bottom),
      Offset(rrect.left, math.max(centerLeft.dy, rrect.bottom - blRadiusY)),
    ];

    return Path()..addPolygon(vertices, true);
  }

  @override
  Path getInnerPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    return _getPath(borderRadius.toRRect(rect).deflate(side.strokeInset));
  }

  @override
  Path getOuterPath({
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    return _getPath(borderRadius.toRRect(rect));
  }

  @override
  void paint({
    required Canvas canvas,
    required Rect rect,
    required BorderSide side,
    required BorderRadius borderRadius,
  }) {
    if (rect.isEmpty) {
      return;
    }
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final RRect borderRect = borderRadius.toRRect(rect);
        final RRect adjustedRect = borderRect.inflate(side.strokeOutset);
        final Path path = _getPath(adjustedRect)..addPath(
          getInnerPath(rect: rect, side: side, borderRadius: borderRadius),
          Offset.zero,
        );
        canvas.drawPath(path, side.toPaint());
    }
  }

  @override
  CutCornersBorderDelegate scale(double t) => this;

  @override
  CornersBorderDelegate? lerpFrom(CornersBorderDelegate? a, double t) {
    return this;
  }

  @override
  CornersBorderDelegate? lerpTo(CornersBorderDelegate? b, double t) {
    return this;
  }

  @override
  String toString() {
    return objectRuntimeType(this, "CutCornersBorderDelegate");
  }
}

class CornersBorder extends OutlinedBorder {
  const CornersBorder({
    super.side,
    required this.delegate,
    this.corners = Corners.none,
  });

  final CornersBorderDelegate delegate;
  final CornersGeometry corners;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return delegate.getInnerPath(
      rect: rect,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return delegate.getOuterPath(
      rect: rect,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect),
    );
  }

  @override
  bool get preferPaintInterior => delegate.preferPaintInterior;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    delegate.paint(
      canvas: canvas,
      rect: rect,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect),
    );
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    delegate.paintInterior(
      canvas: canvas,
      rect: rect,
      paint: paint,
      side: side,
      borderRadius: corners.resolve(textDirection).toBorderRadius(rect),
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CornersBorder) {
      return CornersBorder(
        side: BorderSide.lerp(a.side, side, t),
        delegate: CornersBorderDelegate.lerp(a.delegate, delegate, t)!,
        // TODO: implement CornersGeometry.lerp
        corners: CornersGeometry.lerp(a.corners, corners, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CornersBorder) {
      return CornersBorder(
        side: BorderSide.lerp(side, b.side, t),
        delegate: CornersBorderDelegate.lerp(delegate, b.delegate, t)!,
        // TODO: implement CornersGeometry.lerp
        corners: CornersGeometry.lerp(corners, b.corners, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  CornersBorder scale(double t) => CornersBorder(
    side: side.scale(t),
    delegate: delegate.scale(t),
    corners: corners * t,
  );

  @override
  CornersBorder copyWith({
    BorderSide? side,
    CornersBorderDelegate? delegate,
    CornersGeometry? corners,
  }) => CornersBorder(
    side: side ?? this.side,
    delegate: delegate ?? this.delegate,
    corners: corners ?? this.corners,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CornersBorder &&
            side == other.side &&
            delegate == other.delegate &&
            corners == other.corners;
  }

  @override
  int get hashCode => Object.hash(side, delegate, corners);

  @override
  String toString() {
    return "${objectRuntimeType(this, "CornersBorder")}($side, $delegate, $corners)";
  }
}
