import 'package:flutter/material.dart' hide Icon, IconTheme, IconThemeData;
import 'package:material3_expressive/material3_expressive.dart';

enum ButtonVariant { elevated, filled, tonal, outlined, text }

enum ToggleButtonColor { elevated, filled, tonal, outlined }

enum ButtonSize { extraSmall, small, medium, large, extraLarge }

enum ButtonShape { round, square }

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.selected,
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
  });

  final bool selected;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final WidgetStatesController? statesController;
  final bool? isSemanticButton;
  final String? tooltip;
  final Widget? icon;
  final Widget label;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();

  static ButtonStyle defaultStyleOf({
    required BuildContext context,
    ButtonSize size = ButtonSize.small,
    ToggleButtonColor color = ToggleButtonColor.filled,
    ButtonShape shape = ButtonShape.round,
  }) {
    final sharedStyle = _Shared(context: context);
    final square = shape == ButtonShape.square;
    final sizeStyle = switch (size) {
      ButtonSize.extraSmall => _SizeExtraSmall(
        context: context,
        square: square,
      ),
      ButtonSize.small => _SizeSmall(context: context, square: square),
      ButtonSize.medium => _SizeMedium(context: context, square: square),
      _ => throw UnimplementedError(),
    };
    final colorStyle = switch (color) {
      ToggleButtonColor.elevated => _ColorElevated(context: context),
      ToggleButtonColor.filled => _ColorFilled(context: context),
      ToggleButtonColor.tonal => _ColorTonal(context: context),
      _ => throw UnimplementedError(),
    };
    return sharedStyle._merge(sizeStyle)._merge(colorStyle);
  }
}

class _ToggleButtonState extends State<ToggleButton> {
  WidgetStatesController? _internalStatesController;
  WidgetStatesController get _statesController =>
      widget.statesController ?? _internalStatesController!;
  @override
  void initState() {
    super.initState();
    if (widget.statesController == null) {
      _internalStatesController = WidgetStatesController();
    }
  }

  @override
  void didUpdateWidget(covariant ToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.statesController != oldWidget.statesController) {
      _statesController.removeListener(_statesListener);
      oldWidget.statesController?.update(WidgetState.selected, false);
      _internalStatesController?.dispose();
      _internalStatesController = widget.statesController != null
          ? null
          : WidgetStatesController();
      _statesController.addListener(_statesListener);
    }
    if (widget.selected != oldWidget.selected) {
      _statesController.update(WidgetState.selected, widget.selected);
    }
  }

  @override
  void dispose() {
    _internalStatesController?.dispose();
    super.dispose();
  }

  void _statesListener() {
    setState(() {});
  }

  Widget? _buildIcon(BuildContext context) {
    final icon = widget.icon;
    if (icon == null) return null;
    return Builder(
      builder: (context) {
        final legacyIconTheme = IconTheme.legacyOf(context);
        return IconTheme.merge(
          data: IconThemeDataPartial(
            color: legacyIconTheme.color,
            size: legacyIconTheme.size,
            opsz: legacyIconTheme
                .size, // opticalSize is not set in ButtonStyleButton
            fill: widget.selected ? 1.0 : 0.0,
          ),
          child: icon,
        );
      },
    );
  }

  Widget? _buildLabel(BuildContext context) {
    final Widget? label = widget.label;
    if (label == null) return null;
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return _ToggleButton(
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      style: widget.style,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      statesController: _statesController,
      isSemanticButton: widget.isSemanticButton,
      tooltip: widget.tooltip,
      child: _ButtonChild(
        icon: _buildIcon(context),
        label: _buildLabel(context),
        iconAlignment: widget.style?.iconAlignment ?? IconAlignment.start,
      ),
    );
  }
}

