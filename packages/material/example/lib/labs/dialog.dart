import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

// DualTransitionBuilder? _a;

// CurvedAnimation? _b;

typedef Selector<T extends Object?> =
    T Function(
      AnimationStatus status,
      Animation<double> forwardAnimation,
      Animation<double> reverseAnimation,
    );

typedef DirectionalSelector<T extends Object?> =
    T Function(AnimationStatus status, Animation<double> animation);

class SelectorAnimation<T extends Object?> extends DualAnimationBase<T> {
  SelectorAnimation({required super.parent, required this.selector});

  final Selector<T> selector;

  @override
  T get value =>
      selector(_effectiveAnimationStatus, forwardAnimation, reverseAnimation);

  // static Selector<T> directionalSelector<T extends Object?>() {
  //   return
  // }
  // static Selector<T> directionalSelector<T extends Object?>(
  //   DirectionalSelector<T> selector,
  // ) {
  //   return (status, forwardAnimation, reverseAnimation) {
  //     final Animation<double> animation = switch (status) {
  //       AnimationStatus.dismissed ||
  //       AnimationStatus.forward => forwardAnimation,
  //       AnimationStatus.completed ||
  //       AnimationStatus.reverse => reverseAnimation,
  //     };
  //     return selector(status, animation);
  //   };
  // }
  static Selector<double> passthrough() {
    return (status, forwardAnimation, reverseAnimation) => switch (status) {
      AnimationStatus.dismissed ||
      AnimationStatus.forward => forwardAnimation.value,
      AnimationStatus.completed ||
      AnimationStatus.reverse => reverseAnimation.value,
    };
  }

  static Selector<T> directional<T extends Object?>({
    required T Function(Animation<double> animation) forward,
    required T Function(Animation<double> animation) reverse,
  }) {
    return (status, forwardAnimation, reverseAnimation) => switch (status) {
      AnimationStatus.dismissed ||
      AnimationStatus.forward => forward(forwardAnimation),
      AnimationStatus.completed ||
      AnimationStatus.reverse => reverse(reverseAnimation),
    };
  }
}

abstract class DualAnimationBase<T extends Object?> extends Animation<T>
    with AnimationWithParentMixin<double> {
  DualAnimationBase({required Animation<double> parent}) : _parent = parent {
    _effectiveAnimationStatus = parent.status;
    parent.addStatusListener(_statusListener);
    _updateAnimations();
  }

  Animation<double> _parent;

  @override
  Animation<double> get parent => _parent;

  set parent(Animation<double> value) {
    if (_parent == value) return;
    _parent.removeStatusListener(_statusListener);
    _parent = value;
    _effectiveAnimationStatus = _calculateEffectiveAnimationStatus(
      _effectiveAnimationStatus,
      _parent.status,
    );
    _parent.addStatusListener(_statusListener);
    _updateAnimations();
  }

  late AnimationStatus _effectiveAnimationStatus;
  final ProxyAnimation _forwardAnimation = ProxyAnimation();
  final ProxyAnimation _reverseAnimation = ProxyAnimation();

  Animation<double> get forwardAnimation => _forwardAnimation;
  Animation<double> get reverseAnimation => _reverseAnimation;

  void dispose() {
    parent.removeStatusListener(_statusListener);
  }

  void _statusListener(AnimationStatus status) {
    final oldEffective = _effectiveAnimationStatus;
    _effectiveAnimationStatus = _calculateEffectiveAnimationStatus(
      _effectiveAnimationStatus,
      status,
    );
    if (oldEffective != _effectiveAnimationStatus) {
      _updateAnimations();
    }
  }

  AnimationStatus _calculateEffectiveAnimationStatus(
    AnimationStatus previous,
    AnimationStatus current,
  ) {
    // TODO: investigate if this was rewritten correctly
    // return switch ((previous, current)) {
    //   (_, AnimationStatus.dismissed || AnimationStatus.completed) => current,
    //   (
    //     AnimationStatus.dismissed ||
    //         AnimationStatus.completed ||
    //         AnimationStatus.forward,
    //     AnimationStatus.forward,
    //   ) =>
    //     current,
    //   (AnimationStatus.reverse, AnimationStatus.forward) => previous,
    //   (
    //     AnimationStatus.dismissed ||
    //         AnimationStatus.completed ||
    //         AnimationStatus.reverse,
    //     AnimationStatus.reverse,
    //   ) =>
    //     current,
    //   (AnimationStatus.forward, AnimationStatus.reverse) => previous,
    // };
    switch (current) {
      case AnimationStatus.dismissed:
      case AnimationStatus.completed:
        return current;
      case AnimationStatus.forward:
        switch (previous) {
          case AnimationStatus.dismissed:
          case AnimationStatus.completed:
          case AnimationStatus.forward:
            return current;
          case AnimationStatus.reverse:
            return previous;
        }
      case AnimationStatus.reverse:
        switch (previous) {
          case AnimationStatus.dismissed:
          case AnimationStatus.completed:
          case AnimationStatus.reverse:
            return current;
          case AnimationStatus.forward:
            return previous;
        }
    }
  }

  void _updateAnimations() {
    switch (_effectiveAnimationStatus) {
      case AnimationStatus.dismissed:
      case AnimationStatus.forward:
        _forwardAnimation.parent = parent;
        _reverseAnimation.parent = kAlwaysDismissedAnimation;
      case AnimationStatus.reverse:
      case AnimationStatus.completed:
        _forwardAnimation.parent = kAlwaysCompleteAnimation;
        _reverseAnimation.parent = ReverseAnimation(parent);
    }
  }
}

