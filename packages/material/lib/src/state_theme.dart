// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

const Set<WidgetState> _draggedStates = {WidgetState.dragged};
const Set<WidgetState> _focusStates = {WidgetState.focused};
const Set<WidgetState> _hoverStates = {WidgetState.hovered};
const Set<WidgetState> _pressedStates = {WidgetState.pressed};

/// Linearly interpolate between two doubles.
///
/// Same as [lerpDouble] but specialized for non-null `double` type.
double _lerpDouble(double a, double b, double t) {
  // This doesn't match _lerpInt to preserve specific behaviors when dealing
  // with infinity and nan.
  return a * (1.0 - t) + b * t;
}

WidgetStateProperty<T>? _lerpProperties<T>(
  WidgetStateProperty<T>? a,
  WidgetStateProperty<T>? b,
  double t,
  T Function(T a, T b, double t) lerpFunction,
) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;
  return _WidgetStatePropertyLerp<T>(a, b, t, lerpFunction);
}

/// Linearly interpolate between two [WidgetStateProperty]s.
class _WidgetStatePropertyLerp<T> implements WidgetStateProperty<T> {
  const _WidgetStatePropertyLerp(this.a, this.b, this.t, this.lerpFunction);

  final WidgetStateProperty<T> a;
  final WidgetStateProperty<T> b;
  final double t;
  final T Function(T a, T b, double t) lerpFunction;

  @override
  T resolve(Set<WidgetState> states) {
    final resolvedA = a.resolve(states);
    final resolvedB = b.resolve(states);
    return lerpFunction(resolvedA, resolvedB, t);
  }
}

@immutable
abstract class StateThemeDataPartial with Diagnosticable {
  const factory StateThemeDataPartial({
    WidgetStateProperty<double>? stateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead")
    double? draggedStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead") double? focusStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead") double? hoverStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead")
    double? pressedStateLayerOpacity,
  }) = _StateThemeDataPartial;

  WidgetStateProperty<double>? get stateLayerOpacity;

  @Deprecated("Use stateLayerOpacity instead")
  double? get draggedStateLayerOpacity;

  @Deprecated("Use stateLayerOpacity instead")
  double? get focusStateLayerOpacity;

  @Deprecated("Use stateLayerOpacity instead")
  double? get hoverStateLayerOpacity;

  @Deprecated("Use stateLayerOpacity instead")
  double? get pressedStateLayerOpacity;

  StateThemeDataPartial copyWith({
    WidgetStateProperty<double>? stateLayerOpacity,

    @Deprecated("Use stateLayerOpacity instead")
    double? draggedStateLayerOpacity,

    @Deprecated("Use stateLayerOpacity instead") double? focusStateLayerOpacity,

    @Deprecated("Use stateLayerOpacity instead") double? hoverStateLayerOpacity,

    @Deprecated("Use stateLayerOpacity instead")
    double? pressedStateLayerOpacity,
  });

  StateThemeDataPartial merge(StateThemeDataPartial? other);

  static StateThemeDataPartial? lerp(
    StateThemeDataPartial? a,
    StateThemeDataPartial? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return StateThemeDataPartial(
      stateLayerOpacity: _lerpProperties<double>(
        a?.stateLayerOpacity,
        b?.stateLayerOpacity,
        t,
        _lerpDouble,
      ),
      draggedStateLayerOpacity: lerpDouble(
        a?.draggedStateLayerOpacity,
        b?.draggedStateLayerOpacity,
        t,
      ),
      focusStateLayerOpacity: lerpDouble(
        a?.focusStateLayerOpacity,
        b?.focusStateLayerOpacity,
        t,
      ),
      hoverStateLayerOpacity: lerpDouble(
        a?.hoverStateLayerOpacity,
        b?.hoverStateLayerOpacity,
        t,
      ),
      pressedStateLayerOpacity: lerpDouble(
        a?.pressedStateLayerOpacity,
        b?.pressedStateLayerOpacity,
        t,
      ),
    );
  }
}

