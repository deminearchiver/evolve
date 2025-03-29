import 'package:material/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() {
  test("ColorThemeData.lerp special cases", () {
    final ColorThemeData colorTheme = ColorThemeData.baseline(
      brightness: Brightness.light,
    );
    expect(
      identical(ColorThemeData.lerp(colorTheme, colorTheme, 0.5), colorTheme),
      true,
    );
  });

  test("ColorThemeData.lerp matches ColorScheme.lerp", () {
    final colorThemeA = ColorThemeData.baseline(brightness: Brightness.light);
    final colorThemeB = ColorThemeData.baseline(brightness: Brightness.dark);
    final colorSchemeA = colorThemeA.toColorScheme();
    final colorSchemeB = colorThemeB.toColorScheme();
    const double t = 0.5;

    final colorTheme = ColorThemeData.lerp(colorThemeA, colorThemeB, t);
    final colorScheme = ColorScheme.lerp(colorSchemeA, colorSchemeB, t);

    expect(colorTheme == ColorThemeData.fromColorScheme(colorScheme), true);
  });

  test(
    "ColorThemeData.toColorScheme matches ColorThemeData.fromColorScheme",
    () {
      final ColorThemeData colorTheme = ColorThemeData.baseline(
        brightness: Brightness.light,
      );
      final ColorScheme colorScheme = colorTheme.toColorScheme();
      expect(colorTheme == ColorThemeData.fromColorScheme(colorScheme), true);
    },
  );

  test(
    "Color values in ColorThemeData.fromSeed with different variants matches values in DynamicScheme",
    () {
      const seedColor = Colors.orange;
      final sourceColor = Hct.fromInt(seedColor.toARGB32());
      for (final schemeVariant in DynamicSchemeVariant.values) {
        final DynamicScheme dynamicScheme = switch (schemeVariant) {
          DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.fidelity => SchemeFidelity(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.content => SchemeContent(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.monochrome => SchemeMonochrome(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.neutral => SchemeNeutral(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.vibrant => SchemeVibrant(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.expressive => SchemeExpressive(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.rainbow => SchemeRainbow(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
          DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
            sourceColorHct: sourceColor,
            isDark: false,
            contrastLevel: 0.0,
          ),
        };
        final colorScheme = ColorThemeData.fromSeed(
          seedColor: seedColor,
          variant: schemeVariant,
          brightness: Brightness.light,
          contrastLevel: ColorThemeData.contrastLevelNormal,
        );

        expect(
          colorScheme.primary.toARGB32(),
          MaterialDynamicColors.primary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onPrimary.toARGB32(),
          MaterialDynamicColors.onPrimary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.primaryContainer.toARGB32(),
          MaterialDynamicColors.primaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onPrimaryContainer.toARGB32(),
          MaterialDynamicColors.onPrimaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.primaryFixed.toARGB32(),
          MaterialDynamicColors.primaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.primaryFixedDim.toARGB32(),
          MaterialDynamicColors.primaryFixedDim.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onPrimaryFixed.toARGB32(),
          MaterialDynamicColors.onPrimaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onPrimaryFixedVariant.toARGB32(),
          MaterialDynamicColors.onPrimaryFixedVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.secondary.toARGB32(),
          MaterialDynamicColors.secondary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSecondary.toARGB32(),
          MaterialDynamicColors.onSecondary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.secondaryContainer.toARGB32(),
          MaterialDynamicColors.secondaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSecondaryContainer.toARGB32(),
          MaterialDynamicColors.onSecondaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.secondaryFixed.toARGB32(),
          MaterialDynamicColors.secondaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.secondaryFixedDim.toARGB32(),
          MaterialDynamicColors.secondaryFixedDim.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSecondaryFixed.toARGB32(),
          MaterialDynamicColors.onSecondaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSecondaryFixedVariant.toARGB32(),
          MaterialDynamicColors.onSecondaryFixedVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.tertiary.toARGB32(),
          MaterialDynamicColors.tertiary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onTertiary.toARGB32(),
          MaterialDynamicColors.onTertiary.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.tertiaryContainer.toARGB32(),
          MaterialDynamicColors.tertiaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onTertiaryContainer.toARGB32(),
          MaterialDynamicColors.onTertiaryContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.tertiaryFixed.toARGB32(),
          MaterialDynamicColors.tertiaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.tertiaryFixedDim.toARGB32(),
          MaterialDynamicColors.tertiaryFixedDim.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onTertiaryFixed.toARGB32(),
          MaterialDynamicColors.onTertiaryFixed.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onTertiaryFixedVariant.toARGB32(),
          MaterialDynamicColors.onTertiaryFixedVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.error.toARGB32(),
          MaterialDynamicColors.error.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onError.toARGB32(),
          MaterialDynamicColors.onError.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.errorContainer.toARGB32(),
          MaterialDynamicColors.errorContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onErrorContainer.toARGB32(),
          MaterialDynamicColors.onErrorContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.background.toARGB32(),
          MaterialDynamicColors.background.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onBackground.toARGB32(),
          MaterialDynamicColors.onBackground.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surface.toARGB32(),
          MaterialDynamicColors.surface.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceDim.toARGB32(),
          MaterialDynamicColors.surfaceDim.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceBright.toARGB32(),
          MaterialDynamicColors.surfaceBright.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceContainerLowest.toARGB32(),
          MaterialDynamicColors.surfaceContainerLowest.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceContainerLow.toARGB32(),
          MaterialDynamicColors.surfaceContainerLow.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceContainer.toARGB32(),
          MaterialDynamicColors.surfaceContainer.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceContainerHigh.toARGB32(),
          MaterialDynamicColors.surfaceContainerHigh.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceContainerHighest.toARGB32(),
          MaterialDynamicColors.surfaceContainerHighest.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSurface.toARGB32(),
          MaterialDynamicColors.onSurface.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.surfaceVariant.toARGB32(),
          MaterialDynamicColors.surfaceVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.onSurfaceVariant.toARGB32(),
          MaterialDynamicColors.onSurfaceVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.outline.toARGB32(),
          MaterialDynamicColors.outline.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.outlineVariant.toARGB32(),
          MaterialDynamicColors.outlineVariant.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.shadow.toARGB32(),
          MaterialDynamicColors.shadow.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.scrim.toARGB32(),
          MaterialDynamicColors.scrim.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.inverseSurface.toARGB32(),
          MaterialDynamicColors.inverseSurface.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.inverseOnSurface.toARGB32(),
          MaterialDynamicColors.inverseOnSurface.getArgb(dynamicScheme),
        );
        expect(
          colorScheme.inversePrimary.toARGB32(),
          MaterialDynamicColors.inversePrimary.getArgb(dynamicScheme),
        );
      }
    },
  );
}
