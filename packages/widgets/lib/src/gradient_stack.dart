import 'package:flutter/widgets.dart';

class GradientStack extends StatelessWidget {
  const GradientStack({
    super.key,
    this.position = DecorationPosition.background,
    required this.gradients,
    this.child = const SizedBox.shrink(),
  });

  /// Whether to paint the box decoration behind or in front of the child.
  final DecorationPosition position;

  final List<Gradient> gradients;

  final Widget child;

  // @override
  // Widget build(final BuildContext context) => _buildGradientWidget(gradients);

  // Widget _buildGradientWidget(final List<Gradient> remainingGradients) =>
  //     DecoratedBox(
  //       decoration: BoxDecoration(gradient: remainingGradients.first),
  //       child:
  //           remainingGradients.length > 1
  //               ? _buildGradientWidget(remainingGradients.sublist(1))
  //               : null,
  //     );

  @override
  Widget build(BuildContext context) {
    return gradients.fold<Widget>(
      child,
      (previousValue, gradient) => DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(gradient: gradient),
        child: previousValue,
      ),
    );
  }
}
