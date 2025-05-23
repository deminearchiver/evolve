import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// ButtonStyleButton? _buttonStyleButton;

// enum ButtonSize {
//   extraSmall, // md.comp.button.xsmall
//   small, // md.comp.button.small
//   medium, // md.comp.button.medium
//   large, // md.comp.button.large
//   extraLarge, // md.comp.button.xlarge
// }

// enum ButtonVariant {
//   filled, // md.comp.button.filled
//   tonal, // md.comp.button.tonal
//   elevated, // md.comp.button.elevated
//   text, // md.comp.button.text
//   outlined, // md.comp.button.outlined
// }

// enum ButtonState { enabled, disabled, hovered, focused, presed }

// class Button extends StatefulWidget {
//   const Button({super.key, this.enabled = true, this.selected});

//   final bool? selected;

//   final bool enabled;
//   // final bool square;

//   @override
//   State<Button> createState() => _ButtonState();
// }

// class _ButtonState extends State<Button> {
//   late ButtonState _state;
//   late WidgetStatesController _statesController;
//   bool get _disabled => _state == ButtonState.disabled;
//   bool get _enabled => !_disabled;

//   @override
//   void initState() {
//     super.initState();
//     _state = widget.enabled ? ButtonState.enabled : ButtonState.disabled;
//     _statesController = WidgetStatesController();
//   }

//   @override
//   void didUpdateWidget(covariant Button oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.enabled != oldWidget.enabled) {
//       _state = widget.enabled ? ButtonState.enabled : ButtonState.disabled;
//     }
//   }

//   void _updateState(ButtonState state) {
//     _state = state;
//     if (state == ButtonState.disabled) {
//       _statesController.value = {WidgetState.disabled};
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final child = const Placeholder();
//     const double touchTargetSize = 48.0;
//     const double minWidth = 48.0;
//     return Semantics(
//       container: true,
//       button: true,
//       // enabled: widget.enabled,
//       child: _InputPadding(
//         minSize: const Size.square(touchTargetSize),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minWidth: math.max(minWidth, touchTargetSize),
//           ),
//           child: Material(
//             child: Tooltip(
//               child: InkWell(
//                 child: Padding(padding: EdgeInsets.zero, child: child),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// A widget to pad the area around a [ButtonStyleButton]'s inner [Material].
// ///
// /// Redirect taps that occur in the padded area around the child to the center
// /// of the child. This increases the size of the button and the button's
// /// "tap target", but not its material or its ink splashes.
// class _InputPadding extends SingleChildRenderObjectWidget {
//   const _InputPadding({super.child, required this.minSize});

//   final Size minSize;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return _RenderInputPadding(minSize);
//   }

//   @override
//   void updateRenderObject(
//     BuildContext context,
//     covariant _RenderInputPadding renderObject,
//   ) {
//     renderObject.minSize = minSize;
//   }
// }

// class _RenderInputPadding extends RenderShiftedBox {
//   _RenderInputPadding(this._minSize, [RenderBox? child]) : super(child);

//   Size get minSize => _minSize;
//   Size _minSize;
//   set minSize(Size value) {
//     if (_minSize == value) {
//       return;
//     }
//     _minSize = value;
//     markNeedsLayout();
//   }

//   @override
//   double computeMinIntrinsicWidth(double height) {
//     if (child != null) {
//       return math.max(child!.getMinIntrinsicWidth(height), minSize.width);
//     }
//     return 0.0;
//   }

//   @override
//   double computeMinIntrinsicHeight(double width) {
//     if (child != null) {
//       return math.max(child!.getMinIntrinsicHeight(width), minSize.height);
//     }
//     return 0.0;
//   }

//   @override
//   double computeMaxIntrinsicWidth(double height) {
//     if (child != null) {
//       return math.max(child!.getMaxIntrinsicWidth(height), minSize.width);
//     }
//     return 0.0;
//   }

//   @override
//   double computeMaxIntrinsicHeight(double width) {
//     if (child != null) {
//       return math.max(child!.getMaxIntrinsicHeight(width), minSize.height);
//     }
//     return 0.0;
//   }

//   Size _computeSize({
//     required BoxConstraints constraints,
//     required ChildLayouter layoutChild,
//   }) {
//     if (child != null) {
//       final Size childSize = layoutChild(child!, constraints);
//       final double height = math.max(childSize.width, minSize.width);
//       final double width = math.max(childSize.height, minSize.height);
//       return constraints.constrain(Size(height, width));
//     }
//     return Size.zero;
//   }

//   @override
//   Size computeDryLayout(BoxConstraints constraints) {
//     return _computeSize(
//       constraints: constraints,
//       layoutChild: ChildLayoutHelper.dryLayoutChild,
//     );
//   }

//   @override
//   double? computeDryBaseline(
//     covariant BoxConstraints constraints,
//     TextBaseline baseline,
//   ) {
//     final RenderBox? child = this.child;
//     if (child == null) {
//       return null;
//     }
//     final double? result = child.getDryBaseline(constraints, baseline);
//     if (result == null) {
//       return null;
//     }
//     final Size childSize = child.getDryLayout(constraints);
//     return result +
//         Alignment.center
//             .alongOffset(getDryLayout(constraints) - childSize as Offset)
//             .dy;
//   }

//   @override
//   void performLayout() {
//     size = _computeSize(
//       constraints: constraints,
//       layoutChild: ChildLayoutHelper.layoutChild,
//     );
//     if (child != null) {
//       final BoxParentData childParentData = child!.parentData! as BoxParentData;
//       childParentData.offset = Alignment.center.alongOffset(
//         size - child!.size as Offset,
//       );
//     }
//   }

//   @override
//   bool hitTest(BoxHitTestResult result, {required Offset position}) {
//     if (super.hitTest(result, position: position)) {
//       return true;
//     }
//     final Offset center = child!.size.center(Offset.zero);
//     return result.addWithRawTransform(
//       transform: MatrixUtils.forceToPoint(center),
//       position: center,
//       hitTest: (BoxHitTestResult result, Offset position) {
//         assert(position == center);
//         return child!.hitTest(result, position: center);
//       },
//     );
//   }
// }

// class ButtonStyle {
//   final WidgetStateProperty<EdgeInsetsGeometry> padding;
//   final WidgetStateProperty<TextStyle> labelTextStyle;
// }