class _ToggleButton extends ButtonStyleButton {
  const _ToggleButton({
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

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return ToggleButton.defaultStyleOf(context: context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return null;
  }
}

class _ButtonChild extends StatelessWidget {
  const _ButtonChild({
    super.key,
    this.icon,
    this.label,
    this.iconAlignment = IconAlignment.start,
  });

  final Widget? icon;
  final Widget? label;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      children: switch (iconAlignment) {
        IconAlignment.start => [?icon, ?label],
        IconAlignment.end => [?label, ?icon],
      },
    );
  }
}

class _Shared extends ButtonStyle {
  _Shared({required BuildContext context})
    : _context = context,
      super(
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.padded,
        visualDensity: VisualDensity.standard,
        mouseCursor: WidgetStateMouseCursor.clickable,
      );

  final BuildContext _context;
  late final ColorThemeData _colorTheme = ColorTheme.of(_context);

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      WidgetStatePropertyAll(_colorTheme.shadow);
}

class _SizeExtraSmall extends ButtonStyle {
  _SizeExtraSmall({required BuildContext context, this.square = false})
    : _context = context,
      super(tapTargetSize: MaterialTapTargetSize.padded);

  final BuildContext _context;
  final bool square;
  late final ShapeThemeData _shapeTheme = ShapeTheme.of(_context);
  late final TypescaleThemeData _typescaleTheme = TypescaleTheme.of(_context);

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      WidgetStatePropertyAll(Size(48.0, 32.0));

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((states) {
        final roundCorner = _shapeTheme.full;
        final squareCorner = _shapeTheme.medium;
        // final pressedCorner = _shapeTheme.small;

        final Corner corner;
        // if (states.contains(WidgetState.pressed)) {
        //   corner = pressedCorner;
        // } else
        if (states.contains(WidgetState.selected)) {
          corner = square ? roundCorner : squareCorner;
        } else {
          corner = square ? squareCorner : roundCorner;
        }
        return CornersBorder.rounded(corners: Corners.all(corner));
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_typescaleTheme.labelLarge.toTextStyle());

  @override
  WidgetStateProperty<double?>? get iconSize => WidgetStatePropertyAll(20.0);
}

class _SizeSmall extends ButtonStyle {
  _SizeSmall({required BuildContext context, this.square = false})
    : _context = context,
      super(tapTargetSize: MaterialTapTargetSize.padded);

  final BuildContext _context;
  final bool square;
  late final ShapeThemeData _shapeTheme = ShapeTheme.of(_context);
  late final TypescaleThemeData _typescaleTheme = TypescaleTheme.of(_context);

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      WidgetStatePropertyAll(Size(48.0, 40.0));

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((states) {
        final roundCorner = _shapeTheme.full;
        final squareCorner = _shapeTheme.medium;
        // final pressedCorner = _shapeTheme.small;

        final Corner corner;
        // if (states.contains(WidgetState.pressed)) {
        //   corner = pressedCorner;
        // } else
        if (states.contains(WidgetState.selected)) {
          corner = square ? roundCorner : squareCorner;
        } else {
          corner = square ? squareCorner : roundCorner;
        }
        return CornersBorder.rounded(corners: Corners.all(corner));
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_typescaleTheme.labelLarge.toTextStyle());

  @override
  WidgetStateProperty<double?>? get iconSize => WidgetStatePropertyAll(20.0);
}

class _SizeMedium extends ButtonStyle {
  _SizeMedium({required BuildContext context, this.square = false})
    : _context = context,
      super(tapTargetSize: MaterialTapTargetSize.padded);

  final BuildContext _context;
  final bool square;
  late final ShapeThemeData _shapeTheme = ShapeTheme.of(_context);
  late final TypescaleThemeData _typescaleTheme = TypescaleTheme.of(_context);

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      WidgetStatePropertyAll(Size(48.0, 56.0));

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      WidgetStateProperty.resolveWith((states) {
        final roundCorner = _shapeTheme.full;
        final squareCorner = _shapeTheme.large;
        // final pressedCorner = _shapeTheme.medium;

        final Corner corner;
        // if (states.contains(WidgetState.pressed)) {
        //   corner = pressedCorner;
        // } else
        if (states.contains(WidgetState.selected)) {
          corner = square ? roundCorner : squareCorner;
        } else {
          corner = square ? squareCorner : roundCorner;
        }
        return CornersBorder.rounded(corners: Corners.all(corner));
      });

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(_typescaleTheme.titleMedium.toTextStyle());

