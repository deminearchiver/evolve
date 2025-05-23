import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material3_expressive_example/scheduler_utils.dart';

class SizeChangeGroup extends StatefulWidget {
  const SizeChangeGroup({
    super.key,
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0.0,
    this.children = const [],
  });

  const SizeChangeGroup.horizontal({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0.0,
    this.children = const [],
  }) : direction = Axis.horizontal;

  const SizeChangeGroup.vertical({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0.0,
    this.children = const [],
  }) : direction = Axis.vertical;

  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final List<Widget> children;

  @override
  State<SizeChangeGroup> createState() => _SizeChangeGroupState();
}

class _SizeChangeGroupState extends State<SizeChangeGroup> {
  final Map<int, _SizeChangeState> _clients = <int, _SizeChangeState>{};

  @override
  void didUpdateWidget(covariant SizeChangeGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (final client in _clients.values) {
      client._updateSizeAdjustments();
    }
  }

  @override
  void dispose() {
    _clients.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      // Constant value
      mainAxisSize: MainAxisSize.min,

      // Passed through from widget
      direction: widget.direction,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      spacing: widget.spacing,
      children: widget.children
          .mapIndexed<Widget>(
            (index, child) =>
                _SizeChangeGroupScope(state: this, index: index, child: child),
          )
          .toList(),
    );
  }
}

class _SizeChangeGroupScope extends InheritedWidget {
  const _SizeChangeGroupScope({
    required this.state,
    required this.index,
    required super.child,
  });

  final _SizeChangeGroupState state;
  final int index;

  @override
  bool updateShouldNotify(covariant _SizeChangeGroupScope oldWidget) {
    return state != oldWidget.state || index != oldWidget.index;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<_SizeChangeGroupState>("state", state));
    properties.add(IntProperty("index", index));
  }

  static _SizeChangeGroupScope? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_SizeChangeGroupScope>();
  }
}

class _SizeChangeItemScope extends InheritedWidget {
  const _SizeChangeItemScope({required this.index, required super.child});

  final int index;

  @override
  bool updateShouldNotify(_SizeChangeItemScope oldWidget) {
    return index != oldWidget.index;
  }

  static _SizeChangeItemScope? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_SizeChangeItemScope>();
  }

  static int? _maybeIndexOf(BuildContext context) {
    return _maybeOf(context)?.index;
  }
}

class SizeChange extends StatefulWidget {
  const SizeChange({
    super.key,
    required this.direction,
    this.sizeFactor = 1.0,
    required this.child,
  });

  const SizeChange.width({
    super.key,
    double widthFactor = 1.0,
    required this.child,
  }) : direction = Axis.horizontal,
       sizeFactor = widthFactor;

  const SizeChange.height({
    super.key,
    double heightFactor = 1.0,
    required this.child,
  }) : direction = Axis.vertical,
       sizeFactor = heightFactor;

  final Axis direction;
  final double sizeFactor;
  final Widget child;

  @override
  State<SizeChange> createState() => _SizeChangeState();
}

class _SizeChangeState extends State<SizeChange> {
  _SizeChangeGroupScope? _scope;
  _SizeChangeGroupScope? get scope => _scope;
  set scope(_SizeChangeGroupScope? value) {
    if (_scope == value) {
      return;
    }
    if (_scope case final oldScope?) {
      _resetSizeAdjustments();
      oldScope.state._clients.remove(oldScope.index);
    }
    if (value case final newScope?) {
      newScope.state._clients[newScope.index] = this;
      _updateSizeAdjustments();
    }
    _scope = value;
  }

  int? _index;
  int? get index => _index;

  double get ownSizeFactorAdjustment => widget.sizeFactor - 1.0;

  late _ChangeNotifier _relayout;
  Size size = Size.zero;
  Size previousSize = Size.zero;
  Size nextSize = Size.zero;
  double sizeFactorAdjustmentFromPrevious = 0.0;
  double sizeFactorAdjustmentFromNext = 0.0;

  @override
  void initState() {
    super.initState();
    _relayout = _ChangeNotifier();
    PersistentFrameCallbacks.add(_persistentFrameCallback);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scope = _SizeChangeGroupScope._maybeOf(context);
  }

