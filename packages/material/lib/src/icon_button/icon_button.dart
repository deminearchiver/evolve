import 'package:material/material.dart';

enum IconButtonVariant { standard, filled, filledTonal, outlined }

class IconButton extends StatelessWidget {
  const IconButton({
    super.key,
    this.variant = IconButtonVariant.standard,
    this.selected,
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
    required this.icon,
  });
  const IconButton.filled({
    super.key,
    this.selected,
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
    required this.icon,
  }) : variant = IconButtonVariant.filled;
  const IconButton.filledTonal({
    super.key,
    this.selected,
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
    required this.icon,
  }) : variant = IconButtonVariant.filledTonal;
  const IconButton.outlined({
    super.key,
    this.selected,
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
    required this.icon,
  }) : variant = IconButtonVariant.outlined;

  final IconButtonVariant variant;
  final bool? selected;

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

  /// Typically the button's label.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget icon;

  Widget _buildIcon() {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final double? variantFill = switch (variant) {
      IconButtonVariant.filled => 1.0,
      _ => 0.0,
    };
    final double? resolvedFill = switch (selected) {
      false => 0.0,
      true => 1.0,
      null => variantFill,
    };
    return IconTheme.merge(
      data: IconThemeData(fill: resolvedFill, opticalSize: 24.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _IconButton(
      variant: variant,
      selected: selected,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isSemanticButton: isSemanticButton,
      tooltip: tooltip,
      child: _buildIcon(),
    );
  }
}

class _IconButton extends ButtonStyleButton {
  const _IconButton({
    super.key,
    required this.variant,
    required this.selected,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.tooltip,
    required super.child,
  });

  final IconButtonVariant variant;
  final bool? selected;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return switch (variant) {
      IconButtonVariant.standard => _StandardIconButtonDefaults(
        context: context,
        selected: selected,
      ),
      IconButtonVariant.filled => _FilledIconButtonDefaults(
        context: context,
        selected: selected,
      ),
      IconButtonVariant.filledTonal => _FilledTonalIconButtonDefaults(
        context: context,
        selected: selected,
      ),
      IconButtonVariant.outlined => _OutlinedIconButtonDefaults(
        context: context,
        selected: selected,
      ),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) => null;
}

class _IconButtonDefaultsBase extends ButtonStyle implements _DefaultsContext {
  const _IconButtonDefaultsBase({required this.context, required this.selected})
    : super(
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.standard,
      );

  @override
  final BuildContext context;

  final bool? selected;
}

abstract interface class _DefaultsContext {
  BuildContext get context;
}

mixin _DefaultsColorTheme implements _DefaultsContext {
  late final ColorThemeData _color = ColorTheme.of(context);
}
mixin _DefaultsElevationTheme implements _DefaultsContext {
  late final ElevationThemeData _elevation = ElevationTheme.of(context);
}

mixin _DefaultsStateTheme implements _DefaultsContext {
  late final StateThemeData _state = StateTheme.of(context);
}

mixin _DefaultsTypescaleTheme implements _DefaultsContext {
  late final TextTheme _typescale = Theme.of(context).textTheme;
}

mixin _DefaultsShapeTheme implements _DefaultsContext {
  late final ShapeThemeData _shape = ShapeTheme.of(context);
}

mixin _IconButtonCommonDefaults on ButtonStyle
    implements
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme {
  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStatePropertyAll(_elevation.level0);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_typescale.labelLarge);

  @override
  WidgetStateProperty<double?>? get iconSize =>
      const WidgetStatePropertyAll(24.0);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => WidgetStatePropertyAll(
    CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.full),
    ),
  );

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(40.0, 40.0));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(EdgeInsets.all(8.0));

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

class _StandardIconButtonDefaults extends _IconButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _IconButtonCommonDefaults {
  _StandardIconButtonDefaults({
    required super.context,
    required super.selected,
  });

  bool get isSelected => selected ?? false;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(
      isSelected ? _color.primary : _color.onSurfaceVariant,
    ),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected ? _color.primary : _color.onSurfaceVariant;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected ? _color.primary : _color.onSurfaceVariant;
      });
}

class _FilledIconButtonDefaults extends _IconButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _IconButtonCommonDefaults {
  _FilledIconButtonDefaults({required super.context, required super.selected});

  bool get isSelected => selected ?? true;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return isSelected ? _color.primary : _color.surfaceContainerHighest;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(isSelected ? _color.onPrimary : _color.primary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected ? _color.onPrimary : _color.primary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected ? _color.onPrimary : _color.primary;
      });
}

class _FilledTonalIconButtonDefaults extends _IconButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _IconButtonCommonDefaults {
  _FilledTonalIconButtonDefaults({
    required super.context,
    required super.selected,
  });

  bool get isSelected => selected ?? true;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return isSelected
            ? _color.secondaryContainer
            : _color.surfaceContainerHighest;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(
      isSelected ? _color.onSecondaryContainer : _color.onSurfaceVariant,
    ),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected
            ? _color.onSecondaryContainer
            : _color.onSurfaceVariant;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor => WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.disabled)) {
        return _color.onSurface.withValues(alpha: 0.38);
      }
      return isSelected ? _color.onSecondaryContainer : _color.onSurfaceVariant;
    },
  );
}

class _OutlinedIconButtonDefaults extends _IconButtonDefaultsBase
    with
        // Interfaces
        _DefaultsColorTheme,
        _DefaultsElevationTheme,
        _DefaultsStateTheme,
        _DefaultsTypescaleTheme,
        _DefaultsShapeTheme,
        // Implementations
        _IconButtonCommonDefaults {
  _OutlinedIconButtonDefaults({
    required super.context,
    required super.selected,
  });

  bool get isSelected => selected ?? false;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (isSelected) {
          if (states.contains(WidgetState.disabled)) {
            return _color.onSurface.withValues(alpha: 0.12);
          }
          return _color.inverseSurface;
        }
        return Colors.transparent;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((states) {
        final opacity = _state.stateLayerOpacity;

        Color color;
        if (isSelected) {
          color = _color.inverseOnSurface;
        } else if (states.contains(WidgetState.pressed)) {
          color = _color.onSurface;
        } else {
          color = _color.onSurfaceVariant;
        }

        if (states.contains(WidgetState.disabled)) return color.withAlpha(0);
        final alpha = opacity.resolve(states);
        if (alpha == 0.0) return color.withAlpha(0);
        return color.withValues(alpha: alpha);
      });

  @override
  WidgetStateProperty<BorderSide?>? get side =>
      WidgetStateProperty.resolveWith((states) {
        if (isSelected) return null;
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: _color.onSurface.withValues(alpha: 0.12));
        }
        return BorderSide(color: _color.outline);
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return isSelected
            ? _color.onSecondaryContainer
            : _color.onSurfaceVariant;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor => WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.disabled)) {
        return _color.onSurface.withValues(alpha: 0.38);
      }
      if (isSelected) {
        return _color.inverseOnSurface;
      }
      if (states.contains(WidgetState.pressed)) {
        return _color.onSurface;
      }
      return isSelected ? _color.onSecondaryContainer : _color.onSurfaceVariant;
    },
  );
}
