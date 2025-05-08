import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

GestureDetector? _gestureDetector;

class Gestures {
  const Gestures({
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapMove,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTap,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onLongPressDown,
    this.onLongPressCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPressEnd,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressUp,
    this.onTertiaryLongPressEnd,
  });

  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapDownCallback? onTapUp;
  final GestureTapMoveCallback? onTapMove;
  final GestureTapCancelCallback? onTapCancel;

  final GestureTapCallback? onSecondaryTap;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapDownCallback? onSecondaryTapUp;
  final GestureTapCancelCallback? onSecondaryTapCancel;

  final GestureTapCallback? onTertiaryTap;
  final GestureTapDownCallback? onTertiaryTapDown;
  final GestureTapDownCallback? onTertiaryTapUp;
  final GestureTapCancelCallback? onTertiaryTapCancel;

  final GestureTapCallback? onDoubleTap;
  final GestureTapDownCallback? onDoubleTapDown;
  final GestureTapCancelCallback? onDoubleTapCancel;

  final GestureLongPressDownCallback? onLongPressDown;
  final GestureLongPressCancelCallback? onLongPressCancel;
  final GestureLongPressCallback? onLongPress;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureLongPressEndCallback? onLongPressEnd;

  final GestureLongPressDownCallback? onSecondaryLongPressDown;
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;
  final GestureLongPressCallback? onSecondaryLongPress;
  final GestureLongPressStartCallback? onSecondaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;
  final GestureLongPressUpCallback? onSecondaryLongPressUp;
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;

  final GestureLongPressDownCallback? onTertiaryLongPressDown;
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;
  final GestureLongPressCallback? onTertiaryLongPress;
  final GestureLongPressStartCallback? onTertiaryLongPressStart;
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;
  final GestureLongPressUpCallback? onTertiaryLongPressUp;
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;

  // final GestureDragDownCallback? onHorizontalDragDown;
  // final GestureDragStartCallback? onHorizontalDragStart;
  // final GestureDragUpdateCallback? onHorizontalDragUpdate;
  // final GestureDragEndCallback? onHorizontalDragEnd;
  // final GestureDragCancelCallback? onHorizontalDragCancel;

  // final GestureDragDownCallback? onVerticalDragDown;
  // final GestureDragStartCallback? onVerticalDragStart;
  // final GestureDragUpdateCallback? onVerticalDragUpdate;
  // final GestureDragEndCallback? onVerticalDragEnd;
  // final GestureDragCancelCallback? onVerticalDragCancel;

  // final GestureDragDownCallback? onPanDragDown;
  // final GestureDragStartCallback? onPanDragStart;
  // final GestureDragUpdateCallback? onPanDragUpdate;
  // final GestureDragEndCallback? onPanDragEnd;
  // final GestureDragCancelCallback? onPanDragCancel;

  // final GestureScaleStartCallback? onScaleStart;
  // final GestureScaleUpdateCallback? onScaleUpdate;
  // final GestureScaleEndCallback? onScaleEnd;

  bool get onTapEnabled =>
      onTap != null ||
      onTapDown != null ||
      onTapUp != null ||
      onTapCancel != null;

  bool get enabled => onTapEnabled;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Gestures &&
            runtimeType == other.runtimeType &&
            onTap == other.onTap &&
            onTapDown == other.onTapDown &&
            onTapUp == other.onTapUp &&
            onTapMove == other.onTapMove &&
            onTapCancel == other.onTapCancel &&
            onSecondaryTap == other.onSecondaryTap &&
            onSecondaryTapDown == other.onSecondaryTapDown &&
            onSecondaryTapUp == other.onSecondaryTapUp &&
            onSecondaryTapCancel == other.onSecondaryTapCancel &&
            onTertiaryTap == other.onTertiaryTap &&
            onTertiaryTapDown == other.onTertiaryTapDown &&
            onTertiaryTapUp == other.onTertiaryTapUp &&
            onTertiaryTapCancel == other.onTertiaryTapCancel &&
            onDoubleTap == other.onDoubleTap &&
            onDoubleTapDown == other.onDoubleTapDown &&
            onDoubleTapCancel == other.onDoubleTapCancel &&
            onLongPressDown == other.onLongPressDown &&
            onLongPressCancel == other.onLongPressCancel &&
            onLongPress == other.onLongPress &&
            onLongPressStart == other.onLongPressStart &&
            onLongPressMoveUpdate == other.onLongPressMoveUpdate &&
            onLongPressUp == other.onLongPressUp &&
            onLongPressEnd == other.onLongPressEnd &&
            onSecondaryLongPressDown == other.onSecondaryLongPressDown &&
            onSecondaryLongPressCancel == other.onSecondaryLongPressCancel &&
            onSecondaryLongPress == other.onSecondaryLongPress &&
            onSecondaryLongPressStart == other.onSecondaryLongPressStart &&
            onSecondaryLongPressMoveUpdate ==
                other.onSecondaryLongPressMoveUpdate &&
            onSecondaryLongPressUp == other.onSecondaryLongPressUp &&
            onSecondaryLongPressEnd == other.onSecondaryLongPressEnd &&
            onTertiaryLongPressDown == other.onTertiaryLongPressDown &&
            onTertiaryLongPressCancel == other.onTertiaryLongPressCancel &&
            onTertiaryLongPress == other.onTertiaryLongPress &&
            onTertiaryLongPressStart == other.onTertiaryLongPressStart &&
            onTertiaryLongPressMoveUpdate ==
                other.onTertiaryLongPressMoveUpdate &&
            onTertiaryLongPressUp == other.onTertiaryLongPressUp &&
            onTertiaryLongPressEnd == other.onTertiaryLongPressEnd;
  }

  @override
  int get hashCode => Object.hashAll([
    onTap,
    onTapDown,
    onTapUp,
    onTapMove,
    onTapCancel,
    onSecondaryTap,
    onSecondaryTapDown,
    onSecondaryTapUp,
    onSecondaryTapCancel,
    onTertiaryTap,
    onTertiaryTapDown,
    onTertiaryTapUp,
    onTertiaryTapCancel,
    onDoubleTap,
    onDoubleTapDown,
    onDoubleTapCancel,
    onLongPressDown,
    onLongPressCancel,
    onLongPress,
    onLongPressStart,
    onLongPressMoveUpdate,
    onLongPressUp,
    onLongPressEnd,
    onSecondaryLongPressDown,
    onSecondaryLongPressCancel,
    onSecondaryLongPress,
    onSecondaryLongPressStart,
    onSecondaryLongPressMoveUpdate,
    onSecondaryLongPressUp,
    onSecondaryLongPressEnd,
    onTertiaryLongPressDown,
    onTertiaryLongPressCancel,
    onTertiaryLongPress,
    onTertiaryLongPressStart,
    onTertiaryLongPressMoveUpdate,
    onTertiaryLongPressUp,
    onTertiaryLongPressEnd,
  ]);
}
