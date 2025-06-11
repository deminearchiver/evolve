part of 'state.dart';

class StateTheme extends InheritedTheme {
  const StateTheme({super.key, required this.data, required super.child});

  final StateThemeData data;

  @override
  bool updateShouldNotify(covariant StateTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return StateTheme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<StateThemeData>("data", data));
  }

  static Widget merge({
    Key? key,
    required StateThemeDataPartial data,
    required Widget child,
  }) => Builder(
    builder: (context) =>
        StateTheme(key: key, data: of(context).merge(data), child: child),
  );

  static StateThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateTheme>()?.data;
  }

  static StateThemeData of(BuildContext context) {
    return maybeOf(context) ?? const StateThemeData.fallback();
  }
}