  @override
  void didUpdateWidget(covariant SizeChange oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sizeFactor != oldWidget.sizeFactor) {
      _updateSizeAdjustments();
    }
  }

  void _updateSizeAdjustments() {
    final group = scope;
    if (group == null) return;
    final previous = group.state._clients[group.index - 1];
    final next = group.state._clients[group.index + 1];
    double adjacentSizeAdjustment = 0.0;
    if (previous != null && next != null) {
      adjacentSizeAdjustment = -ownSizeFactorAdjustment / 2.0;
    } else if (previous != null || next != null) {
      adjacentSizeAdjustment = -ownSizeFactorAdjustment;
    }
    previous?.sizeFactorAdjustmentFromNext = adjacentSizeAdjustment;
    next?.sizeFactorAdjustmentFromPrevious = adjacentSizeAdjustment;
    previous?.nextSize = size;
    next?.previousSize = size;
  }

  void _resetSizeAdjustments() {
    final group = scope;
    if (group == null) return;
    final previous = group.state._clients[group.index - 1];
    final next = group.state._clients[group.index + 1];
    previous?.sizeFactorAdjustmentFromNext = 0.0;
    next?.sizeFactorAdjustmentFromPrevious = 0.0;
    previous?.nextSize = Size.zero;
    next?.previousSize = Size.zero;
  }

  @override
  void dispose() {
    _resetSizeAdjustments();
    PersistentFrameCallbacks.remove(_persistentFrameCallback);
    _relayout.dispose();
    scope = null;
    super.dispose();
  }

  void _persistentFrameCallback(Duration _) {
    _relayout.notify();
  }

  void _onSizeChanged(Size value) {
    size = value;
  }

  @override
  Widget build(BuildContext context) {
    if (scope == null) {
      return widget.child;
    }
    return _SizeAdjustment(
      relayout: _relayout,
      previousSize: () => previousSize,
      nextSize: () => nextSize,
      sizeFactorAdjustmentFromPrevious: () => sizeFactorAdjustmentFromPrevious,
      sizeFactorAdjustmentFromNext: () => sizeFactorAdjustmentFromNext,
      ownSizeFactorAdjustment: ownSizeFactorAdjustment,
      direction: widget.direction,
      child: _SizeObserver(
        // We are using a method here because _SizeObserver calls markNeedsLayout()
        // on every update of the listener property, so we have to make sure it is
        // identical on every rebuild to prevent unnecessary relayouts.
        onSizeChanged: _onSizeChanged,
        child: widget.child,
      ),
    );
  }
}

class _SizeAdjustment extends SingleChildRenderObjectWidget {
  const _SizeAdjustment({
    this.relayout,
    required this.previousSize,
    required this.nextSize,
    required this.sizeFactorAdjustmentFromPrevious,
    required this.sizeFactorAdjustmentFromNext,
    required this.ownSizeFactorAdjustment,
    required this.direction,
    required Widget super.child,
  });

  final Listenable? relayout;
  final ValueGetter<Size> previousSize;
  final ValueGetter<Size> nextSize;
  final ValueGetter<double> sizeFactorAdjustmentFromPrevious;
  final ValueGetter<double> sizeFactorAdjustmentFromNext;
  final double ownSizeFactorAdjustment;
  final Axis direction;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSizeAdjustment(
      relayout: relayout,
      previousSize: previousSize,
      nextSize: nextSize,
      alignment: Alignment.center,
      textDirection: Directionality.maybeOf(context),
      sizeFactorAdjustmentFromPrevious: sizeFactorAdjustmentFromPrevious,
      sizeFactorAdjustmentFromNext: sizeFactorAdjustmentFromNext,
      ownSizeFactorAdjustment: ownSizeFactorAdjustment,
      direction: direction,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSizeAdjustment renderObject,
  ) {
    renderObject
      ..textDirection = Directionality.maybeOf(context)
      ..relayout = relayout
      ..previousSize = previousSize
      ..nextSize = nextSize
      ..sizeFactorAdjustmentFromPrevious = sizeFactorAdjustmentFromPrevious
      ..sizeFactorAdjustmentFromNext = sizeFactorAdjustmentFromNext
      ..ownSizeFactorAdjustment = ownSizeFactorAdjustment
      ..direction = direction;
  }
}

