import 'package:flutter/widgets.dart';

typedef WidgetBuilderWithChild =
    Widget Function(BuildContext context, Widget child);

class CombiningBuilder extends StatelessWidget {
  const CombiningBuilder({
    super.key,
    this.builders = const [],
    required this.child,
  });

  final List<WidgetBuilderWithChild> builders;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return builders.fold<Widget>(
      child,
      (child, builder) => builder(context, child),
    );
  }
}