  @override
  WidgetStateProperty<double?>? get iconSize => WidgetStatePropertyAll(24.0);
}

class _ColorElevated extends ButtonStyle {
  _ColorElevated({required BuildContext context}) : _context = context, super();

  final BuildContext _context;
  late final ColorThemeData _colorTheme = ColorTheme.of(_context);
  late final StateThemeData _stateTheme = StateTheme.of(_context);
  late final ElevationThemeData _elevationTheme = ElevationTheme.of(_context);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _elevationTheme.level0;
        }
        if (states.contains(WidgetState.pressed)) {
          return _elevationTheme.level1;
        }
        if (states.contains(WidgetState.hovered)) {
          return _elevationTheme.level2;
        }
        if (states.contains(WidgetState.focused)) {
          return _elevationTheme.level1;
        }
        return _elevationTheme.level1;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.primary;
        }
        return _colorTheme.surfaceContainerLow;
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.38);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.onPrimary;
        }
        return _colorTheme.primary;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor => foregroundColor;

  @override
  WidgetStateProperty<Color?>? get overlayColor => StateLayerColor(
    color: foregroundColor,
    opacity: StateLayerOpacity.fromStateTheme(_stateTheme),
  );
}

class _ColorFilled extends ButtonStyle {
  _ColorFilled({required BuildContext context}) : _context = context, super();

  final BuildContext _context;
  late final ColorThemeData _colorTheme = ColorTheme.of(_context);
  late final StateThemeData _stateTheme = StateTheme.of(_context);
  late final ElevationThemeData _elevationTheme = ElevationTheme.of(_context);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStatePropertyAll(_elevationTheme.level0);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.primary;
        }
        return _colorTheme.surfaceContainer;
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.38);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.onPrimary;
        }
        return _colorTheme.onSurfaceVariant;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor => foregroundColor;

  @override
  WidgetStateProperty<Color?>? get overlayColor => StateLayerColor(
    color: foregroundColor,
    opacity: StateLayerOpacity.fromStateTheme(_stateTheme),
  );
}

class _ColorTonal extends ButtonStyle {
  _ColorTonal({required BuildContext context}) : _context = context, super();

  final BuildContext _context;
  late final ColorThemeData _colorTheme = ColorTheme.of(_context);
  late final StateThemeData _stateTheme = StateTheme.of(_context);
  late final ElevationThemeData _elevationTheme = ElevationTheme.of(_context);

  @override
  WidgetStateProperty<double?>? get elevation =>
      WidgetStatePropertyAll(_elevationTheme.level0);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.secondary;
        }
        return _colorTheme.secondaryContainer;
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _colorTheme.onSurface.withValues(alpha: 0.38);
        }
        if (states.contains(WidgetState.selected)) {
          return _colorTheme.onSecondary;
        }
        return _colorTheme.onSecondaryContainer;
      });

  @override
  WidgetStateProperty<Color?>? get iconColor => foregroundColor;

  @override
  WidgetStateProperty<Color?>? get overlayColor => StateLayerColor(
    color: foregroundColor,
    opacity: StateLayerOpacity.fromStateTheme(_stateTheme),
  );
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

abstract class ToggleButtonStyle {
  WidgetStateProperty<BoxConstraints?>? get containerConstraints;
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding;
  WidgetStateProperty<double>? get spacing;
  WidgetStateProperty<Color?>? get containerColor;
  WidgetStateProperty<IconThemeDataPartial?>? get iconTheme;
  WidgetStateProperty<TextStyle?>? get labelTextStyle;
}
