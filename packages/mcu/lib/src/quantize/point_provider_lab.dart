import 'package:mcu/src/quantize/point_provider.dart';

import '../utils/color_utils.dart' as color_utils;

final class PointProviderLab implements PointProvider {
  @override
  List<double> fromInt(int argb) {
    final lab = color_utils.labFromArgb(argb);
    return [lab[0], lab[1], lab[2]];
  }

  @override
  int toInt(List<double> lab) {
    return color_utils.argbFromLab(lab[0], lab[1], lab[2]);
  }

  @override
  double distance(List<double> one, List<double> two) {
    final dL = (one[0] - two[0]);
    final dA = (one[1] - two[1]);
    final dB = (one[2] - two[2]);
    return (dL * dL + dA * dA + dB * dB);
  }
}
