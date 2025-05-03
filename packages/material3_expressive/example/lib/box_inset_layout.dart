import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double _factor = 0.146447; // (1 - sqrt(2) / 2) / 2

// class BoxInsetLayout extends StatelessWidget {
//   const BoxInsetLayout({super.key, required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     final rightEdge = size.width;
//     final bottomEdge = size.height;
//     final inset = _factor * math.max(rightEdge, bottomEdge);
//     return Padding(padding: EdgeInsets.all(inset), child: child);
//   }
// }

class BoxInsetLayout extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {}
}

class RenderBoxInsetLayout extends RenderShiftedBox {
  RenderBoxInsetLayout({required Size screenSize, RenderBox? child})
    : super(child);

  Size _screenSize;
  Size get screenSize => _screenSize;
  set screenSize(Size value) {
    if (_screenSize == value) return;
    _screenSize = value;
    markNeedsLayout();
  }
}
