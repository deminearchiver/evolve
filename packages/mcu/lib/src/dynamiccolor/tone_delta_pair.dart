import 'package:mcu/src/dynamiccolor/dynamic_color.dart';
import 'package:mcu/src/dynamiccolor/tone_polarity.dart';

enum DeltaConstraint { exact, nearer, farther }

class ToneDeltaPair {
  const ToneDeltaPair(
    this.roleA,
    this.roleB,
    this.delta,
    this.polarity, [
    this.stayTogether = true,
    this.constraint = DeltaConstraint.exact,
  ]);

  const ToneDeltaPair.withConstraint(
    this.roleA,
    this.roleB,
    this.delta,
    this.polarity,
    this.constraint,
  ) : stayTogether = true;

  final DynamicColor roleA;
  final DynamicColor roleB;
  final double delta;
  final TonePolarity polarity;
  final bool stayTogether;
  final DeltaConstraint constraint;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ToneDeltaPair &&
            roleA == other.roleA &&
            roleB == other.roleB &&
            delta == other.delta &&
            polarity == other.polarity &&
            stayTogether == other.stayTogether &&
            constraint == other.constraint;
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roleA,
    roleB,
    delta,
    polarity,
    stayTogether,
    constraint,
  );
}
