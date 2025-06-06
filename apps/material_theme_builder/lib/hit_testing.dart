import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ForwardHitTests extends SingleChildRenderObjectWidget {
  const ForwardHitTests({super.key, required this.descendantKey, super.child});

  final GlobalKey descendantKey;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderForwardHitTests(childKey: descendantKey);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderForwardHitTests renderObject,
  ) {
    renderObject.descendantKey = descendantKey;
  }
}

class RenderForwardHitTests extends RenderProxyBox {
  RenderForwardHitTests({required GlobalKey childKey, RenderBox? child})
    : _descendantKey = childKey,
      super(child);

  GlobalKey _descendantKey;
  GlobalKey get descendantKey => _descendantKey;
  set descendantKey(GlobalKey value) {
    if (_descendantKey == value) return;
    _descendantKey = value;
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
