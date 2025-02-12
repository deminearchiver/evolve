import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
abstract class _ButtonThemeData with Diagnosticable {
  const _ButtonThemeData({this.style});

  final ButtonStyle? style;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ButtonStyle?>("style", style, defaultValue: null),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ElevatedButtonThemeData && style == other.style;
  }

  @override
  int get hashCode => style.hashCode;
}

abstract class _ButtonTheme<T extends _ButtonThemeData> extends InheritedTheme {
  const _ButtonTheme({super.key, required this.data, required super.child});

  final T data;

  @override
  bool updateShouldNotify(covariant _ButtonTheme<T> oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child);
}

@immutable
class ElevatedButtonThemeData extends _ButtonThemeData {
  const ElevatedButtonThemeData({super.style});
}

class ElevatedButtonTheme extends _ButtonTheme<ElevatedButtonThemeData> {
  const ElevatedButtonTheme({
    super.key,
    required super.data,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ElevatedButtonTheme(data: data, child: child);
  }

  static ElevatedButtonThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ElevatedButtonTheme>()
        ?.data;
  }

  static ElevatedButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const ElevatedButtonThemeData();
  }
}

@immutable
class FilledButtonThemeData extends _ButtonThemeData {
  const FilledButtonThemeData({super.style});
}

class FilledButtonTheme extends _ButtonTheme<FilledButtonThemeData> {
  const FilledButtonTheme({
    super.key,
    required super.data,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    return FilledButtonTheme(data: data, child: child);
  }

  static FilledButtonThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FilledButtonTheme>()
        ?.data;
  }

  static FilledButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const FilledButtonThemeData();
  }
}

@immutable
class FilledTonalButtonThemeData extends _ButtonThemeData {
  const FilledTonalButtonThemeData({super.style});
}

class FilledTonalButtonTheme extends _ButtonTheme<FilledTonalButtonThemeData> {
  const FilledTonalButtonTheme({
    super.key,
    required super.data,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    return FilledTonalButtonTheme(data: data, child: child);
  }

  static FilledTonalButtonThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FilledTonalButtonTheme>()
        ?.data;
  }

  static FilledTonalButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const FilledTonalButtonThemeData();
  }
}

@immutable
class OutlinedButtonThemeData extends _ButtonThemeData {
  const OutlinedButtonThemeData({super.style});
}

class OutlinedButtonTheme extends _ButtonTheme<OutlinedButtonThemeData> {
  const OutlinedButtonTheme({
    super.key,
    required super.data,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    return OutlinedButtonTheme(data: data, child: child);
  }

  static OutlinedButtonThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<OutlinedButtonTheme>()
        ?.data;
  }

  static OutlinedButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const OutlinedButtonThemeData();
  }
}

@immutable
class TextButtonThemeData extends _ButtonThemeData {
  const TextButtonThemeData({super.style});
}

class TextButtonTheme extends _ButtonTheme<TextButtonThemeData> {
  const TextButtonTheme({super.key, required super.data, required super.child});

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TextButtonTheme(data: data, child: child);
  }

  static TextButtonThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TextButtonTheme>()?.data;
  }

  static TextButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const TextButtonThemeData();
  }
}
