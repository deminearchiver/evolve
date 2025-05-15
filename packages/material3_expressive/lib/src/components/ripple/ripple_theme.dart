import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material3_expressive/material3_expressive.dart';

abstract class RippleThemeDataPartial with Diagnosticable {
  const factory RippleThemeDataPartial({
    Color? hoverColor,
    double? hoverOpacity,
    Color? pressedColor,
    double? pressedOpacity,
  }) = _RippleThemeDataPartial;

  const factory RippleThemeDataPartial.fromStateTheme({
    StateThemeDataPartial? stateTheme,
    Color? hoverColor,
    Color? pressedColor,
  }) = _RippleThemeDataPartialFromStateTheme;

  Color? get hoverColor;
  double? get hoverOpacity;
  Color? get pressedColor;
  double? get pressedOpacity;

  RippleThemeDataPartial copyWith({
    Color? hoverColor,
    double? hoverOpacity,
    Color? pressedColor,
    double? pressedOpacity,
  });

  RippleThemeDataPartial merge(RippleThemeDataPartial? other);
}

mixin RippleThemeDataPartialMixin on Diagnosticable
    implements RippleThemeDataPartial {
  @override
  RippleThemeDataPartial copyWith({
    Color? hoverColor,
    double? hoverOpacity,
    Color? pressedColor,
    double? pressedOpacity,
  }) {
    if (hoverColor == null &&
        hoverOpacity == null &&
        pressedColor == null &&
        pressedOpacity == null) {
      return this;
    }
    return RippleThemeDataPartial(
      hoverColor: hoverColor ?? this.hoverColor,
      hoverOpacity: hoverOpacity ?? this.hoverOpacity,
      pressedColor: pressedColor ?? this.pressedColor,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
    );
  }

  @override
  RippleThemeDataPartial merge(RippleThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      hoverColor: other.hoverColor,
      hoverOpacity: other.hoverOpacity,
      pressedColor: other.pressedColor,
      pressedOpacity: other.pressedOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("hoverColor", hoverColor, defaultValue: null));
    properties.add(
      DoubleProperty("hoverOpacity", hoverOpacity, defaultValue: null),
    );
    properties.add(
      ColorProperty("pressedColor", pressedColor, defaultValue: null),
    );
    properties.add(
      DoubleProperty("pressedOpacity", pressedOpacity, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is RippleThemeDataPartial &&
            hoverColor == other.hoverColor &&
            hoverOpacity == other.hoverOpacity &&
            pressedColor == other.pressedColor &&
            pressedOpacity == other.pressedOpacity;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoverColor,
    hoverOpacity,
    pressedColor,
    pressedOpacity,
  );
}

class _RippleThemeDataPartial with Diagnosticable, RippleThemeDataPartialMixin {
  const _RippleThemeDataPartial({
    this.hoverColor,
    this.hoverOpacity,
    this.pressedColor,
    this.pressedOpacity,
  });

  @override
  final Color? hoverColor;

  @override
  final double? hoverOpacity;

  @override
  final Color? pressedColor;

  @override
  final double? pressedOpacity;
}

class _RippleThemeDataPartialFromStateTheme
    with Diagnosticable, RippleThemeDataPartialMixin {
  const _RippleThemeDataPartialFromStateTheme({
    StateThemeDataPartial? stateTheme,
    this.hoverColor,
    this.pressedColor,
  }) : _stateTheme = stateTheme;

  final StateThemeDataPartial? _stateTheme;

  @override
  final Color? hoverColor;

  @override
  double? get hoverOpacity => _stateTheme?.hoverStateLayerOpacity;

  @override
  final Color? pressedColor;

  @override
  double? get pressedOpacity => _stateTheme?.pressedStateLayerOpacity;
}

abstract class RippleThemeData
    with Diagnosticable
    implements RippleThemeDataPartial {
  const factory RippleThemeData({
    required Color hoverColor,
    required double hoverOpacity,
    required Color pressedColor,
    required double pressedOpacity,
  }) = _RippleThemeData;

  const factory RippleThemeData.fromStateTheme({
    required StateThemeData stateTheme,
    required Color hoverColor,
    required Color pressedColor,
  }) = _RippleThemeDataFromStateTheme;

  const factory RippleThemeData.fallback({
    required ColorThemeData colorTheme,
    required StateThemeData stateTheme,
  }) = _RippleThemeDataFallback;

  @override
  Color get hoverColor;

  @override
  double get hoverOpacity;

  @override
  Color get pressedColor;

  @override
  double get pressedOpacity;

  @override
  RippleThemeData copyWith({
    Color? hoverColor,
    double? hoverOpacity,
    Color? pressedColor,
    double? pressedOpacity,
  });

  @override
  RippleThemeData merge(RippleThemeDataPartial? other);
}

mixin RippleThemeDataMixin on Diagnosticable implements RippleThemeData {
  @override
  RippleThemeData copyWith({
    Color? hoverColor,
    double? hoverOpacity,
    Color? pressedColor,
    double? pressedOpacity,
  }) {
    if (hoverColor == null &&
        hoverOpacity == null &&
        pressedColor == null &&
        pressedOpacity == null) {
      return this;
    }
    return RippleThemeData(
      hoverColor: hoverColor ?? this.hoverColor,
      hoverOpacity: hoverOpacity ?? this.hoverOpacity,
      pressedColor: pressedColor ?? this.pressedColor,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
    );
  }

  @override
  RippleThemeData merge(RippleThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      hoverColor: other.hoverColor,
      hoverOpacity: other.hoverOpacity,
      pressedColor: other.pressedColor,
      pressedOpacity: other.pressedOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty("hoverColor", hoverColor));
    properties.add(DoubleProperty("hoverOpacity", hoverOpacity));
    properties.add(ColorProperty("pressedColor", pressedColor));
    properties.add(DoubleProperty("pressedOpacity", pressedOpacity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is RippleThemeData &&
            hoverColor == other.hoverColor &&
            hoverOpacity == other.hoverOpacity &&
            pressedColor == other.pressedColor &&
            pressedOpacity == other.pressedOpacity;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hoverColor,
    hoverOpacity,
    pressedColor,
    pressedOpacity,
  );
}

class _RippleThemeData with Diagnosticable, RippleThemeDataMixin {
  const _RippleThemeData({
    required this.hoverColor,
    required this.hoverOpacity,
    required this.pressedColor,
    required this.pressedOpacity,
  });

  @override
  final Color hoverColor;

  @override
  final double hoverOpacity;

  @override
  final Color pressedColor;

  @override
  final double pressedOpacity;
}

class _RippleThemeDataFromStateTheme with Diagnosticable, RippleThemeDataMixin {
  const _RippleThemeDataFromStateTheme({
    required StateThemeData stateTheme,
    required this.hoverColor,
    required this.pressedColor,
  }) : _stateTheme = stateTheme;

  final StateThemeData _stateTheme;

  @override
  final Color hoverColor;

  @override
  double get hoverOpacity => _stateTheme.hoverStateLayerOpacity;

  @override
  final Color pressedColor;

  @override
  double get pressedOpacity => _stateTheme.pressedStateLayerOpacity;
}

class _RippleThemeDataFallback with Diagnosticable, RippleThemeDataMixin {
  const _RippleThemeDataFallback({
    required ColorThemeData colorTheme,
    required StateThemeData stateTheme,
  }) : _colorTheme = colorTheme,
       _stateTheme = stateTheme;

  final ColorThemeData _colorTheme;
  final StateThemeData _stateTheme;

  @override
  Color get hoverColor => _colorTheme.onSurface;

  @override
  double get hoverOpacity => _stateTheme.hoverStateLayerOpacity;

  @override
  Color get pressedColor => _colorTheme.onSurface;

  @override
  double get pressedOpacity => _stateTheme.pressedStateLayerOpacity;
}

class RippleTheme extends InheritedTheme {
  const RippleTheme({super.key, required this.data, required super.child});

  final RippleThemeData data;

  @override
  bool updateShouldNotify(RippleTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return RippleTheme(data: data, child: child);
  }

  static RippleThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RippleTheme>()?.data;
  }

  static RippleThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    return RippleThemeData.fallback(
      colorTheme: ColorTheme.of(context),
      stateTheme: StateTheme.of(context),
    );
  }
}
