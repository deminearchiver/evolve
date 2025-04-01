import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

Color _harmonizeColor(Color designColor, Color sourceColor) {
  if (designColor == sourceColor) return designColor;
  final designColorArgb = designColor.toARGB32();
  final sourceColorArgb = sourceColor.toARGB32();
  return Color(Blend.harmonize(designColorArgb, sourceColorArgb));
}

extension on Color {
  /// Blend the color's HCT hue towards the source color's HCT
  /// hue, in a way that leaves the original color recognizable and
  /// recognizably shifted towards the key color.
  ///
  /// [sourceColor] ARGB representation of the main theme color.
  /// Returns the color with a hue shifted towards the
  /// source color, a slightly warmer/cooler variant of the design
  /// color's hue.
  Color harmonizeWith(Color sourceColor) => _harmonizeColor(this, sourceColor);
}

@immutable
class ExtendedColor with Diagnosticable {
  const ExtendedColor({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  factory ExtendedColor.fromSeed({
    required Color seedColor,
    required Brightness brightness,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0.0,
  }) {
    final scheme = _buildDynamicScheme(
      brightness,
      seedColor,
      variant,
      contrastLevel,
    );
    return ExtendedColor.fromDynamicScheme(scheme);
  }

  factory ExtendedColor.fromDynamicScheme(DynamicScheme scheme) {
    return ExtendedColor(
      color: Color(MaterialDynamicColors.primary.getArgb(scheme)),
      onColor: Color(MaterialDynamicColors.onPrimary.getArgb(scheme)),
      colorContainer: Color(
        MaterialDynamicColors.primaryContainer.getArgb(scheme),
      ),
      onColorContainer: Color(
        MaterialDynamicColors.onPrimaryContainer.getArgb(scheme),
      ),
    );
  }

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;

  bool get isHarmonized => false;

  ExtendedColor copyWith({
    Color? color,
    Color? onColor,
    Color? colorContainer,
    Color? onColorContainer,
  }) {
    if (color == null &&
        onColor == null &&
        colorContainer == null &&
        onColorContainer == null) {
      return this;
    }
    return ExtendedColor(
      color: color ?? this.color,
      onColor: onColor ?? this.onColor,
      colorContainer: colorContainer ?? this.colorContainer,
      onColorContainer: onColorContainer ?? this.onColorContainer,
    );
  }

  ExtendedColor harmonizeWith(Color sourceColor) {
    return _HarmonizedExtendedColor(
      parent: this,
      color: color.harmonizeWith(sourceColor),
      onColor: onColor.harmonizeWith(sourceColor),
      colorContainer: colorContainer.harmonizeWith(sourceColor),
      onColorContainer: onColorContainer.harmonizeWith(sourceColor),
    );
  }

  ExtendedColor unharmonized() => this;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("isHarmonized", isHarmonized));
    properties.add(ColorProperty("color", color));
    properties.add(ColorProperty("onColor", onColor));
    properties.add(ColorProperty("colorContainer", colorContainer));
    properties.add(ColorProperty("onColorContainer", onColorContainer));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ExtendedColor &&
            isHarmonized == other.isHarmonized &&
            color == other.color &&
            onColor == other.onColor &&
            colorContainer == other.colorContainer &&
            onColorContainer == other.onColorContainer;
  }

  @override
  int get hashCode => Object.hash(
    isHarmonized,
    color,
    onColor,
    colorContainer,
    onColorContainer,
  );

  static DynamicScheme _buildDynamicScheme(
    Brightness brightness,
    Color seedColor,
    DynamicSchemeVariant schemeVariant,
    double contrastLevel,
  ) {
    assert(
      contrastLevel >= ColorThemeData.contrastLevelLow &&
          contrastLevel <= ColorThemeData.contrastLevelHigh,
      "contrastLevel must be between ${ColorThemeData.contrastLevelLow} and ${ColorThemeData.contrastLevelHigh} inclusive.",
    );

    final bool isDark = brightness == Brightness.dark;
    final Hct sourceColor = Hct.fromInt(seedColor.toARGB32());
    return switch (schemeVariant) {
      DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fidelity => SchemeFidelity(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.content => SchemeContent(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.monochrome => SchemeMonochrome(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.neutral => SchemeNeutral(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.vibrant => SchemeVibrant(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.expressive => SchemeExpressive(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.rainbow => SchemeRainbow(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
      DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
        sourceColorHct: sourceColor,
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
    };
  }
}

class _HarmonizedExtendedColor extends ExtendedColor {
  const _HarmonizedExtendedColor({
    required ExtendedColor parent,
    required super.color,
    required super.onColor,
    required super.colorContainer,
    required super.onColorContainer,
  }) : _parent = parent;

  final ExtendedColor _parent;

  @override
  bool get isHarmonized => true;

  @override
  ExtendedColor copyWith({
    Color? color,
    Color? onColor,
    Color? colorContainer,
    Color? onColorContainer,
  }) {
    if (color == null &&
        onColor == null &&
        colorContainer == null &&
        onColorContainer == null) {
      return this;
    }
    if (color != null &&
        onColor != null &&
        colorContainer != null &&
        onColorContainer != null) {
      return ExtendedColor(
        color: color,
        onColor: onColor,
        colorContainer: colorContainer,
        onColorContainer: onColorContainer,
      );
    }
    return _HarmonizedExtendedColor(
      parent: _parent,
      color: color ?? this.color,
      onColor: onColor ?? this.onColor,
      colorContainer: colorContainer ?? this.colorContainer,
      onColorContainer: onColorContainer ?? this.onColorContainer,
    );
  }

  @override
  ExtendedColor harmonizeWith(Color sourceColor) {
    return _parent.harmonizeWith(sourceColor);
  }

  @override
  ExtendedColor unharmonized() => _parent;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _HarmonizedExtendedColor &&
            _parent == other._parent &&
            isHarmonized == other.isHarmonized &&
            color == other.color &&
            onColor == other.onColor &&
            colorContainer == other.colorContainer &&
            onColorContainer == other.onColorContainer;
  }

  @override
  int get hashCode => Object.hash(
    _parent,
    isHarmonized,
    color,
    onColor,
    colorContainer,
    onColorContainer,
  );
}
