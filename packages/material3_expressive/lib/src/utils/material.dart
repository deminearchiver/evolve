// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:material3_expressive/material3_expressive.dart';

// class Surface extends StatefulWidget {
//   const Surface({
//     super.key,
//     this.clipBehavior = Clip.antiAlias,
//     this.shape,
//     this.color,
//     this.shadowColor,
//     this.child,
//   });

//   final Clip clipBehavior;
//   final Color? color;
//   final Color? shadowColor;
//   final ShapeBorder? shape;
//   final Widget? child;

//   @override
//   State<Surface> createState() => _SurfaceState();
// }

// class _SurfaceState extends State<Surface> with TickerProviderStateMixin {
//   final GlobalKey _inkFeatureRenderer = GlobalKey(debugLabel: 'ink renderer');

//   bool _onLayoutChangedNotification(LayoutChangedNotification notification) {
//     final renderer =
//         _inkFeatureRenderer.currentContext!.findRenderObject()!
//             as _RenderInkFeatures;
//     renderer._didChangeLayout();
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = ColorTheme.of(context);
//     final shapeTheme = ShapeTheme.of(context);
//     final color = widget.color ?? Colors.transparent;
//     final shadowColor = widget.shadowColor ?? colorTheme.shadow;
//     final isTransparent =
//         color.a == 0.0 || color == color.withValues(alpha: 0.0);
//     final textDirection = Directionality.maybeOf(context);
//     Widget? contents = widget.child;
//     contents = NotificationListener<LayoutChangedNotification>(
//       onNotification: _onLayoutChangedNotification,
//       child: _InkFeatures(
//         key: _inkFeatureRenderer,
//         vsync: this,
//         absorbHitTest: !isTransparent,
//         color: color,
//         child: contents,
//       ),
//     );
//     final shape =
//         widget.shape ??
//         CornersBorder(
//           delegate: const RoundedCornersBorderDelegate(),
//           corners: Corners.all(shapeTheme.none),
//         );
//     if (isTransparent) {
//       return ClipPath(
//         clipper: ShapeBorderClipper(shape: shape, textDirection: textDirection),
//         clipBehavior: widget.clipBehavior,
//         child: _ShapeBorderPaint(shape: shape, child: contents),
//       );
//     }

//     return const Placeholder();
//   }
// }

// class _InkFeatures extends SingleChildRenderObjectWidget {
//   const _InkFeatures({
//     super.key,
//     this.color,
//     required this.vsync,
//     required this.absorbHitTest,
//     super.child,
//   });

//   // This widget must be owned by a MaterialState, which must be provided as the vsync.
//   // This relationship must be 1:1 and cannot change for the lifetime of the MaterialState.

//   final Color? color;

//   final TickerProvider vsync;

//   final bool absorbHitTest;

//   @override
//   _RenderInkFeatures createRenderObject(BuildContext context) {
//     return _RenderInkFeatures(
//       color: color,
//       absorbHitTest: absorbHitTest,
//       vsync: vsync,
//     );
//   }

//   @override
//   void updateRenderObject(
//     BuildContext context,
//     _RenderInkFeatures renderObject,
//   ) {
//     renderObject
//       ..color = color
//       ..absorbHitTest = absorbHitTest;
//     assert(vsync == renderObject.vsync);
//   }
// }

// class _RenderInkFeatures extends RenderProxyBox
//     implements MaterialInkController {
//   _RenderInkFeatures({
//     RenderBox? child,
//     required this.vsync,
//     required this.absorbHitTest,
//     this.color,
//   }) : super(child);

//   // This class should exist in a 1:1 relationship with a MaterialState object,
//   // since there's no current support for dynamically changing the ticker
//   // provider.
//   @override
//   final TickerProvider vsync;

//   // This is here to satisfy the MaterialInkController contract.
//   // The actual painting of this color is done by a Container in the
//   // MaterialState build method.
//   @override
//   Color? color;

//   bool absorbHitTest;

//   @visibleForTesting
//   List<InkFeature>? get debugInkFeatures {
//     if (kDebugMode) {
//       return _inkFeatures;
//     }
//     return null;
//   }

//   List<InkFeature>? _inkFeatures;

//   @override
//   void addInkFeature(InkFeature feature) {
//     assert(!feature._debugDisposed);
//     assert(feature._controller == this);
//     _inkFeatures ??= <InkFeature>[];
//     assert(!_inkFeatures!.contains(feature));
//     _inkFeatures!.add(feature);
//     markNeedsPaint();
//   }

//   void _removeFeature(InkFeature feature) {
//     assert(_inkFeatures != null);
//     _inkFeatures!.remove(feature);
//     markNeedsPaint();
//   }

//   void _didChangeLayout() {
//     if (_inkFeatures?.isNotEmpty ?? false) {
//       markNeedsPaint();
//     }
//   }

//   @override
//   bool hitTestSelf(Offset position) => absorbHitTest;

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     final List<InkFeature>? inkFeatures = _inkFeatures;
//     if (inkFeatures != null && inkFeatures.isNotEmpty) {
//       final Canvas canvas = context.canvas;
//       canvas.save();
//       canvas.translate(offset.dx, offset.dy);
//       canvas.clipRect(Offset.zero & size);
//       for (final InkFeature inkFeature in inkFeatures) {
//         inkFeature._paint(canvas);
//       }
//       canvas.restore();
//     }
//     assert(inkFeatures == _inkFeatures);
//     super.paint(context, offset);
//   }
// }
// InteractiveInkFeature a

// class _ShapeBorderPaint extends StatelessWidget {
//   const _ShapeBorderPaint({
//     required this.child,
//     required this.shape,
//     this.borderOnForeground = true,
//   });

//   final Widget child;
//   final ShapeBorder shape;
//   final bool borderOnForeground;

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: borderOnForeground
//           ? null
//           : _ShapeBorderPainter(shape, Directionality.maybeOf(context)),
//       foregroundPainter: borderOnForeground
//           ? _ShapeBorderPainter(shape, Directionality.maybeOf(context))
//           : null,
//       child: child,
//     );
//   }
// }

// class _ShapeBorderPainter extends CustomPainter {
//   _ShapeBorderPainter(this.border, this.textDirection);

//   final ShapeBorder border;
//   final TextDirection? textDirection;

//   @override
//   void paint(Canvas canvas, Size size) {
//     border.paint(canvas, Offset.zero & size, textDirection: textDirection);
//   }

//   @override
//   bool shouldRepaint(_ShapeBorderPainter oldDelegate) {
//     return border != oldDelegate.border;
//   }
// }
