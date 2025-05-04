import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'spring_theme_data_partial.dart';
part 'spring_theme_data.dart';
part 'spring_theme.dart';

/// Structure that describes a spring's constants.
class SpringPartial with Diagnosticable {
  /// Creates a spring given the stiffness (k), and damping ratio (ζ).
  /// The damping ratio describes a gradual reduction in a spring oscillation.
  /// By using the damping ratio, you can define how rapidly the oscillations
  /// decay from one bounce to the next.
  ///
  /// The damping ratio is especially useful when trying to determining the type
  /// of spring to create. A ratio of 1.0 creates a critically damped
  /// spring, > 1.0 creates an overdamped spring and < 1.0 an underdamped one.
  ///
  /// See [stiffness] for the units for that argument.
  /// The damping ratio is unitless.
  const SpringPartial({this.stiffness, this.damping});

  /// The spring constant (k).
  ///
  /// The units of stiffness are M/T², where M is the mass unit,
  /// and T is the time unit.
  ///
  /// Stiffness defines the spring constant, which measures the strength of
  /// the spring. A stiff spring applies more force to the object that is
  /// attached for some deviation from the rest position.
  final double? stiffness;

  /// The damping ratio describes a gradual reduction in a spring oscillation.
  /// By using the damping ratio, you can define how rapidly the oscillations
  /// decay from one bounce to the next.
  final double? damping;

  SpringPartial copyWith({double? stiffness, double? damping}) {
    if (stiffness == null && damping == null) {
      return this;
    }
    return SpringPartial(
      stiffness: stiffness ?? this.stiffness,
      damping: damping ?? this.damping,
    );
  }

  SpringPartial merge(SpringPartial? other) {
    if (other == null) return this;
    return copyWith(stiffness: other.stiffness, damping: other.damping);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("stiffness", stiffness, defaultValue: null));
    properties.add(DoubleProperty("damping", damping, defaultValue: null));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpringPartial &&
            runtimeType == other.runtimeType &&
            stiffness == other.stiffness &&
            damping == other.damping;
  }

  @override
  int get hashCode => Object.hash(stiffness, damping);
}

class Spring with Diagnosticable implements SpringPartial {
  const Spring({required this.stiffness, required this.damping});

  @override
  final double stiffness;

  @override
  final double damping;

  @override
  Spring copyWith({double? stiffness, double? damping}) {
    if (stiffness == null && damping == null) {
      return this;
    }
    return Spring(
      stiffness: stiffness ?? this.stiffness,
      damping: damping ?? this.damping,
    );
  }

  @override
  Spring merge(SpringPartial? other) {
    if (other == null) return this;
    return copyWith(stiffness: other.stiffness, damping: other.damping);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("stiffness", stiffness));
    properties.add(DoubleProperty("damping", damping));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Spring &&
            runtimeType == other.runtimeType &&
            stiffness == other.stiffness &&
            damping == other.damping;
  }

  @override
  int get hashCode => Object.hash(stiffness, damping);

  SpringDescription toSpringDescription() =>
      SpringDescription(mass: 1.0, stiffness: stiffness, damping: damping);
}
