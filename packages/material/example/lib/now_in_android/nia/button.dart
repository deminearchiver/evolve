import 'package:material/material.dart';
import 'package:material/material.dart' as material;

enum ButtonVariant {
  filled(material.ButtonVariant.filled),
  outlined(material.ButtonVariant.outlined),
  text(material.ButtonVariant.text);

  const ButtonVariant(this._variant);
  final material.ButtonVariant _variant;
}

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

  @override
  Widget build(BuildContext context) {
    final defaultStyle = switch (variant) {
      ButtonVariant.filled => _FilledButtonDefaults(context: context),
      ButtonVariant.outlined => _OutlinedButtonDefaults(context: context),
      ButtonVariant.text => _TextButtonDefaults(context: context),
    };
    return material.Button(
      variant: variant._variant,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style?.merge(defaultStyle) ?? defaultStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isSemanticButton: isSemanticButton,
      tooltip: tooltip,
      icon: icon,
      label: label,
    );
  }
}

class _FilledButtonDefaults extends ButtonStyle {
  _FilledButtonDefaults({required this.context});

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.fromMap({
        WidgetState.disabled: _color.onSurface.withValues(alpha: 0.12),
        WidgetState.any: switch (_color.brightness) {
          Brightness.light => _color.inverseSurface,
          Brightness.dark => _color.primary,
        },
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.fromMap({
        WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
        WidgetState.any: switch (_color.brightness) {
          Brightness.light => _color.inverseOnSurface,
          Brightness.dark => _color.onPrimary,
        },
      });
  @override
  WidgetStateProperty<Color?>? get iconColor => WidgetStateProperty.fromMap({
    WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
    WidgetState.any: switch (_color.brightness) {
      Brightness.light => _color.inverseOnSurface,
      Brightness.dark => _color.onPrimary,
    },
  });
}

class _OutlinedButtonDefaults extends ButtonStyle {
  _OutlinedButtonDefaults({required this.context});

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<BorderSide?>? get side => WidgetStateProperty.fromMap({
    WidgetState.disabled: BorderSide(
      color: _color.onSurface.withValues(alpha: 0.12),
    ),
    WidgetState.focused: BorderSide(color: _color.onSurface),
    WidgetState.any: BorderSide(color: _color.outline),
  });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.fromMap({
        WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
        WidgetState.any: _color.onSurface,
      });
  @override
  WidgetStateProperty<Color?>? get iconColor => WidgetStateProperty.fromMap({
    WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
    WidgetState.any: _color.onSurface,
  });
}

class _TextButtonDefaults extends ButtonStyle {
  _TextButtonDefaults({required this.context});

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.fromMap({
        WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
        WidgetState.any: _color.onSurface,
      });
  @override
  WidgetStateProperty<Color?>? get iconColor => WidgetStateProperty.fromMap({
    WidgetState.disabled: _color.onSurface.withValues(alpha: 0.38),
    WidgetState.any: _color.onSurface,
  });
}
