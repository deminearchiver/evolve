import 'package:flutter/animation.dart';

AnimationController? _animationController;

class ImplicitAnimation<T extends Object?> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  @override
  AnimationStatus get status => throw UnimplementedError();

  @override
  T get value => throw UnimplementedError();
}

class ImplicitTweenAnimation<T extends Object?> {}

class ImplicitSpringAnimation<T extends Object?> extends Animation<T>
    with
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  // TickerFuture animateTo(T target, {double velocity = 0.0}) {

  // }

  @override
  AnimationStatus get status => throw UnimplementedError();

  @override
  T get value => throw UnimplementedError();
}
