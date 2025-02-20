import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class ProxyShapeBorder extends ShapeBorder {
  const ProxyShapeBorder({required this.shape});

  final ShapeBorder shape;

  @override
  EdgeInsetsGeometry get dimensions => shape.dimensions;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return shape.getInnerPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return shape.getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    shape.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    shape.paintInterior(canvas, rect, paint);
  }

  @override
  bool get preferPaintInterior => shape.preferPaintInterior;

  @override
  ShapeBorder scale(double t);
}

abstract class ProxyOutlinedBorder extends OutlinedBorder {
  const ProxyOutlinedBorder({required this.shape});

  final OutlinedBorder shape;

  @override
  BorderSide get side => shape.side;

  @override
  EdgeInsetsGeometry get dimensions => shape.dimensions;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return shape.getInnerPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return shape.getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    shape.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  bool get preferPaintInterior => shape.preferPaintInterior;

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    super.paintInterior(canvas, rect, paint, textDirection: textDirection);
    shape.paintInterior(canvas, rect, paint, textDirection: textDirection);
  }

  @override
  OutlinedBorder copyWith({BorderSide? side});

  @override
  ShapeBorder scale(double t);
}
