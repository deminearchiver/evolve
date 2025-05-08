import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:logging/logging.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material3_expressive_example/animation.dart';
import 'package:material3_expressive_example/button.dart';
import 'package:material3_expressive_example/hit_testing.dart';
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
      home: const Test3(),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                // Stack(
                //   children: [
                //     Positioned.fill(child: InkWell(onTap: () {})),
                //     ConstrainedBox(
                //       constraints: BoxConstraints(
                //         minWidth: 312.0,
                //         minHeight: 312.0,
                //       ),
                //       child: ForwardHitTests(
                //         descendantKey: _childKey,
                //         child: Align(
                //           alignment: Alignment.center,
                //           widthFactor: 1.0,
                //           heightFactor: 1.0,
                //           child: ConstrainedBox(
                //             key: _childKey,
                //             constraints: BoxConstraints(minWidth: 48.0),
                //             child: Material(
                //               color: Colors.red,
                //               child: GestureDetector(
                //                 behavior: HitTestBehavior.translucent,
                //                 child: InkWell(
                //                   onTap: () {},
                //                   child: Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                       horizontal: 16,
                //                       vertical: 10,
                //                     ),
                //                     child: Text("Button"),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Button(label: Text("Button")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Test3 extends StatefulWidget {
  const Test3({super.key});

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> with TickerProviderStateMixin {
  late CurveImplicitAnimation<double> _scale;
  late CurveImplicitAnimation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _scale = CurveImplicitAnimation<double>(
      vsync: this,
      duration: Durations.extralong4,
      curve: const EasingThemeData.fallback().emphasized,
      initialValue: 0.0,
      builder: (targetValue) => Tween<double>(begin: targetValue),
    );
    _color = CurveImplicitAnimation(
      vsync: this,
      duration: Durations.short4,
      initialValue: Colors.red,
      builder: (targetValue) => ColorTween(begin: targetValue),
    );
  }

  @override
  void dispose() {
    _color.dispose();
    _scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Button(label: Text("Custom button")),

            // FilledButton.tonal(
            //   onPressed: () => setState(() {
            //     _scale.targetValue = 1.0 - _scale.targetValue;
            //   }),
            //   child: Text("Scale"),
            // ),
            // FilledButton.tonal(
            //   onPressed: () => setState(() {
            //     _scale.value = 1.0;
            //   }),
            //   child: Text("Reset"),
            // ),
            // FilledButton.tonal(
            //   onPressed: () => setState(() => _color.targetValue = Colors.red),
            //   child: Text("Red"),
            // ),
            // FilledButton.tonal(
            //   onPressed: () =>
            //       setState(() => _color.targetValue = Colors.green),
            //   child: Text("Green"),
            // ),
            // FilledButton.tonal(
            //   onPressed: () => setState(() => _color.targetValue = Colors.blue),
            //   child: Text("Blue"),
            // ),
            // ScaleTransition(
            //   scale: _scale,
            //   child: AnimatedBuilder(
            //     animation: _color,
            //     builder: (context, child) =>
            //         Container(width: 312, height: 312, color: _color.value),
            //   ),
            // ),
            // CurveShowcase(),
          ],
        ),
      ),
    );
  }
}

class CurveShowcase extends StatefulWidget {
  const CurveShowcase({super.key});

  @override
  State<CurveShowcase> createState() => _CurveShowcaseState();
}

class _CurveShowcaseState extends State<CurveShowcase>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => CustomPaint(
        size: Size(500, 500),
        painter: _CurvePainter(
          trackColor: colorTheme.secondaryContainer,
          activeIndicatorColor: colorTheme.primary,
          value: _controller.value,
        ),
      ),
    );
  }
}

class _CurvePainter extends CustomPainter {
  const _CurvePainter({
    required this.trackColor,
    required this.activeIndicatorColor,
    required this.value,
  });

  final Color trackColor;
  final Color activeIndicatorColor;
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    Curve curve = Curves.easeInOutCubicEmphasized;
    final width = size.width;
    final height = size.height;
    final trackPath = Path()..moveTo(0.0, 0.0);
    final activeIndicatorPath = Path()..moveTo(0.0, 0.0);
    Offset? handleOffset;
    // double lastAngle = 0.0;
    double lastX = 0.0;
    double lastY = 0.0;
    // const double epsilon = 3;
    // final List<Offset> points = <Offset>[];
    double? lastAngle;
    for (double x = 0.0; x < width; x++) {
      final t = x / width;
      final value = curve.transform(t);
      final y = value * height;
      // trackPath.quadraticBezierTo(x, y);
      final deltaX = t - lastX;
      final deltaY = value - lastY;
      final theta = deltaY / deltaX;
      final angle = math.atan(theta);
      final startAngle = lastAngle ?? angle;
      final sweepAngle = angle - (lastAngle ?? angle);
      // trackPath.arcTo(
      //   Rect.fromLTRB(lastX, lastY, x, y),
      //   startAngle,
      //   sweepAngle,
      //   true,
      // );
      if (t <= this.value) {
        activeIndicatorPath.lineTo(x, y);
      } else {
        handleOffset ??= Offset(x, y);
      }
      lastX = x;
      lastY = y;
    }
    handleOffset ??= size.bottomRight(Offset.zero);
    // canvas.rotate(angle!);

    final trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = trackColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;
    final activeIndicatorPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = activeIndicatorColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;
    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(activeIndicatorPath, activeIndicatorPaint);
    canvas.drawCircle(
      size.bottomRight(Offset.zero),
      2.0,
      Paint()..color = activeIndicatorColor,
    );
    canvas.drawCircle(
      size.topLeft(Offset.zero),
      2.0,
      Paint()..color = activeIndicatorColor,
    );
    // canvas.drawCircle(handleOffset, 8.0, Paint()..color = activeIndicatorColor);
    // for (final point in points) {
    //   canvas.drawCircle(point, 4.0, Paint()..color = Colors.red);
    // }
  }

  @override
  bool shouldRepaint(covariant _CurvePainter oldDelegate) {
    return trackColor != oldDelegate.trackColor ||
        activeIndicatorColor != oldDelegate.activeIndicatorColor ||
        value != oldDelegate.value;
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
    final colorTheme = ColorTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              surfaceTintColor: Colors.transparent,
              leading: Center(
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surfaceContainer,
                  shape: const StadiumBorder(),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Icon(
                        Symbols.arrow_back,
                        opticalSize: 24,
                        color: colorTheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text("Settings"),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text("Headline"),
                subtitle: Text("Supporting text"),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                height: 16 + 40 + 16,
                child: Center(
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    shape: CornersBorder(
                      delegate: const RoundedCornersBorderDelegate(),
                      corners: Corners.full,
                      side: BorderSide(color: colorTheme.outlineVariant),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            Icon(
                              Symbols.restart_alt,
                              color: colorTheme.onSurfaceVariant,
                              size: 20,
                              opticalSize: 20,
                            ),
                            Text(
                              "Reset settings",
                              style: typescaleTheme.labelLarge
                                  .toTextStyle()
                                  .copyWith(color: colorTheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
