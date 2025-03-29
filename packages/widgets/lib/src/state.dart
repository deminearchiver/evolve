import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@experimental
mixin DeferredWidgetStateMixin<T extends StatefulWidget> on State<T> {
  void deferredSetState(VoidCallback callback) {
    switch (SchedulerBinding.instance.schedulerPhase) {
      case SchedulerPhase.persistentCallbacks:
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(callback);
        });
      default:
        if (mounted) setState(callback);
    }
  }
}

@experimental
mixin DeferredRouteStateMixin<T> on ModalRoute<T> {
  void deferredSetState(VoidCallback callback) {
    switch (SchedulerBinding.instance.schedulerPhase) {
      case SchedulerPhase.persistentCallbacks:
        SchedulerBinding.instance.addPostFrameCallback(
          (_) => setState(callback),
        );
      default:
        setState(callback);
    }
  }
}
