import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef ThemeSelectorCallback<T extends Object?, U extends Object?> =
    U Function(T data);

abstract interface class ThemeSelector<T extends Object?, U extends Object?> {
  const factory ThemeSelector.from(ThemeSelectorCallback<T, U> selector) =
      _FunctionThemeSelector;

  U selectFrom(T data);
}

class _FunctionThemeSelector<T extends Object?, U extends Object?>
    implements ThemeSelector<T, U> {
  const _FunctionThemeSelector(this._selector);

  final ThemeSelectorCallback<T, U> _selector;

  @override
  U selectFrom(T data) => _selector(data);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        runtimeType == other.runtimeType &&
            other is _FunctionThemeSelector<T, U> &&
            identical(other._selector, _selector);
  }

  @override
  int get hashCode => Object.hash(runtimeType, _selector);
}

abstract class BaseTheme<T extends Object?>
    extends InheritedModel<ThemeSelector<T, Object?>> {
  const BaseTheme({super.key, required super.child});

  T get data;

  @override
  bool updateShouldNotify(covariant BaseTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant BaseTheme<T> oldWidget,
    Set<ThemeSelector<T, Object?>> dependencies,
  ) {
    for (final selector in dependencies) {
      final oldValue = selector.selectFrom(oldWidget.data);
      final newValue = selector.selectFrom(data);
      if (oldValue != newValue) return true;
    }
    return false;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>("data", data));
  }
}
