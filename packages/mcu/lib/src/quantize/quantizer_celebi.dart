import 'package:mcu/src/quantize/quantizer_wsmeans.dart';
import 'package:mcu/src/quantize/quantizer_wu.dart';

abstract final class QuantizerCelebi {
  static Map<int, int> quantize(List<int> pixels, int maxColors) {
    final wu = QuantizerWu();
    final wuResult = wu.quantize(pixels, maxColors);
    final Set<int> wuClustersAsObjects = wuResult.colorToCount.keys.toSet();
    int index = 0;
    final List<int> wuClusters = List.filled(wuClustersAsObjects.length, 0);
    for (final argb in wuClustersAsObjects) {
      wuClusters[index++] = argb;
    }
    return QuantizerWsmeans.quantize(pixels, wuClusters, maxColors);
  }
}
