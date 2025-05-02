part of 'state.dart';

abstract class StateThemeDataPartial with Diagnosticable {
  const factory StateThemeDataPartial({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  }) = _StateThemeDataPartial;

  double? get hoverStateLayerOpacity;
  double? get focusStateLayerOpacity;
  double? get pressedStateLayerOpacity;
  double? get draggedStateLayerOpacity;

  StateThemeDataPartial copyWith({
    double? hoverStateLayerOpacity,
    double? focusStateLayerOpacity,
    double? pressedStateLayerOpacity,
    double? draggedStateLayerOpacity,
  });

  StateThemeDataPartial merge(StateThemeDataPartial? other);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

mixin StateThemeDataPartialMixin on Diagnosticable
    implements StateThemeDataPartial {
  @override
  StateThemeDataPartial copyWith({
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
    return StateThemeDataPartial(
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
  StateThemeDataPartial merge(StateThemeDataPartial? other) {
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
      DoubleProperty(
        "hoverStateLayerOpacity",
        hoverStateLayerOpacity,
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
        "pressedStateLayerOpacity",
        pressedStateLayerOpacity,
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
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is StateThemeDataPartial &&
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

class _StateThemeDataPartial with Diagnosticable, StateThemeDataPartialMixin {
  const _StateThemeDataPartial({
    this.hoverStateLayerOpacity,
    this.focusStateLayerOpacity,
    this.pressedStateLayerOpacity,
    this.draggedStateLayerOpacity,
  });

  @override
  final double? hoverStateLayerOpacity;

  @override
  final double? focusStateLayerOpacity;

  @override
  final double? pressedStateLayerOpacity;

  @override
  final double? draggedStateLayerOpacity;
}
