import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'state_theme_data_partial.dart';
part 'state_theme_data.dart';
part 'state_theme.dart';

class StateLayerColor implements WidgetStateProperty<Color?> {
  const StateLayerColor({this.color, this.opacity});

  final WidgetStateProperty<Color?>? color;
  final WidgetStateProperty<double?>? opacity;

  @override
  Color? resolve(Set<WidgetState> states) {
    final resolvedColor = color?.resolve(states);
    final resolvedOpacity = opacity?.resolve(states) ?? 0.0;
    if (resolvedColor == null) {
      return null;
    }
    return resolvedColor.withValues(alpha: resolvedOpacity);
  }
}

abstract class StateLayerOpacity implements WidgetStateProperty<double> {
  const factory StateLayerOpacity.fromStateTheme(
    StateThemeDataPartial stateTheme,
  ) = _WidgetStateLayerOpacityFromStateTheme;

  static StateLayerOpacity of(BuildContext context) {
    final stateTheme = StateTheme.of(context);
    return StateLayerOpacity.fromStateTheme(stateTheme);
  }
}

// class _WidgetStateLayerOpacity implements WidgetStateLayerOpacity {
//   const _WidgetStateLayerOpacity({
//     this.hoverStateLayerOpacity,
//     this.focusStateLayerOpacity,
//     this.pressedStateLayerOpacity,
//     this.draggedStateLayerOpacity,
//   })

//   final double? hoverStateLayerOpacity;
//   final double? hoverStateLayerOpacity;
// }

class _WidgetStateLayerOpacityFromStateTheme implements StateLayerOpacity {
  const _WidgetStateLayerOpacityFromStateTheme(this._state);

  final StateThemeDataPartial _state;

  @override
  double resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return 0.0;
    }
    final draggedValue = _state.draggedStateLayerOpacity;
    if (draggedValue != null && states.contains(WidgetState.dragged)) {
      return draggedValue;
    }
    final pressedValue = _state.pressedStateLayerOpacity;
    if (pressedValue != null && states.contains(WidgetState.pressed)) {
      return pressedValue;
    }
    final focusValue = _state.focusStateLayerOpacity;
    if (focusValue != null && states.contains(WidgetState.focused)) {
      return focusValue;
    }
    final hoverValue = _state.hoverStateLayerOpacity;
    if (hoverValue != null && states.contains(WidgetState.hovered)) {
      return hoverValue;
    }
    return 0.0;
  }
}
