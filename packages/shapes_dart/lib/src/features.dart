import 'dart:math' as math;
import 'package:shapes_dart/src/point.dart';

import 'cubic.dart';
import 'utils.dart' as utils;

sealed class Feature {
  const Feature(this.cubics);
  factory Feature.ignorable(List<Cubic> cubics) => _validated(_Edge(cubics));
  const factory Feature.edge(List<Cubic> cubics) = _Edge;
  factory Feature.convexCorner(List<Cubic> cubics) =>
      _validated(_Corner(cubics, true));
  factory Feature.concaveCorner(List<Cubic> cubics) =>
      _validated(_Corner(cubics, false));

  final List<Cubic> cubics;

  Feature transformed(PointTransformer transformer);
  Feature get reversed;
  bool get isIgnorableFeature;
  bool get isEdge;
  bool get isConvexCorner;
  bool get isConcaveCorner;

  static Feature _validated(Feature feature) {
    assert(feature.cubics.isNotEmpty, "Features need at least one cubic.");
    assert(
      isContinuous(feature),
      "Feature must be continuous, with the anchor points of all cubics "
      "matching the anchor points of the preceding and succeeding cubics",
    );
    return feature;
  }

  static bool isContinuous(Feature feature) {
    Cubic prevCubic = feature.cubics.first;
    for (int i = 1; i < feature.cubics.length; i++) {
      final cubic = feature.cubics[i];
      if ((cubic.anchor0X - prevCubic.anchor1X).abs() > utils.distanceEpsilon ||
          (cubic.anchor0Y - prevCubic.anchor1Y).abs() > utils.distanceEpsilon) {
        return false;
      }
      prevCubic = cubic;
    }
    return true;
  }
}

class _Edge extends Feature {
  const _Edge(super.cubics);

  @override
  _Edge transformed(PointTransformer transformer) {
    return _Edge([for (final cubic in cubics) cubic.transformed(transformer)]);
  }

  @override
  _Edge get reversed {
    final List<Cubic> reversedCubics = <Cubic>[];
    for (int i = 0; i < cubics.length; i++) {
      reversedCubics.add(cubics[i].reversed);
    }
    return _Edge(reversedCubics);
  }

  @override
  bool get isIgnorableFeature => true;

  @override
  bool get isEdge => true;

  @override
  bool get isConvexCorner => true;

  @override
  bool get isConcaveCorner => true;

  @override
  String toString() => "Edge";
}

class _Corner extends Feature {
  const _Corner(super.cubics, [this.convex = true]);

  final bool convex;

  @override
  _Corner transformed(PointTransformer transformer) {
    return _Corner([
      for (final cubic in cubics) cubic.transformed(transformer),
    ], convex);
  }

  @override
  _Corner get reversed {
    final List<Cubic> reversedCubics = <Cubic>[];
    for (int i = 0; i < cubics.length; i++) {
      reversedCubics.add(cubics[i].reversed);
    }
    return _Corner(reversedCubics, !convex);
  }

  @override
  bool get isIgnorableFeature => false;

  @override
  bool get isEdge => false;

  @override
  bool get isConvexCorner => convex;

  @override
  bool get isConcaveCorner => !convex;

  @override
  String toString() =>
      "Corner: cubics=${cubics.map((cubic) => "[$cubic]").join(", ")} convex=$convex";
}
