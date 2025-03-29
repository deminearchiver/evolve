import 'dart:math' as math;

import 'package:example/labs/dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialThemeBuilderApp());
}

class MaterialThemeBuilderApp extends StatefulWidget {
  const MaterialThemeBuilderApp({super.key});

  @override
  State<MaterialThemeBuilderApp> createState() =>
      _MaterialThemeBuilderAppState();
}

class _MaterialThemeBuilderAppState extends State<MaterialThemeBuilderApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Test1(),
      builder:
          (context, child) =>
              child != null
                  ? CombiningBuilder(builders: [], child: child)
                  : const SizedBox.shrink(),
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
    return Scaffold(
      body: Flex.vertical(
        children: [
          Button.filled(
            onPressed:
                () => showDialog(
                  context: context,
                  builder: (context) => const Test2(),
                ),
            label: Text("Primary color"),
          ),
          Button.filled(
            onPressed:
                () => showBasicDialog(
                  context: context,
                  builder:
                      (context) => BasicDialog(
                        headline: Text("Basic dialog"),
                        actions: [
                          Button.text(onPressed: () {}, label: Text("Cancel")),
                          const SizedBox(width: 8),
                          Button.filledTonal(
                            onPressed: () {},
                            label: Text("OK"),
                          ),
                        ],
                      ),
                ),
            label: Text("Show basic dialog"),
          ),
        ],
      ),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return AlertDialog(
      icon: const Icon(Symbols.palette),
      title: Text("HCT Color Picker"),
      // content: Align.center(
      //   child: Ink(
      //     child: CustomPaint(
      //       size: Size.square(40),
      //       painter: _WheelPainter(
      //         rotation: math.pi,
      //         colors: [
      //           colorTheme.primary,
      //           colorTheme.primary,
      //           colorTheme.tertiary,
      //           colorTheme.secondary,
      //         ],
      //       ),
      //       child: InkWell(onTap: () {}),
      //     ),
      //   ),
      // ),
      actions: [
        Button.text(onPressed: () {}, label: Text("Cancel")),
        Button.filledTonal(onPressed: () {}, label: Text("OK")),
      ],
    );
  }
}

class _WheelPainter extends CustomPainter {
  const _WheelPainter({this.rotation = 0, required this.colors})
    : assert(colors.length >= 1);

  final double rotation;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final arcLength = 2 * math.pi / colors.length;

    for (final (index, color) in colors.indexed) {
      final paint = Paint()..color = color;
      canvas.drawArc(
        rect,
        rotation + arcLength * index,
        arcLength,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WheelPainter oldDelegate) {
    return rotation != oldDelegate.rotation ||
        !listEquals(colors, oldDelegate.colors);
  }
}
