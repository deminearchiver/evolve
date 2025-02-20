// Copyright (c) 2025, deminearchiver
// Use of this source code is governed the BSD-3-Clause license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'proxy_shape_border.dart';

abstract class CroppedBorder extends ProxyShapeBorder {
  const CroppedBorder._({required super.shape});

  const factory CroppedBorder.align({
    required ShapeBorder shape,
    AlignmentGeometry alignment,
    double widthFactor,
    double heightFactor,
  }) = _AlignCroppedBorder;

  const factory CroppedBorder.padding({
    required ShapeBorder shape,
    EdgeInsetsGeometry padding,
  }) = _PaddingCroppedBorder;
}

class _AlignCroppedBorder extends CroppedBorder {
  const _AlignCroppedBorder({
    required super.shape,
    this.alignment = Alignment.center,
    this.widthFactor = 1,
    this.heightFactor = 1,
  }) : super._();

  final AlignmentGeometry alignment;
  final double widthFactor;
  final double heightFactor;
  @override
  ShapeBorder scale(double t) {
    return _AlignCroppedBorder(
      shape: shape.scale(t),
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  Rect _adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedAlignment = alignment.resolve(textDirection);
    final size = Size(rect.width * widthFactor, rect.height * heightFactor);
    final offset = resolvedAlignment.alongOffset(rect.size - size as Offset);
    return Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return super.getInnerPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return super.getOuterPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    super.paint(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    super.paintInterior(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      paint,
      textDirection: textDirection,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is _AlignCroppedBorder) {
      return _AlignCroppedBorder(
        shape: shape.lerpFrom(a.shape, t)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, t)!,
        widthFactor: lerpDouble(a.widthFactor, widthFactor, t)!,
        heightFactor: lerpDouble(a.heightFactor, heightFactor, t)!,
      );
    }
    if (a is _PaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpFrom(a.shape, t)!,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        padding: a.padding,
        t: 1 - t,
      );
    }
    if (a is _AlignToPaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpFrom(a.shape, t)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, t)!,
        widthFactor: lerpDouble(a.widthFactor, widthFactor, t)!,
        heightFactor: lerpDouble(a.heightFactor, heightFactor, t)!,
        padding: a.padding,
        t: a.t,
      );
    }
    return _AlignCroppedBorder(
      shape: shape.lerpFrom(a, t)!,
      alignment: alignment,
      widthFactor: lerpDouble(1, widthFactor, t)!,
      heightFactor: lerpDouble(1, heightFactor, t)!,
    );
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is _AlignCroppedBorder) {
      return _AlignCroppedBorder(
        shape: shape.lerpTo(b.shape, t)!,
        alignment: AlignmentGeometry.lerp(alignment, b.alignment, t)!,
        widthFactor: lerpDouble(widthFactor, b.widthFactor, t)!,
        heightFactor: lerpDouble(heightFactor, b.heightFactor, t)!,
      );
    }
    if (b is _PaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpTo(b.shape, t)!,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        padding: b.padding,
        t: t,
      );
    }
    if (b is _AlignToPaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpTo(b.shape, t)!,
        alignment: AlignmentGeometry.lerp(alignment, b.alignment, t)!,
        widthFactor: lerpDouble(widthFactor, b.widthFactor, t)!,
        heightFactor: lerpDouble(heightFactor, b.heightFactor, t)!,
        padding: b.padding,
        t: b.t,
      );
    }
    return _AlignCroppedBorder(
      shape: shape.lerpTo(b, t)!,
      alignment: alignment,
      widthFactor: lerpDouble(widthFactor, 1, t)!,
      heightFactor: lerpDouble(heightFactor, 1, t)!,
    );
  }

  @override
  String toString() {
    return "${objectRuntimeType(this, 'CroppedShapeBorder.align')}($alignment, $widthFactor, $heightFactor)";
  }
}

class _PaddingCroppedBorder extends CroppedBorder {
  const _PaddingCroppedBorder({
    required super.shape,
    this.padding = EdgeInsets.zero,
  }) : super._();

