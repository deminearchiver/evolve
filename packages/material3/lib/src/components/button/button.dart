import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ButtonSize { extraSmall, small, medium, large, extraLarge }

enum ButtonVariant { elevated, filled, tonal, outlined, text }

abstract class FactoryWidget extends StatelessWidget {
  const FactoryWidget({super.key});
}

class ButtonStyle with Diagnosticable {
  @override
  bool operator ==(Object other) {
    return super == other;
  }

  @override
  int get hashCode => super.hashCode;
}

class Button extends FactoryWidget {
  const Button({super.key});

  const factory Button.withDefaults({
    Key? key,
    required ButtonSize size,
    required ButtonVariant variant,
  }) = _ButtonWithDefaults;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ButtonWithDefaults extends Button {
  const _ButtonWithDefaults({
    super.key,
    required this.size,
    required this.variant,
  });

  final ButtonSize size;
  final ButtonVariant variant;
}
