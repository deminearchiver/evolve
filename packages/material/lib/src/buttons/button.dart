import 'package:material/material.dart';

enum ButtonVariant { elevated, filled, filledTonal, outlined, text }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.variant,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       child = null;

  const Button.elevated({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       variant = ButtonVariant.elevated,
       child = null;
  const Button.filled({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       variant = ButtonVariant.filled,
       child = null;
  const Button.filledTonal({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       variant = ButtonVariant.filledTonal,
       child = null;
  const Button.outlined({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       variant = ButtonVariant.outlined,
       child = null;
  const Button.text({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    this.icon,
    required this.label,
  }) : assert(
         icon != null || label != null,
         "At least icon or label must be provided",
       ),
       variant = ButtonVariant.text,
       child = null;

  const Button.custom({
    super.key,
    required this.variant,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.tooltip,
    required Widget this.child,
  }) : icon = null,
       label = null;

  final ButtonVariant variant;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Called when a pointer enters or exits the button response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  ///
  /// Non-null properties of this style override the corresponding
  /// properties in [themeStyleOf] and [defaultStyleOf]. [WidgetStateProperty]s
  /// that resolve to non-null values will similarly override the corresponding
  /// [WidgetStateProperty]s in [themeStyleOf] and [defaultStyleOf].
  ///
  /// Null by default.
  final ButtonStyle? style;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none] unless [ButtonStyle.backgroundBuilder] or
  /// [ButtonStyle.foregroundBuilder] is specified. In those
  /// cases the default is [Clip.antiAlias].
  final Clip? clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.inkwell.statesController}
  final WidgetStatesController? statesController;

  /// Determine whether this subtree represents a button.
  ///
  /// If this is null, the screen reader will not announce "button" when this
  /// is focused. This is useful for [MenuItemButton] and [SubmenuButton] when we
  /// traverse the menu system.
  ///
  /// Defaults to true.
  final bool? isSemanticButton;

  /// Text that describes the action that will occur when the button is pressed or
  /// hovered over.
  ///
  /// This text is displayed when the user long-presses or hovers over the button
  /// in a tooltip. This string is also used for accessibility.
  ///
  /// If null, the button will not display a tooltip.
  final String? tooltip;

  final Widget? icon;
  final Widget? label;

  /// Typically the button's label.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  ButtonStyle? _resolveStyle() {
    final padding = _defaultPadding(
      variant: variant,
      iconAlignment: style?.iconAlignment ?? IconAlignment.start,
      hasIcon: icon != null,
      hasLabel: label != null,
    );
    final newStyle = ButtonStyle(padding: WidgetStatePropertyAll(padding));
    return style?.merge(newStyle) ?? newStyle;
  }

  Widget? _buildLabel() {
    return label != null
        ? DefaultTextStyle.merge(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          child: label!,
        )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = _resolveStyle();

    return _Button(
      variant: variant,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: resolvedStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isSemanticButton: isSemanticButton,
      tooltip: tooltip,
      child: ButtonChild(
        icon: icon,
        iconAlignment: resolvedStyle?.iconAlignment ?? IconAlignment.start,
        label: _buildLabel(),
      ),
    );
  }
}

class _Button extends ButtonStyleButton {
  const _Button({
    required this.variant,
    required super.onPressed,
    required super.onLongPress,
    required super.onHover,
    required super.onFocusChange,
    required super.style,
    required super.focusNode,
    required super.autofocus,
    required super.clipBehavior,
    required super.statesController,
    required super.isSemanticButton,
    required super.tooltip,
    required super.child,
  });

  final ButtonVariant variant;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return switch (variant) {
      ButtonVariant.elevated => _ElevatedButtonDefaults(context: context),
      ButtonVariant.filled => _FilledButtonDefaults(context: context),
      ButtonVariant.filledTonal => _FilledTonalButtonDefaults(context: context),
      ButtonVariant.outlined => _OutlinedButtonDefaults(context: context),
      ButtonVariant.text => _TextButtonDefaults(context: context),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    final ButtonStyle? style = switch (variant) {
      ButtonVariant.elevated => ElevatedButtonTheme.maybeOf(context)?.style,
      ButtonVariant.filled => FilledButtonTheme.maybeOf(context)?.style,
      ButtonVariant.filledTonal =>
        FilledTonalButtonTheme.maybeOf(context)?.style,
      ButtonVariant.outlined => OutlinedButtonTheme.maybeOf(context)?.style,
      ButtonVariant.text => TextButtonTheme.maybeOf(context)?.style,
    };
    return style;
  }
}

EdgeInsetsGeometry _defaultPadding({
  required ButtonVariant variant,
  required IconAlignment iconAlignment,
  required bool hasIcon,
  required bool hasLabel,
}) {
  switch (variant) {
    case ButtonVariant.elevated:
    case ButtonVariant.filled:
    case ButtonVariant.filledTonal:
    case ButtonVariant.outlined:
      if (hasIcon && hasLabel) {
        return switch (iconAlignment) {
          IconAlignment.start => const EdgeInsetsDirectional.only(
            start: 16.0,
            end: 24.0,
          ),
          IconAlignment.end => const EdgeInsetsDirectional.only(
            start: 24.0,
            end: 16.0,
          ),
        };
      }
      if (hasIcon) {
        return const EdgeInsetsDirectional.symmetric(horizontal: 8);
      }
      if (hasLabel) {
        return const EdgeInsetsDirectional.symmetric(horizontal: 24);
      }
      return EdgeInsetsDirectional.zero;
    case ButtonVariant.text:
      if (hasIcon && hasLabel) {
        return switch (iconAlignment) {
          IconAlignment.start => const EdgeInsetsDirectional.only(
            start: 12.0,
            end: 16.0,
          ),
          IconAlignment.end => const EdgeInsetsDirectional.only(
            start: 16.0,
            end: 12.0,
          ),
        };
      }
      if (hasIcon) {
        return const EdgeInsetsDirectional.symmetric(horizontal: 8);
      }
      if (hasLabel) {
        return const EdgeInsetsDirectional.symmetric(horizontal: 12);
      }
      return EdgeInsetsDirectional.zero;
  }
}

class ButtonChild extends StatelessWidget {
  const ButtonChild({
    super.key,
    this.icon,
    this.label,
    this.iconAlignment = IconAlignment.start,
  }) : assert((icon != null || label != null));

  final Widget? icon;
  final Widget? label;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    if (label != null && icon != null) {
      return _ButtonWithIconAndLabelChild(
        icon: icon!,
        iconAlignment: iconAlignment,
        label: label!,
      );
    }
    if (icon != null) return _ButtonWithIconChild(icon: icon!);
    return _ButtonWithLabelChild(label: label!);
  }
}

class _CustomButtonChildMarker extends InheritedWidget {
  const _CustomButtonChildMarker({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant _CustomButtonChildMarker oldWidget) {
    return false;
  }
}

class _ButtonWithIconChild extends StatelessWidget {
  const _ButtonWithIconChild({super.key, required this.icon});

  final Widget icon;

  Widget _buildContent(BuildContext context) {
    return IconTheme.merge(
      data: const IconThemeDataPartial(size: 24, opticalSize: 24),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isCustom = CommonButton._isCustomOf(context);
    // final child = _buildContent(context);
    // if (isCustom) {
    //   return Padding(
    //     padding: CommonButton._defaultPadding(hasIcon: true, hasLabel: false),
    //     child: child,
    //   );
    // }
    // return child;

    return _buildContent(context);
  }
}

class _ButtonWithLabelChild extends StatelessWidget {
  const _ButtonWithLabelChild({super.key, required this.label});

  final Widget label;

  Widget _buildContent(BuildContext context) {
    return label;
  }

  @override
  Widget build(BuildContext context) {
    // final isCustom = CommonButton._isCustomOf(context);
    // final child = _buildContent(context);
    // if (isCustom) {
    //   return Padding(
    //     padding: CommonButton._defaultPadding(hasIcon: false, hasLabel: true),
    //     child: child,
    //   );
    // }
    // return child;

    return _buildContent(context);
  }
}

class _ButtonWithIconAndLabelChild extends StatelessWidget {
  const _ButtonWithIconAndLabelChild({
    super.key,
    required this.icon,
    this.iconAlignment = IconAlignment.start,
    required this.label,
  });

  final Widget icon;
  final Widget label;
  final IconAlignment iconAlignment;

  Widget _buildContent(BuildContext context) {
    final wrappedIcon = IconTheme.merge(
      data: const IconThemeDataPartial(size: 18, opticalSize: 18, fill: 1),
      child: icon,
    );
    return Flex.horizontal(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      children: switch (iconAlignment) {
        IconAlignment.start => [wrappedIcon, Flexible(child: label)],
        IconAlignment.end => [Flexible(child: label), wrappedIcon],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isCustom = CommonButton._isCustomOf(context);
    // final child = _buildContent(context);
    // if (isCustom) {
    //   return Padding(
    //     padding: _defaultPadding(
    //       variant: variant,
    //       hasIcon: true,
    //       hasLabel: true,
    //     ),
    //     child: child,
    //   );
    // }
    // return child;

    return _buildContent(context);
  }
}

class _ButtonDefaultsBase extends ButtonStyle implements _DefaultsContext {
  const _ButtonDefaultsBase({required this.context})
    : super(
        animationDuration: kThemeChangeDuration,
        iconAlignment: IconAlignment.start,
        enableFeedback: true,
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.standard,
      );

  @override
  final BuildContext context;
}

abstract interface class _DefaultsContext implements ButtonStyle {
  BuildContext get context;
}

mixin _DefaultsColorTheme on ButtonStyle implements _DefaultsContext {
  late final ColorThemeData _color = ColorTheme.of(context);
}
mixin _DefaultsElevationTheme on ButtonStyle implements _DefaultsContext {
  late final ElevationThemeData _elevation = ElevationTheme.of(context);
}

mixin _DefaultsStateTheme on ButtonStyle implements _DefaultsContext {
  late final StateThemeData _state = StateTheme.of(context);
}

mixin _DefaultsTypescaleTheme on ButtonStyle implements _DefaultsContext {
  late final TextTheme _typescale = Theme.of(context).textTheme;
}
mixin _DefaultsShapeTheme on ButtonStyle implements _DefaultsContext {
  late final ShapeThemeData _shape = ShapeTheme.of(context);
}

mixin _ButtonCommonDefaults on ButtonStyle
    implements
        _DefaultsColorTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme {
  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_typescale.labelLarge);

  @override
  WidgetStateProperty<double?>? get iconSize =>
      const WidgetStatePropertyAll(18.0);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => WidgetStatePropertyAll(
    CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.full),
    ),
  );

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(64.0, 40.0));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size(double.infinity, 40.0));

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateMouseCursor.clickable;

  @override
  WidgetStateProperty<Color?>? get surfaceTintColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;
}

mixin _ContainedButtonElevationDefaults on ButtonStyle
    implements _DefaultsColorTheme, _DefaultsElevationTheme {
  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      WidgetStatePropertyAll(_color.shadow);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _elevation.level0;
        }
        if (states.contains(WidgetState.pressed)) {
          return _elevation.level1;
        }
        if (states.contains(WidgetState.hovered)) {
          return _elevation.level2;
        }
        if (states.contains(WidgetState.focused)) {
          return _elevation.level1;
        }
        return _elevation.level1;
      });
}

