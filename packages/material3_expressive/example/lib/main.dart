import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    hide DynamicSchemeVariant, Icon, IconTheme, IconThemeData;
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material3_expressive_example/follower.dart';
import 'package:material3_expressive_example/implicit_animation.dart';
import 'package:material3_expressive_example/button.dart';
import 'package:material3_expressive_example/hit_testing.dart';
import 'package:material3_expressive_example/size_change.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'ripple.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}(${record.loggerName}): ${record.message}');
  });
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

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
  final OverlayPortalController _controller = OverlayPortalController();

  Rect _rect = Rect.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            OverlayPortal.overlayChildLayoutBuilder(
              controller: _controller,
              overlayChildBuilder: (context, info) => Align(
                alignment: Alignment.topLeft,
                child: Transform(
                  transform: info.childPaintTransform,
                  child: SizedBox(
                    width: info.childSize.width,
                    height: info.childSize.height,
                    child: Material(color: Colors.red),
                  ),
                ),
              ),
              child: Material(
                color: colorTheme.surfaceDim,
                child: InkWell(
                  onTap: () => _controller.toggle(),
                  child: SizedBox(width: 100, height: 100),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: colorTheme.surfaceDim,
              child: Follower(
                anchorGlobalRect: () => _rect,
                child: Container(color: Colors.red),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: colorTheme.surfaceContainerLowest,
              child: Follower(
                anchorGlobalRect: () => _rect,
                child: Container(color: Colors.red),
              ),
            ),
            SizeChangeGroup.horizontal(
              children: [
                Anchor(
                  onGlobalRectChanged: (value) => _rect = value,
                  child: ButtonTest(
                    variant: ButtonVariant.outlined,
                    icon: const Icon(Symbols.anchor),
                    label: Text("Anchor"),
                  ),
                ),
              ],
            ),

            Skeletonizer(
              enabled: false,
              ignorePointers: false,
              child: Material(
                child: SizeChangeGroup.horizontal(
                  spacing: 8.0,
                  children: [
                    ButtonTest(
                      variant: ButtonVariant.tonal,
                      icon: const Icon(Symbols.arrow_back),
                    ),
                    ...Iterable.generate(
                      3,
                      (index) => ButtonTest(
                        variant: ButtonVariant.filled,
                        label: Text("${index + 1}"),
                      ),
                    ),
                    ButtonTest(
                      variant: ButtonVariant.tonal,
                      // icon: const Icon(Symbols.arrow_forward),
                      label: Text("1"),
                    ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.arrow_back),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.mic_off),
                    //   label: Text("Microphone"),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.videocam_off),
                    //   label: Text("Camera"),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.mic_off),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.videocam_off),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.call_end),
                    // ),
                    // ButtonTest(
                    //   variant: ButtonVariant.tonal,
                    //   icon: const Icon(Symbols.more_vert),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTest extends StatefulWidget {
  const ButtonTest({super.key, required this.variant, this.icon, this.label})
    : assert(icon != null || label != null);

  final ButtonVariant variant;
  final Widget? icon;
  final Widget? label;

  @override
  State<ButtonTest> createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> with TickerProviderStateMixin {
  late ColorThemeData _color;
  late ShapeThemeData _shapeTheme;

  late WidgetStatesController _statesController;
  late SpringImplicitAnimation<double> _widthFactor;
  late SpringImplicitAnimation<ShapeBorder?> _shape;

  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController()..addListener(_statesListener);
    _widthFactor = SpringImplicitAnimation<double>(
      vsync: this,
      spring: const SpringThemeData.standard().fastSpatial
          .toSpringDescription(),
      initialValue: 1.0,
      builder: (value) => Tween<double>(begin: value),
    );
    _shape = SpringImplicitAnimation<ShapeBorder?>(
      vsync: this,
      spring: const SpringThemeData.standard().fastSpatial
          .toSpringDescription(),
      initialValue: null,
      builder: (value) => ShapeBorderTween(begin: value),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _color = ColorTheme.of(context);
    _shapeTheme = ShapeTheme.of(context);
  }

  @override
  void dispose() {
    _shape.dispose();
    _widthFactor.dispose();
    _statesController.dispose();
    super.dispose();
  }

  void _statesListener() {
    if (_statesController.value.contains(WidgetState.pressed)) {
      _widthFactor.targetValue = 1.15;
    } else {
      _widthFactor.targetValue = 1.0;
    }
    setState(() {});
  }

  Color get _backgroundColor {
    if (_selected) {
      return switch (widget.variant) {
        ButtonVariant.elevated => _color.primary,
        ButtonVariant.filled => _color.primary,
        ButtonVariant.tonal => _color.secondary,
        ButtonVariant.outlined => _color.inverseSurface,
        ButtonVariant.text => Colors.transparent,
      };
    }
    return switch (widget.variant) {
      ButtonVariant.elevated => _color.surfaceContainerLow,
      ButtonVariant.filled => _color.surfaceContainer,
      ButtonVariant.tonal => _color.secondaryContainer,
      ButtonVariant.outlined => Colors.transparent,
      ButtonVariant.text => Colors.transparent,
    };
  }

  Color get _foregroundColor {
    if (_selected) {
      return switch (widget.variant) {
        ButtonVariant.elevated => _color.onPrimary,
        ButtonVariant.filled => _color.onPrimary,
        ButtonVariant.tonal => _color.onSecondary,
        ButtonVariant.outlined => _color.inverseOnSurface,
        ButtonVariant.text => _color.primary,
      };
    }
    return switch (widget.variant) {
      ButtonVariant.elevated => _color.primary,
      ButtonVariant.filled => _color.onSurfaceVariant,
      ButtonVariant.tonal => _color.onSecondaryContainer,
      ButtonVariant.outlined => _color.onSurfaceVariant,
      ButtonVariant.text => _color.primary,
    };
  }

  Corner get _corner {
    if (_statesController.value.contains(WidgetState.pressed)) {
      return _shapeTheme.large;
    }
    return _selected ? _shapeTheme.extraLarge : _shapeTheme.full;
  }

  BorderSide get _side {
    return switch (widget.variant) {
      ButtonVariant.outlined when !_selected => BorderSide(
        width: 1.0,
        color: _color.outlineVariant,
      ),
      _ => BorderSide.none,
    };
  }

  IconThemeDataPartial get _iconTheme {
    if (widget.label == null) {
      return IconThemeDataPartial(
        color: _foregroundColor,
        size: 24.0,
        opsz: 24.0,
        fill: _selected ? 1.0 : 0.0,
      );
    }
    return IconThemeDataPartial(
      color: _foregroundColor,
      size: 24.0,
      opsz: 24.0,
      fill: _selected ? 1.0 : 0.0,
    );
  }

  EdgeInsetsGeometry get _padding {
    if (widget.label == null) {
      return const EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      );
    }
    return const EdgeInsetsDirectional.symmetric(
      horizontal: 24.0,
      vertical: 16.0,
    );
  }

  Color get _shadowColor => switch (widget.variant) {
    ButtonVariant.elevated => _color.shadow,
    _ => Colors.transparent,
  };
  WidgetStateProperty<double> get _elevation =>
      WidgetStateProperty.resolveWith((states) {
        final hovered = states.contains(WidgetState.hovered);
        return switch (widget.variant) {
          ButtonVariant.elevated => hovered ? 2.0 : 1.0,
          _ => 0.0,
        };
      });

  @override
  Widget build(BuildContext context) {
    final typescaleTheme = TypescaleTheme.of(context);
    _shape.targetValue = CornersBorder(
      delegate: const RoundedCornersBorderDelegate(),
      corners: Corners.all(_corner),
      side: _side,
    );

    return AnimatedBuilder(
      animation: _shape,
      child: Ripple(
        statesController: _statesController,
        color: WidgetStatePropertyAll(_foregroundColor),
        onTap: () => setState(() => _selected = !_selected),
        child: AnimatedBuilder(
          animation: _widthFactor,
          child: ConstrainedBox(
            constraints: widget.label != null
                ? const BoxConstraints(minWidth: 48.0)
                : const BoxConstraints(),
            child: Padding(
              padding: _padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8.0,
                children: [
                  if (widget.icon case final icon?)
                    IconTheme.merge(data: _iconTheme, child: icon),
                  if (widget.label case final label?)
                    DefaultTextStyle(
                      style:
                          (_selected
                                  ? typescaleTheme.titleMediumEmphasized
                                  : typescaleTheme.titleMedium)
                              .toTextStyle()
                              .copyWith(color: _foregroundColor),
                      child: label,
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
          shadowColor: _shadowColor,
          elevation: _elevation.resolve(_statesController.value),
          color: _backgroundColor,
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
                        opsz: 24,
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
                              opsz: 20,
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
