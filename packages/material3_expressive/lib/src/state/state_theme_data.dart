part of 'state.dart';

@immutable
abstract class StateThemeData
    with Diagnosticable
    implements StateThemeDataPartial {
  const factory StateThemeData({
    required double hoverStateLayerOpacity,
    required double focusStateLayerOpacity,
    required double pressedStateLayerOpacity,
    required double draggedStateLayerOpacity,
  }) = _StateThemeData;

  const factory StateThemeData.fallback() = _StateThemeData.fallback;

  @override
  double get hoverStateLayerOpacity;

  @override
  double get focusStateLayerOpacity;

  @override
  double get pressedStateLayerOpacity;

  @override
  double get draggedStateLayerOpacity;

  @override
  StateThemeData copyWith({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  });

  @override
  StateThemeData merge(StateThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin StateThemeDataMixin on Diagnosticable implements StateThemeData {
  @override
  StateThemeData copyWith({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  }) {
    if (hoverStateLayerOpacity == null &&
        focusStateLayerOpacity == null &&
        pressedStateLayerOpacity == null &&
        draggedStateLayerOpacity == null) {
      return this;
    }
    return StateThemeData(
      hoverStateLayerOpacity:
          hoverStateLayerOpacity ?? this.hoverStateLayerOpacity,
      focusStateLayerOpacity:
          focusStateLayerOpacity ?? this.focusStateLayerOpacity,
      pressedStateLayerOpacity:
          pressedStateLayerOpacity ?? this.pressedStateLayerOpacity,
      draggedStateLayerOpacity:
          draggedStateLayerOpacity ?? this.draggedStateLayerOpacity,
    );
  }

  @override
  StateThemeData merge(StateThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      hoverStateLayerOpacity: other.hoverStateLayerOpacity,
      focusStateLayerOpacity: other.focusStateLayerOpacity,
      pressedStateLayerOpacity: other.pressedStateLayerOpacity,
      draggedStateLayerOpacity: other.draggedStateLayerOpacity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DoubleProperty("hoverStateLayerOpacity", hoverStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("focusStateLayerOpacity", focusStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("pressedStateLayerOpacity", pressedStateLayerOpacity),
    );
    properties.add(
      DoubleProperty("draggedStateLayerOpacity", draggedStateLayerOpacity),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is StateThemeData &&
            hoverStateLayerOpacity == other.hoverStateLayerOpacity &&
            focusStateLayerOpacity == other.focusStateLayerOpacity &&
            pressedStateLayerOpacity == other.pressedStateLayerOpacity &&
            draggedStateLayerOpacity == other.draggedStateLayerOpacity;
  }

  @override
  int get hashCode => Object.hash(
    hoverStateLayerOpacity,
    focusStateLayerOpacity,
    pressedStateLayerOpacity,
    draggedStateLayerOpacity,
  );
}

@immutable
class _StateThemeData with Diagnosticable, StateThemeDataMixin {
  const _StateThemeData({
    required this.hoverStateLayerOpacity,
    required this.focusStateLayerOpacity,
    required this.pressedStateLayerOpacity,
    required this.draggedStateLayerOpacity,
  });

  const _StateThemeData.fallback()
    : hoverStateLayerOpacity = 0.08,
      focusStateLayerOpacity = 0.1,
      pressedStateLayerOpacity = 0.1,
      draggedStateLayerOpacity = 0.16;

  @override
  final double hoverStateLayerOpacity;

  @override
  final double focusStateLayerOpacity;

  @override
  final double pressedStateLayerOpacity;

  @override
  final double draggedStateLayerOpacity;
}
