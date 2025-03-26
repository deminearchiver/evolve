import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'package:widgets/widgets.dart';

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

  const factory CroppedBorder.positioned({
    required ShapeBorder shape,
    Alignment alignment,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) = _PositionedCroppedBorder;

  Rect adjustRect(Rect rect, {TextDirection? textDirection}) {
    return rect;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return super.getInnerPath(
      adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return super.getOuterPath(
      adjustRect(rect, textDirection: textDirection),
      textDirection: textDirection,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    super.paint(
      canvas,
      adjustRect(rect, textDirection: textDirection),
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
      adjustRect(rect, textDirection: textDirection),
      paint,
      textDirection: textDirection,
    );
  }

  @override
  CroppedBorder scale(double t);

  @override
  int get hashCode => shape.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CroppedBorder && shape == other.shape;
  }

  static CroppedBorder _lerp(CroppedBorder a, CroppedBorder b, double t) {
    final shape = ShapeBorder.lerp(a.shape, b.shape, t)!;
    return _CroppedBorderLerp(a, b, t, shape: shape);
  }
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
  Rect adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedAlignment = alignment.resolve(textDirection);
    final size = Size(rect.width * widthFactor, rect.height * heightFactor);
    final offset = resolvedAlignment.alongOffset(rect.size - size as Offset);
    return Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
  }

  @override
  _AlignCroppedBorder scale(double t) {
    return _AlignCroppedBorder(
      shape: shape.scale(t),
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is _AlignCroppedBorder) {
      return _AlignCroppedBorder(
        shape: ShapeBorder.lerp(a.shape, shape, t)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, t)!,
        widthFactor: lerpDouble(a.widthFactor, widthFactor, t)!,
        heightFactor: lerpDouble(a.heightFactor, heightFactor, t)!,
      );
    }
    if (a is CroppedBorder) {
      return CroppedBorder._lerp(a, this, t);
    }
    if (a != null) {
      return _AlignCroppedBorder(
        shape: ShapeBorder.lerp(a, shape, t)!,
        alignment: alignment,
        widthFactor: lerpDouble(1, widthFactor, t)!,
        heightFactor: lerpDouble(1, heightFactor, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is _AlignCroppedBorder) {
      return _AlignCroppedBorder(
        shape: ShapeBorder.lerp(shape, b.shape, t)!,
        alignment: AlignmentGeometry.lerp(alignment, b.alignment, t)!,
        widthFactor: lerpDouble(widthFactor, b.widthFactor, t)!,
        heightFactor: lerpDouble(heightFactor, b.heightFactor, t)!,
      );
    }
    if (b is CroppedBorder) {
      return CroppedBorder._lerp(this, b, t);
    }
    if (b != null) {
      return _AlignCroppedBorder(
        shape: ShapeBorder.lerp(shape, b, t)!,
        alignment: alignment,
        widthFactor: lerpDouble(widthFactor, 1, t)!,
        heightFactor: lerpDouble(heightFactor, 1, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _AlignCroppedBorder &&
            shape == other.shape &&
            alignment == other.alignment &&
            widthFactor == other.widthFactor &&
            heightFactor == other.heightFactor;
  }

  @override
  int get hashCode => Object.hash(shape, alignment, widthFactor, heightFactor);

  @override
  String toString() {
    return "${objectRuntimeType(this, "CroppedBorder.align")}($alignment, $widthFactor, $heightFactor)";
  }
}

class _PaddingCroppedBorder extends CroppedBorder {
  const _PaddingCroppedBorder({
    required super.shape,
    this.padding = EdgeInsets.zero,
  }) : super._();

  final EdgeInsetsGeometry padding;

  @override
  Rect adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedPadding = padding.resolve(textDirection);
    return Rect.fromLTRB(
      rect.left + resolvedPadding.left,
      rect.top + resolvedPadding.top,
      rect.right - resolvedPadding.right,
      rect.bottom - resolvedPadding.bottom,
    );
  }

  @override
  _PaddingCroppedBorder scale(double t) {
    return _PaddingCroppedBorder(shape: shape.scale(t), padding: padding);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is _PaddingCroppedBorder) {
      return _PaddingCroppedBorder(
        shape: ShapeBorder.lerp(a.shape, shape, t)!,
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
      );
    }
    if (a is CroppedBorder) {
      return CroppedBorder._lerp(a, this, t);
    }
    if (a != null) {
      return _PaddingCroppedBorder(
        shape: ShapeBorder.lerp(a, shape, t)!,
        padding: EdgeInsetsGeometry.lerp(EdgeInsets.zero, padding, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is _PaddingCroppedBorder) {
      return _PaddingCroppedBorder(
        shape: shape.lerpTo(b, t)!,
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
      );
    }
    if (b is CroppedBorder) {
      return CroppedBorder._lerp(this, b, t);
    }
    if (b != null) {
      return _PaddingCroppedBorder(
        shape: ShapeBorder.lerp(shape, b, t)!,
        padding: EdgeInsetsGeometry.lerp(padding, EdgeInsets.zero, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _PaddingCroppedBorder &&
            shape == other.shape &&
            padding == other.padding;
  }

  @override
  int get hashCode => Object.hash(shape, padding);

  @override
  String toString() {
    return "${objectRuntimeType(this, "CroppedBorder.padding")}($padding)";
  }
}

class _PositionedCroppedBorder extends CroppedBorder {
  const _PositionedCroppedBorder({
    required super.shape,
    this.alignment = Alignment.center,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
  }) : assert(left == null || right == null || width == null),
       assert(top == null || bottom == null || height == null),
       super._();

  const _PositionedCroppedBorder.fill({
    required super.shape,
    this.alignment = Alignment.center,
  }) : left = 0,
       top = 0,
       right = 0,
       bottom = 0,
       width = null,
       height = null,
       super._();

  final AlignmentGeometry alignment;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;

  @override
  Rect adjustRect(Rect rect, {TextDirection? textDirection}) {
    final resolvedAlignment = alignment.resolve(textDirection);
    final size = rect.size;

    // double x;
    // if (left != null) {
    //   x = left!;
    // } else if (right != null) {
    //   x = width != null ? rect.width - right! - width! : 0.0;
    // } else {
    //   x = resolvedAlignment.alongOffset(size - Size(width!, 0) as Offset).dx;
    // }

    // double y;
    // if (top != null) {
    //   y = top!;
    // } else if (bottom != null) {
    //   y = height != null ? size.height - bottom! - height! : 0.0;
    // } else {
    //   y = resolvedAlignment.alongOffset(size - Size(0, height!) as Offset).dy;
    // }

    return Rect.fromLTWH(
      switch ((left, right, width)) {
        (final double left?, _, _) => left,
        (_, final double right?, final double width?) =>
          rect.width - right - width,
        // TODO: investigate behavior when width is null
        (_, final double _?, _) => 0.0,
        _ => resolvedAlignment._alongX(size.width - width!),
      },
      switch ((top, bottom, height)) {
        (final double top?, _, _) => top,
        (_, final double bottom?, final double height?) =>
          size.height - bottom - height,
        // TODO: investigate behavior when height is null
        (_, final double _?, _) => 0.0,
        _ => resolvedAlignment._alongY(size.height - height!),
      },
      switch ((left, right)) {
        (final double left?, final double right?) => size.width - right - left,
        (_, _) => width!,
      },
      switch ((top, bottom)) {
        (final double top?, final double bottom?) => size.height - bottom - top,
        (_, _) => height!,
      },
    );
  }

  @override
  _PositionedCroppedBorder scale(double t) {
    return _PositionedCroppedBorder(
      shape: shape.scale(t),
      left: left != null ? left! * t : null,
      top: top != null ? top! * t : null,
      right: right != null ? right! * t : null,
      bottom: bottom != null ? bottom! * t : null,
      width: width != null ? width! * t : null,
      height: height != null ? height! * t : null,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CroppedBorder) {
      return CroppedBorder._lerp(a, this, t);
    }
    if (a != null) {
      return CroppedBorder._lerp(
        _PositionedCroppedBorder.fill(shape: a, alignment: alignment),
        this,
        t,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CroppedBorder) {
      return CroppedBorder._lerp(this, b, t);
    }
    if (b != null) {
      return CroppedBorder._lerp(
        this,
        _PositionedCroppedBorder.fill(shape: b, alignment: alignment),
        t,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _PositionedCroppedBorder &&
            shape == other.shape &&
            alignment == other.alignment &&
            left == other.left &&
            top == other.top &&
            right == other.right &&
            bottom == other.bottom &&
            width == other.width &&
            height == other.height;
  }

  @override
  int get hashCode =>
      Object.hash(shape, alignment, left, top, right, bottom, width, height);

  @override
  String toString() {
    return "${objectRuntimeType(this, "CroppedBorder.positioned")}($alignment, $left, $top, $right, $bottom, $width, $height)";
  }
}

class _CroppedBorderLerp extends CroppedBorder {
  const _CroppedBorderLerp(this.a, this.b, this.t, {required super.shape})
    : super._();

  final CroppedBorder a;
  final CroppedBorder b;
  final double t;

  @override
  Rect adjustRect(Rect rect, {TextDirection? textDirection}) {
    return Rect.lerp(
      a.adjustRect(rect, textDirection: textDirection),
      b.adjustRect(rect, textDirection: textDirection),
      t,
    )!;
  }

  @override
  _CroppedBorderLerp scale(double factor) {
    return _CroppedBorderLerp(
      a.scale(t),
      b.scale(t),
      t,
      shape: shape.scale(factor),
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? from, double progress) {
    if (from is _CroppedBorderLerp) {
      return _CroppedBorderLerp(
        ShapeBorder.lerp(from.a, a, progress)! as CroppedBorder,
        ShapeBorder.lerp(from.b, b, progress)! as CroppedBorder,
        lerpDouble(from.t, t, progress)!,
        shape: ShapeBorder.lerp(from.shape, shape, progress)!,
      );
    }
    if (from != null) {
      return _CroppedBorderLerp(
        a,
        b,
        t,
        shape: ShapeBorder.lerp(from, shape, progress)!,
      );
    }
    return super.lerpTo(b, progress);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? to, double progress) {
    if (to is _CroppedBorderLerp) {
      return _CroppedBorderLerp(
        ShapeBorder.lerp(a, to.a, progress)! as CroppedBorder,
        ShapeBorder.lerp(b, to.b, progress)! as CroppedBorder,
        lerpDouble(t, to.t, progress)!,
        shape: ShapeBorder.lerp(shape, to.shape, progress)!,
      );
    }
    if (to != null) {
      return _CroppedBorderLerp(
        a,
        b,
        t,
        shape: ShapeBorder.lerp(shape, to, progress)!,
      );
    }
    return super.lerpTo(b, progress);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _CroppedBorderLerp &&
            shape == other.shape &&
            a == other.a &&
            b == other.b &&
            t == other.t;
  }

  @override
  int get hashCode => Object.hash(shape, a, b, t);

  @override
  String toString() {
    return "${objectRuntimeType(this, "_CroppedBorderLerp")}($a, $b, $t)";
  }
}

// This function was split into 2 for extra performance
// Offset alongOffset(Offset other) {
//   final double centerX = other.dx / 2.0;
//   final double centerY = other.dy / 2.0;
//   return Offset(centerX + x * centerX, centerY + y * centerY);
// }
extension on Alignment {
  double _alongX(double other) {
    final double center = other / 2.0;
    return center + x * center;
  }

  double _alongY(double other) {
    final double center = other / 2.0;
    return center + y * center;
  }
}
