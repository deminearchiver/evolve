import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

abstract class ThemeBase<T extends Diagnosticable> extends InheritedTheme {
  const ThemeBase({super.key, required this.data, required super.child});

  final T data;

  @override
  bool updateShouldNotify(covariant ThemeBase oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child);
}

class Theme extends StatefulWidget {
  const Theme({super.key});

  @override
  State<Theme> createState() => _ThemeState();
}

class _ThemeState extends State<Theme> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
