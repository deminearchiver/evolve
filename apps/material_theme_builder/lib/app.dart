import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    hide DynamicSchemeVariant, Icon, IconTheme, IconThemeData;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:material_theme_builder/bloc.dart';
// import 'package:material_theme_builder/button.dart';
import 'package:material_theme_builder/theme/component_themes.dart';
import 'package:material_theme_builder/theme/theme.dart';
import 'package:material_theme_builder/widgets/button.dart';
import 'package:mcu/mcu.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode get _themeMode => ThemeMode.light;

  Widget _buildWrapper(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();

    Widget result = child;
    result = ComponentThemes(child: result);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colorThemes = ColorThemeFactory(
          sourceColor: state.sourceColor,
          variant: state.variant,
          version: state.version,
          platform: state.platform,
        );
        final brightness = switch (_themeMode) {
          ThemeMode.system => MediaQuery.platformBrightnessOf(context),
          ThemeMode.light => Brightness.light,
          ThemeMode.dark => Brightness.dark,
        };
        final highContrast = MediaQuery.highContrastOf(context);
        final data = switch ((brightness, highContrast)) {
          (Brightness.light, false) => colorThemes.light,
          (Brightness.light, true) => colorThemes.lightHighContrast,
          (Brightness.dark, false) => colorThemes.dark,
          (Brightness.dark, true) => colorThemes.darkHighContrast,
        };
        return ColorTheme(data: data, child: result);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThemeBloc(const ThemeState(version: DynamicSchemeVersion.spec2021)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final colorThemes = ColorThemeFactory(
            sourceColor: state.sourceColor,
            variant: state.variant,
            version: state.version,
            platform: state.platform,
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: kDebugMode
                ? const MaterialScrollBehavior().copyWith(
                    dragDevices: {PointerDeviceKind.mouse},
                  )
                : null,
            themeMode: _themeMode,
            theme: LegacyThemeFactory.from(colorTheme: colorThemes.light),
            darkTheme: LegacyThemeFactory.from(colorTheme: colorThemes.dark),
            highContrastTheme: LegacyThemeFactory.from(
              colorTheme: colorThemes.lightHighContrast,
            ),
            highContrastDarkTheme: LegacyThemeFactory.from(
              colorTheme: colorThemes.darkHighContrast,
            ),
            builder: _buildWrapper,
            home: Test1(),
          );
        },
      ),
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
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    final themeBloc = context.watch<ThemeBloc>();
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text("Material Theme Builder"),
              actions: [
                IconButton(
                  onPressed: themeBloc.canUndo
                      ? () => context.read<ThemeBloc>().undo()
                      : null,
                  icon: const Icon(Symbols.undo),
                ),
                IconButton(
                  onPressed: themeBloc.canRedo
                      ? () => context.read<ThemeBloc>().redo()
                      : null,
                  icon: const Icon(Symbols.redo),
                ),
                const SizedBox(width: 4),
              ],
            ),
            SliverList.list(
              children: [
                Row(
                  children: [
                    // ToggleButton(
                    //   selected: false,
                    //   onPressed: () {},
                    //   style: ToggleButton.defaultStyleOf(
                    //     context: context,
                    //     color: ToggleButtonColor.filled,
                    //     size: ButtonSize.medium,
                    //   ),
                    //   icon: const Icon(Symbols.play_arrow_rounded, fill: 1),
                    //   label: Text("Play arrow"),
                    // ),
                    Button(
                      // size: ButtonSize.extraLarge,
                      // shape: ButtonShape.square,
                      color: ButtonColor.filled,
                      onTap: () {},
                      icon: const Icon(Symbols.play_arrow, fill: 1),
                      label: Text("Play"),
                    ),
                    Button(
                      // size: ButtonSize.extraLarge,
                      // shape: ButtonShape.square,
                      color: ButtonColor.filled,
                      onTap: () {},
                      icon: const Icon(Symbols.play_arrow, fill: 1),
                      label: Text("Play"),
                    ),
                  ],
                ),

                Wrap(
                  spacing: 12.0,
                  runSpacing: 0.0,
                  children: [
                    for (final variant in DynamicSchemeVariant.values)
                      Button(
                        size: ButtonSize.small,
                        color: ButtonColor.outlined,
                        onTap: () =>
                            themeBloc..add(ThemeVariantChanged(variant)),
                        label: Text("${variant.name}"),
                      ),
                  ],
                ),
                Row(
                  spacing: 2.0,
                  children: [
                    for (final version in DynamicSchemeVersion.values)
                      Expanded(
                        child: Button(
                          size: ButtonSize.small,
                          color: ButtonColor.elevated,
                          onTap: () =>
                              themeBloc..add(ThemeVersionChanged(version)),
                          label: Text("${version.name}"),
                        ),
                      ),
                  ],
                ),
                Row(
                  spacing: 2.0,
                  children: [
                    for (final platform in DynamicSchemePlatform.values)
                      Expanded(
                        child: Button(
                          size: ButtonSize.small,
                          color: ButtonColor.tonal,
                          onTap: () =>
                              themeBloc..add(ThemePlatformChanged(platform)),
                          label: Text("${platform.name}"),
                        ),
                      ),
                  ],
                ),
                Material(
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surfaceContainer,
                  shape: const StadiumBorder(),
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => ColorDialog(),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          12,
                          12,
                          0,
                          12,
                        ),
                        child: Row(
                          children: [
                            SizedBox.square(
                              dimension: 48,
                              child: Material(
                                shape: const StadiumBorder(),
                                color: colorTheme.primaryContainer,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                // spacing: 4.0,
                                children: [
                                  Text(
                                    "Primary",
                                    style: typescaleTheme.titleLargeEmphasized
                                        .toTextStyle()
                                        .copyWith(color: colorTheme.onSurface),
                                  ),
                                  Text(
                                    "Acts as a custom source color",
                                    style: typescaleTheme.labelMedium
                                        .toTextStyle()
                                        .copyWith(
                                          color: colorTheme.onSurfaceVariant,
                                        ),
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
              ],
            ),
          ],
        ),
      ),
      extendBody: true,

      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Align(
            alignment: Alignment.center,
            heightFactor: 1.0,
            child: Material(
              color: colorTheme.primaryContainer,
              shape: CornersBorder.rounded(
                corners: Corners.all(shapeTheme.full),
              ),
              child: SizedBox(
                height: 64.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: null,

                      style: ButtonStyle(
                        iconColor: WidgetStateProperty.fromMap({
                          WidgetState.disabled: colorTheme.onSurface.withValues(
                            alpha: 0.38,
                          ),
                          WidgetState.selected: colorTheme.onSurface,
                          WidgetState.any: colorTheme.onPrimaryContainer,
                        }),
                      ),
                      icon: IconTheme.replaceWithLegacy(
                        child: Icon(Symbols.undo),
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: null,
                      style: ButtonStyle(
                        iconColor: WidgetStateProperty.fromMap({
                          WidgetState.disabled: colorTheme.onSurface.withValues(
                            alpha: 0.38,
                          ),
                          WidgetState.selected: colorTheme.onSurface,
                          WidgetState.any: colorTheme.onPrimaryContainer,
                        }),
                      ),
                      icon: IconTheme.replaceWithLegacy(
                        child: Icon(Symbols.redo),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Button(
                      onTap: null,
                      icon: Icon(Symbols.file_export),

                      label: Text("Export"),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorDialog extends StatefulWidget {
  const ColorDialog({super.key});

  @override
  State<ColorDialog> createState() => _ColorDialogState();
}

class _ColorDialogState extends State<ColorDialog> {
  double _hue = 0.0;
  double _chroma = 0.0;
  double _tone = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorTheme = ColorTheme.of(context);
    final typescaleTheme = TypescaleTheme.of(context);
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 280,
          maxWidth: 560,
          minHeight: 240,
          maxHeight: size.height * 2 / 3,
        ),
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Pick a color",
                        style: typescaleTheme.headlineSmallEmphasized
                            .toTextStyle()
                            .copyWith(color: colorTheme.onSurface),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 52,
                        child: HctColorPicker(aspect: _Aspect.hue),
                      ),
                      ColorSlider(
                        value: _hue / 360.0,
                        onChanged: (value) =>
                            setState(() => _hue = value * 360.0),
                        labelText: "Hue",
                      ),
                      TextField(
                        controller: TextEditingController(
                          text: _hue.toStringAsFixed(1),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Hue",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24 - 4 - 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 12,
                    children: [
                      Button(
                        color: ButtonColor.outlined,
                        onTap: () {},
                        label: Text("Cancel"),
                      ),
                      Button(
                        color: ButtonColor.tonal,
                        onTap: () {},
                        label: Text("Apply"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorSlider extends StatefulWidget {
  const ColorSlider({
    super.key,
    required this.onChanged,
    required this.value,
    this.labelText,
  });

  final ValueChanged<double> onChanged;
  final double value;

  final String? labelText;

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  final _textFieldKey = GlobalKey<FormFieldState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toStringAsFixed(1));
  }

  @override
  void didUpdateWidget(covariant ColorSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value.toStringAsFixed(1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
            onChanged: widget.onChanged,
            value: widget.value,
            min: 0.0,
            max: 360.0,
          ),
        ),
        Expanded(
          child: TextFormField(
            key: _textFieldKey,
            autovalidateMode: AutovalidateMode.always,
            controller: _controller,
            onChanged: (value) => _textFieldKey.currentState?.validate(),
            onFieldSubmitted: (value) {
              if (_textFieldKey.currentState?.validate() == true) {
                widget.onChanged(double.parse(value));
              }
            },
            validator: (value) {
              if (value == null) {
                return "Cannot be empty";
              }
              final number = double.tryParse(value);
              if (number == null) {
                return "Invalid number";
              }
              return null;
            },
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,

              labelText: widget.labelText,
            ),
          ),
        ),
      ],
    );
  }
}

enum _Aspect { hue, chroma, tone }

class HctColorPicker extends StatefulWidget {
  const HctColorPicker({super.key, required this.aspect});

  final _Aspect aspect;

  @override
  State<HctColorPicker> createState() => _HctColorPickerState();
}

class _HctColorPickerState extends State<HctColorPicker> {
  double _hue = 200;
  double _chroma = 50;
  double _tone = 50;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDragStart(DragStartDetails details) {}
  void _onDragUpdate(DragUpdateDetails details) {}

  @override
  Widget build(BuildContext context) {
    const trackHeight = 40.0;
    const handleHeight = 52.0;

    final from = Hct.from(0, _chroma, _tone);
    final to = Hct.from(360, _chroma, _tone);
    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(from.toInt()), Color(to.toInt())],
    );

    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      child: SizedBox(
        height: math.max(trackHeight, handleHeight),
        child: CustomPaint(
          size: Size.fromHeight(math.max(trackHeight, handleHeight)),
          painter: _HctPainter(
            textDirection: Directionality.maybeOf(context),
            trackHeight: trackHeight,
            handleHeight: handleHeight,
            hue: 150,
            chroma: 75,
            tone: 50,
          ),
        ),
      ),
    );
  }
}

class _HctPainter extends CustomPainter {
  const _HctPainter({
    this.textDirection,
    required this.trackHeight,
    required this.handleHeight,
    required this.hue,
    required this.chroma,
    required this.tone,
  });

  final TextDirection? textDirection;

  final double trackHeight;
  final double handleHeight;

  final double hue;
  final double chroma;
  final double tone;

  Hct _forHue(double t) {
    assert(0.0 <= t && t <= 1.0);
    return Hct.from(t * 360.0, chroma, tone);
  }

  Hct _forChroma(double t) {
    assert(0.0 <= t && t <= 1.0);
    return Hct.from(hue, t * 150.0, tone);
  }

  Hct _forTone(double t) {
    assert(0.0 <= t && t <= 1.0);
    return Hct.from(hue, chroma, t * 100.0);
  }

  List<Color> _colorsFor(int count, Color Function(double t) generator) {
    assert(count >= 2);
    final lastIndex = count - 1;
    return List.generate(count, (index) {
      final t = index / lastIndex;
      return generator(t);
    });
  }

  Gradient _buildGradient(List<Color> colors) {
    return LinearGradient(
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
      colors: colors,
    );
  }

  List<Color> _colorsForHue([int count = 6]) {
    return _colorsFor(count, (t) => Color(_forHue(t).toInt()));
  }

  List<Color> _colorsForChroma([int count = 20]) {
    return _colorsFor(count, (t) => Color(_forChroma(t).toInt()));
  }

  List<Color> _colorsForTone([int count = 20]) {
    return _colorsFor(count, (t) => Color(_forTone(t).toInt()));
  }

  // ui.Image _buildImage() {
  //   final list = Uint8List.fromList([]);
  //   final codec = ui.instantiateImageCodec(list);
  // }

  @override
  void paint(Canvas canvas, Size size) {
    final largestHeight = math.max(trackHeight, handleHeight);
    assert(size.height >= largestHeight);

    const value = 0.4;
    const gap = 6.0;
    final alignment = Alignment(value * 2.0 - 1.0, 0.0);
    final handleRect = Rect.fromCenter(
      center: alignment.alongSize(size),
      width: 4.0,
      height: handleHeight,
    );
    final handleBorderRadius = BorderRadius.circular(
      handleRect.shortestSide / 2,
    );
    final handleRRect = handleBorderRadius.toRRect(handleRect);

    final trackStartRect = Rect.fromLTRB(
      0.0,
      (size.height - trackHeight) / 2.0,
      math.max(0.0, handleRect.left - gap),
      (size.height + trackHeight) / 2.0,
    );
    final trackStartBorderRadius = BorderRadius.horizontal(
      left: Radius.circular(12.0),
      right: Radius.circular(2.0),
    );
    final trackStartRRect = trackStartBorderRadius.toRRect(trackStartRect);

    final handleColor = Color(_forHue(value).toInt());
    final handlePaint = Paint()..color = handleColor;
    canvas.drawRRect(handleRRect, handlePaint);
    final path = Path()
      ..addRRect(trackStartRRect)
      ..close();
    canvas.clipPath(path);

    // debugPrint(
    //   "${_colorsForHue(2).map((color) => color.toARGB32().toRadixString(16))}",
    // );
    final rect = Offset.zero & size;
    final colors = _colorsForHue();
    final gradient = _buildGradient(colors);
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect, textDirection: textDirection);
    canvas.drawPaint(paint);
    // final paint
    // final gradient =
    // canvas.drawPoints(ui.PointMode.points, [], )
    // canvas.scale(1.0, size.height);
    // canvas.save();
    // canvas.clipPath(
    //   Path()..addRRect(RRect.fromLTRBAndCorners(left, top, right, bottom)),
    // );
    // final t = hue / 360.0;
    // for (int x = 0; x < size.width; x++) {
    //   final paint = Paint()..color = Color(_forTone(x / size.width).toInt());
    //   canvas.drawRect(
    //     Rect.fromLTWH(x.toDouble(), 0.0, 1.0, size.height),
    //     paint,
    //   );
    // }
    // final paint = Paint()
    //   ..strokeWidth = 4
    //   ..color = Colors.red
    //   ..style = PaintingStyle.stroke;
    // canvas.drawRRect(
    //   BorderRadius.circular(
    //     16,
    //   ).toRRect(Rect.fromLTWH(t - 8, 0, 16, size.height)),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant _HctPainter oldDelegate) {
    return textDirection != oldDelegate.textDirection ||
        hue != oldDelegate.hue ||
        chroma != oldDelegate.chroma ||
        tone != oldDelegate.tone;
  }
}
