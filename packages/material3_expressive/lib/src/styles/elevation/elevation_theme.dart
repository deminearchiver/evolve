part of 'elevation.dart';

class ElevationTheme extends InheritedTheme {
  const ElevationTheme({super.key, required this.data, required super.child});

  final ElevationThemeData data;

  @override
  bool updateShouldNotify(covariant ElevationTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ElevationTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ElevationThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required ElevationThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        ElevationTheme(key: key, data: of(context).merge(data), child: child),
  );

  static ElevationThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElevationTheme>()?.data;
  }

  static ElevationThemeData of(BuildContext context) {
    return maybeOf(context) ?? const ElevationThemeData.fallback();
  }
}
