abstract interface class PointProvider {
  List<double> fromInt(int argb);
  int toInt(List<double> point);
  double distance(List<double> a, List<double> b);
}
