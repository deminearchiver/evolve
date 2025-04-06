import 'package:dynamic_color/dynamic_color.dart';
import 'package:material/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

// Color _harmonizeColor(Color from, Color to) {
//   if (from == to) return from;
//   return Color(Blend.harmonize(from.toARGB32(), to.toARGB32()));
// }

extension ColorThemeDataHarmonization on ColorThemeData {
  /// Harmonizes [color] with this [ColorScheme]'s [primary].
  Color _harmonizeWithPrimary(Color color) => color.harmonizeWith(primary);
  // Color _harmonizeWithPrimary(Color color) => _harmonizeColor(color, primary);

  /// Harmonizes semantic and custom [ColorThemeData] colors with its [primary] color.
  ///
  /// Harmonization makes adding and introducing new colors to your app more
  /// seamless by automatically shifting hue and chroma slightly so that a
  /// product's colors feel more cohesive with dynamic user colors.
  ///
  /// Semantic colors (i.e. colors with meaning) include colors such as [error].
  /// See [Harmonize colors](https://m3.material.io/styles/color/advanced/adjust-existing-colors#1cc12e43-237b-45b9-8fe0-9a3549c1f61e)
  /// for more information.
  ///
  /// ![Diagram comparing static colors in an app to harmonized static colors](https://firebasestorage.googleapis.com/v0/b/design-spec/o/projects%2Fgoogle-material-3%2Fimages%2Flwt814il-4.png?alt=media&token=c451da1d-f5cb-43ef-ad1c-d1e8e23c68bd)
  ColorThemeData harmonized() {
    return copyWith(
      error: _harmonizeWithPrimary(error),
      onError: _harmonizeWithPrimary(onError),
      errorContainer: _harmonizeWithPrimary(errorContainer),
      onErrorContainer: _harmonizeWithPrimary(onErrorContainer),
    );
  }
}
