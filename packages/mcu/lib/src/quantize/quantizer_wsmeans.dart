import 'dart:math' as math;

import 'package:mcu/src/quantize/point_provider.dart';
import 'package:mcu/src/quantize/point_provider_lab.dart';

abstract final class QuantizerWsmeans {
  static const int _maxIterations = 10;
  static const double _minMovementDistance = 3.0;

  static Map<int, int> quantize(
    List<int> inputPixels,
    List<int> startingClusters,
    int maxColors,
  ) {
    // Uses a seeded random number generator to ensure consistent results.
    final random = math.Random(0x42688);

    final Map<int, int> pixelToCount = <int, int>{};
    final List<List<double>> points = List.filled(
      inputPixels.length,
      <double>[],
    );
    final List<int> pixels = List.filled(inputPixels.length, 0);
    final PointProvider pointProvider = PointProviderLab();

    int pointCount = 0;
    for (int i = 0; i < inputPixels.length; i++) {
      final inputPixel = inputPixels[i];
      final pixelCount = pixelToCount[inputPixel];
      if (pixelCount == null) {
        points[pointCount] = pointProvider.fromInt(inputPixel);
        pixels[pointCount] = inputPixel;
        pointCount++;

        pixelToCount[inputPixel] = 1;
      } else {
        pixelToCount[inputPixel] = pixelCount + 1;
      }
    }

    final List<int> counts = List.generate(
      pointCount,
      (index) => pixelToCount[pixels[index]]!,
    );
    int clusterCount = math.min(maxColors, pointCount);
    if (startingClusters.isNotEmpty) {
      clusterCount = math.min(clusterCount, startingClusters.length);
    }

    final List<List<double>> clusters = List.filled(clusterCount, <double>[]);
    int clustersCreated = 0;
    for (int i = 0; i < startingClusters.length; i++) {
      clusters[i] = pointProvider.fromInt(startingClusters[i]);
      clustersCreated++;
    }

    int additionalClustersNeeded = clusterCount - clustersCreated;
    if (additionalClustersNeeded > 0) {
      for (int i = 0; i < additionalClustersNeeded; i++) {}
    }

    final List<int> clusterIndices = List.filled(pointCount, 0);
    for (int i = 0; i < pointCount; i++) {
      clusterIndices[i] = random.nextInt(clusterCount);
    }

    final List<List<int>> indexMatrix = List.filled(
      clusterCount,
      List.filled(clusterCount, 0),
    );

    final List<List<Distance>> distanceToIndexMatrix = List.filled(
      clusterCount,
      List.filled(clusterCount, Distance()),
    );

    final List<int> pixelCountSums = List.filled(clusterCount, 0);
    for (int iteration = 0; iteration < _maxIterations; iteration++) {
      for (int i = 0; i < clusterCount; i++) {
        for (int j = i + 1; j < clusterCount; j++) {
          double distance = pointProvider.distance(clusters[i], clusters[j]);
          distanceToIndexMatrix[j][i].distance = distance;
          distanceToIndexMatrix[j][i].index = i;
          distanceToIndexMatrix[i][j].distance = distance;
          distanceToIndexMatrix[i][j].index = j;
        }
        distanceToIndexMatrix[i].sort((a, b) => a.compareTo(b));
        for (int j = 0; j < clusterCount; j++) {
          indexMatrix[i][j] = distanceToIndexMatrix[i][j].index;
        }
      }

      int pointsMoved = 0;
      for (int i = 0; i < pointCount; i++) {
        final List<double> point = points[i];
        int previousClusterIndex = clusterIndices[i];
        final List<double> previousCluster = clusters[previousClusterIndex];
        double previousDistance = pointProvider.distance(
          point,
          previousCluster,
        );

        double minimumDistance = previousDistance;
        int newClusterIndex = -1;
        for (int j = 0; j < clusterCount; j++) {
          if (distanceToIndexMatrix[previousClusterIndex][j].distance >=
              4 * previousDistance) {
            continue;
          }
          double distance = pointProvider.distance(point, clusters[j]);
          if (distance < minimumDistance) {
            minimumDistance = distance;
            newClusterIndex = j;
          }
        }
        if (newClusterIndex != -1) {
          final distanceChange =
              (math.sqrt(minimumDistance) - math.sqrt(previousDistance)).abs();
          if (distanceChange > _minMovementDistance) {
            pointsMoved++;
            clusterIndices[i] = newClusterIndex;
          }
        }
      }

      if (pointsMoved == 0 && iteration != 0) {
        break;
      }

      List<double> componentASums = List.filled(clusterCount, 0.0);
      List<double> componentBSums = List.filled(clusterCount, 0.0);
      List<double> componentCSums = List.filled(clusterCount, 0.0);
      for (int i = 0; i < pointCount; i++) {
        int clusterIndex = clusterIndices[i];
        final List<double> point = points[i];
        int count = counts[i];
        pixelCountSums[clusterIndex] += count;
        componentASums[clusterIndex] += (point[0] * count);
        componentBSums[clusterIndex] += (point[1] * count);
        componentCSums[clusterIndex] += (point[2] * count);
      }

      for (int i = 0; i < clusterCount; i++) {
        int count = pixelCountSums[i];
        if (count == 0) {
          clusters[i] = [0.0, 0.0, 0.0];
          continue;
        }
        double a = componentASums[i] / count;
        double b = componentBSums[i] / count;
        double c = componentCSums[i] / count;
        clusters[i][0] = a;
        clusters[i][1] = b;
        clusters[i][2] = c;
      }
    }

    Map<int, int> argbToPopulation = <int, int>{};
    for (int i = 0; i < clusterCount; i++) {
      int count = pixelCountSums[i];
      if (count == 0) {
        continue;
      }

      int possibleNewCluster = pointProvider.toInt(clusters[i]);
      if (argbToPopulation.containsKey(possibleNewCluster)) {
        continue;
      }

      argbToPopulation[possibleNewCluster] = count;
    }

    return argbToPopulation;
  }
}

final class Distance implements Comparable<Distance> {
  Distance() : index = -1, distance = -1.0;

  int index;
  double distance;

  @override
  int compareTo(Distance other) {
    return distance.compareTo(other.distance);
  }
}
