import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material3_expressive_example/implicit_animation.dart';
import 'package:material3_expressive_example/hit_testing.dart';

enum ButtonSize { extraSmall, small, medium, large, extraLarge }

enum ButtonVariant { filled, tonal, elevated, text, outlined }

ButtonStyleButton? _buttonStyleButton;

class Button extends StatefulWidget {
  const Button({super.key, this.icon, required this.label});

  final Widget? icon;
  final Widget label;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final GlobalKey _targetKey = GlobalKey();

  Widget _buildLabel(BuildContext context) {
    return widget.label;
  }

  Widget _buildChild(BuildContext context) {
    return _ButtonChild(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      spacing: 8.0,
      icon: widget.icon,
      label: widget.label,
    );
  }

  Widget _buildContainer(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    // return KeyedSubtree(
    //   key: _targetKey,
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(minWidth: 48.0),
    //     child: Material(
    //       animationDuration: Duration.zero,
    //       clipBehavior: Clip.antiAlias,
    //       elevation: 0.0,
    //       shape: CornersBorder(
    //         delegate: const RoundedCornersBorderDelegate(),
    //         corners: Corners.all(shapeTheme.full),
    //       ),
    //       color: colorTheme.primary,
    //       child: InkWell(onTap: () {}, child: child),
    //     ),
    //   ),
    // );
    return KeyedSubtree(
      key: _targetKey,
      child: _ButtonContainer(child: child),
    );
  }

  Widget _buildTouchTarget(Widget child) {
    const minSize = Size.square(48.0);
    final constraints = BoxConstraints(
      minWidth: minSize.width,
      minHeight: minSize.height,
    );
    return ConstrainedBox(
      constraints: constraints,
      child: ForwardHitTests(
        descendantKey: _targetKey,
        child: Align(
          alignment: Alignment.center,
          // TODO: should specify the following here?
          // widthFactor: 1.0,
          // heightFactor: 1.0,
          child: child,
        ),
      ),
    );
  }

  Widget _buildSemantics(Widget child) {
    return Semantics(
      container: true,
      button: true,
      enabled: true,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = _buildChild(context);
    final Widget container = _buildContainer(context, child);
    final Widget touchTarget = _buildTouchTarget(container);
    final Widget semantics = _buildSemantics(touchTarget);
    return semantics;
  }
}

class _ButtonContainer extends StatefulWidget {
  const _ButtonContainer({super.key, required this.child});

  final Widget child;

  @override
  State<_ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<_ButtonContainer>
    with TickerProviderStateMixin {
  late ShapeThemeData _shapeTheme;
  late EasingThemeData _easingTheme;
  late DurationThemeData _durationTheme;
  late SpringThemeData _springTheme;

  late WidgetStatesController _statesController;
  Set<WidgetState> get _states => _statesController.value;

  late SpringImplicitAnimation<ShapeBorder?> _shapeAnimation;

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController()..addListener(_statesListener);
    _shapeAnimation = SpringImplicitAnimation(
      vsync: this,
      spring: const SpringDescription(mass: 1, stiffness: 1, damping: 1),
      initialValue: null,
      builder: (value) => ShapeBorderTween(begin: value),
    );
  }

  @override
  void didUpdateWidget(covariant _ButtonContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shapeTheme = ShapeTheme.of(context);
    _easingTheme = EasingTheme.of(context);
    _durationTheme = DurationTheme.of(context);
    _springTheme = SpringTheme.of(context);
    _shapeAnimation.spring = _springTheme.fastSpatial.toSpringDescription();
  }

  @override
  void dispose() {
    _shapeAnimation.dispose();
    _statesController.dispose();
    super.dispose();
  }

  void _statesListener() {
    setState(() {});
  }

  WidgetStateProperty<ShapeBorder?> get _shape =>
      WidgetStateProperty.resolveWith((states) {
        Corner corner;
        if (states.contains(WidgetState.pressed)) {
          corner = _shapeTheme.small;
        } else {
          corner = _shapeTheme.full;
        }
        return CornersBorder(
          delegate: const RoundedCornersBorderDelegate(),
          corners: Corners.all(corner),
        );
      });

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    _shapeAnimation.targetValue = _shape.resolve(_states);

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 48.0),
      child: AnimatedBuilder(
        animation: _shapeAnimation,
        child: InkWell(
          onTap: () {},
          statesController: _statesController,
          overlayColor: StateLayerColor(
            color: WidgetStatePropertyAll(colorTheme.onPrimary),
            opacity: StateLayerOpacity.of(context),
          ),
          child: widget.child,
        ),
        builder: (context, child) {
          return Material(
            animationDuration: Duration.zero,
            clipBehavior: Clip.antiAlias,
            shape: _shapeAnimation.value,
            color: colorTheme.primary,
            child: DefaultTextStyle(
              style: TypescaleTheme.of(
                context,
              ).labelLarge.toTextStyle().copyWith(color: colorTheme.onPrimary),
              child: child!,
            ),
          );
        },
      ),
    );
  }
}

class _ButtonChild extends StatelessWidget {
  const _ButtonChild({
    super.key,
    this.padding = EdgeInsets.zero,
    this.spacing = 0.0,
    this.icon,
    this.label,
  });

  final EdgeInsetsGeometry padding;
  final double spacing;
  final Widget? icon;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.maybeOf(context) ?? TextDirection.ltr;
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: spacing,
        children: switch (textDirection) {
          TextDirection.ltr => [?icon, ?label],
          TextDirection.rtl => [?label, ?icon],
        },
      ),
    );
  }
}
