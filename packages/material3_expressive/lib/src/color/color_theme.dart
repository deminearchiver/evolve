part of 'color.dart';

class ColorTheme extends InheritedTheme {
  const ColorTheme({super.key, required this.data, required super.child});

  final ColorThemeData data;

  @override
  bool updateShouldNotify(covariant ColorTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ColorTheme(data: data, child: child);
  }

  static Widget merge({
    Key? key,
    required ColorThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        ColorTheme(key: key, data: of(context).merge(data), child: child),
  );

  static ColorThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorTheme>()?.data;
  }

  static ColorThemeData of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null);
    return result!;
  }
}