class BasicDialogRoute<T extends Object?> extends PopupRoute<T> {
  BasicDialogRoute({
    required this.themes,
    required this.builder,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    super.requestFocus,
    super.settings,
  });

  final CapturedThemes themes;
  final WidgetBuilder builder;

  @override
  final Color? barrierColor;

  @override
  final bool barrierDismissible;

  @override
  final String? barrierLabel;

  @override
  Duration get transitionDuration => Durations.long2;
  @override
  Duration get reverseTransitionDuration => Durations.short3;

  @override
  void install() {
    super.install();
  }

  @override
  void dispose() {
    _containerShape.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }

  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  final Tween<ShapeBorder?> _shapeEnterTween = ShapeBorderTween();
  final Tween<ShapeBorder?> _shapeExitTween = ShapeBorderTween();

  late final SelectorAnimation<ShapeBorder?> _containerShape =
      SelectorAnimation(
        parent: kAlwaysDismissedAnimation,
        selector: SelectorAnimation.directional(
          forward: _shapeEnterTween.evaluate,
          reverse: _shapeExitTween.evaluate,
        ),
      );

  final _containerOffsetTween = Tween<Offset>(
    begin: Offset(0, -50),
    end: Offset.zero,
  );
  late Animation<Offset> _containerOffset;

  void _didChangeState(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    if (_curvedAnimation.parent != animation) {
      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Easing.emphasizedDecelerate,
        reverseCurve: Easing.emphasizedAccelerate.flipped,
      );
      _containerOffset = _containerOffsetTween.animate(_curvedAnimation);
    }
    if (_containerShape.parent != _curvedAnimation) {
      _containerShape.parent = _curvedAnimation;
    }
    final shapeTheme = ShapeTheme.of(context);
    final ShapeBorder shape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      corners: Corners.all(shapeTheme.corner.extraLarge),
    );
    _shapeEnterTween.begin = CroppedBorder.align(
      shape: shape,
      alignment: Alignment.topCenter,
      heightFactor: 0,
    );
    _shapeEnterTween.end = shape;
    _shapeExitTween.begin = shape;
    _shapeExitTween.end = CroppedBorder.align(
      shape: shape,
      alignment: Alignment.topCenter,
      heightFactor: 0.35,
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    _didChangeState(context, animation, secondaryAnimation);
    return BasicDialogScope(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      containerOpacity: animation,
      containerOffset: _containerOffset,
      containerShape: _containerShape,
      child: child,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    Widget child = Builder(builder: builder);
    child = themes.wrap(child);
    child = SafeArea(child: child);
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: DisplayFeatureSubScreen(
        // TODO implement anchorPoint
        anchorPoint: Offset.zero,
        child: child,
      ),
    );
  }
}

