// import 'package:material/material.dart';

// class IconButtonThemeData {
//   const IconButtonThemeData({this.style});

//   final ButtonStyle? style;
// }

// class IconButtonTheme extends InheritedTheme {
//   const IconButtonTheme({super.key, required this.data, required super.child});

//   final IconButtonThemeData data;

//   @override
//   bool updateShouldNotify(covariant IconButtonTheme oldWidget) {
//     return data != oldWidget.data;
//   }

//   @override
//   Widget wrap(BuildContext context, Widget child) {
//     return IconButtonTheme(data: data, child: child);
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

class IconButtonThemeDataPartial with Diagnosticable {
  const IconButtonThemeDataPartial({
    this.style,
    this.unselectedStyle,
    this.selectedStyle,
  });

  final ButtonStyle? style;

  final ButtonStyle? unselectedStyle;

  final ButtonStyle? selectedStyle;

  IconButtonThemeDataPartial copyWith({
    ButtonStyle? style,
    ButtonStyle? unselectedStyle,
    ButtonStyle? selectedStyle,
  }) {
    if (style == null && unselectedStyle == null && selectedStyle == null) {
      return this;
    }
    return IconButtonThemeDataPartial(
      style: style ?? this.style,
      unselectedStyle: unselectedStyle ?? this.unselectedStyle,
      selectedStyle: selectedStyle ?? this.selectedStyle,
    );
  }

  IconButtonThemeDataPartial merge(IconButtonThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      style: other.style,
      unselectedStyle: other.unselectedStyle,
      selectedStyle: other.selectedStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("style", style));
    properties.add(DiagnosticsProperty("selectedStyle", selectedStyle));
    properties.add(DiagnosticsProperty("unselectedStyle", unselectedStyle));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IconButtonThemeDataPartial &&
            style == other.style &&
            unselectedStyle == other.unselectedStyle &&
            selectedStyle == other.selectedStyle;
  }

  @override
  int get hashCode => Object.hash(style, unselectedStyle, selectedStyle);
}

class IconButtonThemeData
    with Diagnosticable
    implements IconButtonThemeDataPartial {
  const IconButtonThemeData({
    required this.style,
    required this.unselectedStyle,
    required this.selectedStyle,
  });

  const IconButtonThemeData.fallback()
    : style = const ButtonStyle(),
      unselectedStyle = const ButtonStyle(),
      selectedStyle = const ButtonStyle();

  @override
  final ButtonStyle style;

  @override
  final ButtonStyle unselectedStyle;

  @override
  final ButtonStyle selectedStyle;

  @override
  IconButtonThemeData copyWith({
    ButtonStyle? style,
    ButtonStyle? unselectedStyle,
    ButtonStyle? selectedStyle,
  }) {
    if (style == null && unselectedStyle == null && selectedStyle == null) {
      return this;
    }
    return IconButtonThemeData(
      style: style ?? this.style,
      unselectedStyle: unselectedStyle ?? this.unselectedStyle,
      selectedStyle: selectedStyle ?? this.selectedStyle,
    );
  }

  @override
  IconButtonThemeData merge(IconButtonThemeDataPartial? other) {
    if (other == null) return this;
    return copyWith(
      style: other.style,
      unselectedStyle: other.unselectedStyle,
      selectedStyle: other.selectedStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty("style", style));
    properties.add(DiagnosticsProperty("selectedStyle", selectedStyle));
    properties.add(DiagnosticsProperty("unselectedStyle", unselectedStyle));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IconButtonThemeData &&
            style == other.style &&
            unselectedStyle == other.unselectedStyle &&
            selectedStyle == other.selectedStyle;
  }

  @override
  int get hashCode => Object.hash(style, unselectedStyle, selectedStyle);
}

class IconButtonTheme extends InheritedTheme {
  const IconButtonTheme({super.key, required this.data, required super.child});

  final IconButtonThemeData data;

  @override
  bool updateShouldNotify(covariant IconButtonTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return IconButtonTheme(data: data, child: child);
  }

  static Widget merge({
    Key? key,
    required IconButtonThemeDataPartial data,
    required Widget child,
  }) {
    return Builder(
      builder:
          (context) => IconButtonTheme(
            key: key,
            data: of(context).merge(data),
            child: child,
          ),
    );
  }

  static IconButtonThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IconButtonTheme>()?.data;
  }

  static IconButtonThemeData of(BuildContext context) {
    return maybeOf(context) ?? const IconButtonThemeData.fallback();
  }
}
