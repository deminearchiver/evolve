import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:material3_expressive_example/scheduler_utils.dart';

class Anchor extends StatefulWidget {
  const Anchor({super.key, this.onGlobalRectChanged, required this.child});

  final ValueChanged<Rect>? onGlobalRectChanged;
  final Widget child;

  @override
  State<Anchor> createState() => _AnchorState();
}

class _AnchorState extends State<Anchor> {
  Rect _globalRect = Rect.zero;
  Rect get globalRect => _globalRect;

  late PersistentFrameNotifier _relayout;

  @override
  void initState() {
    super.initState();
    _relayout = PersistentFrameNotifier();
  }

  @override
  void dispose() {
    _relayout.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _RectObserver(
      relayout: _relayout,
      onGlobalRectChanged: (value) {
        widget.onGlobalRectChanged?.call(value);
        _globalRect = value;
      },
      child: widget.child,
    );
  }
}

class Follower extends StatefulWidget {
  const Follower({
    super.key,
    required this.anchorGlobalRect,
    required this.child,
  });

  final ValueGetter<Rect> anchorGlobalRect;
  final Widget child;

  @override
  State<Follower> createState() => _FollowerState();
}

class _FollowerState extends State<Follower> {
  late PersistentFrameNotifier _relayout;

  @override
  void initState() {
    super.initState();
    _relayout = PersistentFrameNotifier();
  }

  @override
  void dispose() {
    _relayout.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Layout(
      relayout: _relayout,
      anchorContext: () => null,
      anchorGlobalRect: widget.anchorGlobalRect,
      child: widget.child,
    );
  }
}

class _Layout extends SingleChildRenderObjectWidget {
  const _Layout({
    required this.relayout,
    required this.anchorContext,
    required this.anchorGlobalRect,
    required Widget super.child,
  });

  final Listenable relayout;
  final ValueGetter<BuildContext?> anchorContext;
  final ValueGetter<Rect> anchorGlobalRect;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderLayout(
      relayout: relayout,
      anchorContext: anchorContext,
      anchorGlobalRect: anchorGlobalRect,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderLayout renderObject) {
    renderObject
      ..relayout = relayout
      ..anchorContext = anchorContext
      ..anchorGlobalRect = anchorGlobalRect;
  }
}

class _RenderLayout extends RenderShiftedBox with RenderObjectRelayoutMixin {
  _RenderLayout({
    Listenable? relayout,
    required ValueGetter<BuildContext?> anchorContext,
    required ValueGetter<Rect> anchorGlobalRect,
    RenderBox? child,
  }) : _anchorContext = anchorContext,
       _anchorGlobalRect = anchorGlobalRect,
       super(child) {
    this.relayout = relayout;
  }

  ValueGetter<BuildContext?> _anchorContext;
  ValueGetter<BuildContext?> get anchorContext => _anchorContext;
  set anchorContext(ValueGetter<BuildContext?> value) {
    if (_anchorContext == value) {
      return;
    }
    _anchorContext = value;
    markNeedsLayout();
  }

  ValueGetter<Rect> _anchorGlobalRect;
  ValueGetter<Rect> get anchorGlobalRect => _anchorGlobalRect;
  set anchorGlobalRect(ValueGetter<Rect> value) {
    if (_anchorGlobalRect == value) {
      return;
    }
    _anchorGlobalRect = value;
    markNeedsLayout();
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final anchorGlobalRect = this.anchorGlobalRect();

    final Size childSize = child!.getDryLayout(
      BoxConstraints.tight(anchorGlobalRect.size),
    );
    return constraints.biggest;
  }

  @override
  void performLayout() {
    final anchorGlobalRect = this.anchorGlobalRect();

    final constraints = this.constraints;
    final BoxConstraints tightConstraints = BoxConstraints.tight(
      anchorGlobalRect.size,
    );
    child!.layout(tightConstraints, parentUsesSize: true);
    final parentData = child!.parentData! as BoxParentData;
    parentData.offset = globalToLocal(anchorGlobalRect.topLeft);
    size = constraints.biggest;
  }
}

// class _SizeObserver extends SingleChildRenderObjectWidget {
//   const _SizeObserver({
//     required this.onSizeChanged,
//     required Widget super.child,
//   });

//   final ValueChanged<Size> onSizeChanged;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return _RenderSizeObserver(onSizeChanged: onSizeChanged);
//   }

//   @override
//   void updateRenderObject(
//     BuildContext context,
//     _RenderSizeObserver renderObject,
//   ) {
//     renderObject.onSizeChanged = onSizeChanged;
//   }
// }

// class _RenderSizeObserver extends RenderProxyBox {
//   _RenderSizeObserver({ValueChanged<Size>? onSizeChanged, RenderBox? child})
//     : _onSizeChanged = onSizeChanged,
//       super(child);

//   ValueChanged<Size>? _onSizeChanged;
//   ValueChanged<Size>? get onSizeChanged => _onSizeChanged;
//   set onSizeChanged(ValueChanged<Size>? value) {
//     if (_onSizeChanged == value) {
//       return;
//     }
//     _onSizeChanged = value;
//     if (_onSizeChanged != null) {
//       markNeedsLayout();
//     }
//   }

//   @override
//   void performLayout() {
//     super.performLayout();
//     onSizeChanged(size);
//   }
// }

class _RectObserver extends SingleChildRenderObjectWidget {
  const _RectObserver({
    required this.relayout,
    this.onGlobalRectChanged,
    required Widget super.child,
  });

  final Listenable relayout;
  final ValueChanged<Rect>? onGlobalRectChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderRectObserver(
      relayout: relayout,
      onGlobalRectChanged: onGlobalRectChanged,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderRectObserver renderObject,
  ) {
    renderObject
      ..relayout = relayout
      ..onGlobalRectChanged = onGlobalRectChanged;
  }
}

class _RenderRectObserver extends RenderProxyBox
    with RenderObjectRelayoutMixin {
  _RenderRectObserver({
    Listenable? relayout,
    ValueChanged<Rect>? onGlobalRectChanged,
    RenderBox? child,
  }) : _onGlobalRectChanged = onGlobalRectChanged,
       super(child) {
    this.relayout = relayout;
  }

  ValueChanged<Rect>? _onGlobalRectChanged;
  ValueChanged<Rect>? get onGlobalRectChanged => _onGlobalRectChanged;
  set onGlobalRectChanged(ValueChanged<Rect>? value) {
    if (_onGlobalRectChanged == value) {
      return;
    }
    _onGlobalRectChanged = value;
    if (_onGlobalRectChanged != null) {
      markNeedsLayout();
    }
  }

  Rect? _oldRect;

  @override
  void performLayout() {
    super.performLayout();
    if (onGlobalRectChanged case final onGlobalRectChanged?) {
      final newRect = localToGlobal(Offset.zero) & size;
      if (_oldRect != newRect) {
        onGlobalRectChanged(newRect);
      }
      _oldRect = newRect;
    }
  }
}