Future<T?> showBasicDialog<T extends Object?>({
  bool useRootNavigator = true,
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  final themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(context, rootNavigator: useRootNavigator).context,
  );

  final colorTheme = ColorTheme.of(context);
  final barrierColor = colorTheme.scrim.withValues(alpha: 0.52);

  final navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  final route = BasicDialogRoute<T>(
    themes: themes,
    builder: builder,
    barrierColor: barrierColor,
  );
  return navigator.push(route);
}

enum _BasicDialogScopeAspect {
  animation,
  secondaryAnimation,
  containerOpacity,
  containerOffset,
  containerShape,
}

class BasicDialogScope extends InheritedModel<_BasicDialogScopeAspect> {
  const BasicDialogScope({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.containerOpacity,
    required this.containerOffset,
    required this.containerShape,
    required super.child,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;

  final Animation<double> containerOpacity;
  final Animation<Offset> containerOffset;
  final Animation<ShapeBorder?> containerShape;

  @override
  bool updateShouldNotify(covariant BasicDialogScope oldWidget) {
    return animation != oldWidget.animation ||
        secondaryAnimation != oldWidget.secondaryAnimation ||
        containerOpacity != oldWidget.containerOpacity ||
        containerOffset != oldWidget.containerOffset ||
        containerShape != oldWidget.containerShape;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant BasicDialogScope oldWidget,
    Set<Object> dependencies,
  ) => dependencies.any(
    (dependency) =>
        dependency is _BasicDialogScopeAspect &&
        switch (dependency) {
          _BasicDialogScopeAspect.animation => animation != oldWidget.animation,
          _BasicDialogScopeAspect.secondaryAnimation =>
            secondaryAnimation != oldWidget.secondaryAnimation,
          _BasicDialogScopeAspect.containerOpacity =>
            containerOpacity != oldWidget.containerOpacity,
          _BasicDialogScopeAspect.containerOffset =>
            containerOffset != oldWidget.containerOffset,
          _BasicDialogScopeAspect.containerShape =>
            containerShape != oldWidget.containerShape,
        },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("containerOpacity", containerOpacity));
    properties.add(DiagnosticsProperty("containerShape", containerShape));
  }

  static BasicDialogScope? _maybeOf(
    BuildContext context, [
    _BasicDialogScopeAspect? aspect,
  ]) => context.dependOnInheritedWidgetOfExactType<BasicDialogScope>(
    aspect: aspect,
  );

  static BasicDialogScope _of(
    BuildContext context, [
    _BasicDialogScopeAspect? aspect,
  ]) {
    final result = _maybeOf(context);
    assert(result != null);
    return result!;
  }

  static BasicDialogScope? maybeOf(BuildContext context) => _maybeOf(context);
  static BasicDialogScope of(BuildContext context) => _of(context);

  static Animation<double>? maybeAnimationOf(BuildContext context) =>
      _maybeOf(context, _BasicDialogScopeAspect.animation)?.animation;
  static Animation<double> animationOf(BuildContext context) =>
      _of(context, _BasicDialogScopeAspect.animation).animation;

  static Animation<double>? maybeSecondaryAnimationOf(BuildContext context) =>
      _maybeOf(
        context,
        _BasicDialogScopeAspect.secondaryAnimation,
      )?.secondaryAnimation;
  static Animation<double> secondaryAnimationOf(BuildContext context) =>
      _of(
        context,
        _BasicDialogScopeAspect.secondaryAnimation,
      ).secondaryAnimation;

  static Animation<double>? maybeContainerOpacityOf(BuildContext context) =>
      _maybeOf(
        context,
        _BasicDialogScopeAspect.containerOpacity,
      )?.containerOpacity;

  static Animation<double> containerOpacityOf(BuildContext context) =>
      _of(context, _BasicDialogScopeAspect.containerOpacity).containerOpacity;

  static Animation<Offset>? maybeContainerOffsetOf(BuildContext context) =>
      _maybeOf(
        context,
        _BasicDialogScopeAspect.containerOffset,
      )?.containerOffset;

  static Animation<Offset> containerOffsetOf(BuildContext context) =>
      _of(context, _BasicDialogScopeAspect.containerOffset).containerOffset;

  static Animation<ShapeBorder?>? maybeContainerShapeOf(BuildContext context) =>
      _maybeOf(context, _BasicDialogScopeAspect.containerShape)?.containerShape;

  static Animation<ShapeBorder?> containerShapeOf(BuildContext context) =>
      _of(context, _BasicDialogScopeAspect.containerShape).containerShape;
}

class BasicDialog extends StatefulWidget {
  const BasicDialog({super.key, this.icon, this.headline, this.actions});

