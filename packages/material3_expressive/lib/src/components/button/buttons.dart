/// It is possible to customize the style of a button:
/// ```dart
/// import 'package:material3_expressive/material3_expressive.dart';
///
/// Widget build(BuildContext context) {
///   final size = ButtonSizeLarge.of(context);
///
///   return Button(
///     style: FilledButtonTheme.of,
///     icon: const Icon(Symbols.pause),
///     label: Text("Pause"),
///   );
/// }
///
/// ```
library;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:material3_expressive/material3_expressive.dart'
    show TypescaleTheme;

enum ButtonVariant { elevated, filled, tonal, outlined, text }

abstract class ButtonSizeTheme {
  const ButtonSizeTheme();

  Widget merge({Key? key, required ButtonStyle style, required Widget child});

  @protected
  ButtonStyle? defaultStyleOf(BuildContext context) => null;

  ButtonStyle? maybeStyleOf(BuildContext context);

  ButtonStyle styleOf(BuildContext context) {
    final result = maybeStyleOf(context);
    if (result != null) return result;
    final defaultStyle = defaultStyleOf(context);
    assert(
      defaultStyle != null,
      "No ancestor ButtonSizeTheme widget found an no default style provided.",
    );
    return defaultStyle!;
  }

  static const ButtonSizeTheme extraSmall = _ButtonSizeExtraSmall();
}

class _ButtonSizeExtraSmall extends ButtonSizeTheme {
  const _ButtonSizeExtraSmall();

  @override
  Widget merge({Key? key, required ButtonStyle style, required Widget child}) =>
      Builder(
        builder: (context) =>
            _ButtonSizeExtraSmallTheme(key: key, style: style, child: child),
      );

  @override
  ButtonStyle? defaultStyleOf(BuildContext context) {
    final typescaleTheme = TypescaleTheme.of(context);

    return ButtonStyle(
      padding: const WidgetStatePropertyAll(
        EdgeInsetsDirectional.symmetric(horizontal: 12.0, vertical: 6.0),
      ),
      iconSize: const WidgetStatePropertyAll(20.0),
      elevation: const WidgetStatePropertyAll(0.0),
      textStyle: WidgetStatePropertyAll(
        typescaleTheme.labelLarge.toTextStyle(),
      ),
      alignment: Alignment.center,
    );
  }

  @override
  ButtonStyle? maybeStyleOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ButtonSizeExtraSmallTheme>()
        ?.style;
  }
}

abstract class _ButtonSizeTheme extends InheritedTheme {
  const _ButtonSizeTheme({
    super.key,
    required this.style,
    required super.child,
  });

  final ButtonStyle style;

  @override
  bool updateShouldNotify(covariant _ButtonSizeTheme oldWidget) {
    return style != oldWidget.style;
  }

  @override
  Widget wrap(BuildContext context, Widget child);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ButtonStyle>("style", style));
  }
}

class _ButtonSizeExtraSmallTheme extends _ButtonSizeTheme {
  const _ButtonSizeExtraSmallTheme({
    super.key,
    required super.style,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _ButtonSizeExtraSmallTheme(style: style, child: child);
  }
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// enum ToggleButtonVariant { elevated, filled, tonal, outlined }

// class ToggleButton extends StatefulWidget {
//   const ToggleButton({super.key, required ToggleButtonVariant variant}): _variant = null;
//   const ToggleButton.custom({super.key});

//   final ToggleButtonVariant? _variant;

//   final bool selected; //? Should this be `selected` or `checked`?

//   @override
//   State<ToggleButton> createState() => _ToggleButtonState();
// }

// class _ToggleButtonState extends State<ToggleButton> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

enum IconButtonVariant { standard, filled, tonal, outlined }
