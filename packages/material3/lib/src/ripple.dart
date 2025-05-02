import 'dart:ui' as ui;

import 'package:flutter/material.dart';

const int _kEnterAnimationDuration = 450;

const int _kExitAnimationDuration = 375;

const int _kNoiseAnimationDuration = 7000;

const int _kMaxNoisePhase = _kNoiseAnimationDuration ~/ 214;

// LinearInterpolator
const Curve _linear = _Linear();

// PathInterpolator(0.4f, 0f, 0.2f, 1f)
const Curve _fastOutSlowIn = Curves.fastOutSlowIn;

/// The identity map over the unit interval.
class _Linear extends Curve {
  const _Linear();

  @override
  double transformInternal(double t) => t;
}

class Ripple extends InteractiveInkFeature {
  Ripple({
    required super.controller,
    required super.referenceBox,
    required ui.Offset position,
    required super.color,
    required ui.TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    ui.VoidCallback? onRemoved,
  }) : assert(containedInkWell || rectCallback == null) {
    _RippleFactory.initializeShader();
    controller.addInkFeature(this);

    // Immediately begin animating the ink.
    _animationController =
        AnimationController(
            // duration: _animationDuration,
            vsync: controller.vsync,
          )
          ..addListener(controller.markNeedsPaint)
          // ..addStatusListener(_handleStatusChanged)
          ..forward();
  }
  // Animation
  late AnimationController _animationController;

  // Shader
  ui.FragmentShader? _fragmentShader;

  @override
  void paintFeature(ui.Canvas canvas, Matrix4 transform) {
    final program = _RippleFactory._program;
    if (program == null) return;
    _maybeInitializeFragmentShader(program);

    final paint = Paint()..shader = _fragmentShader;
  }

  @override
  void dispose() {
    _fragmentShader?.dispose();
    super.dispose();
  }

  void _maybeInitializeFragmentShader(ui.FragmentProgram program) {
    if (_fragmentShader != null) return;
    _fragmentShader = program.fragmentShader();
  }

  static const InteractiveInkFeatureFactory splashFactory = _RippleFactory();
}

class _RippleFactory extends InteractiveInkFeatureFactory {
  const _RippleFactory();

  static bool _initCalled = false;
  static ui.FragmentProgram? _program;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required ui.Offset position,
    required ui.Color color,
    required ui.TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    ui.VoidCallback? onRemoved,
  }) {
    return Ripple(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius,
      onRemoved: onRemoved,
    );
  }

  static void initializeShader() {
    if (!_initCalled) {
      ui.FragmentProgram.fromAsset(
        "packages/material3/shaders/ripple.frag",
      ).then((program) {
        _program = program;
      });
      _initCalled = true;
    }
  }
}