  final Widget? icon;
  final Widget? headline;
  final List<Widget>? actions;

  @override
  State<BasicDialog> createState() => _BasicDialogState();
}

class _BasicDialogState extends State<BasicDialog> {
  late ColorThemeData _color;
  late ShapeThemeData _shape;
  late MotionThemeData _motion;
  late ElevationThemeData _elevation;
  late StateThemeData _state;
  late TextTheme _text;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _color = ColorTheme.of(context);
    _shape = ShapeTheme.of(context);
    _motion = MotionTheme.of(context);
    _elevation = ElevationTheme.of(context);
    _state = StateTheme.of(context);
    _text = TextTheme.of(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildHeadline(BuildContext context, Widget child) {
    return DefaultTextStyle.merge(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: _text.headlineSmall!.copyWith(color: _color.onSurface),
      child: child,
    );
  }

  Widget _buildActions(BuildContext context, List<Widget> children) {
    return OverflowBar(
      alignment: MainAxisAlignment.end,
      overflowAlignment: OverflowBarAlignment.end,
      overflowDirection: VerticalDirection.down,
      spacing: 0,
      overflowSpacing: 0,
      children: children,
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    final containerShape = BasicDialogScope.maybeContainerShapeOf(context);
    if (containerShape != null) {
      final animation = BasicDialogScope.animationOf(context);
      return AnimatedBuilder(
        animation: animation,
        child: child,
        builder:
            (context, child) => Material(
              animationDuration: Duration.zero,
              clipBehavior: Clip.antiAlias,
              type: MaterialType.card,
              color: _color.surfaceContainerHigh,
              shape: containerShape.value,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: _elevation.level3,
              child: child!,
            ),
      );
    }
    return const Placeholder();
  }

  Widget _buildContainerOffset(BuildContext context, Widget child) {
    final containerOffset = BasicDialogScope.maybeContainerOffsetOf(context);
    if (containerOffset == null) return child;
    return AnimatedBuilder(
      animation: containerOffset,
      child: child,
      builder:
          (context, child) => Transform.translate(
            offset: containerOffset.value,
            filterQuality: FilterQuality.low,
            child: child!,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shape = CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.extraLarge),
    );
    return Align.center(
      child: _buildContainerOffset(
        context,
        _buildContainer(
          context,
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 280, maxWidth: 560),
            child: IntrinsicWidth(
              child: Flex.vertical(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.headline case final headline?)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: _buildHeadline(context, headline),
                    ),
                  if (widget.actions case final actions?)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: _buildActions(context, actions),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
