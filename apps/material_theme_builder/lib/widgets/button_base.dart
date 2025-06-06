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

class _ButtonContainer extends StatefulWidget {
  const _ButtonContainer({
    super.key,
    this.shape,
    this.color,
    this.elevation,
    this.shadowColor,
  });

  final ShapeBorder? shape;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;

  @override
  State<_ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<_ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      color: widget.color,
      shape: widget.shape ?? const RoundedRectangleBorder(),
      shadowColor: widget.shadowColor ?? Colors.transparent,
      elevation: widget.elevation ?? 0.0,
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
