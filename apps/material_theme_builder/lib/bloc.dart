import 'dart:ui';

import 'package:material3_expressive/material3_expressive.dart';
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

final class ThemeVariantChanged extends ThemeEvent {
  const ThemeVariantChanged(this.variant);

  final DynamicSchemeVariant variant;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemeVariantChanged &&
            variant == other.variant;
  }

  @override
  int get hashCode => Object.hash(runtimeType, variant);
}

final class ThemeVersionChanged extends ThemeEvent {
  const ThemeVersionChanged(this.version);

  final DynamicSchemeVersion version;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemeVersionChanged &&
            version == other.version;
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);
}

final class ThemePlatformChanged extends ThemeEvent {
  const ThemePlatformChanged(this.platform);

  final DynamicSchemePlatform platform;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemePlatformChanged &&
            platform == other.platform;
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform);
}

final class ThemeState {
  const ThemeState({
    this.sourceColor = const Color(0xFF6750A4),
    this.variant = DynamicSchemeVariant.tonalSpot,
    this.version = DynamicSchemeVersion.spec2021,
    this.platform = DynamicSchemePlatform.phone,
  });

  final Color sourceColor;
  final DynamicSchemeVariant variant;
  final DynamicSchemeVersion version;
  final DynamicSchemePlatform platform;

  ThemeState copyWith({
    Color? sourceColor,
    DynamicSchemeVariant? variant,
    DynamicSchemeVersion? version,
    DynamicSchemePlatform? platform,
  }) {
    if (sourceColor == null &&
        variant == null &&
        version == null &&
        platform == null) {
      return this;
    }
    return ThemeState(
      sourceColor: sourceColor ?? this.sourceColor,
      variant: variant ?? this.variant,
      version: version ?? this.version,
      platform: platform ?? this.platform,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is ThemeState &&
            sourceColor == other.sourceColor &&
            variant == other.variant &&
            version == other.version &&
            platform == other.platform;
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sourceColor, variant, version, platform);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>
    with ReplayBlocMixin<ThemeEvent, ThemeState> {
  ThemeBloc([super.state = const ThemeState()]) {
    on<ThemeSourceColorChanged>(_onSourceColorChanged);
    on<ThemeVariantChanged>(_onVariantChanged);
    on<ThemeVersionChanged>(_onVersionChanged);
    on<ThemePlatformChanged>(_onPlatformChanged);
  }

  void _onSourceColorChanged(
    ThemeSourceColorChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(sourceColor: event.sourceColor));
  }

  void _onVariantChanged(ThemeVariantChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(variant: event.variant));
  }

  void _onVersionChanged(ThemeVersionChanged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(version: event.version));
  }

  void _onPlatformChanged(
    ThemePlatformChanged event,
    Emitter<ThemeState> emit,
  ) {
    emit(state.copyWith(platform: event.platform));
  }
}
