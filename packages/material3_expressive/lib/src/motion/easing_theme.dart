part of 'motion.dart';

class EasingTheme extends InheritedTheme {
  const EasingTheme({super.key, required this.data, required super.child});

  final EasingThemeData data;

  @override
  bool updateShouldNotify(covariant EasingTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return EasingTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<EasingThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required EasingThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        EasingTheme(key: key, data: of(context).merge(data), child: child),
  );

  static EasingThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasingTheme>()?.data;
  }

  static EasingThemeData of(BuildContext context) {
    return maybeOf(context) ?? const EasingThemeData.fallback();
  }
}
