part of 'shapes.dart';

class CornerRounding {
  const CornerRounding({this.radius = 0.0, this.smoothing = 0.0})
    : assert(radius >= 0.0),
      assert(smoothing >= 0.0 && smoothing <= 1.0);

  final double radius;
  final double smoothing;

  static const CornerRounding unrounded = CornerRounding();
}
