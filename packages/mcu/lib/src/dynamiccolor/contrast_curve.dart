import '../utils/math_utils.dart' as math_utils;

final class ContrastCurve {
  const ContrastCurve(this.low, this.normal, this.medium, this.high);

  final double low;
  final double normal;
  final double medium;
  final double high;

  double get(double contrastLevel) {
    if (contrastLevel <= -1.0) {
      return low;
    } else if (contrastLevel < 0.0) {
      return math_utils.lerp(low, normal, (contrastLevel + 1.0) / 1.0);
    } else if (contrastLevel < 0.5) {
      return math_utils.lerp(normal, medium, (contrastLevel - 0.0) / 0.5);
    } else if (contrastLevel < 1.0) {
      return math_utils.lerp(medium, high, (contrastLevel - 0.5) / 0.5);
    } else {
      return high;
    }
  }

  @override
  String toString() => "ContrastCurve($low, $normal, $medium, $high)";

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ContrastCurve &&
            low == other.low &&
            normal == other.normal &&
            medium == other.medium &&
            high == other.high;
  }

  @override
  int get hashCode => Object.hash(runtimeType, low, normal, medium, high);
}
