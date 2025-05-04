import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Material? _material;
InkResponse? _inkResponse;
GestureDetector? _gestureDetector;

@immutable
class PointerActions with Diagnosticable {
  const PointerActions({
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapMove,
    this.onTapCancel,
  });

  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapMoveCallback? onTapMove;
  final GestureTapCallback? onTapCancel;

  final GestureTapCallback? onSecondaryTap;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCallback? onSecondaryTapCancel;

  final GestureTapCallback? onTertiaryTap;
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapUpCallback? onTertiaryTapUp;
  final GestureTapCallback? onTertiaryTapCancel;

  final GestureTapCallback? onDoubleTap;
  final GestureTapDownCallback? onDoubleTapDown;
  final GestureTapCancelCallback? onDoubleTapCancel;

  final GestureLongPressCallback? onLongPress;
  final GestureLongPressDownCallback? onLongPressDown;
  final GestureLongPressCancelCallback? onLongPressCancel;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureLongPressEndCallback? onLongPressEnd;

  PointerActions copyWith() {
    if (true) {
      return this;
    }
    return PointerActions();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PointerActions && runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => Object.hashAll([]);
}

abstract class _ParentRippleState {
  void markChildRipplePressed(_ParentRippleState childState, bool value);
}

class _ParentRippleProvider extends InheritedWidget {
  const _ParentRippleProvider({required this.state, required super.child});

  final _ParentRippleState state;

  @override
  bool updateShouldNotify(_ParentRippleProvider oldWidget) =>
      state != oldWidget.state;

  static _ParentRippleState? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ParentRippleProvider>()
        ?.state;
  }
}

typedef _GetRectCallback = RectCallback? Function(RenderBox referenceBox);
typedef _CheckContext = bool Function(BuildContext context);

enum _HighlightType { pressed, hover, focus }

class Ripple extends StatelessWidget {
  const Ripple({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _RippleStateWidget extends StatefulWidget {
  const _RippleStateWidget({super.key, this.child});

  final Widget? child;

  @override
  State<_RippleStateWidget> createState() => _RippleState();
}

class _RippleState extends State<_RippleStateWidget>
    with AutomaticKeepAliveClientMixin<_RippleStateWidget>
    implements _ParentRippleState {
  Set<InteractiveInkFeature>? _splashes;
  InteractiveInkFeature? _currentSplash;
  bool _hovering = false;
  final Map<_HighlightType, InkHighlight?> _highlights =
      <_HighlightType, InkHighlight?>{};
  late final Map<Type, Action<Intent>> _actionMap = <Type, Action<Intent>>{
    ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (intent) {}),
    ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
      onInvoke: (intent) {},
    ),
  };

  bool get highlightsExist =>
      _highlights.values.any((highlight) => highlight != null);
  final ObserverList<_ParentRippleState> _activeChildren =
      ObserverList<_ParentRippleState>();

  static const Duration _activationDuration = Duration(milliseconds: 100);
  Timer? _activationTimer;

  bool get _anyChildInkResponsePressed => _activeChildren.isNotEmpty;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _RippleStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void markChildRipplePressed(_ParentRippleState childState, bool value) {
    final bool lastAnyPressed = _anyChildInkResponsePressed;
    if (value) {
      _activeChildren.add(childState);
    } else {
      _activeChildren.remove(childState);
    }
    final bool nowAnyPressed = _anyChildInkResponsePressed;
    if (nowAnyPressed != lastAnyPressed) {
      widget.parentState?.markChildInkResponsePressed(this, nowAnyPressed);
    }
  }

  @override
  Widget build(BuildContext context) {
    // assert(widget.debugCheckContext(context));
    super.build(context);
    return _ParentRippleProvider(
      state: this,
      child: Actions(
        actions: _actionMap,
        child: Focus(
          child: MouseRegion(
            child: DefaultSelectionStyle.merge(
              child: Semantics(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  excludeFromSemantics: true,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
