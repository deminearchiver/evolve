import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:logging/logging.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material3_expressive_example/implicit_animation.dart';
import 'package:material3_expressive_example/button.dart';
import 'package:material3_expressive_example/hit_testing.dart';
import 'package:material3_expressive_example/size_change.dart';
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.light;

  ColorThemeData _buildColorTheme({
    required Brightness brightness,
    double contrastLevel = 0.0,
  }) => ColorThemeData.baseline(
    variant: DynamicSchemeVariant.fidelity,
    brightness: brightness,
    contrastLevel: contrastLevel,
    version: DynamicSchemeVersion.spec2025,
    platform: DynamicSchemePlatform.phone,
  );

  Widget _builder(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    final highContrast = MediaQuery.highContrastOf(context);
    final brightness = switch (themeMode) {
      ThemeMode.system => MediaQuery.platformBrightnessOf(context),
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
    };
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
      themeMode: themeMode,
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
  late SpringImplicitAnimation<double> _widthFactor;

  @override
  void initState() {
    super.initState();
    _widthFactor = SpringImplicitAnimation<double>(
      vsync: this,
      // spring: SpringDescription.withDampingRatio(
      //   mass: 1,
      //   stiffness: 100,
      //   ratio: 0.1,
      // ),
      spring: const SpringThemeData.expressive().fastSpatial
          .toSpringDescription(),
      initialValue: 1.0,
      builder: (targetValue) => Tween<double>(begin: targetValue),
    );
    // _widthFactor = CurveImplicitAnimation<double>(
    //   vsync: this,
    //   duration: Durations.extralong4,
    //   curve: Curves.easeInOutCubicEmphasized,
    //   initialValue: 1.0,
    //   builder: (targetValue) => Tween<double>(begin: targetValue),
    // );
  }

  @override
  void dispose() {
    _widthFactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            // Button(label: Text("Custom button")),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   spacing: 8.0,
            //   children: [
            //     FilledButton(
            //       onPressed: () => _widthFactor.targetValue = 1.0,
            //       child: const Text("0%"),
            //     ),
            //     FilledButton(
            //       onPressed: () => _widthFactor.targetValue = 1.15,
            //       child: const Text("+15%"),
            //     ),
            //     FilledButton(
            //       onPressed: () => _widthFactor.targetValue = 1.3,
            //       child: const Text("+30%"),
            //     ),
            //   ],
            // ),
            Material(
              // color: Colors.red.shade100,
              child: SizeChangeGroup.horizontal(
                children: [
                  ButtonTest(
                    icon: const Icon(Symbols.arrow_back),
                    label: Text("Back"),
                  ),
                  ButtonTest(
                    icon: const Icon(Symbols.bug_report),
                    label: Text("Report a bug"),
                  ),
                  ButtonTest(
                    icon: const Icon(Symbols.mail),
                    label: Text("Contact us"),
                  ),
                  ButtonTest(
                    icon: const Icon(Symbols.settings),
                    label: Text("Settings"),
                  ),
                  // ButtonTest(
                  //   icon: const Icon(Symbols.settings),
                  //   label: Text("Настройки"),
                  // ),
                  // ButtonTest(
                  //   icon: const Icon(Symbols.settings),
                  //   label: Text("Настройки"),
                  // ),
                ],
              ),
            ),
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

class ButtonTest extends StatefulWidget {
  const ButtonTest({super.key, this.icon, required this.label});

  final Widget? icon;
  final Widget label;

  @override
  State<ButtonTest> createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> with TickerProviderStateMixin {
  late WidgetStatesController _statesController;
  late SpringImplicitAnimation<double> _widthFactor;
  late SpringImplicitAnimation<ShapeBorder?> _shape;

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController()..addListener(_statesListener);
    _widthFactor = SpringImplicitAnimation<double>(
      vsync: this,
      spring: const SpringThemeData.expressive().fastSpatial
          .toSpringDescription(),
      initialValue: 1.0,
      builder: (value) => Tween<double>(begin: value),
    );
    _shape = SpringImplicitAnimation<ShapeBorder?>(
      vsync: this,
      spring: const SpringThemeData.expressive().fastSpatial
          .toSpringDescription(),
      initialValue: null,
      builder: (value) => ShapeBorderTween(begin: value),
    );
  }

  @override
  void dispose() {
    _shape.dispose();
    _widthFactor.dispose();
    _statesController.dispose();
    super.dispose();
  }

  void _statesListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    final backgroundColor = colorTheme.primary;
    final foregroundColor = colorTheme.onPrimary;
    final corner = _statesController.value.contains(WidgetState.pressed)
        ? shapeTheme.small
        : shapeTheme.full;
    _shape.targetValue = CornersBorder(
      delegate: const RoundedCornersBorderDelegate(),
      corners: Corners.all(corner),
    );

    return AnimatedBuilder(
      animation: _shape,
      child: InkWell(
        statesController: _statesController,
        onTapDown: (_) => _widthFactor.targetValue = 1.15,
        onTapUp: (_) => _widthFactor.targetValue = 1.0,
        onTapCancel: () => _widthFactor.targetValue = 1.0,
        overlayColor: StateLayerColor(
          color: WidgetStatePropertyAll(foregroundColor),
          opacity: StateLayerOpacity.fromStateTheme(stateTheme),
        ),
        child: AnimatedBuilder(
          animation: _widthFactor,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 48.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8.0,
                children: [
                  if (widget.icon case final icon?)
                    IconTheme.merge(
                      data: IconThemeData(
                        size: 20.0,
                        opticalSize: 20.0,
                        color: foregroundColor,
                      ),
                      child: icon,
                    ),
                  DefaultTextStyle(
                    style: typescaleTheme.labelLarge.toTextStyle().copyWith(
                      color: foregroundColor,
                    ),
                    child: widget.label,
                  ),
                ],
              ),
            ),
          ),
          builder: (context, child) =>
              SizeChange.width(widthFactor: _widthFactor.value, child: child!),
        ),
      ),
      builder: (context, child) {
        return Material(
          animationDuration: Duration.zero,
          clipBehavior: Clip.antiAlias,
          color: backgroundColor,
          shape: _shape.value,
          child: child!,
        );
      },
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
