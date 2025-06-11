part of 'motion.dart';

class DurationTheme extends InheritedTheme {
  const DurationTheme({super.key, required this.data, required super.child});

  final DurationThemeData data;

  @override
  bool updateShouldNotify(covariant DurationTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DurationTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DurationThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required DurationThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        DurationTheme(key: key, data: of(context).merge(data), child: child),
  );

  static DurationThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DurationTheme>()?.data;
  }

  static DurationThemeData of(BuildContext context) {
    return maybeOf(context) ?? const DurationThemeData.fallback();
  }
}
