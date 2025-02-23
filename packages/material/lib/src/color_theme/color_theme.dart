import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ColorThemeData>("data", data));
  }

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final ColorThemeData? colorTheme = ColorTheme.maybeOf(context);
  /// ```
  ///
  /// Will return null if there is no ancestor [ColorTheme] in the `context`.
  static ColorThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorTheme>()?.data;
  }

  /// The data from the closest [ColorTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to creating an instance of [ColorThemeData] from the closest
  /// [ColorScheme] that encloses the given context if there is no
  /// [ColorTheme] in the given build context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final ColorThemeData colorTheme = ColorTheme.of(context);
  /// ```
  static ColorThemeData of(BuildContext context) {
    final result = maybeOf(context);
    if (result != null) return result;

    final colorScheme = ColorScheme.of(context);
    return ColorThemeData.fromColorScheme(colorScheme);
  }
}