@immutable
class _StateThemeDataPartial
    with Diagnosticable
    implements StateThemeDataPartial {
  const _StateThemeDataPartial({
    WidgetStateProperty<double>? stateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead")
    double? draggedStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead") double? focusStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead") double? hoverStateLayerOpacity,
    @Deprecated("Use stateLayerOpacity instead")
    double? pressedStateLayerOpacity,
  }) : _stateLayerOpacity = stateLayerOpacity,
       _draggedStateLayerOpacity = draggedStateLayerOpacity,
       _focusStateLayerOpacity = focusStateLayerOpacity,
       _hoverStateLayerOpacity = hoverStateLayerOpacity,
       _pressedStateLayerOpacity = pressedStateLayerOpacity;

  final WidgetStateProperty<double>? _stateLayerOpacity;
  final double? _draggedStateLayerOpacity;
  final double? _focusStateLayerOpacity;
  final double? _hoverStateLayerOpacity;
  final double? _pressedStateLayerOpacity;

  @override
  WidgetStateProperty<double>? get stateLayerOpacity =>
      _stateLayerOpacity ??
      WidgetStateProperty.fromMap({
        WidgetState.disabled: 0.0,
        if (_draggedStateLayerOpacity case final draggedStateLayerOpacity?)
          WidgetState.dragged: draggedStateLayerOpacity,
        if (_pressedStateLayerOpacity case final pressedStateLayerOpacity?)
          WidgetState.pressed: pressedStateLayerOpacity,
        if (_hoverStateLayerOpacity case final hoverStateLayerOpacity?)
          WidgetState.pressed: hoverStateLayerOpacity,
        if (_focusStateLayerOpacity case final focusStateLayerOpacity?)
          WidgetState.focused: focusStateLayerOpacity,
        WidgetState.any: 0.0,
      });

  @override
  double? get draggedStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_draggedStates) ?? _draggedStateLayerOpacity;

  @override
  double? get focusStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_focusStates) ?? _focusStateLayerOpacity;

  @override
  double? get hoverStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_hoverStates) ?? _hoverStateLayerOpacity;

  @override
  double? get pressedStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_pressedStates) ?? _pressedStateLayerOpacity;

  @override
  StateThemeDataPartial copyWith({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) {
    if (stateLayerOpacity == null &&
        draggedStateLayerOpacity == null &&
        focusStateLayerOpacity == null &&
        hoverStateLayerOpacity == null &&
        pressedStateLayerOpacity == null) {
      return this;
    }
    return _StateThemeDataPartial(
      stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
      draggedStateLayerOpacity:
          draggedStateLayerOpacity ?? _draggedStateLayerOpacity,
      focusStateLayerOpacity: focusStateLayerOpacity ?? _focusStateLayerOpacity,
      hoverStateLayerOpacity: hoverStateLayerOpacity ?? _hoverStateLayerOpacity,
      pressedStateLayerOpacity:
          pressedStateLayerOpacity ?? _pressedStateLayerOpacity,
    );
  }

  @override
  StateThemeDataPartial merge(StateThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      stateLayerOpacity: other.stateLayerOpacity,
      draggedStateLayerOpacity: other.draggedStateLayerOpacity,
      focusStateLayerOpacity: other.focusStateLayerOpacity,
      hoverStateLayerOpacity: other.hoverStateLayerOpacity,
      pressedStateLayerOpacity: other.pressedStateLayerOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<double>>(
        "stateLayerOpacity",
        stateLayerOpacity,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        "draggedStateLayerOpacity",
        draggedStateLayerOpacity,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        "focusStateLayerOpacity",
        focusStateLayerOpacity,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        "hoverStateLayerOpacity",
        hoverStateLayerOpacity,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        "pressedStateLayerOpacity",
        pressedStateLayerOpacity,
        defaultValue: null,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _StateThemeDataPartial &&
            _stateLayerOpacity == other._stateLayerOpacity &&
            _draggedStateLayerOpacity == other._draggedStateLayerOpacity &&
            _focusStateLayerOpacity == other._focusStateLayerOpacity &&
            _hoverStateLayerOpacity == other._hoverStateLayerOpacity &&
            _pressedStateLayerOpacity == other._pressedStateLayerOpacity;
  }

  @override
  int get hashCode => Object.hash(
    _stateLayerOpacity,
    _draggedStateLayerOpacity,
    _focusStateLayerOpacity,
    _hoverStateLayerOpacity,
    _pressedStateLayerOpacity,
  );
}

@immutable
abstract class StateThemeData
    with Diagnosticable
    implements StateThemeDataPartial {
  const factory StateThemeData({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.fallback() = _StateThemeDataFallback;

  @override
  WidgetStateProperty<double> get stateLayerOpacity;

  @override
  @Deprecated("Use stateLayerOpacity instead")
  double get draggedStateLayerOpacity;

  @override
  @Deprecated("Use stateLayerOpacity instead")
  double get focusStateLayerOpacity;

  @override
  @Deprecated("Use stateLayerOpacity instead")
  double get hoverStateLayerOpacity;

  @override
  @Deprecated("Use stateLayerOpacity instead")
  double get pressedStateLayerOpacity;

  @override
  StateThemeData copyWith({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  });

  @override
  StateThemeData merge(StateThemeDataPartial? other);

  static StateThemeData lerp(StateThemeData a, StateThemeData b, double t) {
    return StateThemeData(
      stateLayerOpacity: _WidgetStatePropertyLerp<double>(
        a.stateLayerOpacity,
        b.stateLayerOpacity,
        t,
        _lerpDouble,
      ),
      draggedStateLayerOpacity: _lerpDouble(
        a.draggedStateLayerOpacity,
        b.draggedStateLayerOpacity,
        t,
      ),
      focusStateLayerOpacity: _lerpDouble(
        a.focusStateLayerOpacity,
        b.focusStateLayerOpacity,
        t,
      ),
      hoverStateLayerOpacity: _lerpDouble(
        a.hoverStateLayerOpacity,
        b.hoverStateLayerOpacity,
        t,
      ),
      pressedStateLayerOpacity: _lerpDouble(
        a.pressedStateLayerOpacity,
        b.pressedStateLayerOpacity,
        t,
      ),
    );
  }
}

class _StateThemeData with Diagnosticable implements StateThemeData {
  const _StateThemeData({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) : assert(
         stateLayerOpacity != null || draggedStateLayerOpacity != null,
         "Must provide stateLayerOpacity or draggedStateLayerOpacity",
       ),
       assert(
         stateLayerOpacity != null || focusStateLayerOpacity != null,
         "Must provide stateLayerOpacity or focusStateLayerOpacity",
       ),
       assert(
         stateLayerOpacity != null || hoverStateLayerOpacity != null,
         "Must provide stateLayerOpacity or hoverStateLayerOpacity",
       ),
       assert(
         stateLayerOpacity != null || pressedStateLayerOpacity != null,
         "Must provide stateLayerOpacity or pressedStateLayerOpacity",
       ),
       _stateLayerOpacity = stateLayerOpacity,
       _draggedStateLayerOpacity = draggedStateLayerOpacity,
       _focusStateLayerOpacity = focusStateLayerOpacity,
       _hoverStateLayerOpacity = hoverStateLayerOpacity,
       _pressedStateLayerOpacity = pressedStateLayerOpacity;

  final WidgetStateProperty<double>? _stateLayerOpacity;
  final double? _draggedStateLayerOpacity;
  final double? _focusStateLayerOpacity;
  final double? _hoverStateLayerOpacity;
  final double? _pressedStateLayerOpacity;

  @override
  WidgetStateProperty<double> get stateLayerOpacity =>
      _stateLayerOpacity ??
      WidgetStateProperty.fromMap({
        WidgetState.disabled: 0.0,
        if (_draggedStateLayerOpacity case final draggedStateLayerOpacity?)
          WidgetState.dragged: draggedStateLayerOpacity,
        if (_pressedStateLayerOpacity case final pressedStateLayerOpacity?)
          WidgetState.pressed: pressedStateLayerOpacity,
        if (_hoverStateLayerOpacity case final hoverStateLayerOpacity?)
          WidgetState.pressed: hoverStateLayerOpacity,
        if (_focusStateLayerOpacity case final focusStateLayerOpacity?)
          WidgetState.focused: focusStateLayerOpacity,
        WidgetState.any: 0.0,
      });

  @override
  double get draggedStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_draggedStates) ?? _draggedStateLayerOpacity!;

  @override
  double get focusStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_focusStates) ?? _focusStateLayerOpacity!;

  @override
  double get hoverStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_hoverStates) ?? _hoverStateLayerOpacity!;

  @override
  double get pressedStateLayerOpacity =>
      _stateLayerOpacity?.resolve(_pressedStates) ?? _pressedStateLayerOpacity!;

  @override
  StateThemeData copyWith({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) {
    if (stateLayerOpacity == null &&
        draggedStateLayerOpacity == null &&
        focusStateLayerOpacity == null &&
        hoverStateLayerOpacity == null &&
        pressedStateLayerOpacity == null) {
      return this;
    }
    return _StateThemeData(
      stateLayerOpacity: stateLayerOpacity ?? _stateLayerOpacity,
      draggedStateLayerOpacity:
          draggedStateLayerOpacity ?? _draggedStateLayerOpacity,
      focusStateLayerOpacity: focusStateLayerOpacity ?? _focusStateLayerOpacity,
      hoverStateLayerOpacity: hoverStateLayerOpacity ?? _hoverStateLayerOpacity,
      pressedStateLayerOpacity:
          pressedStateLayerOpacity ?? _pressedStateLayerOpacity,
    );
  }

  @override
  StateThemeData merge(StateThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      stateLayerOpacity: other.stateLayerOpacity,
      draggedStateLayerOpacity: other.draggedStateLayerOpacity,
      focusStateLayerOpacity: other.focusStateLayerOpacity,
      hoverStateLayerOpacity: other.hoverStateLayerOpacity,
      pressedStateLayerOpacity: other.pressedStateLayerOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<double>>(
        "stateLayerOpacity",
        stateLayerOpacity,
      ),
    );
    properties.add(
      DoubleProperty("draggedStateLayerOpacity", draggedStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("focusStateLayerOpacity", focusStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("hoverStateLayerOpacity", hoverStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("pressedStateLayerOpacity", pressedStateLayerOpacity),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _StateThemeData &&
            _stateLayerOpacity == other._stateLayerOpacity &&
            _draggedStateLayerOpacity == other._draggedStateLayerOpacity &&
            _focusStateLayerOpacity == other._focusStateLayerOpacity &&
            _hoverStateLayerOpacity == other._hoverStateLayerOpacity &&
            _pressedStateLayerOpacity == other._pressedStateLayerOpacity;
  }

  @override
  int get hashCode => Object.hash(
    _stateLayerOpacity,
    _draggedStateLayerOpacity,
    _focusStateLayerOpacity,
    _hoverStateLayerOpacity,
    _pressedStateLayerOpacity,
  );
}

class _StateThemeDataFallback with Diagnosticable implements StateThemeData {
  const _StateThemeDataFallback();

  @override
  WidgetStateProperty<double> get stateLayerOpacity =>
      const WidgetStateProperty.fromMap({
        WidgetState.disabled: 0.0,
        WidgetState.dragged: 0.16,
        WidgetState.pressed: 0.12,
        WidgetState.hovered: 0.08,
        WidgetState.focused: 0.12,
        WidgetState.any: 0.0,
      });

  @override
  double get draggedStateLayerOpacity => 0.16;

  @override
  double get focusStateLayerOpacity => 0.12;

  @override
  double get hoverStateLayerOpacity => 0.08;

  @override
  double get pressedStateLayerOpacity => 0.12;

  @override
  StateThemeData copyWith({
    WidgetStateProperty<double>? stateLayerOpacity,
    double? draggedStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? hoverStateLayerOpacity,
    double? pressedStateLayerOpacity,
  }) {
    if (stateLayerOpacity == null &&
        draggedStateLayerOpacity == null &&
        focusStateLayerOpacity == null &&
        hoverStateLayerOpacity == null &&
        pressedStateLayerOpacity == null) {
      return this;
    }
    return StateThemeData(
      stateLayerOpacity: stateLayerOpacity ?? this.stateLayerOpacity,
      draggedStateLayerOpacity:
          draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
      focusStateLayerOpacity:
          focusStateLayerOpacity ?? this.focusStateLayerOpacity,
      hoverStateLayerOpacity:
          hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
      pressedStateLayerOpacity:
          pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
    );
  }

  @override
  StateThemeData merge(StateThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      stateLayerOpacity: other.stateLayerOpacity,
      draggedStateLayerOpacity: other.draggedStateLayerOpacity,
      focusStateLayerOpacity: other.focusStateLayerOpacity,
      hoverStateLayerOpacity: other.hoverStateLayerOpacity,
      pressedStateLayerOpacity: other.pressedStateLayerOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStateProperty<double>>(
        "stateLayerOpacity",
        stateLayerOpacity,
      ),
    );
    properties.add(
      DoubleProperty("draggedStateLayerOpacity", draggedStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("focusStateLayerOpacity", focusStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("hoverStateLayerOpacity", hoverStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("pressedStateLayerOpacity", pressedStateLayerOpacity),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is StateThemeData &&
            stateLayerOpacity == other.stateLayerOpacity &&
            draggedStateLayerOpacity == other.draggedStateLayerOpacity &&
            focusStateLayerOpacity == other.focusStateLayerOpacity &&
            hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
            pressedStateLayerOpacity == other.pressedStateLayerOpacity;
  }

  @override
  int get hashCode => Object.hash(
    stateLayerOpacity,
    draggedStateLayerOpacity,
    focusStateLayerOpacity,
    hoverStateLayerOpacity,
    pressedStateLayerOpacity,
  );
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

  static Widget merge({
    Key? key,
    required StateThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) =>
              StateTheme(key: key, data: of(context).merge(data), child: child),
    );
  }

  static StateThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateTheme>()?.data;
  }

  static StateThemeData of(BuildContext context) {
    return maybeOf(context) ?? const StateThemeData.fallback();
  }
}

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
