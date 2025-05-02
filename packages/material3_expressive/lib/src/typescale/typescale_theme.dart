part of 'typescale.dart';

class TypescaleTheme extends InheritedTheme {
  const TypescaleTheme({super.key, required this.data, required super.child});

  final TypescaleThemeData data;

  @override
  bool updateShouldNotify(covariant TypescaleTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TypescaleTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypescaleThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required TypescaleThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        TypescaleTheme(key: key, data: of(context).merge(data), child: child),
  );

  static TypescaleThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypescaleTheme>()?.data;
  }

  static TypescaleThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;
    return TypescaleThemeData.fallback(context);
  }
}
