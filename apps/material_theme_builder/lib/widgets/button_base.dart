import 'package:flutter/material.dart';

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

class _ButtonContainer extends StatelessWidget {
  const _ButtonContainer({
    super.key,
    this.shape,
    this.color,
    this.elevation,
    this.shadowColor,
    this.child,
  });

  final ShapeBorder? shape;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      color: color,
      shape: shape ?? const RoundedRectangleBorder(),
      shadowColor: shadowColor ?? Colors.transparent,
      elevation: elevation ?? 0.0,
      child: child,
    );
  }
}

class _ButtonChild extends StatefulWidget {
  const _ButtonChild({super.key});

  @override
  State<_ButtonChild> createState() => _ButtonChildState();
}

class _ButtonChildState extends State<_ButtonChild> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
