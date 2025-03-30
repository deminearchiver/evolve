import 'package:material/material.dart';

enum FloatingActionButtonVariant { primary, secondary, tertiary, surface }

enum FloatingActionButtonSize { regular, small, large }

class FloatingActionButton extends StatelessWidget {
  /// Creates a floating action button.
  const FloatingActionButton({
    super.key,
    this.variant = FloatingActionButtonVariant.primary,
    this.size = FloatingActionButtonSize.regular,
    this.lowered = false,
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

  /// Creates a small floating action button.
  const FloatingActionButton.small({
    super.key,
    this.variant = FloatingActionButtonVariant.primary,
    this.lowered = false,
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
  }) : size = FloatingActionButtonSize.small;

  /// Creates a large floating action button.
  const FloatingActionButton.large({
    super.key,
    this.variant = FloatingActionButtonVariant.primary,
    this.lowered = false,
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
  }) : size = FloatingActionButtonSize.large;

  final FloatingActionButtonVariant variant;
  final FloatingActionButtonSize size;
  final bool lowered;

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

  /// The icon to display inside the button.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget icon;

  // ButtonStyle? _resolveStyle() {
  //   final padding = _defaultPadding(
  //     variant: variant,
  //     iconAlignment: style?.iconAlignment ?? IconAlignment.start,
  //     hasIcon: icon != null,
  //     hasLabel: label != null,
  //   );
  //   final newStyle = ButtonStyle(padding: WidgetStatePropertyAll(padding));
  //   return style?.merge(newStyle) ?? newStyle;
  // }

  // Widget? _buildLabel() {
  //   return label != null
  //       ? DefaultTextStyle.merge(
  //         overflow: TextOverflow.ellipsis,
  //         maxLines: 1,
  //         child: label!,
  //       )
  //       : null;
  // }

  @override
  Widget build(BuildContext context) {
    // final resolvedStyle = _resolveStyle();

    return _FloatingActionButton(
      variant: variant,
      size: size,
      lowered: lowered,
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
      child: icon,
    );
  }
}

class _FloatingActionButton extends ButtonStyleButton {
  const _FloatingActionButton({
    required this.variant,
    required this.size,
    required this.lowered,
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

  final FloatingActionButtonVariant variant;
  final FloatingActionButtonSize size;
  final bool lowered;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ButtonStyle sharedDefaults = _SharedDefaults(
      context: context,
      lowered: lowered,
    );
    final ButtonStyle variantDefaults = switch (variant) {
      FloatingActionButtonVariant.primary => _VariantPrimaryDefaults(
        context: context,
        lowered: lowered,
      ),
      FloatingActionButtonVariant.secondary => _VariantSecondaryDefaults(
        context: context,
        lowered: lowered,
      ),
      FloatingActionButtonVariant.tertiary => _VariantTertiaryDefaults(
        context: context,
        lowered: lowered,
      ),
      FloatingActionButtonVariant.surface => _VariantSurfaceDefaults(
        context: context,
        lowered: lowered,
      ),
    };
    final ButtonStyle sizeDefaults = switch (size) {
      FloatingActionButtonSize.regular => _SizeRegularDefaults(
        context: context,
        lowered: lowered,
      ),
      FloatingActionButtonSize.small => _SizeSmallDefaults(
        context: context,
        lowered: lowered,
      ),
      FloatingActionButtonSize.large => _SizeLargeDefaults(
        context: context,
        lowered: lowered,
      ),
    };
    return sharedDefaults._merge(variantDefaults)._merge(sizeDefaults);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    // TODO: implement FloatingActionButtonTheme for different variants / sizes
    return null;
  }
}

abstract interface class _DefaultsContext {
  BuildContext get context;
}

mixin _DefaultsColor on ButtonStyle implements _DefaultsContext {
  late final ColorThemeData _color = ColorTheme.of(context);
}
mixin _DefaultsShape on ButtonStyle implements _DefaultsContext {
  late final ShapeThemeData _shape = ShapeTheme.of(context);
}
mixin _DefaultsElevation on ButtonStyle implements _DefaultsContext {
  late final ElevationThemeData _elevation = ElevationTheme.of(context);
}
mixin _DefaultsState on ButtonStyle implements _DefaultsContext {
  late final StateThemeData _state = StateTheme.of(context);
}
mixin _DefaultsText on ButtonStyle implements _DefaultsContext {
  late final TextTheme _text = TextTheme.of(context);
}

class _Defaults extends ButtonStyle implements _DefaultsContext {
  const _Defaults({required this.context, required this.lowered})
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

  final bool lowered;
}

class _SharedDefaults extends _Defaults
    with _DefaultsColor, _DefaultsElevation, _DefaultsText {
  _SharedDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(EdgeInsets.zero);

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateMouseCursor.clickable;

  @override
  WidgetStateProperty<Color?>? get surfaceTintColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_text.labelLarge);

  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      WidgetStatePropertyAll(_color.shadow);

  @override
  WidgetStateProperty<double?>? get elevation =>
      lowered
          ? WidgetStateProperty.resolveWith((states) {
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
          })
          : WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return _elevation.level3;
            }
            if (states.contains(WidgetState.hovered)) {
              return _elevation.level4;
            }
            if (states.contains(WidgetState.focused)) {
              return _elevation.level3;
            }
            return _elevation.level3;
          });
}

