import 'package:material/material.dart';

// TODO: remove after implementing tooltip theme
extension TooltipThemeDataExtension on TooltipThemeData {
  TooltipThemeData merge(TooltipThemeData? other) {
    if (other == null) return this;
    return copyWith(
      // ignore: deprecated_member_use
      height: other.height,
      constraints: other.constraints,
      padding: other.padding,
      margin: other.margin,
      verticalOffset: other.verticalOffset,
      preferBelow: other.preferBelow,
      excludeFromSemantics: other.excludeFromSemantics,
      decoration: other.decoration,
      textStyle: other.textStyle,
      textAlign: other.textAlign,
      waitDuration: other.waitDuration,
      showDuration: other.showDuration,
      triggerMode: other.triggerMode,
      enableFeedback: other.enableFeedback,
    );
  }
}
