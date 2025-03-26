import 'package:flutter/material.dart';

typedef TickerBuilder =
    Widget Function(BuildContext context, TickerProvider vsync, Widget? child);

class SingleTickerBuilder extends StatefulWidget {
  const SingleTickerBuilder({super.key, this.child, required this.builder});

  final Widget? child;
  final TickerBuilder builder;

  @override
  State<SingleTickerBuilder> createState() => _SingleTickerBuilderState();
}

class _SingleTickerBuilderState extends State<SingleTickerBuilder>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this, widget.child);
  }
}

class MultiTickerBuilder extends StatefulWidget {
  const MultiTickerBuilder({super.key, this.child, required this.builder});

  final Widget? child;
  final TickerBuilder builder;

  @override
  State<MultiTickerBuilder> createState() => _MultiTickerBuilderState();
}

class _MultiTickerBuilderState extends State<MultiTickerBuilder>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this, widget.child);
  }
}