class _VariantPrimaryDefaults extends _Defaults
    with _DefaultsColor, _DefaultsState {
  _VariantPrimaryDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(_color.primaryContainer);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onPrimaryContainer),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStatePropertyAll(_color.onPrimaryContainer);

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStatePropertyAll(_color.onPrimaryContainer);
}

class _VariantSecondaryDefaults extends _Defaults
    with _DefaultsColor, _DefaultsState {
  _VariantSecondaryDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(_color.secondaryContainer);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onSecondaryContainer),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStatePropertyAll(_color.onSecondaryContainer);

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStatePropertyAll(_color.onSecondaryContainer);
}

class _VariantTertiaryDefaults extends _Defaults
    with _DefaultsColor, _DefaultsState {
  _VariantTertiaryDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(_color.tertiaryContainer);

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onTertiaryContainer),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStatePropertyAll(_color.onTertiaryContainer);

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStatePropertyAll(_color.onTertiaryContainer);
}

class _VariantSurfaceDefaults extends _Defaults
    with _DefaultsColor, _DefaultsState {
  _VariantSurfaceDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<Color?>? get backgroundColor => WidgetStatePropertyAll(
    lowered ? _color.surfaceContainerLow : _color.surfaceContainerHigh,
  );

  @override
  WidgetStateProperty<Color?>? get overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.primary),
    _state.stateLayerOpacity,
  );

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStatePropertyAll(_color.primary);

  @override
  WidgetStateProperty<Color?>? get iconColor =>
      WidgetStatePropertyAll(_color.primary);
}

class _SizeRegularDefaults extends _Defaults with _DefaultsShape {
  _SizeRegularDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => WidgetStatePropertyAll(
    CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.large),
    ),
  );

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(56, 56));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size(56, 56));

  @override
  WidgetStateProperty<double?>? get iconSize =>
      const WidgetStatePropertyAll(24);
}

class _SizeSmallDefaults extends _Defaults with _DefaultsShape {
  _SizeSmallDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => WidgetStatePropertyAll(
    CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.medium),
    ),
  );

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(40, 40));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size(40, 40));

  @override
  WidgetStateProperty<double?>? get iconSize =>
      const WidgetStatePropertyAll(24);
}

class _SizeLargeDefaults extends _Defaults with _DefaultsShape {
  _SizeLargeDefaults({required super.context, required super.lowered});

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape => WidgetStatePropertyAll(
    CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.extraLarge),
    ),
  );

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(96, 96));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size(96, 96));

  @override
  WidgetStateProperty<double?>? get iconSize =>
      const WidgetStatePropertyAll(36);
}

extension on ButtonStyle {
  ButtonStyle _merge(ButtonStyle? other) {
    if (other == null) return this;
    return copyWith(
      textStyle: other.textStyle,
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      surfaceTintColor: other.surfaceTintColor,
      elevation: other.elevation,
      padding: other.padding,
      minimumSize: other.minimumSize,
      fixedSize: other.fixedSize,
      maximumSize: other.maximumSize,
      iconColor: other.iconColor,
      iconSize: other.iconSize,
      iconAlignment: other.iconAlignment,
      side: other.side,
      shape: other.shape,
      mouseCursor: other.mouseCursor,
      visualDensity: other.visualDensity,
      tapTargetSize: other.tapTargetSize,
      animationDuration: other.animationDuration,
      enableFeedback: other.enableFeedback,
      alignment: other.alignment,
      splashFactory: other.splashFactory,
      backgroundBuilder: other.backgroundBuilder,
      foregroundBuilder: other.foregroundBuilder,
    );
  }
}
