import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
abstract class StateThemeData with Diagnosticable {
  const StateThemeData._();

  const factory StateThemeData({
    required WidgetStateProperty<double> stateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.standard() = _StateThemeDataStandard;
  const factory StateThemeData.web() = _StateThemeDataWeb;

  @Deprecated("This constructor is deprecated and should not be used")
  const factory StateThemeData.fromValues({
    required double draggedStateLayerOpacity,
    required double focusStateLayerOpacity,
    required double hoverStateLayerOpacity,
    required double pressedStateLayerOpacity,
  }) = _StateThemeDataFromValues;

  @Deprecated(
    "draggedStateLayerOpacity was deprecated in favor of stateLayerOpacity",
  )
  double get draggedStateLayerOpacity;

  @Deprecated(
    "focusStateLayerOpacity was deprecated in favor of stateLayerOpacity",
  )
  double get focusStateLayerOpacity;

  @Deprecated(
    "hoverStateLayerOpacity was deprecated in favor of stateLayerOpacity",
  )
  double get hoverStateLayerOpacity;

  @Deprecated(
    "pressedStateLayerOpacity was deprecated in favor of stateLayerOpacity",
  )
  double get pressedStateLayerOpacity;

  WidgetStateProperty<double> get stateLayerOpacity;

  // static StateThemeData? lerp(StateThemeData? a, StateThemeData? b, double t) {
  //   if (a == null || b == null) return null;
  //   if (identical(a, b)) return a;
  //   final stateLayerOpacity =
  //       WidgetStateProperty.lerp<double>(
  //         a.stateLayerOpacity,
  //         b.stateLayerOpacity,
  //         t,
  //         lerpDouble,
  //       ) ??
  //       (t > 0.5 ? b.stateLayerOpacity : a.stateLayerOpacity);
  //   return StateThemeData(stateLayerOpacity: stateLayerOpacity);
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<double>>(
        "stateLayerOpacity",
        stateLayerOpacity,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is StateThemeData && stateLayerOpacity == other.stateLayerOpacity;
  }

  @override
  int get hashCode => stateLayerOpacity.hashCode;
}

class _StateThemeData extends StateThemeData {
  const _StateThemeData({required this.stateLayerOpacity}) : super._();

  @override
  double get draggedStateLayerOpacity =>
      stateLayerOpacity.resolve({WidgetState.dragged});

  @override
  double get focusStateLayerOpacity =>
      stateLayerOpacity.resolve({WidgetState.focused});

  @override
  double get hoverStateLayerOpacity =>
      stateLayerOpacity.resolve({WidgetState.hovered});

  @override
  double get pressedStateLayerOpacity =>
      stateLayerOpacity.resolve({WidgetState.pressed});

  @override
  final WidgetStateProperty<double> stateLayerOpacity;
}

class _StateThemeDataStandard extends _StateThemeData {
  const _StateThemeDataStandard()
    : super(
        stateLayerOpacity: const WidgetStateProperty.fromMap({
          WidgetState.disabled: 0.0,
          WidgetState.dragged: 0.16,
          WidgetState.pressed: 0.1,
          WidgetState.hovered: 0.08,
          WidgetState.focused: 0.1,
          WidgetState.any: 0.0,
        }),
      );
}

class _StateThemeDataWeb extends _StateThemeData {
  const _StateThemeDataWeb()
    : super(
        stateLayerOpacity: const WidgetStateProperty.fromMap({
          WidgetState.disabled: 0.0,
          WidgetState.dragged: 0.16,
          WidgetState.pressed: 0.12,
          WidgetState.hovered: 0.08,
          WidgetState.focused: 0.12,
          WidgetState.any: 0.0,
        }),
      );
}

class _StateThemeDataFromValues extends StateThemeData {
  const _StateThemeDataFromValues({
    required this.draggedStateLayerOpacity,
    required this.focusStateLayerOpacity,
    required this.hoverStateLayerOpacity,
    required this.pressedStateLayerOpacity,
  }) : super._();

  @override
  final double draggedStateLayerOpacity;

  @override
  final double focusStateLayerOpacity;

  @override
  final double hoverStateLayerOpacity;

  @override
  final double pressedStateLayerOpacity;

  @override
  WidgetStateProperty<double> get stateLayerOpacity =>
      WidgetStateProperty<double>.fromMap({
        WidgetState.disabled: 0.0,
        WidgetState.dragged: draggedStateLayerOpacity,
        WidgetState.pressed: pressedStateLayerOpacity,
        WidgetState.hovered: hoverStateLayerOpacity,
        WidgetState.focused: focusStateLayerOpacity,
        WidgetState.any: 0.0,
      });
}

class StateTheme extends InheritedTheme {
  const StateTheme({super.key, required this.data, required super.child});

  final StateThemeData data;

  @override
  bool updateShouldNotify(covariant StateTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return StateTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StateThemeData>("data", data));
  }

  static StateThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateTheme>()?.data;
  }

  static StateThemeData of(BuildContext context) {
    return maybeOf(context) ?? const StateThemeData.standard();
  }

  // static Widget merge({Key? key, required StateThemeData data, required Widget child}) {
  //   return Builder(
  //     builder: (BuildContext context) {
  //       return StateTheme(
  //         key: key,
  //         data: _getInheritedIconThemeData(context).merge(data),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}

// const _standard = WidgetStateProperty<double>.fromMap({
//   WidgetState.disabled: 0.0,
//   WidgetState.dragged: 0.16,
//   WidgetState.pressed: 0.1,
//   WidgetState.hovered: 0.08,
//   WidgetState.focused: 0.1,
//   WidgetState.any: 0.0,
// });
// const _web = WidgetStateProperty<double>.fromMap({
//   WidgetState.disabled: 0.0,
//   WidgetState.dragged: 0.16,
//   WidgetState.pressed: 0.12,
//   WidgetState.hovered: 0.08,
//   WidgetState.focused: 0.12,
//   WidgetState.any: 0.0,
// });

class WidgetStateLayerColor implements WidgetStateProperty<Color> {
  const WidgetStateLayerColor(this.color, this.opacity);

  final WidgetStateProperty<Color?>? color;
  final WidgetStateProperty<double?>? opacity;

  @override
  Color resolve(Set<WidgetState> states) {
    // No color property provided
    if (color == null) return Colors.transparent;
    final resolvedColor = color!.resolve(states);

    // Short circuit if no color found
    if (resolvedColor == null) return Colors.transparent;

    // Disabled
    if (states.contains(WidgetState.disabled)) {
      return resolvedColor.withAlpha(0);
    }
    // Opacity not provided
    if (opacity == null) return resolvedColor.withAlpha(0);

    // Default opacity is 0
    final alpha = opacity!.resolve(states) ?? 0.0;

    // Optimized for opacity = 0
    if (alpha == 0.0) return resolvedColor.withAlpha(0);

    // Unoptimized color spaces for opacity other than 0
    return resolvedColor.withValues(alpha: alpha);
  }
}
