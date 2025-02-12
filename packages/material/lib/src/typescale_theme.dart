import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class Typescale with Diagnosticable {
  const Typescale({
    required this.font,
    required this.weight,
    required this.size,
    required this.lineHeight,
    required this.tracking,
  });

  final String font;
  final double weight;
  final double size;
  final double lineHeight;
  final double tracking;

  TextStyle toTextStyle({required Color color}) {
    final weight = this.weight.round();
    return TextStyle(
      fontFamily: font,
      color: color,
      fontSize: size,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.values.reduce(
        (previous, current) =>
            (current.value - weight).abs() < (previous.value - weight)
                ? current
                : previous,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("font", font));
    properties.add(DoubleProperty("weight", weight));
    properties.add(DoubleProperty("size", size));
    properties.add(DoubleProperty("lineHeight", lineHeight));
    properties.add(DoubleProperty("tracking", tracking));
  }
}
