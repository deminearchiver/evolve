import 'package:material/material.dart';

abstract final class ThemeBuilder {
  static ThemeData fromColorScheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      platform: TargetPlatform.android,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      // ignore: deprecated_member_use
      progressIndicatorTheme: ProgressIndicatorThemeData(year2023: false),
      sliderTheme: SliderThemeData(
        // ignore: deprecated_member_use
        year2023: false,
      ),

      // textSelectionTheme: TextSelectionThemeData(
      //   cursorColor: colorScheme.primary,
      //   selectionColor: colorScheme.primary,
      // ),
    );
  }
}
