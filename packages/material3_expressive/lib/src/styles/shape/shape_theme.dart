part of 'shape.dart';

class ShapeTheme extends InheritedTheme {
  const ShapeTheme({super.key, required this.data, required super.child});

  final ShapeThemeData data;

  @override
  bool updateShouldNotify(covariant ShapeTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ShapeTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ShapeThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required ShapeThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        ShapeTheme(key: key, data: of(context).merge(data), child: child),
  );

  static ShapeThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShapeTheme>()?.data;
  }

  static ShapeThemeData of(BuildContext context) {
    return maybeOf(context) ?? const ShapeThemeData.fallback();
  }
}
