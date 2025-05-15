import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

sealed class ThemeEvent implements ReplayEvent {
  const ThemeEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType && other is ThemeEvent;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

final class ThemeSourceColorChanged extends ThemeEvent {
  const ThemeSourceColorChanged(this.sourceColor);

  final Color sourceColor;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemeSourceColorChanged &&
            sourceColor == other.sourceColor;
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceColor);
}

final class ThemeState {
  const ThemeState({
    this.sourceColor = const Color(0xFF6750A4),
    this.contrastLevel = 0.0,
  });

  final Color sourceColor;
  final double contrastLevel;

  ThemeState copyWith({Color? sourceColor, double? contrastLevel}) {
    if (sourceColor == null && contrastLevel == null) {
      return this;
    }
    return ThemeState(
      sourceColor: sourceColor ?? this.sourceColor,
      contrastLevel: contrastLevel ?? this.contrastLevel,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemeState &&
            sourceColor == other.sourceColor;
  }

  @override
  int get hashCode => Object.hash(runtimeType, sourceColor);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>
    with ReplayBlocMixin<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeSourceColorChanged>(_onSourceColorChanged);
  }

  void _onSourceColorChanged(
    ThemeSourceColorChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(sourceColor: event.sourceColor));
  }
}
