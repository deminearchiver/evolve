import 'package:flutter/material.dart';

typedef TweenBuilder<T extends Object?> = Tween<T> Function(T value);

class ImplicitAnimation<T extends Object?> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  ImplicitAnimation({
    String? debugLabel,
    required TickerProvider vsync,
    required Duration duration,
    Curve curve = Curves.linear,
    required T initialValue,
    required TweenBuilder<T> builder,
  }) : _curve = curve,
       _targetValue = initialValue,
       _builder = builder {
    _controller =
        AnimationController(
            debugLabel: debugLabel,
            vsync: vsync,
            duration: duration,
          )
          ..addListener(notifyListeners)
          ..addStatusListener(notifyStatusListeners);
    _constructTween();
  }

  late final AnimationController _controller;
  late CurvedAnimation _animation = _createAnimation();
  Tween<T>? _tween;

  @override
  AnimationStatus get status => _animation.status;

  @override
  T get value => _tween?.evaluate(_animation) ?? _targetValue;

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  Duration get duration {
    assert(_controller.duration != null);
    return _controller.duration!;
  }

  set duration(Duration value) {
    if (_controller.duration == value) {
      return;
    }
    _controller.duration = value;
    _animate();
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
    _animate();
  }

  TweenBuilder<T> _builder;
  TweenBuilder<T> get builder => _builder;
  set builder(TweenBuilder<T> value) {
    if (_builder == value) {
      return;
    }
    _builder = value;
    final current = _tween?.evaluate(_animation);
    _animate(from: current);
  }

  T _targetValue;
  T get targetValue => _targetValue;
  set targetValue(T value) {
    if (_targetValue == value) {
      return;
    }
    _targetValue = value;
    _animate();
  }

  TickerFuture? _animate({T? from, T? to}) {
    if (!_constructTween()) return null;
    final tween = _tween;
    _tween = tween
      ?..begin = from ?? tween.evaluate(_animation)
      ..end = to ?? _targetValue;
    return _controller.forward(from: 0.0);
  }

  bool _constructTween() {
    bool shouldStartAnimation = false;

    Tween<T>? tween = _tween;
    if (_targetValue != null) {
      tween ??= _builder(_targetValue);
      if (_targetValue != (tween.end ?? tween.begin)) {
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

  CurvedAnimation _createAnimation() {
    return CurvedAnimation(parent: _controller, curve: _curve);
  }

  @override
  String toStringDetails() {
    return _controller.toStringDetails();
  }
}
