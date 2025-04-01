import 'package:flutter/material.dart';
import 'package:material/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final backgroundColor = color ?? Colors.transparent;
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        animationDuration: Duration.zero,
        borderOnForeground: true,
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        shape: CornersBorder(
          delegate: shapeTheme.corner.family.delegate,
          corners: Corners.all(shapeTheme.corner.full),
          side: BorderSide(
            width: 1,
            color: colorTheme.outline,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child:
            color == null
                ? CustomPaint(painter: _NoColorPainter(color: colorTheme.error))
                : null,
      ),
    );
  }
}

class _NoColorPainter extends CustomPainter {
  const _NoColorPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..color = color;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant _NoColorPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
