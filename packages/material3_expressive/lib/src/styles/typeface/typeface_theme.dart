part of 'typeface.dart';

class TypefaceTheme extends InheritedTheme {
  const TypefaceTheme({super.key, required this.data, required super.child});

  final TypefaceThemeData data;

  @override
  bool updateShouldNotify(covariant TypefaceTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TypefaceTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TypefaceThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required TypefaceThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        TypefaceTheme(key: key, data: of(context).merge(data), child: child),
  );

  static TypefaceThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TypefaceTheme>()?.data;
  }

  static TypefaceThemeData of(BuildContext context) {
    return maybeOf(context) ?? const TypefaceThemeData.fallback();
  }
}
