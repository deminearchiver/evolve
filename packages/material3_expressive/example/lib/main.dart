import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:logging/logging.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material3_expressive_example/typography.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}(${record.loggerName}): ${record.message}');
  });
  runApp(const MainApp());
}

final lightColorTheme = ColorThemeData.baseline(
  // variant: DynamicSchemeVariant.tonalSpot,
  brightness: Brightness.light,
  version: DynamicSchemeVersion.spec2025,
  platform: DynamicSchemePlatform.watch,
);
final darkColorTheme = ColorThemeData.baseline(
  // variant: DynamicSchemeVariant.expressive,
  brightness: Brightness.dark,
  version: DynamicSchemeVersion.spec2025,
  platform: DynamicSchemePlatform.watch,
);
final highContrastLightColorTheme = ColorThemeData.baseline(
  brightness: Brightness.light,
  contrastLevel: 1.0,
);
final highContrastDarkColorTheme = ColorThemeData.baseline(
  brightness: Brightness.dark,
  contrastLevel: 1.0,
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final ThemeMode themeMode = ThemeMode.system;

  ColorThemeData _buildColorTheme({
    required Brightness brightness,
    double contrastLevel = 0.0,
  }) => ColorThemeData.baseline(
    variant: DynamicSchemeVariant.tonalSpot,
    brightness: brightness,
    contrastLevel: contrastLevel,
    version: DynamicSchemeVersion.spec2025,
    platform: DynamicSchemePlatform.phone,
  );

  Widget _builder(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    final highContrast = MediaQuery.highContrastOf(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    return ColorTheme(
      data: _buildColorTheme(
        brightness: brightness,
        contrastLevel: highContrast ? 1.0 : 0.0,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debug
      debugShowCheckedModeBanner: false,
      // Scroll
      scrollBehavior: kDebugMode
          ? const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            )
          : null,
      // Color
      themeMode: ThemeMode.system,
      theme: ThemeDataFactory.fromColorTheme(
        _buildColorTheme(brightness: Brightness.light),
      ),
      darkTheme: ThemeDataFactory.fromColorTheme(
        _buildColorTheme(brightness: Brightness.dark),
      ),
      highContrastTheme: ThemeDataFactory.fromColorTheme(
        _buildColorTheme(brightness: Brightness.light, contrastLevel: 1.0),
      ),
      highContrastDarkTheme: ThemeDataFactory.fromColorTheme(
        _buildColorTheme(brightness: Brightness.dark, contrastLevel: 1.0),
      ),
      builder: _builder,
      home: const Test1(),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: Center(child: PlayPause()));
    return Scaffold(
      body: ListView(
        children: [
          WearChip.centered(
            variant: WearChipVariant.tonal,
            primaryLabel: Text("Cancel"),
          ),
          const SizedBox(height: 4),
          WearChip.centered(
            variant: WearChipVariant.filled,
            primaryLabel: Text("Confirm"),
          ),
        ],
      ),
    );
  }
}

enum WearChipVariant { filled, tonal, tonalHighlighted }

class WearChip extends StatelessWidget {
  const WearChip({
    super.key,
    required this.variant,
    this.icon,
    required this.primaryLabel,
    this.secondaryLabel,
  }) : centered = false;
  const WearChip.centered({
    super.key,
    required this.variant,
    required this.primaryLabel,
  }) : centered = true,
       icon = null,
       secondaryLabel = null;

  final WearChipVariant variant;
  final bool centered;

  final Widget? icon;
  final Widget primaryLabel;
  final Widget? secondaryLabel;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final typographyTheme = WearTypographyTheme.of(context);
    final containerColor = switch (variant) {
      WearChipVariant.filled => colorTheme.primary,
      WearChipVariant.tonal => colorTheme.surfaceContainerLow,
      WearChipVariant.tonalHighlighted => colorTheme.surfaceContainerLow,
    };
    final iconColor = switch (variant) {
      WearChipVariant.filled => colorTheme.onPrimary,
      WearChipVariant.tonal => colorTheme.primary,
      WearChipVariant.tonalHighlighted => colorTheme.primary,
    };
    final primaryTextColor = switch (variant) {
      WearChipVariant.filled => colorTheme.onPrimary,
      WearChipVariant.tonal => colorTheme.onSurface,
      WearChipVariant.tonalHighlighted => colorTheme.onSurface,
    };
    final secondaryTextColor = switch (variant) {
      WearChipVariant.filled => colorTheme.onPrimary.withValues(alpha: 0.8),
      WearChipVariant.tonal => colorTheme.onSurface.withValues(alpha: 0.8),
      WearChipVariant.tonalHighlighted => colorTheme.onSurface.withValues(
        alpha: 0.8,
      ),
    };
    final primaryTextStyle = typographyTheme.button.toTextStyle().copyWith(
      color: primaryTextColor,
    );
    final secondaryTextStyle = typographyTheme.caption1.toTextStyle().copyWith(
      color: secondaryTextColor,
    );
    final Gradient? gradient = switch (variant) {
      WearChipVariant.tonalHighlighted => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          colorTheme.primary.withValues(alpha: 0.5),
          containerColor.withValues(alpha: 0.0),
        ],
      ),
      _ => null,
    };
    final shape = const StadiumBorder();
    return SizedBox(
      height: 52,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: shape,
        color: containerColor,
        child: Ink(
          decoration: ShapeDecoration(shape: shape, gradient: gradient),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                spacing: 6,
                children: [
                  if (icon case final icon?)
                    IconTheme.merge(
                      data: IconThemeData(
                        color: iconColor,
                        size: 24,
                        opticalSize: 24,
                      ),
                      child: icon,
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DefaultTextStyle(
                          style: primaryTextStyle,
                          textAlign: centered
                              ? TextAlign.center
                              : TextAlign.start,
                          child: primaryLabel,
                        ),
                        if (secondaryLabel case final secondaryLabel?)
                          DefaultTextStyle(
                            style: secondaryTextStyle,
                            child: secondaryLabel,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeDataFactory {
  static ThemeData fromColorTheme(ColorThemeData colorTheme) {
    final colorScheme = colorTheme.toColorScheme();
    return fromColorScheme(colorScheme);
  }

  static ThemeData fromColorScheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      platform: TargetPlatform.android,
    );
  }
}

class PlayPause extends StatefulWidget {
  const PlayPause({super.key});

  @override
  State<PlayPause> createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final backgroundColor = colorTheme.onSurface.withValues(alpha: 0.1);
    final trackColor = colorTheme.onSurface.withValues(alpha: 0.2);
    final activeIndicatorColor = colorTheme.primary;
    return SizedBox.square(
      dimension: 60.0,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const StadiumBorder(),
        color: backgroundColor,
        child: InkWell(
          onTap: () {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                year2023: false,
                value: 0,
                color: trackColor,
                strokeWidth: 4,
                padding: EdgeInsets.zero,
              ),
              ProgressIndicatorTheme(
                data: const ProgressIndicatorThemeData(
                  circularTrackColor: Colors.transparent,
                ),
                child: CircularProgressIndicator(
                  year2023: false,
                  value: 0.75,
                  color: activeIndicatorColor,
                  strokeWidth: 4,
                  padding: EdgeInsets.zero,
                ),
              ),
              Icon(
                Symbols.play_arrow,
                size: 32,
                opticalSize: 32,
                color: colorTheme.onSurface,
                fill: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
