import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/rendering.dart';

class Notifier extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}

class PersistentFrameNotifier extends ChangeNotifier {
  PersistentFrameNotifier() {
    PersistentFrameCallbacks.add(_persistentFrameCallback);
  }

  @override
  void dispose() {
    PersistentFrameCallbacks.remove(_persistentFrameCallback);
    super.dispose();
  }

  void _persistentFrameCallback(Duration _) {
    notifyListeners();
  }
}

abstract final class PersistentFrameCallbacks {
  static bool _persistentFrameCallbackScheduled = false;
  static final Set<FrameCallback> _persistentFrameCallbacks = <FrameCallback>{};

  static bool add(FrameCallback callback) {
    if (!_persistentFrameCallbackScheduled) {
      Future.microtask(() {
        SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
          for (final callback in _persistentFrameCallbacks) {
            callback(timeStamp);
          }
        });
      });
      _persistentFrameCallbackScheduled = true;
    }
    return _persistentFrameCallbacks.add(callback);
  }

  static bool remove(FrameCallback callback) {
    return _persistentFrameCallbacks.remove(callback);
  }
}

mixin RenderObjectRelayoutMixin on RenderObject {
  Listenable? _relayout;
  Listenable? get relayout => _relayout;
  set relayout(Listenable? value) {
    if (_relayout == value) {
      return;
    }
    if (attached) {
      _relayout?.removeListener(markNeedsLayout);
      value?.addListener(markNeedsLayout);
    }
    _relayout = value;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    relayout?.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    relayout?.removeListener(markNeedsLayout);
    super.detach();
  }
}
