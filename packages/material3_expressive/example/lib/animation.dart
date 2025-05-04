import 'package:flutter/material.dart';

typedef TweenBuilder<T extends Object> =
    Tween<T> Function(SingleTweenVisitor<T> visitor);

typedef ForEachTween<T extends Object> = void Function(TweenVisitor<T> visitor);

typedef SingleTweenVisitor<T extends Object> =
    void Function(T targetValue, TweenConstructor<T> constructor);

// ImplicitlyAnimatedWidgetState a
class ImplicitAnimationControllerAAAA<T extends Object> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  ImplicitAnimationControllerAAAA({
    required TickerProvider vsync,
    required Duration duration,
    Curve curve = Curves.linear,
    required TweenBuilder<T> builder,
    String? debugLabel,
  }) : _curve = curve,
       _builder = builder {
    _controller = AnimationController(
      vsync: vsync,
      duration: duration,
      debugLabel: debugLabel,
    );
    _controller.addStatusListener((status) {
      if (status.isCompleted) {
        // onEnd?.call();
      }
    });
    _constructTween();
  }

  Duration get duration => _controller.duration!;
  set duration(Duration value) {
    if (_controller.duration == value) {
      return;
    }
    _controller.duration = value;

    _didUpdate();
  }

  Curve _curve;
  Curve get curve => _curve;
  set curve(Curve value) {
    if (_curve == value) {
      return;
    }
    _curve = value;
    _animation.dispose();
    _animation = _createCurve();

    _didUpdate();
  }

  TweenBuilder<T> _builder;
  TweenBuilder<T> get builder => _builder;
  set builder(TweenBuilder<T> value) {
    if (_builder == value) {
      return;
    }
    _builder = value;

    _didUpdate();
  }

  Tween<T>? _tween;
  late AnimationController _controller;
  late CurvedAnimation _animation = _createCurve();

  CurvedAnimation _createCurve() {
    return CurvedAnimation(parent: _controller, curve: curve);
  }

  void _didUpdate() {
    if (_constructTween()) {
      _setupTween((tween, targetValue, constructor) {
        return tween
          ?..begin = tween.evaluate(_animation)
          ..end = targetValue;
      });
      _controller.forward(from: 0.0);
    }
  }

  bool _constructTween() {
    bool shouldStartAnimation = false;
    builder((targetValue, constructor) {
      final tween = _tween ?? constructor(targetValue);
      if (targetValue != (tween.end ?? tween.begin)) {
        shouldStartAnimation = true;
      } else {
        tween.end ??= tween.begin;
      }
      _tween = tween;
    });
    return shouldStartAnimation;
  }

  void _setupTween(TweenVisitor<T> visitor) {
    // _tween =
  }

  @override
  @mustCallSuper
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  AnimationStatus get status => _controller.status;

  @override
  T get value {
    assert(_tween != null);
    return _tween!.evaluate(_animation);
  }

  set value(T value) {}
}

