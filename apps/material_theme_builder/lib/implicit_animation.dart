import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

typedef TweenBuilder<T extends Object?> = Tween<T> Function(T value);

abstract class ImplicitAnimation<T extends Object?> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  ImplicitAnimation() {
    controller
      ..addListener(notifyListeners)
      ..addStatusListener(notifyStatusListeners);
    buildTween();
  }

  @protected
  AnimationController get controller;

  @protected
  Animation<double> get animation;

  Tween<T>? _tween;

  @protected
  Tween<T>? get tween => _tween;

  @protected
  set tween(Tween<T>? value) {
    if (_tween == value) {
      return;
    }
    _tween = value;
  }

  TweenBuilder<T> get builder;
  T get targetValue;
  set value(T value);

  @protected
  TickerFuture animate();

  @protected
  TickerFuture? startAnimation({T? from, T? to}) {
    if (!buildTween()) return null;
    final tween = _tween;
    _tween = tween
      ?..begin = from ?? tween.evaluate(animation)
      ..end = to ?? targetValue;
    return animate();
  }

  @protected
  bool buildTween() {
    bool shouldStartAnimation = false;

    Tween<T>? tween = _tween;
    if (targetValue != null) {
      tween ??= builder(targetValue);
      if (targetValue != (tween.end ?? tween.begin)) {
        shouldStartAnimation = true;
      } else {
        tween.end ??= tween.begin;
      }
    } else {
      tween = null;
    }
    _tween = tween;

    return shouldStartAnimation;
  }

  @override
  AnimationStatus get status => animation.status;

  @override
  T get value => _tween?.evaluate(animation) ?? targetValue;

  @override
  String toStringDetails() => controller.toStringDetails();
}

class CurveImplicitAnimation<T extends Object?> extends ImplicitAnimation<T> {
  CurveImplicitAnimation({
    String? debugLabel,
    required TickerProvider vsync,
    required Duration duration,
    Curve curve = Curves.linear,
    required T initialValue,
    required TweenBuilder<T> builder,
  }) : _curve = curve,
       _targetValue = initialValue,
       _builder = builder,
       controller = AnimationController(
         debugLabel: debugLabel,
         vsync: vsync,
         duration: duration,
       ),
       super();

  @override
  final AnimationController controller;

  late CurvedAnimation _animation = _createAnimation();

  @override
  Animation<double> get animation => _animation;

  @override
  AnimationStatus get status => _animation.status;

  T get _value => _tween?.evaluate(_animation) ?? _targetValue;

  @override
  T get value => _value;

  @override
  set value(T newValue) {
    if (_value == newValue &&
        _targetValue == newValue &&
        !controller.isAnimating) {
      return;
    }
    _targetValue = newValue;
    _tween
      ?..begin = _targetValue
      ..end = _targetValue;
    controller.value = 0.0;
  }

  @override
  void dispose() {
    _animation.dispose();
    controller.dispose();
    super.dispose();
  }

  Duration get duration {
    assert(controller.duration != null);
    return controller.duration!;
  }

  set duration(Duration value) {
    if (controller.duration == value) {
      return;
    }
    controller.duration = value;
    startAnimation();
  }

  Curve _curve;

  Curve get curve => _curve;

  set curve(Curve value) {
    if (_curve == value) {
      return;
    }
    _curve = value;
    _animation.dispose();
    _animation = _createAnimation();
    startAnimation();
  }

  TweenBuilder<T> _builder;

  @override
  TweenBuilder<T> get builder => _builder;

  set builder(TweenBuilder<T> value) {
    if (_builder == value) {
      return;
    }
    _builder = value;
    final current = _tween?.evaluate(_animation);
    startAnimation(from: current);
  }

  T _targetValue;

  @override
  T get targetValue => _targetValue;

  set targetValue(T value) {
    if (_targetValue == value) {
      return;
    }
    _targetValue = value;
    startAnimation();
  }

  @override
  TickerFuture animate() {
    return controller.forward(from: 0.0);
  }

  CurvedAnimation _createAnimation() {
    return CurvedAnimation(parent: controller, curve: _curve);
  }
}

class SpringImplicitAnimation<T extends Object?> extends ImplicitAnimation<T> {
  SpringImplicitAnimation({
    String? debugLabel,
    required TickerProvider vsync,
    required SpringDescription spring,
    required T initialValue,
    required TweenBuilder<T> builder,
  }) : _spring = spring,
       _targetValue = initialValue,
       _builder = builder,
       controller = AnimationController.unbounded(
         vsync: vsync,
         debugLabel: debugLabel,
       ),
       super();

  @override
  final AnimationController controller;

  @override
  Animation<double> get animation => controller;

  SpringDescription _spring;

  SpringDescription get spring => _spring;

  set spring(SpringDescription value) {
    if (_spring == value) {
      return;
    }
    _spring = value;
    startAnimation();
  }

  TweenBuilder<T> _builder;

  @override
  TweenBuilder<T> get builder => _builder;

  set builder(TweenBuilder<T> value) {
    if (_builder == value) {
      return;
    }
    _builder = value;
    final current = tween?.evaluate(controller);
    tween = null;
    startAnimation(from: current);
  }

  T _targetValue;

  @override
  T get targetValue => _targetValue;

  set targetValue(T value) {
    if (_targetValue == value) {
      return;
    }
    _targetValue = value;
    startAnimation();
  }

  @override
  set value(T newValue) {
    if (value == newValue &&
        _targetValue == newValue &&
        !controller.isAnimating) {
      return;
    }
    _targetValue = newValue;
    _tween
      ?..begin = _targetValue
      ..end = _targetValue;
    controller.value = 0.0;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  TickerFuture animate() {
    final simulation = _createSimulation();
    return controller.animateWith(simulation);
  }

  Simulation _createSimulation() {
    return SpringSimulation(_spring, 0.0, 1.0, 0.0, snapToEnd: true);
    // return ScrollSpringSimulation(_spring, 0.0, 1.0, 1.0);
  }
}
