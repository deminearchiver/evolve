import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:logging/logging.dart';
import 'package:material3_expressive/material3_expressive.dart';
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

  Widget _builder(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    final highContrast = MediaQuery.highContrastOf(context);
    final brightness = MediaQuery.platformBrightnessOf(context);
    return ColorTheme(
      data: ColorThemeData.baseline(
        brightness: brightness,
        contrastLevel: highContrast ? 1.0 : 0.0,
        version: DynamicSchemeVersion.spec2025,
        platform: DynamicSchemePlatform.watch,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scroll
      // Color
      themeMode: ThemeMode.system,
      theme: ThemeDataFactory.fromColorTheme(lightColorTheme),
      darkTheme: ThemeDataFactory.fromColorTheme(darkColorTheme),
      highContrastTheme: ThemeDataFactory.fromColorTheme(
        highContrastLightColorTheme,
      ),
      highContrastDarkTheme: ThemeDataFactory.fromColorTheme(
        highContrastDarkColorTheme,
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
    return const Scaffold(body: Center(child: PlayPause()));
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
      // platform: TargetPlatform.android,
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
