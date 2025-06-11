import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Icon, IconTheme, IconThemeData;
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material_theme_builder/hit_testing.dart';
import 'package:material_theme_builder/implicit_animation.dart';

enum ButtonSize { extraSmall, small, medium, large, extraLarge }

enum ButtonShape { round, square }

enum ButtonColor { elevated, filled, tonal, outlined, text }

enum ToggleButtonColor { elevated, filled, tonal, outlined }

ButtonStyleButton? _buttonStyleButton;

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.size = ButtonSize.small,
    this.shape = ButtonShape.round,
    this.color = ButtonColor.filled,
    required this.onTap,
    this.icon,
    required this.label,
  });

  final ButtonSize size;
  final ButtonShape shape;
  final ButtonColor color;

  final VoidCallback? onTap;

  final Widget? icon;
  final Widget label;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();

  late ColorThemeData _colorTheme;
  late ShapeThemeData _shapeTheme;
  late StateThemeData _stateTheme;
  late ElevationThemeData _elevationTheme;
  late TypescaleThemeData _typescaleTheme;
  late EasingThemeData _easingTheme;
  late SpringThemeData _springTheme;

  late WidgetStatesController _statesController;
  bool _isClicked = false;
  Set<WidgetState> get _states => UnmodifiableSetView(_statesController.value);
  Set<WidgetState> _statesWithClicked = {};

  CurveImplicitAnimation<double?>? _elevationAnimation;
  SpringImplicitAnimation<ShapeBorder?>? _shapeAnimation;

  @override
  void initState() {
    super.initState();
    final enabled = widget.onTap != null;
    _statesController = WidgetStatesController()
      ..update(WidgetState.disabled, !enabled)
      ..addListener(_statesListener);
  }

  @override
  void didUpdateWidget(covariant Button oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorTheme = ColorTheme.of(context);
    _shapeTheme = ShapeTheme.of(context);
    _stateTheme = StateTheme.of(context);
    _elevationTheme = ElevationTheme.of(context);
    _typescaleTheme = TypescaleTheme.of(context);
    _easingTheme = EasingTheme.of(context);
    _springTheme = SpringTheme.of(context);

    if (_elevationAnimation case final elevationAnimation?) {
    } else {
      _elevationAnimation = CurveImplicitAnimation(
        vsync: this,
        duration: const Duration(milliseconds: 120),
        curve: Curves.fastOutSlowIn,
        initialValue: null,
        builder: (value) => Tween<double>(begin: value),
      );
    }

    final spring = _springTheme.fastSpatial;
    if (_shapeAnimation case final shape?) {
      shape.spring = spring.toSpringDescription();
    } else {
      _shapeAnimation = SpringImplicitAnimation(
        vsync: this,
        spring: spring.toSpringDescription(),
        initialValue: null,
        builder: (value) => ShapeBorderTween(begin: value),
      );
    }
  }

  @override
  void dispose() {
    _statesController.dispose();
    _shapeAnimation?.dispose();
    super.dispose();
  }

  void _statesListener() {
    setState(() {});
  }

  WidgetStateProperty<Color> get _backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          // The disabled opacity token changed from 0.12 to 0.1
          return _colorTheme.onSurface.withValues(alpha: 0.1);
        }
        return switch (widget.color) {
          ButtonColor.elevated => _colorTheme.surfaceContainerLow,
          ButtonColor.filled => _colorTheme.primary,
          ButtonColor.tonal => _colorTheme.secondaryContainer,
          ButtonColor.outlined => Colors.transparent,
          ButtonColor.text => Colors.transparent,
        };
      });

  WidgetStateProperty<Color> get _foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.38);
        }
        return switch (widget.color) {
          ButtonColor.elevated => _colorTheme.primary,
          ButtonColor.filled => _colorTheme.onPrimary,
          ButtonColor.tonal => _colorTheme.onSecondaryContainer,
          ButtonColor.outlined => _colorTheme.onSurfaceVariant,
          ButtonColor.text => _colorTheme.primary,
        };
      });

  WidgetStateProperty<Color?> get _overlayColor => StateLayerColor(
    color: _foregroundColor,
    opacity: StateLayerOpacity.fromStateTheme(_stateTheme),
  );

  WidgetStateProperty<Color> get _shadowColor =>
      WidgetStatePropertyAll(_colorTheme.shadow);

  WidgetStateProperty<double> get _elevation =>
      WidgetStateProperty.resolveWith((states) {
        if (widget.color != ButtonColor.elevated) {
          return _elevationTheme.level0;
        }
        if (states.contains(WidgetState.disabled)) {
          return _elevationTheme.level0;
        }
        if (states.contains(WidgetState.pressed)) {
          return _elevationTheme.level1;
        }
        if (states.contains(WidgetState.focused)) {
          return _elevationTheme.level1;
        }
        if (states.contains(WidgetState.hovered)) {
          return _elevationTheme.level2;
        }
        return _elevationTheme.level1;
      });

  WidgetStateProperty<BorderSide> get _side =>
      WidgetStateProperty.resolveWith((states) {
        if (widget.color != ButtonColor.outlined) return BorderSide.none;
        final strokeWidth = switch (widget.size) {
          ButtonSize.extraSmall => 1.0,
          ButtonSize.small => 1.0,
          ButtonSize.medium => 1.0,
          ButtonSize.large => 2.0,
          ButtonSize.extraLarge => 3.0,
        };
        final color = _colorTheme.outlineVariant;
        return BorderSide(
          style: BorderStyle.solid,
          color: color,
          width: strokeWidth,
          strokeAlign: BorderSide.strokeAlignInside,
        );
      });

  WidgetStateProperty<ShapeBorder> get _shape =>
      WidgetStateProperty.resolveWith((states) {
        final pressedCorner = switch (widget.size) {
          ButtonSize.extraSmall => _shapeTheme.small,
          ButtonSize.small => _shapeTheme.small,
          ButtonSize.medium => _shapeTheme.medium,
          ButtonSize.large => _shapeTheme.large,
          ButtonSize.extraLarge => _shapeTheme.large,
        };
        final roundCorner = _shapeTheme.full;
        final squareCorner = switch (widget.size) {
          ButtonSize.extraSmall => _shapeTheme.medium,
          ButtonSize.small => _shapeTheme.medium,
          ButtonSize.medium => _shapeTheme.large,
          ButtonSize.large => _shapeTheme.extraLarge,
          ButtonSize.extraLarge => _shapeTheme.extraLarge,
        };
        final defaultCorner = switch (widget.shape) {
          ButtonShape.round => roundCorner,
          ButtonShape.square => squareCorner,
        };

        final Corner corner;

        if (states.contains(WidgetState.disabled)) {
          corner = defaultCorner;
        } else if (states.contains(WidgetState.pressed)) {
          corner = pressedCorner;
        } else {
          corner = defaultCorner;
        }
        return CornersBorder.rounded(
          corners: Corners.all(corner),
          side: _side.resolve(states),
        );
      });

  WidgetStateProperty<IconThemeDataPartial> get _iconTheme =>
      WidgetStateProperty.resolveWith((states) {
        final color = _foregroundColor.resolve(states);
        final size = switch (widget.size) {
          ButtonSize.extraSmall => 20.0,
          ButtonSize.small => 20.0,
          ButtonSize.medium => 24.0,
          ButtonSize.large => 32.0,
          ButtonSize.extraLarge => 40.0,
        };
        return IconThemeDataPartial(color: color, size: size, opsz: size);
      });

  WidgetStateProperty<TextStyle> get _labelTextStyle =>
      WidgetStateProperty.resolveWith((states) {
        final color = _foregroundColor.resolve(states);
        final typeStyle = switch (widget.size) {
          ButtonSize.extraSmall => _typescaleTheme.labelLarge,
          ButtonSize.small => _typescaleTheme.labelLarge,
          ButtonSize.medium => _typescaleTheme.titleMedium,
          ButtonSize.large => _typescaleTheme.headlineSmall,
          ButtonSize.extraLarge => _typescaleTheme.headlineLarge,
        };
        return typeStyle.toTextStyle().copyWith(color: color);
      });

  WidgetStateProperty<BoxConstraints> get _tapTargetConstraints =>
      WidgetStatePropertyAll(BoxConstraints(minWidth: 48.0, minHeight: 48.0));

  WidgetStateProperty<BoxConstraints> get _containerConstraints =>
      WidgetStateProperty.resolveWith((states) {
        final tapTargetConstraints = _tapTargetConstraints.resolve(states);
        final minHeight = switch (widget.size) {
          ButtonSize.extraSmall => 32.0,
          ButtonSize.small => 40.0,
          ButtonSize.medium => 56.0,
          ButtonSize.large => 96.0,
          ButtonSize.extraLarge => 136.0,
        };
        return BoxConstraints(
          minWidth: tapTargetConstraints.minWidth,
          minHeight: minHeight,
        );
      });
  WidgetStateProperty<double> get _spacing =>
      WidgetStateProperty.resolveWith((states) {
        return switch (widget.size) {
          ButtonSize.extraSmall => 8.0,
          ButtonSize.small => 8.0,
          ButtonSize.medium => 8.0,
          ButtonSize.large => 12.0,
          ButtonSize.extraLarge => 16.0,
        };
      });
  WidgetStateProperty<EdgeInsetsGeometry> get _padding =>
      WidgetStateProperty.resolveWith((states) {
        return switch (widget.size) {
          ButtonSize.extraSmall => const EdgeInsets.fromLTRB(
            12.0,
            6.0,
            12.0,
            6.0,
          ),
          ButtonSize.small => const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
          ButtonSize.medium => const EdgeInsets.fromLTRB(
            24.0,
            16.0,
            24.0,
            16.0,
          ),
          ButtonSize.large => const EdgeInsets.fromLTRB(48.0, 32.0, 48.0, 32.0),
          ButtonSize.extraLarge => const EdgeInsets.fromLTRB(
            64.0,
            48.0,
            64.0,
            48.0,
          ),
        };
      });

  ShapeBorder? _resolveShape() {
    final states = Set.of(_statesController.value);
    if (_isClicked) {
      states.add(WidgetState.pressed);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _isClicked = false);
      });
    }
    return _shape.resolve(states);
  }

  void _updateStatesWithClicked() {
    final statesWithClicked = Set.of(_states);
    if (_isClicked) {
      statesWithClicked.add(WidgetState.pressed);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _isClicked = false);
      });
    }
    _statesWithClicked = UnmodifiableSetView(statesWithClicked);
  }

  @override
  Widget build(BuildContext context) {
    _updateStatesWithClicked();

    final tapTargetConstraints = _tapTargetConstraints.resolve(_states);
    final containerConstraints = _containerConstraints.resolve(_states);
    final backgroundColor = _backgroundColor.resolve(_states);
    final shape = _shape.resolve(_statesWithClicked);
    final elevation = _elevation.resolve(_states);
    assert(_elevationAnimation != null);
    final elevationAnimation = _elevationAnimation!;
    elevationAnimation.targetValue = elevation;
    assert(_shapeAnimation != null);
    final shapeAnimation = _shapeAnimation!;
    shapeAnimation.targetValue = shape;

    final Widget child = Padding(
      padding: _padding.resolve(_states),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: _spacing.resolve(_states),
        children: [
          if (widget.icon case final icon?)
            IconTheme.merge(data: _iconTheme.resolve(_states), child: icon),
          DefaultTextStyle(
            style: _labelTextStyle.resolve(_states),
            child: widget.label,
          ),
        ],
      ),
    );
    final Widget container = ConstrainedBox(
      key: _containerKey,
      constraints: containerConstraints,
      child: AnimatedBuilder(
        animation: AnimationMean(
          left: shapeAnimation.animation,
          right: elevationAnimation.animation,
        ),
        child: InkWell(
          statesController: _statesController,
          onTap: widget.onTap != null
              ? () {
                  setState(() => _isClicked = true);
                  widget.onTap!();
                }
              : null,
          overlayColor: _overlayColor,
          child: child,
        ),
        builder: (context, child) => Material(
          animationDuration: Duration.zero,
          type: MaterialType.card,
          clipBehavior: Clip.antiAlias,
          shape: shapeAnimation.value ?? shape,
          color: backgroundColor,
          shadowColor: _shadowColor.resolve(_states),
          elevation: elevationAnimation.value ?? elevation,
          child: child!,
        ),
      ),
    );
    // final Widget tapTarget = ConstrainedBox(
    //   constraints: tapTargetConstraints,
    //   child: ForwardHitTests(
    //     descendantKey: _containerKey,

    //     child: container,
    //     // child: Align(
    //     //   alignment: Alignment.center,
    //     //   widthFactor: 1.0,
    //     //   heightFactor: 1.0,
    //     //   child: container,
    //     // ),
    //   ),
    // );
    final Widget tapTarget = TapTarget(
      descendantKey: _containerKey,
      alignment: Alignment.center,
      constraints: tapTargetConstraints,
      child: container,
    );
    return Semantics(
      container: true,
      button: true,
      enabled: true,
      child: tapTarget,
    );
  }
}

class MaterialButtonStyle {}

abstract class MultiAnimatedWidget extends StatefulWidget {
  const MultiAnimatedWidget({super.key, this.listenables = const []});

  final List<Listenable> listenables;

  @protected
  Widget build(BuildContext context);

  @override
  State<MultiAnimatedWidget> createState() => _MultiAnimatedWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<List<Listenable>>("listenables", listenables),
    );
  }
}

class _MultiAnimatedWidgetState extends State<MultiAnimatedWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MultiAnimatedWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _listener() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
