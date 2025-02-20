import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

class SwitchThemeDataPartial with Diagnosticable {
  /// Creates a theme that can be used for [ThemeData.switchTheme].
  const SwitchThemeDataPartial({
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.thumbIcon,
    this.padding,
  });

  /// {@macro flutter.material.switch.thumbColor}
  ///
  /// If specified, overrides the default value of [Switch.thumbColor].
  final WidgetStateProperty<Color?>? thumbColor;

  /// {@macro flutter.material.switch.trackColor}
  ///
  /// If specified, overrides the default value of [Switch.trackColor].
  final WidgetStateProperty<Color?>? trackColor;

  /// {@macro flutter.material.switch.trackOutlineColor}
  ///
  /// If specified, overrides the default value of [Switch.trackOutlineColor].
  final WidgetStateProperty<Color?>? trackOutlineColor;

  /// {@macro flutter.material.switch.trackOutlineWidth}
  ///
  /// If specified, overrides the default value of [Switch.trackOutlineWidth].
  final WidgetStateProperty<double?>? trackOutlineWidth;

  /// {@macro flutter.material.switch.materialTapTargetSize}
  ///
  /// If specified, overrides the default value of
  /// [Switch.materialTapTargetSize].
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@macro flutter.material.switch.mouseCursor}
  ///
  /// If specified, overrides the default value of [Switch.mouseCursor].
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// {@macro flutter.material.switch.overlayColor}
  ///
  /// If specified, overrides the default value of [Switch.overlayColor].
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@macro flutter.material.switch.splashRadius}
  ///
  /// If specified, overrides the default value of [Switch.splashRadius].
  final double? splashRadius;

  /// {@macro flutter.material.switch.thumbIcon}
  ///
  /// It is overridden by [Switch.thumbIcon].
  final WidgetStateProperty<Icon?>? thumbIcon;

  /// If specified, overrides the default value of [Switch.padding].
  final EdgeInsetsGeometry? padding;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  SwitchThemeDataPartial copyWith({
    WidgetStateProperty<Color?>? thumbColor,
    WidgetStateProperty<Color?>? trackColor,
    WidgetStateProperty<Color?>? trackOutlineColor,
    WidgetStateProperty<double?>? trackOutlineWidth,
    MaterialTapTargetSize? materialTapTargetSize,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    WidgetStateProperty<Icon?>? thumbIcon,
    EdgeInsetsGeometry? padding,
  }) => SwitchThemeDataPartial(
    thumbColor: thumbColor ?? this.thumbColor,
    trackColor: trackColor ?? this.trackColor,
    trackOutlineColor: trackOutlineColor ?? this.trackOutlineColor,
    trackOutlineWidth: trackOutlineWidth ?? this.trackOutlineWidth,
    materialTapTargetSize: materialTapTargetSize ?? this.materialTapTargetSize,
    mouseCursor: mouseCursor ?? this.mouseCursor,
    overlayColor: overlayColor ?? this.overlayColor,
    splashRadius: splashRadius ?? this.splashRadius,
    thumbIcon: thumbIcon ?? this.thumbIcon,
    padding: padding ?? this.padding,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SwitchThemeDataPartial &&
            thumbColor == other.thumbColor &&
            trackColor == other.trackColor &&
            trackOutlineColor == other.trackOutlineColor &&
            trackOutlineWidth == other.trackOutlineWidth &&
            materialTapTargetSize == other.materialTapTargetSize &&
            mouseCursor == other.mouseCursor &&
            overlayColor == other.overlayColor &&
            splashRadius == other.splashRadius &&
            thumbIcon == other.thumbIcon &&
            padding == other.padding;
  }

  @override
  int get hashCode => Object.hash(
    thumbColor,
    trackColor,
    trackOutlineColor,
    trackOutlineWidth,
    materialTapTargetSize,
    mouseCursor,
    overlayColor,
    splashRadius,
    thumbIcon,
    padding,
  );
}

class SwitchThemeData with Diagnosticable implements SwitchThemeDataPartial {
  /// Creates a theme that can be used for [ThemeData.switchTheme].
  const SwitchThemeData({
    required this.thumbColor,
    required this.trackColor,
    required this.trackOutlineColor,
    required this.trackOutlineWidth,
    required this.materialTapTargetSize,
    required this.mouseCursor,
    required this.overlayColor,
    required this.splashRadius,
    required this.thumbIcon,
    required this.padding,
  });

