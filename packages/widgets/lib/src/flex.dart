import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as flutter_widgets;

class Flex extends flutter_widgets.Flex {
  /// Creates a flex layout.
  ///
  /// The [direction] is required.
  ///
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to decide which direction to lay the children in or to
  /// disambiguate `start` or `end` values for the main or cross axis
  /// directions, the [textDirection] must not be null.
  const Flex({
    super.key,
    required super.direction,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.clipBehavior,
    super.spacing,
    super.children,
  });

  /// Creates a vertical array of children.
  ///
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  const Flex.vertical({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection, // NO DEFAULT: we don't know what the text's baseline should be
    super.verticalDirection,
    super.textBaseline,
    super.spacing,
    super.children,
  }) : super(direction: Axis.vertical);

  /// Creates a horizontal array of children.
  ///
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to determine the layout order (which is always the case
  /// unless the row has no children or only one child) or to disambiguate
  /// `start` or `end` values for the [mainAxisAlignment], the [textDirection]
  /// must not be null.
  const Flex.horizontal({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection, // NO DEFAULT: we don't know what the text's baseline should be
    super.verticalDirection,
    super.textBaseline,
    super.spacing,
    super.children,
  }) : super(direction: Axis.horizontal);
}

class Flexible extends flutter_widgets.Flexible {
  /// Creates a widget that controls how a child of a [Flex]
  /// flexes.
  const Flexible({super.key, super.flex, super.fit, required super.child});

  /// Creates a widget that expands a child of a [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.
  const Flexible.expanded({
    super.key,
    super.flex,
    super.child = const SizedBox.shrink(),
  }) : super(fit: FlexFit.tight);
}