  final EdgeInsetsGeometry padding;
  @override
  ShapeBorder scale(double t) {
    return _PaddingCroppedBorder(shape: shape.scale(t), padding: padding * t);
  }

  Rect _adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedPadding = padding.resolve(textDirection);
    return Rect.fromLTRB(
      rect.left + resolvedPadding.left,
      rect.top + resolvedPadding.top,
      rect.right - resolvedPadding.right,
      rect.bottom - resolvedPadding.bottom,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return super.getInnerPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return super.getOuterPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    super.paint(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    super.paintInterior(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      paint,
      textDirection: textDirection,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is _PaddingCroppedBorder) {
      return _PaddingCroppedBorder(
        shape: shape.lerpFrom(a, t)!,
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
      );
    }
    if (a is _AlignCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpFrom(a.shape, t)!,
        alignment: a.alignment,
        widthFactor: a.widthFactor,
        heightFactor: a.heightFactor,
        padding: padding,
        t: t,
      );
    }
    if (a is _AlignToPaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpFrom(a.shape, t)!,
        alignment: a.alignment,
        widthFactor: a.widthFactor,
        heightFactor: a.heightFactor,
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
        t: a.t,
      );
    }
    return _PaddingCroppedBorder(
      shape: shape.lerpFrom(a, t)!,
      padding: EdgeInsetsGeometry.lerp(EdgeInsets.zero, padding, t)!,
    );
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is _PaddingCroppedBorder) {
      return _PaddingCroppedBorder(
        shape: shape.lerpTo(b, t)!,
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
      );
    }
    if (b is _AlignCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpTo(b.shape, t)!,
        alignment: b.alignment,
        widthFactor: b.widthFactor,
        heightFactor: b.heightFactor,
        padding: padding,
        t: 1 - t,
      );
    }
    if (b is _AlignToPaddingCroppedBorder) {
      return _AlignToPaddingCroppedBorder(
        shape: shape.lerpTo(b.shape, t)!,
        alignment: b.alignment,
        widthFactor: b.widthFactor,
        heightFactor: b.heightFactor,
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
        t: b.t,
      );
    }
    return _PaddingCroppedBorder(
      shape: shape.lerpTo(b, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, EdgeInsets.zero, t)!,
    );
  }

  @override
  String toString() {
    return "${objectRuntimeType(this, 'CroppedShapeBorder.padding')}($padding)";
  }
}

class _AlignToPaddingCroppedBorder extends CroppedBorder {
  const _AlignToPaddingCroppedBorder({
    required super.shape,
    required this.alignment,
    required this.widthFactor,
    required this.heightFactor,
    required this.padding,
    required this.t,
  }) : super._();
  final AlignmentGeometry alignment;
  final double widthFactor;
  final double heightFactor;
  final EdgeInsetsGeometry padding;

  final double t;

  @override
  ShapeBorder scale(double t) {
    return _AlignToPaddingCroppedBorder(
      shape: shape.scale(t),
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      padding: padding * t,
      t: this.t,
    );
  }

  Rect _adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedAlignment = alignment.resolve(textDirection);
    final size = Size(rect.width * widthFactor, rect.height * heightFactor);
    final offset = resolvedAlignment.alongOffset(rect.size - size as Offset);
    final alignRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width,
      size.height,
    );

    final resolvedPadding = padding.resolve(textDirection);
    final paddingRect = Rect.fromLTRB(
      rect.left + resolvedPadding.left,
      rect.top + resolvedPadding.top,
      rect.right - resolvedPadding.right,
      rect.bottom - resolvedPadding.bottom,
    );
    return Rect.lerp(alignRect, paddingRect, t)!;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return super.getInnerPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return super.getOuterPath(
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    super.paint(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    super.paintInterior(
      canvas,
      _adjustRect(rect, textDirection: textDirection),
      paint,
      textDirection: textDirection,
    );
  }
}
