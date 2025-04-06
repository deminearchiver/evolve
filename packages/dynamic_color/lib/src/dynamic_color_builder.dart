import 'package:dynamic_color/dynamic_color.dart';
import 'package:material/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:dynamic_system_colors/dynamic_system_colors.dart'
    as dynamic_color;

/// A stateful builder widget that provides a light and dark [ColorThemeData]s.
///
/// Android: the [ColorThemeData]s are constructed from the [CorePalette] provided
/// by the Android OS.
///
/// macOS, Windows and Linux: the [ColorThemeData]s are constructed from the accent
/// [Color] provided by the system.
///
/// See also:
///
///  * [DynamicColorBuilder example](https://github.com/material-foundation/flutter-packages/tree/main/packages/dynamic_color/example/lib/dynamic_color_builder_example.dart)
///  * [Complete example](https://github.com/material-foundation/flutter-packages/tree/main/packages/dynamic_color/example/lib/complete_example.dart)
///    for obtaining dynamic colors and creating a harmonized color scheme
///  * [DynamicColorPlugin.getCorePalette] for requesting the [CorePalette]
///    directly, asynchronously.
///  * [DynamicColorPlugin.getAccentColor] for requesting the accent [Color]
///    [ColorScheme] directly, asynchronously.
class DynamicColorBuilder extends StatelessWidget {
  const DynamicColorBuilder({super.key, required this.builder});

  /// Builds the child widget of this widget, providing a light and dark [ColorThemeData]s.
  ///
  /// The [ColorScheme]s will be null if dynamic color is not supported on the
  /// platform, or if the OS has yet to respond.
  final Widget Function(
    ColorThemeData? lightDynamic,
    ColorThemeData? darkDynamic,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    return dynamic_color.DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final lightColorTheme =
            lightDynamic != null
                ? ColorThemeData.fromColorScheme(lightDynamic)
                : null;
        final darkColorTheme =
            darkDynamic != null
                ? ColorThemeData.fromColorScheme(darkDynamic)
                : null;
        return builder(lightColorTheme, darkColorTheme);
      },
    );
  }
}