  /// {@macro flutter.material.switch.thumbColor}
  ///
  /// If specified, overrides the default value of [Switch.thumbColor].
  @override
  final WidgetStateProperty<Color?> thumbColor;

  /// {@macro flutter.material.switch.trackColor}
  ///
  /// If specified, overrides the default value of [Switch.trackColor].
  @override
  final WidgetStateProperty<Color?> trackColor;

  /// {@macro flutter.material.switch.trackOutlineColor}
  ///
  /// If specified, overrides the default value of [Switch.trackOutlineColor].
  @override
  final WidgetStateProperty<Color?> trackOutlineColor;

  /// {@macro flutter.material.switch.trackOutlineWidth}
  ///
  /// If specified, overrides the default value of [Switch.trackOutlineWidth].
  @override
  final WidgetStateProperty<double?> trackOutlineWidth;

  /// {@macro flutter.material.switch.materialTapTargetSize}
  ///
  /// If specified, overrides the default value of
  /// [Switch.materialTapTargetSize].
  @override
  final MaterialTapTargetSize materialTapTargetSize;

  /// {@macro flutter.material.switch.mouseCursor}
  ///
  /// If specified, overrides the default value of [Switch.mouseCursor].
  @override
  final WidgetStateProperty<MouseCursor?> mouseCursor;

  /// {@macro flutter.material.switch.overlayColor}
  ///
  /// If specified, overrides the default value of [Switch.overlayColor].
  @override
  final WidgetStateProperty<Color?> overlayColor;

  /// {@macro flutter.material.switch.splashRadius}
  ///
  /// If specified, overrides the default value of [Switch.splashRadius].
  @override
  final double splashRadius;

  /// {@macro flutter.material.switch.thumbIcon}
  ///
  /// It is overridden by [Switch.thumbIcon].
  @override
  final WidgetStateProperty<Icon?> thumbIcon;

  /// If specified, overrides the default value of [Switch.padding].
  @override
  final EdgeInsetsGeometry padding;

  @override
  SwitchThemeData copyWith({
    WidgetStateProperty<Color?>? thumbColor,
    WidgetStateProperty<Color?>? trackColor,
    WidgetStateProperty<Color?>? trackOutlineColor,
    WidgetStateProperty<double?>? trackOutlineWidth,
    MaterialTapTargetSize? materialTapTargetSize,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    WidgetStateProperty<Icon?>? thumbIcon,
    EdgeInsetsGeometry? padding,
  }) => SwitchThemeData(
    thumbColor: thumbColor ?? this.thumbColor,
    trackColor: trackColor ?? this.trackColor,
    trackOutlineColor: trackOutlineColor ?? this.trackOutlineColor,
    trackOutlineWidth: trackOutlineWidth ?? this.trackOutlineWidth,
    materialTapTargetSize: materialTapTargetSize ?? this.materialTapTargetSize,
    mouseCursor: mouseCursor ?? this.mouseCursor,
    overlayColor: overlayColor ?? this.overlayColor,
    splashRadius: splashRadius ?? this.splashRadius,
    thumbIcon: thumbIcon ?? this.thumbIcon,
    padding: padding ?? this.padding,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SwitchThemeData &&
            thumbColor == other.thumbColor &&
            trackColor == other.trackColor &&
            trackOutlineColor == other.trackOutlineColor &&
            trackOutlineWidth == other.trackOutlineWidth &&
            materialTapTargetSize == other.materialTapTargetSize &&
            mouseCursor == other.mouseCursor &&
            overlayColor == other.overlayColor &&
            splashRadius == other.splashRadius &&
            thumbIcon == other.thumbIcon &&
            padding == other.padding;
  }

  @override
  int get hashCode => Object.hash(
    thumbColor,
    trackColor,
    trackOutlineColor,
    trackOutlineWidth,
    materialTapTargetSize,
    mouseCursor,
    overlayColor,
    splashRadius,
    thumbIcon,
    padding,
  );
}

class SwitchTheme {}
