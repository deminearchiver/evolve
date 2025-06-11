part of 'spring.dart';

class SpringTheme extends InheritedTheme {
  const SpringTheme({super.key, required this.data, required super.child});

  final SpringThemeData data;

  @override
  bool updateShouldNotify(covariant SpringTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SpringTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SpringThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required SpringThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        SpringTheme(key: key, data: of(context).merge(data), child: child),
  );

  static SpringThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SpringTheme>()?.data;
  }

  static SpringThemeData of(BuildContext context) {
    return maybeOf(context) ?? const SpringThemeData.fallback();
  }
}