mixin _LoweredContainedButtonElevationDefaults on ButtonStyle
    implements _DefaultsColorTheme, _DefaultsElevationTheme {
  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      WidgetStatePropertyAll(_color.shadow);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _elevation.level0;
        }
        if (states.contains(WidgetState.pressed)) {
          return _elevation.level0;
        }
        if (states.contains(WidgetState.hovered)) {
          return _elevation.level1;
        }
        if (states.contains(WidgetState.focused)) {
          return _elevation.level0;
        }
        return _elevation.level0;
      });
}

mixin _UncontainedButtonElevationDefaults on ButtonStyle
    implements _DefaultsColorTheme, _DefaultsElevationTheme {
  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStatePropertyAll(_elevation.level0);
}

class _ElevatedButtonDefaults extends _ButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _ButtonCommonDefaults,
        _ContainedButtonElevationDefaults {
  _ElevatedButtonDefaults({required super.context});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return _color.surfaceContainerLow;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.primary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });
}

class _FilledButtonDefaults extends _ButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _ButtonCommonDefaults,
        _LoweredContainedButtonElevationDefaults {
  _FilledButtonDefaults({required super.context});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return _color.primary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onPrimary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onPrimary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onPrimary;
      });
}

class _FilledTonalButtonDefaults extends _ButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _ButtonCommonDefaults,
        _LoweredContainedButtonElevationDefaults {
  _FilledTonalButtonDefaults({required super.context});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return _color.secondaryContainer;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onSecondaryContainer),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onSecondaryContainer;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onSecondaryContainer;
      });
}

class _OutlinedButtonDefaults extends _ButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _ButtonCommonDefaults,
        _UncontainedButtonElevationDefaults {
  _OutlinedButtonDefaults({required super.context});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.primary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<BorderSide?>? get side =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: _color.onSurface.withValues(alpha: 0.12));
        }
        if (states.contains(WidgetState.focused)) {
          return BorderSide(color: _color.primary);
        }
        return BorderSide(color: _color.outline);
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });
}

class _TextButtonDefaults extends _ButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _ButtonCommonDefaults,
        _UncontainedButtonElevationDefaults {
  _TextButtonDefaults({required super.context});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.primary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.primary;
      });
}