class _RenderSizeAdjustment extends RenderAligningShiftedBox
    with RenderObjectRelayoutMixin {
  _RenderSizeAdjustment({
    Listenable? relayout,
    required this.previousSize,
    required this.nextSize,
    required this.sizeFactorAdjustmentFromPrevious,
    required this.sizeFactorAdjustmentFromNext,
    required double ownSizeFactorAdjustment,
    required Axis direction,
    super.alignment,
    super.textDirection,
  }) : _ownSizeFactorAdjustment = ownSizeFactorAdjustment,
       _direction = direction {
    this.relayout = relayout;
  }

  ValueGetter<Size> previousSize;
  ValueGetter<Size> nextSize;
  ValueGetter<double> sizeFactorAdjustmentFromPrevious;
  ValueGetter<double> sizeFactorAdjustmentFromNext;

  double _ownSizeFactorAdjustment;
  double get ownSizeFactorAdjustment => _ownSizeFactorAdjustment;

  set ownSizeFactorAdjustment(double value) {
    if (_ownSizeFactorAdjustment == value) {
      return;
    }
    _ownSizeFactorAdjustment = value;
    markNeedsLayout();
  }

  Axis _direction;
  Axis get direction => _direction;
  set direction(Axis value) {
    if (_direction == value) {
      return;
    }
    _direction = value;
    markNeedsLayout();
  }

  double _adjustWidth(double width) {
    if (direction == Axis.vertical) return width;
    return width * (1.0 + ownSizeFactorAdjustment) +
        previousSize().width * sizeFactorAdjustmentFromPrevious() +
        nextSize().width * sizeFactorAdjustmentFromNext();
  }

  double _adjustHeight(double height) {
    if (direction == Axis.horizontal) return height;
    return height * (1.0 + ownSizeFactorAdjustment) +
        previousSize().height * sizeFactorAdjustmentFromPrevious() +
        nextSize().height * sizeFactorAdjustmentFromNext();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _adjustWidth(super.computeMinIntrinsicWidth(height));
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _adjustWidth(super.computeMaxIntrinsicWidth(height));
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _adjustHeight(super.computeMinIntrinsicHeight(width));
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _adjustHeight(super.computeMaxIntrinsicHeight(width));
  }

  @override
  @protected
  Size computeDryLayout(covariant BoxConstraints constraints) {
    if (child != null) {
      final Size childSize = child!.getDryLayout(constraints.loosen());
      return constraints.constrain(
        Size(_adjustWidth(childSize.width), _adjustHeight(childSize.height)),
      );
    }
    return constraints.constrain(const Size(0.0, 0.0));
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;

    if (child != null) {
      child!.layout(constraints.loosen(), parentUsesSize: true);
      size = constraints.constrain(
        Size(
          _adjustWidth(child!.size.width),
          _adjustHeight(child!.size.height),
        ),
      );
      alignChild();
    } else {
      size = constraints.constrain(const Size(0.0, 0.0));
    }
  }
}

class _SizeObserver extends SingleChildRenderObjectWidget {
  const _SizeObserver({
    required this.onSizeChanged,
    required Widget super.child,
  });

  final ValueChanged<Size> onSizeChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSizeObserver(onSizeChanged: onSizeChanged);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderSizeObserver renderObject,
  ) {
    renderObject.onSizeChanged = onSizeChanged;
  }
}

class _RenderSizeObserver extends RenderProxyBox {
  _RenderSizeObserver({
    required ValueChanged<Size> onSizeChanged,
    RenderBox? child,
  }) : _onSizeChanged = onSizeChanged,
       super(child);

  ValueChanged<Size> _onSizeChanged;
  ValueChanged<Size> get onSizeChanged => _onSizeChanged;
  set onSizeChanged(ValueChanged<Size> value) {
    if (_onSizeChanged == value) {
      return;
    }
    _onSizeChanged = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    super.performLayout();
    onSizeChanged(size);
  }
}

class _ChangeNotifier with ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
