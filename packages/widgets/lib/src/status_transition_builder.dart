import 'package:flutter/widgets.dart';

/// Widget that listens to an animation, and rebuilds when the animation changes
/// [AnimationStatus].
///
/// This can be more efficient than just using an [AnimatedBuilder] when you
/// only need to rebuild when the [Animation.status] changes, since
/// [AnimatedBuilder] rebuilds every time the animation ticks.
class StatusTransitionBuilder extends StatefulWidget {
  /// Creates a widget that rebuilds when the given animation changes status.
  const StatusTransitionBuilder({
    super.key,
    required this.animation,
    this.child,
    required this.builder,
  });

  /// The animation to which this widget is listening.
  final Animation<double> animation;

  /// Called every time the [animation] changes [AnimationStatus].
  final TransitionBuilder builder;

  /// The child widget to pass to the [builder].
  ///
  /// If a [builder] callback's return value contains a subtree that does not
  /// depend on the animation, it's more efficient to build that subtree once
  /// instead of rebuilding it on every animation status change.
  ///
  /// Using this pre-built child is entirely optional, but can improve
  /// performance in some cases and is therefore a good practice.
  ///
  /// See: [AnimatedBuilder.child]
  final Widget? child;

  @override
  State<StatusTransitionBuilder> createState() =>
      _StatusTransitionBuilderState();
}

class _StatusTransitionBuilderState extends State<StatusTransitionBuilder> {
  @override
  void initState() {
    super.initState();
    widget.animation.addStatusListener(_animationStatusChanged);
  }

  @override
  void didUpdateWidget(StatusTransitionBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animation != oldWidget.animation) {
      oldWidget.animation.removeStatusListener(_animationStatusChanged);
      widget.animation.addStatusListener(_animationStatusChanged);
    }
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_animationStatusChanged);
    super.dispose();
  }

  void _animationStatusChanged(AnimationStatus status) {
    setState(() {
      // The animation's state is our build state, and it changed already.
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}

// /// Widget that listens to an animation, and rebuilds when the animation changes
// /// [AnimationStatus].
// ///
// /// This can be more efficient than just using an [AnimatedBuilder] when you
// /// only need to rebuild when the [Animation.status] changes, since
// /// [AnimatedBuilder] rebuilds every time the animation ticks.
// class StatusTransitionWidgetBuilder extends StatusTransitionWidget {
//   /// Creates a widget that rebuilds when the given animation changes status.
//   const StatusTransitionWidgetBuilder({
//     super.key,
//     required super.animation,
//     required this.builder,
//     this.child,
//   });

//   /// Called every time the [animation] changes [AnimationStatus].
//   final TransitionBuilder builder;

//   /// The child widget to pass to the [builder].
//   ///
//   /// If a [builder] callback's return value contains a subtree that does not
//   /// depend on the animation, it's more efficient to build that subtree once
//   /// instead of rebuilding it on every animation status change.
//   ///
//   /// Using this pre-built child is entirely optional, but can improve
//   /// performance in some cases and is therefore a good practice.
//   ///
//   /// See: [AnimatedBuilder.child]
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) => builder(context, child);
// }