class ImplicitAnimationController extends Animation<double>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  ImplicitAnimationController({
    required TickerProvider vsync,
    required Duration duration,
    required Curve curve,
    required ForEachTween<Object?> builder,
  }) : _curve = curve,
       _builder = builder {
    _controller = AnimationController(vsync: vsync, duration: duration)
      ..addStatusListener(notifyStatusListeners)
      ..addListener(notifyListeners);
  }

  late final AnimationController _controller;
  late CurvedAnimation _animation = _createCurve();

  Duration get duration {
    assert(_controller.duration != null);
    return _controller.duration!;
  }

  set duration(Duration value) {
    if (_controller.duration == value) {
      return;
    }
    _controller.duration = value;
    _didUpdate();
  }

  Curve _curve;
  Curve get curve => _curve;
  set curve(Curve value) {
    if (_curve == value) {
      return;
    }
    _curve = value;
    _animation.dispose();
    _animation = _createCurve();
  }

  ForEachTween<Object?> _builder;

  @override
  AnimationStatus get status => _animation.status;

  @override
  double get value => _animation.value;

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _didUpdate() {
    if (_constructTweens()) {
      _forEachTween((tween, targetValue, constructor) {
        return tween
          ?..begin = tween.evaluate(_animation)
          ..end = targetValue;
      });
      _controller.forward(from: 0.0);
    }
  }

  CurvedAnimation _createCurve() {
    return CurvedAnimation(parent: _controller, curve: _curve);
  }

  bool _constructTweens() {
    bool shouldStartAnimation = false;
    _forEachTween((tween, targetValue, constructor) {
      if (targetValue != null) {
        tween ??= constructor(targetValue);
        if (targetValue != (tween.end ?? tween.begin)) {
          shouldStartAnimation = true;
        } else {
          tween.end ??= tween.begin;
        }
      } else {
        tween = null;
      }
      return tween;
    });
    return shouldStartAnimation;
  }

  void _forEachTween(TweenVisitor<Object?> visitor) {
    _builder(visitor);
  }

  void animate() {
    _didUpdate();
  }
}

typedef TweenConstructorNullable<T extends Object?> =
    Tween<T> Function(T value);
typedef TweenVisitorNullable<T extends Object?> =
    Tween<T>? Function(
      Tween<T>? tween,
      T targetValue,
      TweenConstructorNullable<T> constructor,
    );

class ImplicitAnimation<T extends Object?> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  ImplicitAnimation({
    required TickerProvider vsync,
    required Duration duration,
    Curve curve = Curves.linear,
    required T initialValue,
    required TweenConstructorNullable<T> builder,
  }) : _curve = curve,
       _targetValue = initialValue,
       _constructor = builder {
    _controller = AnimationController(vsync: vsync, duration: duration)
      ..addListener(notifyListeners)
      ..addStatusListener(notifyStatusListeners);
    _constructTweens();
  }

  late final AnimationController _controller;
  late CurvedAnimation _animation = _createCurve();

  Duration get duration {
    assert(_controller.duration != null);
    return _controller.duration!;
  }

  set duration(Duration value) {
    if (_controller.duration == value) {
      return;
    }
    _controller.duration = value;
  }

  Curve _curve;
  Curve get curve => _curve;
  set curve(Curve value) {
    if (_curve == value) {
      return;
    }
    _curve = value;
    _animation.dispose();
    _animation = _createCurve();
  }

  final TweenConstructorNullable<T> _constructor;
  Tween<T>? _tween;

  T _targetValue;
  T get targetValue => _targetValue;
  set targetValue(T value) {
    if (_targetValue == value) {
      return;
    }
    _targetValue = value;
    _animate();
  }

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

  TickerFuture? _animate() {
    if (!_constructTweens()) {
      return null;
    }
    _forEachTween((tween, targetValue, constructor) {
      return tween
        ?..begin = tween.evaluate(_animation)
        ..end = targetValue;
    });
    return _controller.forward(from: 0.0);
  }

  bool _constructTweens() {
    bool shouldStartAnimation = false;
    _forEachTween((tween, targetValue, constructor) {
      if (targetValue != null) {
        tween ??= constructor(targetValue);
        if (targetValue != (tween.end ?? tween.begin)) {
          shouldStartAnimation = true;
        } else {
          tween.end ??= tween.begin;
        }
      } else {
        tween = null;
      }
      return tween;
    });
    return shouldStartAnimation;
  }

  CurvedAnimation _createCurve() {
    return CurvedAnimation(parent: _controller, curve: _curve);
  }

  void _forEachTween(TweenVisitorNullable<T> visitor) {
    _tween = visitor(_tween, _targetValue, _constructor);
  }

  // TickerFuture? animateTo(T target) {
  //   if (_targetValue == target) {
  //     return null;
  //   }
  //   _targetValue = target;
  //   return _animate();
  // }
}
