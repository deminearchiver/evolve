import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ForwardHitTests extends SingleChildRenderObjectWidget {
  const ForwardHitTests({
    super.key,
    required this.descendantKey,
    required this.constraints,
    this.alignment = Alignment.center,
    super.child,
  });

  final GlobalKey descendantKey;
  final BoxConstraints constraints;
  final Alignment alignment;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderForwardHitTests(
      descendantKey: descendantKey,
      additionalConstraints: constraints,
      alignment: alignment,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderForwardHitTests renderObject,
  ) {
    renderObject.descendantKey = descendantKey;
    renderObject.additionalConstraints = constraints;
    renderObject.alignment = alignment;
  }
}

class RenderForwardHitTests extends RenderShiftedBox {
  RenderForwardHitTests({
    required GlobalKey descendantKey,
    required BoxConstraints additionalConstraints,
    required Alignment alignment,
    RenderBox? child,
  }) : _descendantKey = descendantKey,
       _additionalConstraints = additionalConstraints,
       _alignment = alignment,
       super(child);

  GlobalKey _descendantKey;
  GlobalKey get descendantKey => _descendantKey;
  set descendantKey(GlobalKey value) {
    if (_descendantKey == value) return;
    _descendantKey = value;
  }

  BoxConstraints _additionalConstraints;
  BoxConstraints get additionalConstraints => _additionalConstraints;
  set additionalConstraints(BoxConstraints value) {
    if (_additionalConstraints == value) {
      return;
    }
    _additionalConstraints = value;
    markNeedsLayout();
  }

  Alignment _alignment;
  Alignment get alignment => _alignment;
  set alignment(Alignment value) {
    if (_alignment == value) {
      return;
    }
    _alignment = value;
    markNeedsLayout();
  }

  bool _debugCheckIsDescendant(RenderObject descendant) {
    bool visitParent(RenderObject? ancestor) {
      if (ancestor == null) return false;
      if (identical(this, ancestor)) return true;
      final parent = ancestor.parent;
      if (parent == null) return false;
      return visitParent(parent);
    }

    return visitParent(descendant.parent);
  }

  RenderObject? _findDescendant() {
    final descendant = descendantKey.currentContext?.findRenderObject();
    if (descendant == null) return null;
    assert(_debugCheckIsDescendant(descendant));
    return descendant;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child case final child?) {
      return additionalConstraints.constrainWidth(
        child.getMinIntrinsicWidth(height),
      );
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child case final child?) {
      return additionalConstraints.constrainHeight(
        child.getMinIntrinsicHeight(width),
      );
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child case final child?) {
      return additionalConstraints.constrainWidth(
        child.getMaxIntrinsicWidth(height),
      );
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child case final child?) {
      return additionalConstraints.constrainHeight(
        child.getMaxIntrinsicHeight(width),
      );
    }
    return 0.0;
  }

  Size _computeSize({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
  }) {
    if (child case final child?) {
      final size = layoutChild(child, constraints);
      final constrainedSize = additionalConstraints.constrain(size);
      return constraints.constrain(constrainedSize);
    }
    return Size.zero;
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    return _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
    );
  }

  @override
  double? computeDryBaseline(
    covariant BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    if (child case final child?) {
      final result = child.getDryBaseline(constraints, baseline);
      if (result == null) return null;
      final childSize = child.getDryLayout(constraints);
      return result +
          alignment
              .alongOffset(getDryLayout(constraints) - childSize as Offset)
              .dy;
    }
    return null;
  }

  @override
  void performLayout() {
    size = _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
    );
    if (child case final child?) {
      final childParentData = child.parentData! as BoxParentData;
      childParentData.offset = Alignment.center.alongOffset(
        size - child.size as Offset,
      );
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final descendant = _findDescendant();
    if (descendant == null || descendant is! RenderBox) {
      return false;
    }
    final center = descendant.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (result, position) {
        assert(position == center);
        return descendant.hitTest(result, position: center);
      },
    );
  }
}
