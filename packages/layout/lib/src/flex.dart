// Copyright 2025 deminearchiver.
// Portions copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart' hide RenderFlex, FlexParentData;
import 'package:flutter/rendering.dart' as flutter show FlexParentData;
import 'package:flutter/widgets.dart'
    hide Flex, Row, Column, Flexible, Expanded;
import 'package:flutter/widgets.dart';

/// A widget that displays its children in a one-dimensional array.
///
/// The [Flex] widget allows you to control the axis along which the children are
/// placed (horizontal or vertical). This is referred to as the _main axis_. If
/// you know the main axis in advance, then consider using a [Flex.horizontal] (if it's
/// horizontal) or [Flex.vertical] (if it's vertical) instead, because that will be less
/// verbose.
///
/// To cause a child to expand to fill the available space in the [direction]
/// of this widget's main axis, wrap the child in an [Flexible.expanded] widget.
///
/// The [Flex] widget does not scroll (and in general it is considered an error
/// to have more children in a [Flex] than will fit in the available room). If
/// you have some widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// The [Flex] widget does not allow its children to wrap across multiple
/// horizontal or vertical runs. For a widget that allows its children to wrap,
/// consider using the [Wrap] widget instead of [Flex].
///
/// If you only have one child, then rather than using [Flex],
/// consider using [Align] or [Center] to position the child.
///
/// ## Layout algorithm
///
/// _This section describes how a [Flex] is rendered by the framework._
/// _See [BoxConstraints] for an introduction to box layout models._
///
/// Layout for a [Flex] proceeds in six steps:
///
/// 1. Layout each child with a null or zero flex factor (e.g., those that are
///    not [Flexible.expanded]) with unbounded main axis constraints and the incoming
///    cross axis constraints. If the [crossAxisAlignment] is
///    [CrossAxisAlignment.stretch], instead use tight cross axis constraints
///    that match the incoming max extent in the cross axis.
/// 2. Divide the remaining main axis space among the children with non-zero
///    flex factors (e.g., those that are [Flexible.expanded]) according to their flex
///    factor. For example, a child with a flex factor of 2.0 will receive twice
///    the amount of main axis space as a child with a flex factor of 1.0.
/// 3. Layout each of the remaining children with the same cross axis
///    constraints as in step 1, but instead of using unbounded main axis
///    constraints, use max axis constraints based on the amount of space
///    allocated in step 2. Children with [Flexible.fit] properties that are
///    [FlexFit.tight] are given tight constraints (i.e., forced to fill the
///    allocated space), and children with [Flexible.fit] properties that are
///    [FlexFit.loose] are given loose constraints (i.e., not forced to fill the
///    allocated space).
/// 4. The cross axis extent of the [Flex] is the maximum cross axis extent of
///    the children (which will always satisfy the incoming constraints).
/// 5. The main axis extent of the [Flex] is determined by the [mainAxisSize]
///    property. If the [mainAxisSize] property is [MainAxisSize.max], then the
///    main axis extent of the [Flex] is the max extent of the incoming main
///    axis constraints. If the [mainAxisSize] property is [MainAxisSize.min],
///    then the main axis extent of the [Flex] is the sum of the main axis
///    extents of the children (subject to the incoming constraints).
/// 6. Determine the position for each child according to the
///    [mainAxisAlignment] and the [crossAxisAlignment]. For example, if the
///    [mainAxisAlignment] is [MainAxisAlignment.spaceBetween], any main axis
///    space that has not been allocated to children is divided evenly and
///    placed between the children.
///
/// See also:
///
///  * [Flex.horizontal], for a version of this widget that is always horizontal.
///  * [Flex.vertical], for a version of this widget that is always vertical.
///  * [Flexible.expanded], to indicate children that should take all the remaining room.
///  * [Flexible], to indicate children that should share the remaining room.
///  * [Spacer], a widget that takes up space proportional to its flex value.
///    that may be sized smaller (leaving some remaining room unused).
///  * [Wrap], for a widget that allows its children to wrap over multiple _runs_.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
class Flex extends MultiChildRenderObjectWidget {
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
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
    this.spacing = 0.0,
    super.children,
  }) : assert(
         !identical(crossAxisAlignment, CrossAxisAlignment.baseline) ||
             textBaseline != null,
         "textBaseline is required if you specify the crossAxisAlignment with CrossAxisAlignment.baseline",
       );
  // Cannot use == in the assert above instead of identical because of https://github.com/dart-lang/language/issues/1811.

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
  const factory Flex.horizontal({
    Key? key,
    MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize,
    CrossAxisAlignment crossAxisAlignment,
    TextDirection? textDirection,
    VerticalDirection verticalDirection,
    TextBaseline? textBaseline,
    double spacing,
    List<Widget> children,
  }) = _FlexDirectional.horizontal;

  /// Creates a vertical array of children.
  ///
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  const factory Flex.vertical({
    Key? key,
    MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize,
    CrossAxisAlignment crossAxisAlignment,
    TextDirection? textDirection,
    VerticalDirection verticalDirection,
    TextBaseline? textBaseline,
    double spacing,
    List<Widget> children,
  }) = _FlexDirectional.vertical;

  /// The direction to use as the main axis.
  ///
  /// If you know the axis in advance, then consider using a [Flex.horizontal] (if it's
  /// horizontal) or [Flex.vertical] (if it's vertical) instead of a [Flex], since that
  /// will be less verbose. (For [Flex.horizontal] and [Flex.vertical] this property is fixed to
  /// the appropriate axis.)
  final Axis direction;

  /// How the children should be placed along the main axis.
  ///
  /// For example, [MainAxisAlignment.start], the default, places the children
  /// at the start of the
  /// main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  final MainAxisSize mainAxisSize;

  /// How the children should be placed along the cross axis.
  ///
  /// For example, [CrossAxisAlignment.center], the default, centers the
  /// children in the cross axis.
  ///
  /// When the cross axis is vertical and the children
  /// contain text, consider using [CrossAxisAlignment.baseline] instead.
  /// This typically produces better visual results if the different children
  /// have text with different font metrics, for example because they differ in
  /// [TextStyle.fontSize] or other [TextStyle] properties, or because
  /// they use different fonts due to being written in different scripts.
  final CrossAxisAlignment crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// Defaults to the ambient [Directionality].
  ///
  /// If [textDirection] is [TextDirection.rtl], then the direction in which
  /// text flows starts from right to left. Otherwise, if [textDirection] is
  /// [TextDirection.ltr], then the direction in which text flows starts from
  /// left to right.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// the children are positioned (left-to-right or right-to-left), and the
  /// meaning of the [mainAxisAlignment] property's [MainAxisAlignment.start] and
  /// [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [mainAxisAlignment] is either [MainAxisAlignment.start] or
  /// [MainAxisAlignment.end], or there's more than one child, then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  final TextDirection? textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [mainAxisAlignment]
  /// property's [MainAxisAlignment.start] and [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [mainAxisAlignment]
  /// is either [MainAxisAlignment.start] or [MainAxisAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  final VerticalDirection verticalDirection;

  /// If aligning items according to their baseline, which baseline to use.
  ///
  /// This must be set if using baseline alignment. There is no default because there is no
  /// way for the framework to know the correct baseline _a priori_.
  final TextBaseline? textBaseline;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;

  /// {@macro flutter.rendering.RenderFlex.spacing}
  final double spacing;

  bool get _needTextDirection {
    switch (direction) {
      case Axis.horizontal:
        return true; // because it affects the layout order.
      case Axis.vertical:
        return crossAxisAlignment == CrossAxisAlignment.start ||
            crossAxisAlignment == CrossAxisAlignment.end;
    }
  }

  /// The value to pass to [RenderFlex.textDirection].
  ///
  /// This value is derived from the [textDirection] property and the ambient
  /// [Directionality]. The value is null if there is no need to specify the
  /// text direction. In practice there's always a need to specify the direction
  /// except for vertical flexes whose [crossAxisAlignment] is
  /// not dependent on the text direction (not `start` or `end`). In particular,
  /// a [Row] always needs a text direction because the text direction controls
  /// its layout order. (For [Column]s, the layout order is controlled by
  /// [verticalDirection], which is always specified as it does not depend on an
  /// inherited widget and defaults to [VerticalDirection.down].)
  ///
  /// This method exists so that subclasses of [Flex] that create their own
  /// render objects that are derived from [RenderFlex] can do so and still use
  /// the logic for providing a text direction only when it is necessary.
  @protected
  TextDirection? getEffectiveTextDirection(BuildContext context) {
    return textDirection ??
        (_needTextDirection ? Directionality.maybeOf(context) : null);
  }

  @override
  RenderFlex createRenderObject(BuildContext context) {
    return RenderFlex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: getEffectiveTextDirection(context),
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      spacing: spacing,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderFlex renderObject,
  ) {
    renderObject
      ..direction = direction
      ..mainAxisAlignment = mainAxisAlignment
      ..mainAxisSize = mainAxisSize
      ..crossAxisAlignment = crossAxisAlignment
      ..textDirection = getEffectiveTextDirection(context)
      ..verticalDirection = verticalDirection
      ..textBaseline = textBaseline
      ..clipBehavior = clipBehavior
      ..spacing = spacing;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Axis>("direction", direction));
    properties.add(
      EnumProperty<MainAxisAlignment>("mainAxisAlignment", mainAxisAlignment),
    );
    properties.add(
      EnumProperty<MainAxisSize>(
        "mainAxisSize",
        mainAxisSize,
        defaultValue: MainAxisSize.max,
      ),
    );
    properties.add(
      EnumProperty<CrossAxisAlignment>(
        "crossAxisAlignment",
        crossAxisAlignment,
      ),
    );
    properties.add(
      EnumProperty<TextDirection>(
        "textDirection",
        textDirection,
        defaultValue: null,
      ),
    );
    properties.add(
      EnumProperty<VerticalDirection>(
        "verticalDirection",
        verticalDirection,
        defaultValue: VerticalDirection.down,
      ),
    );
    properties.add(
      EnumProperty<TextBaseline>(
        "textBaseline",
        textBaseline,
        defaultValue: null,
      ),
    );
    properties.add(
      EnumProperty<Clip>("clipBehavior", clipBehavior, defaultValue: Clip.none),
    );
    properties.add(DoubleProperty("spacing", spacing, defaultValue: 0.0));
  }
}

class _FlexDirectional extends Flex {
  const _FlexDirectional.horizontal({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.spacing,
    super.children,
  }) : super(direction: Axis.horizontal);

  const _FlexDirectional.vertical({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.spacing,
    super.children,
  }) : super(direction: Axis.vertical);
}

/// A widget that displays its children in a horizontal array.
///
/// To cause a child to expand to fill the available horizontal space, wrap the
/// child in an [Expanded] widget.
///
/// The [Row] widget does not scroll (and in general it is considered an error
/// to have more children in a [Row] than will fit in the available room). If
/// you have a line of widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// For a vertical variant, see [Column].
///
/// If you only have one child, then consider using [Align] or [Center] to
/// position the child.
///
/// By default, [crossAxisAlignment] is [CrossAxisAlignment.center], which
/// centers the children in the vertical axis.  If several of the children
/// contain text, this is likely to make them visually misaligned if
/// they have different font metrics (for example because they differ in
/// [TextStyle.fontSize] or other [TextStyle] properties, or because
/// they use different fonts due to being written in different scripts).
/// Consider using [CrossAxisAlignment.baseline] instead.
///
/// {@tool snippet}
///
/// This example divides the available space into three (horizontally), and
/// places text centered in the first two cells and the Flutter logo centered in
/// the third:
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/row.png)
///
/// ```dart
/// const Row(
///   children: <Widget>[
///     Expanded(
///       child: Text("Deliver features faster", textAlign: TextAlign.center),
///     ),
///     Expanded(
///       child: Text("Craft beautiful UIs", textAlign: TextAlign.center),
///     ),
///     Expanded(
///       child: FittedBox(
///         child: FlutterLogo(),
///       ),
///     ),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// ## Troubleshooting
///
/// ### Why does my row have a yellow and black warning stripe?
///
/// If the non-flexible contents of the row (those that are not wrapped in
/// [Expanded] or [Flexible] widgets) are together wider than the row itself,
/// then the row is said to have overflowed. When a row overflows, the row does
/// not have any remaining space to share between its [Expanded] and [Flexible]
/// children. The row reports this by drawing a yellow and black striped
/// warning box on the edge that is overflowing. If there is room on the outside
/// of the row, the amount of overflow is printed in red lettering.
///
/// #### Story time
///
/// Suppose, for instance, that you had this code:
///
/// ```dart
/// const Row(
///   children: <Widget>[
///     FlutterLogo(),
///     Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
///     Icon(Icons.sentiment_very_satisfied),
///   ],
/// )
/// ```
///
/// The row first asks its first child, the [FlutterLogo], to lay out, at
/// whatever size the logo would like. The logo is friendly and happily decides
/// to be 24 pixels to a side. This leaves lots of room for the next child. The
/// row then asks that next child, the text, to lay out, at whatever size it
/// thinks is best.
///
/// At this point, the text, not knowing how wide is too wide, says "Ok, I will
/// be thiiiiiiiiiiiiiiiiiiiis wide.", and goes well beyond the space that the
/// row has available, not wrapping. The row responds, "That's not fair, now I
/// have no more room available for my other children!", and gets angry and
/// sprouts a yellow and black strip.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/row_error.png)
///
/// The fix is to wrap the second child in an [Expanded] widget, which tells the
/// row that the child should be given the remaining room:
///
/// ```dart
/// const Row(
///   children: <Widget>[
///     FlutterLogo(),
///     Expanded(
///       child: Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
///     ),
///     Icon(Icons.sentiment_very_satisfied),
///   ],
/// )
/// ```
///
/// Now, the row first asks the logo to lay out, and then asks the _icon_ to lay
/// out. The [Icon], like the logo, is happy to take on a reasonable size (also
/// 24 pixels, not coincidentally, since both [FlutterLogo] and [Icon] honor the
/// ambient [IconTheme]). This leaves some room left over, and now the row tells
/// the text exactly how wide to be: the exact width of the remaining space. The
/// text, now happy to comply to a reasonable request, wraps the text within
/// that width, and you end up with a paragraph split over several lines.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/row_fixed.png)
///
/// The [textDirection] property controls the direction that children are rendered in.
/// [TextDirection.ltr] is the default [textDirection] of [Row] children, so the first
/// child is rendered at the `start` of the [Row], to the left, with subsequent children
/// following to the right. If you want to order children in the opposite
/// direction (right to left), then [textDirection] can be set to
/// [TextDirection.rtl]. This is shown in the example below
///
/// ```dart
/// const Row(
///   textDirection: TextDirection.rtl,
///   children: <Widget>[
///     FlutterLogo(),
///     Expanded(
///       child: Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
///     ),
///     Icon(Icons.sentiment_very_satisfied),
///   ],
/// )
/// ```
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/row_textDirection.png)
///
/// ## Layout algorithm
///
/// _This section describes how a [Row] is rendered by the framework._
/// _See [BoxConstraints] for an introduction to box layout models._
///
/// Layout for a [Row] proceeds in six steps:
///
/// 1. Layout each child with a null or zero flex factor (e.g., those that are
///    not [Expanded]) with unbounded horizontal constraints and the incoming
///    vertical constraints. If the [crossAxisAlignment] is
///    [CrossAxisAlignment.stretch], instead use tight vertical constraints that
///    match the incoming max height.
/// 2. Divide the remaining horizontal space among the children with non-zero
///    flex factors (e.g., those that are [Expanded]) according to their flex
///    factor. For example, a child with a flex factor of 2.0 will receive twice
///    the amount of horizontal space as a child with a flex factor of 1.0.
/// 3. Layout each of the remaining children with the same vertical constraints
///    as in step 1, but instead of using unbounded horizontal constraints, use
///    horizontal constraints based on the amount of space allocated in step 2.
///    Children with [Flexible.fit] properties that are [FlexFit.tight] are
///    given tight constraints (i.e., forced to fill the allocated space), and
///    children with [Flexible.fit] properties that are [FlexFit.loose] are
///    given loose constraints (i.e., not forced to fill the allocated space).
/// 4. The height of the [Row] is the maximum height of the children (which will
///    always satisfy the incoming vertical constraints).
/// 5. The width of the [Row] is determined by the [mainAxisSize] property. If
///    the [mainAxisSize] property is [MainAxisSize.max], then the width of the
///    [Row] is the max width of the incoming constraints. If the [mainAxisSize]
///    property is [MainAxisSize.min], then the width of the [Row] is the sum
///    of widths of the children (subject to the incoming constraints).
/// 6. Determine the position for each child according to the
///    [mainAxisAlignment] and the [crossAxisAlignment]. For example, if the
///    [mainAxisAlignment] is [MainAxisAlignment.spaceBetween], any horizontal
///    space that has not been allocated to children is divided evenly and
///    placed between the children.
///
/// See also:
///
///  * [Column], for a vertical equivalent.
///  * [Flex], if you don't know in advance if you want a horizontal or vertical
///    arrangement.
///  * [Expanded], to indicate children that should take all the remaining room.
///  * [Flexible], to indicate children that should share the remaining room but
///    that may by sized smaller (leaving some remaining room unused).
///  * [Spacer], a widget that takes up space proportional to its flex value.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
@Deprecated("Use Flex instead")
class Row extends Flex {
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
  @Deprecated("Use Flex.horizontal instead")
  const Row({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    super.spacing,
    super.children,
  }) : super(direction: Axis.horizontal);
}

/// A widget that displays its children in a vertical array.
///
/// To cause a child to expand to fill the available vertical space, wrap the
/// child in an [Expanded] widget.
///
/// The [Column] widget does not scroll (and in general it is considered an error
/// to have more children in a [Column] than will fit in the available room). If
/// you have a line of widgets and want them to be able to scroll if there is
/// insufficient room, consider using a [ListView].
///
/// For a horizontal variant, see [Row].
///
/// If you only have one child, then consider using [Align] or [Center] to
/// position the child.
///
/// {@tool snippet}
///
/// This example uses a [Column] to arrange three widgets vertically, the last
/// being made to fill all the remaining space.
///
/// ![Using the Column in this way creates two short lines of text with a large Flutter underneath.](https://flutter.github.io/assets-for-api-docs/assets/widgets/column.png)
///
/// ```dart
/// const Column(
///   children: <Widget>[
///     Text("Deliver features faster"),
///     Text("Craft beautiful UIs"),
///     Expanded(
///       child: FittedBox(
///         child: FlutterLogo(),
///       ),
///     ),
///   ],
/// )
/// ```
/// {@end-tool}
/// {@tool snippet}
///
/// In the sample above, the text and the logo are centered on each line. In the
/// following example, the [crossAxisAlignment] is set to
/// [CrossAxisAlignment.start], so that the children are left-aligned. The
/// [mainAxisSize] is set to [MainAxisSize.min], so that the column shrinks to
/// fit the children.
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/column_properties.png)
///
/// ```dart
/// Column(
///   crossAxisAlignment: CrossAxisAlignment.start,
///   mainAxisSize: MainAxisSize.min,
///   children: <Widget>[
///     const Text("We move under cover and we move as one"),
///     const Text("Through the night, we have one shot to live another day"),
///     const Text("We cannot let a stray gunshot give us away"),
///     const Text("We will fight up close, seize the moment and stay in it"),
///     const Text("It's either that or meet the business end of a bayonet"),
///     const Text("The code word is 'Rochambeau,' dig me?"),
///     Text("Rochambeau!"", style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// ## Troubleshooting
///
/// ### When the incoming vertical constraints are unbounded
///
/// When a [Column] has one or more [Expanded] or [Flexible] children, and is
/// placed in another [Column], or in a [ListView], or in some other context
/// that does not provide a maximum height constraint for the [Column], you will
/// get an exception at runtime saying that there are children with non-zero
/// flex but the vertical constraints are unbounded.
///
/// The problem, as described in the details that accompany that exception, is
/// that using [Flexible] or [Expanded] means that the remaining space after
/// laying out all the other children must be shared equally, but if the
/// incoming vertical constraints are unbounded, there is infinite remaining
/// space.
///
/// The key to solving this problem is usually to determine why the [Column] is
/// receiving unbounded vertical constraints.
///
/// One common reason for this to happen is that the [Column] has been placed in
/// another [Column] (without using [Expanded] or [Flexible] around the inner
/// nested [Column]). When a [Column] lays out its non-flex children (those that
/// have neither [Expanded] or [Flexible] around them), it gives them unbounded
/// constraints so that they can determine their own dimensions (passing
/// unbounded constraints usually signals to the child that it should
/// shrink-wrap its contents). The solution in this case is typically to just
/// wrap the inner column in an [Expanded] to indicate that it should take the
/// remaining space of the outer column, rather than being allowed to take any
/// amount of room it desires.
///
/// Another reason for this message to be displayed is nesting a [Column] inside
/// a [ListView] or other vertical scrollable. In that scenario, there really is
/// infinite vertical space (the whole point of a vertical scrolling list is to
/// allow infinite space vertically). In such scenarios, it is usually worth
/// examining why the inner [Column] should have an [Expanded] or [Flexible]
/// child: what size should the inner children really be? The solution in this
/// case is typically to remove the [Expanded] or [Flexible] widgets from around
/// the inner children.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=jckqXR5CrPI}
///
/// For more discussion about constraints, see [BoxConstraints].
///
/// ### The yellow and black striped banner
///
/// When the contents of a [Column] exceed the amount of space available, the
/// [Column] overflows, and the contents are clipped. In debug mode, a yellow
/// and black striped bar is rendered at the overflowing edge to indicate the
/// problem, and a message is printed below the [Column] saying how much
/// overflow was detected.
///
/// The usual solution is to use a [ListView] rather than a [Column], to enable
/// the contents to scroll when vertical space is limited.
///
/// ## Layout algorithm
///
/// _This section describes how a [Column] is rendered by the framework._
/// _See [BoxConstraints] for an introduction to box layout models._
///
/// Layout for a [Column] proceeds in six steps:
///
/// 1. Layout each child with a null or zero flex factor (e.g., those that are
///    not [Expanded]) with unbounded vertical constraints and the incoming
///    horizontal constraints. If the [crossAxisAlignment] is
///    [CrossAxisAlignment.stretch], instead use tight horizontal constraints
///    that match the incoming max width.
/// 2. Divide the remaining vertical space among the children with non-zero
///    flex factors (e.g., those that are [Expanded]) according to their flex
///    factor. For example, a child with a flex factor of 2.0 will receive twice
///    the amount of vertical space as a child with a flex factor of 1.0.
/// 3. Layout each of the remaining children with the same horizontal
///    constraints as in step 1, but instead of using unbounded vertical
///    constraints, use vertical constraints based on the amount of space
///    allocated in step 2. Children with [Flexible.fit] properties that are
///    [FlexFit.tight] are given tight constraints (i.e., forced to fill the
///    allocated space), and children with [Flexible.fit] properties that are
///    [FlexFit.loose] are given loose constraints (i.e., not forced to fill the
///    allocated space).
/// 4. The width of the [Column] is the maximum width of the children (which
///    will always satisfy the incoming horizontal constraints).
/// 5. The height of the [Column] is determined by the [mainAxisSize] property.
///    If the [mainAxisSize] property is [MainAxisSize.max], then the height of
///    the [Column] is the max height of the incoming constraints. If the
///    [mainAxisSize] property is [MainAxisSize.min], then the height of the
///    [Column] is the sum of heights of the children (subject to the incoming
///    constraints).
/// 6. Determine the position for each child according to the
///    [mainAxisAlignment] and the [crossAxisAlignment]. For example, if the
///    [mainAxisAlignment] is [MainAxisAlignment.spaceBetween], any vertical
///    space that has not been allocated to children is divided evenly and
///    placed between the children.
///
/// See also:
///
///  * [Row], for a horizontal equivalent.
///  * [Flex], if you don't know in advance if you want a horizontal or vertical
///    arrangement.
///  * [Expanded], to indicate children that should take all the remaining room.
///  * [Flexible], to indicate children that should share the remaining room but
///    that may size smaller (leaving some remaining room unused).
///  * [SingleChildScrollView], whose documentation discusses some ways to
///    use a [Column] inside a scrolling container.
///  * [Spacer], a widget that takes up space proportional to its flex value.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
@Deprecated("Use Flex instead")
class Column extends Flex {
  /// Creates a vertical array of children.
  ///
  /// If [crossAxisAlignment] is [CrossAxisAlignment.baseline], then
  /// [textBaseline] must not be null.
  ///
  /// The [textDirection] argument defaults to the ambient [Directionality], if
  /// any. If there is no ambient directionality, and a text direction is going
  /// to be necessary to disambiguate `start` or `end` values for the
  /// [crossAxisAlignment], the [textDirection] must not be null.
  @Deprecated("Use Flex.vertical instead")
  const Column({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.spacing,
    super.children,
  }) : super(direction: Axis.vertical);
}

/// A widget that controls how a child of a [Flex] flexes.
///
/// Using a [Flexible] widget gives a child of a [Flex]
/// the flexibility to expand to fill the available
/// space in the main axis, but, unlike [Flexible.expanded],
/// [Flexible] does not require the child to fill the available space.
///
/// A [Flexible] widget must be a descendant of a [Flex],
/// and the path from the [Flexible] widget to its enclosing [Flex]
/// must contain only [StatelessWidget]s or [StatefulWidget]s (not other
/// kinds of widgets, like [RenderObjectWidget]s).
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=CI7x0mAZiY0}
///
/// See also:
///
///  * [Flexible.expanded], which forces the child to expand to fill the available space.
///  * [Spacer], a widget that takes up space proportional to its flex value.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
class Flexible extends ParentDataWidget<FlexParentData> {
  /// Creates a widget that controls how a child of a [Flex]
  /// flexes.
  const Flexible({
    super.key,
    this.flex = 1.0,
    this.fit = FlexFit.loose,
    required super.child,
  });

  /// Creates a widget that expands a child of a [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.
  const Flexible.expanded({super.key, this.flex = 1.0, required super.child})
    : fit = FlexFit.tight;

  /// The flex factor to use for this child.
  ///
  /// If zero, the child is inflexible and determines its own size. If non-zero,
  /// the amount of space the child can occupy in the main axis is determined by
  /// dividing the free space (after placing the inflexible children) according
  /// to the flex factors of the flexible children.
  final double flex;

  /// How a flexible child is inscribed into the available space.
  ///
  /// If [flex] is non-zero, the [fit] determines whether the child fills the
  /// space the parent makes available during layout. If the fit is
  /// [FlexFit.tight], the child is required to fill the available space. If the
  /// fit is [FlexFit.loose], the child can be at most as large as the available
  /// space (but is allowed to be smaller).
  final FlexFit fit;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is FlexParentData);
    final FlexParentData parentData =
        renderObject.parentData! as FlexParentData;
    bool needsLayout = false;

    if (parentData.flex != flex) {
      parentData.flex = flex;
      needsLayout = true;
    }

    if (parentData.fit != fit) {
      parentData.fit = fit;
      needsLayout = true;
    }

    if (needsLayout) {
      renderObject.parent?.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Flex;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("flex", flex));
  }
}

/// A widget that expands a child of a [Flex]
/// so that the child fills the available space.
///
/// Using an [Expanded] widget makes a child of a [Flex]
/// expand to fill the available space along the main axis. If multiple children are expanded,
/// the available space is divided among them according to the [flex] factor.
///
/// An [Expanded] widget must be a descendant of a [Flex],
/// and the path from the [Expanded] widget to its enclosing [Flex]
/// must contain only [StatelessWidget]s or [StatefulWidget]s (not other
/// kinds of widgets, like [RenderObjectWidget]s).
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=_rnZaagadyo}
///
/// {@tool dartpad}
/// This example shows how to use an [Expanded] widget in a [Column] so that
/// its middle child, a [Container] here, expands to fill the space.
///
/// ![This results in two thin blue boxes with a larger amber box in between.](https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_column.png)
///
/// ** See code in examples/api/lib/widgets/basic/expanded.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to use an [Expanded] widget in a [Row] with multiple
/// children expanded, utilizing the [flex] factor to prioritize available space.
///
/// ![This results in a wide amber box, followed by a thin blue box, with a medium width amber box at the end.](https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_row.png)
///
/// ** See code in examples/api/lib/widgets/basic/expanded.1.dart **
/// {@end-tool}
///
/// See also:
///
///  * [Flexible], which does not force the child to fill the available space.
///  * [Spacer], a widget that takes up space proportional to its flex value.
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
@Deprecated("Use Flexible instead")
class Expanded extends Flexible {
  /// Creates a widget that expands a child of a [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.
  @Deprecated("Use Flexible.expanded instead")
  const Expanded({super.key, super.flex, required super.child})
    : super(fit: FlexFit.tight);
}

/// Parent data for use with [RenderFlex].
class FlexParentData extends ContainerBoxParentData<RenderBox> {
  /// The flex factor to use for this child.
  ///
  /// If null or zero, the child is inflexible and determines its own size. If
  /// non-zero, the amount of space the child's can occupy in the main axis is
  /// determined by dividing the free space (after placing the inflexible
  /// children) according to the flex factors of the flexible children.
  double? flex;

  /// How a flexible child is inscribed into the available space.
  ///
  /// If [flex] is non-zero, the [fit] determines whether the child fills the
  /// space the parent makes available during layout. If the fit is
  /// [FlexFit.tight], the child is required to fill the available space. If the
  /// fit is [FlexFit.loose], the child can be at most as large as the available
  /// space (but is allowed to be smaller).
  FlexFit? fit;

  @override
  String toString() => "${super.toString()}; flex=$flex; fit=$fit";
}

/// Displays its children in a one-dimensional array.
///
/// ## Layout algorithm
///
/// _This section describes how the framework causes [RenderFlex] to position
/// its children._
/// _See [BoxConstraints] for an introduction to box layout models._
///
/// Layout for a [RenderFlex] proceeds in six steps:
///
/// 1. Layout each child with a null or zero flex factor with unbounded main
///    axis constraints and the incoming cross axis constraints. If the
///    [crossAxisAlignment] is [CrossAxisAlignment.stretch], instead use tight
///    cross axis constraints that match the incoming max extent in the cross
///    axis.
/// 2. Divide the remaining main axis space among the children with non-zero
///    flex factors according to their flex factor. For example, a child with a
///    flex factor of 2.0 will receive twice the amount of main axis space as a
///    child with a flex factor of 1.0.
/// 3. Layout each of the remaining children with the same cross axis
///    constraints as in step 1, but instead of using unbounded main axis
///    constraints, use max axis constraints based on the amount of space
///    allocated in step 2. Children with [Flexible.fit] properties that are
///    [FlexFit.tight] are given tight constraints (i.e., forced to fill the
///    allocated space), and children with [Flexible.fit] properties that are
///    [FlexFit.loose] are given loose constraints (i.e., not forced to fill the
///    allocated space).
/// 4. The cross axis extent of the [RenderFlex] is the maximum cross axis
///    extent of the children (which will always satisfy the incoming
///    constraints).
/// 5. The main axis extent of the [RenderFlex] is determined by the
///    [mainAxisSize] property. If the [mainAxisSize] property is
///    [MainAxisSize.max], then the main axis extent of the [RenderFlex] is the
///    max extent of the incoming main axis constraints. If the [mainAxisSize]
///    property is [MainAxisSize.min], then the main axis extent of the [Flex]
///    is the sum of the main axis extents of the children (subject to the
///    incoming constraints).
/// 6. Determine the position for each child according to the
///    [mainAxisAlignment] and the [crossAxisAlignment]. For example, if the
///    [mainAxisAlignment] is [MainAxisAlignment.spaceBetween], any main axis
///    space that has not been allocated to children is divided evenly and
///    placed between the children.
///
/// See also:
///
///  * [Flex], the widget equivalent.
class RenderFlex extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FlexParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FlexParentData>,
        DebugOverflowIndicatorMixin {
  /// Creates a flex render object.
  ///
  /// By default, the flex layout is horizontal and children are aligned to the
  /// start of the main axis and the center of the cross axis.
  RenderFlex({
    List<RenderBox>? children,
    Axis direction = Axis.horizontal,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Clip clipBehavior = Clip.none,
    double spacing = 0.0,
  }) : _direction = direction,
       _mainAxisAlignment = mainAxisAlignment,
       _mainAxisSize = mainAxisSize,
       _crossAxisAlignment = crossAxisAlignment,
       _textDirection = textDirection,
       _verticalDirection = verticalDirection,
       _textBaseline = textBaseline,
       _clipBehavior = clipBehavior,
       _spacing = spacing,
       assert(spacing >= 0.0) {
    addAll(children);
  }

  /// The direction to use as the main axis.
  Axis get direction => _direction;
  Axis _direction;
  set direction(Axis value) {
    if (_direction != value) {
      _direction = value;
      markNeedsLayout();
    }
  }

  /// How the children should be placed along the main axis.
  ///
  /// If the [direction] is [Axis.horizontal], and the [mainAxisAlignment] is
  /// either [MainAxisAlignment.start] or [MainAxisAlignment.end], then the
  /// [textDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], and the [mainAxisAlignment] is
  /// either [MainAxisAlignment.start] or [MainAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment;
  MainAxisAlignment _mainAxisAlignment;
  set mainAxisAlignment(MainAxisAlignment value) {
    if (_mainAxisAlignment != value) {
      _mainAxisAlignment = value;
      markNeedsLayout();
    }
  }

  /// How much space should be occupied in the main axis.
  ///
  /// After allocating space to children, there might be some remaining free
  /// space. This value controls whether to maximize or minimize the amount of
  /// free space, subject to the incoming layout constraints.
  ///
  /// If some children have a non-zero flex factors (and none have a fit of
  /// [FlexFit.loose]), they will expand to consume all the available space and
  /// there will be no remaining free space to maximize or minimize, making this
  /// value irrelevant to the final layout.
  MainAxisSize get mainAxisSize => _mainAxisSize;
  MainAxisSize _mainAxisSize;
  set mainAxisSize(MainAxisSize value) {
    if (_mainAxisSize != value) {
      _mainAxisSize = value;
      markNeedsLayout();
    }
  }

  /// How the children should be placed along the cross axis.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] must not be null.
  CrossAxisAlignment get crossAxisAlignment => _crossAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  set crossAxisAlignment(CrossAxisAlignment value) {
    if (_crossAxisAlignment != value) {
      _crossAxisAlignment = value;
      markNeedsLayout();
    }
  }

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// children are positioned (left-to-right or right-to-left), and the meaning
  /// of the [mainAxisAlignment] property's [MainAxisAlignment.start] and
  /// [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [mainAxisAlignment] is either [MainAxisAlignment.start] or
  /// [MainAxisAlignment.end], or there's more than one child, then the
  /// [textDirection] must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [textDirection] must not be null.
  TextDirection? get textDirection => _textDirection;
  TextDirection? _textDirection;
  set textDirection(TextDirection? value) {
    if (_textDirection != value) {
      _textDirection = value;
      markNeedsLayout();
    }
  }

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [mainAxisAlignment]
  /// property's [MainAxisAlignment.start] and [MainAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [mainAxisAlignment]
  /// is either [MainAxisAlignment.start] or [MainAxisAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the meaning of the
  /// [crossAxisAlignment] property's [CrossAxisAlignment.start] and
  /// [CrossAxisAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and the [crossAxisAlignment] is
  /// either [CrossAxisAlignment.start] or [CrossAxisAlignment.end], then the
  /// [verticalDirection] must not be null.
  VerticalDirection get verticalDirection => _verticalDirection;
  VerticalDirection _verticalDirection;
  set verticalDirection(VerticalDirection value) {
    if (_verticalDirection != value) {
      _verticalDirection = value;
      markNeedsLayout();
    }
  }

  /// If aligning items according to their baseline, which baseline to use.
  ///
  /// Must not be null if [crossAxisAlignment] is [CrossAxisAlignment.baseline].
  TextBaseline? get textBaseline => _textBaseline;
  TextBaseline? _textBaseline;
  set textBaseline(TextBaseline? value) {
    assert(_crossAxisAlignment != CrossAxisAlignment.baseline || value != null);
    if (_textBaseline != value) {
      _textBaseline = value;
      markNeedsLayout();
    }
  }

  bool get _debugHasNecessaryDirections {
    if (RenderObject.debugCheckingIntrinsics) {
      return true;
    }
    if (firstChild != null && lastChild != firstChild) {
      // i.e. there's more than one child
      switch (direction) {
        case Axis.horizontal:
          assert(
            textDirection != null,
            "Horizontal $runtimeType with multiple children has a null textDirection, so the layout order is undefined.",
          );
        case Axis.vertical:
          break;
      }
    }
    if (mainAxisAlignment == MainAxisAlignment.start ||
        mainAxisAlignment == MainAxisAlignment.end) {
      switch (direction) {
        case Axis.horizontal:
          assert(
            textDirection != null,
            "Horizontal $runtimeType with $mainAxisAlignment has a null textDirection, so the alignment cannot be resolved.",
          );
        case Axis.vertical:
          break;
      }
    }
    if (crossAxisAlignment == CrossAxisAlignment.start ||
        crossAxisAlignment == CrossAxisAlignment.end) {
      switch (direction) {
        case Axis.horizontal:
          break;
        case Axis.vertical:
          assert(
            textDirection != null,
            "Vertical $runtimeType with $crossAxisAlignment has a null textDirection, so the alignment cannot be resolved.",
          );
      }
    }
    return true;
  }

  // Set during layout if overflow occurred on the main axis.
  double _overflow = 0;
  // Check whether any meaningful overflow is present. Values below an epsilon
  // are treated as not overflowing.
  bool get _hasOverflow => _overflow > precisionErrorTolerance;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  Clip get clipBehavior => _clipBehavior;
  Clip _clipBehavior = Clip.none;
  set clipBehavior(Clip value) {
    if (value != _clipBehavior) {
      _clipBehavior = value;
      markNeedsPaint();
      markNeedsSemanticsUpdate();
    }
  }

  /// {@template flutter.rendering.RenderFlex.spacing}
  /// How much space to place between children in the main axis.
  ///
  /// The spacing is only applied between children in the main axis.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is
  /// [MainAxisAlignment.start], then the first child will be placed at the start
  /// of the main axis, and the second child will be placed 10.0 pixels after
  /// the first child in the main axis, and so on. The [spacing] is not applied
  /// before the first child or after the last child.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is [MainAxisAlignment.end],
  /// then the last child will be placed at the end of the main axis, and the
  /// second-to-last child will be placed 10.0 pixels before the last child in
  /// the main axis, and so on. The [spacing] is not applied before the first
  /// child or after the last child.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is [MainAxisAlignment.center],
  /// then the children will be placed in the center of the main axis with 10.0
  /// pixels of space between the children. The [spacing] is not applied before the first
  /// child or after the last child.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is [MainAxisAlignment.spaceBetween],
  /// then there will be a minimum of 10.0 pixels of space between each child in the
  /// main axis. If the free space is 100.0 pixels between the two children,
  /// then the minimum space between the children will be 10.0 pixels and the
  /// remaining 90.0 pixels will be the free space between the children. The
  /// [spacing] is not applied before the first child or after the last child.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is [MainAxisAlignment.spaceAround],
  /// then there will be a minimum of 10.0 pixels of space between each child in the
  /// main axis, and the remaining free space will be placed between the children as
  /// well as before the first child and after the last child. The [spacing] is
  /// not applied before the first child or after the last child.
  ///
  /// If the [spacing] is 10.0 and the [mainAxisAlignment] is [MainAxisAlignment.spaceEvenly],
  /// then there will be a minimum of 10.0 pixels of space between each child in the
  /// main axis, and the remaining free space will be evenly placed between the
  /// children as well as before the first child and after the last child. The
  /// [spacing] is not applied before the first child or after the last child.
  ///
  /// When the [spacing] is non-zero, the layout size will be larger than
  /// the sum of the children's layout sizes in the main axis.
  ///
  /// When the total children's layout sizes and total spacing between the
  /// children is greater than the maximum constraints in the main axis, then
  /// the children will overflow. For example, if there are two children and the
  /// maximum constraint is 100.0 pixels, the children's layout sizes are 50.0
  /// pixels each, and the spacing is 10.0 pixels, then the children will
  /// overflow by 10.0 pixels.
  ///
  /// Defaults to 0.0.
  /// {@endtemplate}
  double get spacing => _spacing;
  double _spacing;
  set spacing(double value) {
    if (_spacing == value) {
      return;
    }
    _spacing = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! FlexParentData) {
      child.parentData = FlexParentData();
    }
  }

  double _getIntrinsicSize({
    required Axis sizingDirection,
    required double
    extent, // The extent in the direction that isn't the sizing direction.
    required _ChildSizingFunction
    childSize, // A method to find the size in the sizing direction.
  }) {
    if (_direction == sizingDirection) {
      // INTRINSIC MAIN SIZE
      // Intrinsic main size is the smallest size the flex container can take
      // while maintaining the min/max-content contributions of its flex items.
      double totalFlex = 0.0;
      double inflexibleSpace = spacing * (childCount - 1);
      double maxFlexFractionSoFar = 0.0;
      for (
        RenderBox? child = firstChild;
        child != null;
        child = childAfter(child)
      ) {
        final double flex = _getFlex(child);
        totalFlex += flex;
        if (flex > 0.0) {
          final double flexFraction = childSize(child, extent) / flex;
          maxFlexFractionSoFar = math.max(maxFlexFractionSoFar, flexFraction);
        } else {
          inflexibleSpace += childSize(child, extent);
        }
      }
      return maxFlexFractionSoFar * totalFlex + inflexibleSpace;
    } else {
      // INTRINSIC CROSS SIZE
      // Intrinsic cross size is the max of the intrinsic cross sizes of the
      // children, after the flexible children are fit into the available space,
      // with the children sized using their max intrinsic dimensions.
      final bool isHorizontal = switch (direction) {
        Axis.horizontal => true,
        Axis.vertical => false,
      };

      Size layoutChild(RenderBox child, BoxConstraints constraints) {
        final double mainAxisSizeFromConstraints = isHorizontal
            ? constraints.maxWidth
            : constraints.maxHeight;
        // A infinite mainAxisSizeFromConstraints means this child is flexible (or extent is double.infinity).
        assert(
          (_getFlex(child) != 0.0 && extent.isFinite) ==
              mainAxisSizeFromConstraints.isFinite,
        );
        final double maxMainAxisSize = mainAxisSizeFromConstraints.isFinite
            ? mainAxisSizeFromConstraints
            : (isHorizontal
                  ? child.getMaxIntrinsicWidth(double.infinity)
                  : child.getMaxIntrinsicHeight(double.infinity));
        return isHorizontal
            ? Size(maxMainAxisSize, childSize(child, maxMainAxisSize))
            : Size(childSize(child, maxMainAxisSize), maxMainAxisSize);
      }

      return _computeSizes(
        constraints: isHorizontal
            ? BoxConstraints(maxWidth: extent)
            : BoxConstraints(maxHeight: extent),
        layoutChild: layoutChild,
        getBaseline: ChildLayoutHelper.getDryBaseline,
      ).axisSize.crossAxisExtent;
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _getIntrinsicSize(
      sizingDirection: Axis.horizontal,
      extent: height,
      childSize: (RenderBox child, double extent) =>
          child.getMinIntrinsicWidth(extent),
    );
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _getIntrinsicSize(
      sizingDirection: Axis.horizontal,
      extent: height,
      childSize: (RenderBox child, double extent) =>
          child.getMaxIntrinsicWidth(extent),
    );
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _getIntrinsicSize(
      sizingDirection: Axis.vertical,
      extent: width,
      childSize: (RenderBox child, double extent) =>
          child.getMinIntrinsicHeight(extent),
    );
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _getIntrinsicSize(
      sizingDirection: Axis.vertical,
      extent: width,
      childSize: (RenderBox child, double extent) =>
          child.getMaxIntrinsicHeight(extent),
    );
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) {
    return switch (_direction) {
      Axis.horizontal => defaultComputeDistanceToHighestActualBaseline(
        baseline,
      ),
      Axis.vertical => defaultComputeDistanceToFirstActualBaseline(baseline),
    };
  }

  static double _getFlex(RenderBox child) {
    final FlexParentData childParentData = child.parentData! as FlexParentData;
    return childParentData.flex ?? 0.0;
  }

  static FlexFit _getFit(RenderBox child) {
    final FlexParentData childParentData = child.parentData! as FlexParentData;
    return childParentData.fit ?? FlexFit.tight;
  }

  bool get _isBaselineAligned {
    return switch (crossAxisAlignment) {
      CrossAxisAlignment.baseline => switch (direction) {
        Axis.horizontal => true,
        Axis.vertical => false,
      },
      CrossAxisAlignment.start ||
      CrossAxisAlignment.center ||
      CrossAxisAlignment.end ||
      CrossAxisAlignment.stretch => false,
    };
  }

  double _getCrossSize(Size size) {
    return switch (_direction) {
      Axis.horizontal => size.height,
      Axis.vertical => size.width,
    };
  }

  double _getMainSize(Size size) {
    return switch (_direction) {
      Axis.horizontal => size.width,
      Axis.vertical => size.height,
    };
  }

  // flipMainAxis is used to decide whether to lay out
  // left-to-right/top-to-bottom (false), or right-to-left/bottom-to-top
  // (true). Returns false in cases when the layout direction does not matter
  // (for instance, there is no child).
  bool get _flipMainAxis =>
      firstChild != null &&
      switch (direction) {
        Axis.horizontal => switch (textDirection) {
          null || TextDirection.ltr => false,
          TextDirection.rtl => true,
        },
        Axis.vertical => switch (verticalDirection) {
          VerticalDirection.down => false,
          VerticalDirection.up => true,
        },
      };

  bool get _flipCrossAxis =>
      firstChild != null &&
      switch (direction) {
        Axis.vertical => switch (textDirection) {
          null || TextDirection.ltr => false,
          TextDirection.rtl => true,
        },
        Axis.horizontal => switch (verticalDirection) {
          VerticalDirection.down => false,
          VerticalDirection.up => true,
        },
      };

  BoxConstraints _constraintsForNonFlexChild(BoxConstraints constraints) {
    final bool fillCrossAxis = switch (crossAxisAlignment) {
      CrossAxisAlignment.stretch => true,
      CrossAxisAlignment.start ||
      CrossAxisAlignment.center ||
      CrossAxisAlignment.end ||
      CrossAxisAlignment.baseline => false,
    };
    return switch (_direction) {
      Axis.horizontal =>
        fillCrossAxis
            ? BoxConstraints.tightFor(height: constraints.maxHeight)
            : BoxConstraints(maxHeight: constraints.maxHeight),
      Axis.vertical =>
        fillCrossAxis
            ? BoxConstraints.tightFor(width: constraints.maxWidth)
            : BoxConstraints(maxWidth: constraints.maxWidth),
    };
  }

  BoxConstraints _constraintsForFlexChild(
    RenderBox child,
    BoxConstraints constraints,
    double maxChildExtent,
  ) {
    assert(_getFlex(child) > 0.0);
    assert(maxChildExtent >= 0.0);
    final double minChildExtent = switch (_getFit(child)) {
      FlexFit.tight => maxChildExtent,
      FlexFit.loose => 0.0,
    };
    final bool fillCrossAxis = switch (crossAxisAlignment) {
      CrossAxisAlignment.stretch => true,
      CrossAxisAlignment.start ||
      CrossAxisAlignment.center ||
      CrossAxisAlignment.end ||
      CrossAxisAlignment.baseline => false,
    };
    return switch (_direction) {
      Axis.horizontal => BoxConstraints(
        minWidth: minChildExtent,
        maxWidth: maxChildExtent,
        minHeight: fillCrossAxis ? constraints.maxHeight : 0.0,
        maxHeight: constraints.maxHeight,
      ),
      Axis.vertical => BoxConstraints(
        minWidth: fillCrossAxis ? constraints.maxWidth : 0.0,
        maxWidth: constraints.maxWidth,
        minHeight: minChildExtent,
        maxHeight: maxChildExtent,
      ),
    };
  }

  @override
  double? computeDryBaseline(
    BoxConstraints constraints,
    TextBaseline baseline,
  ) {
    final _LayoutSizes sizes = _computeSizes(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
      getBaseline: ChildLayoutHelper.getDryBaseline,
    );

    if (_isBaselineAligned) {
      return sizes.baselineOffset;
    }

    final BoxConstraints nonFlexConstraints = _constraintsForNonFlexChild(
      constraints,
    );
    BoxConstraints constraintsForChild(RenderBox child) {
      final double? spacePerFlex = sizes.spacePerFlex;
      final double flex;
      return spacePerFlex != null && (flex = _getFlex(child)) > 0.0
          ? _constraintsForFlexChild(child, constraints, flex * spacePerFlex)
          : nonFlexConstraints;
    }

    BaselineOffset baselineOffset = BaselineOffset.noBaseline;
    switch (direction) {
      case Axis.vertical:
        final double freeSpace = math.max(0.0, sizes.mainAxisFreeSpace);
        final bool flipMainAxis = _flipMainAxis;
        final (double leadingSpaceY, double spaceBetween) = mainAxisAlignment
            ._distributeSpace(freeSpace, childCount, flipMainAxis, spacing);
        double y = flipMainAxis
            ? leadingSpaceY +
                  (childCount - 1) * spaceBetween +
                  (sizes.axisSize.mainAxisExtent - sizes.mainAxisFreeSpace)
            : leadingSpaceY;
        final double directionUnit = flipMainAxis ? -1.0 : 1.0;
        for (
          RenderBox? child = firstChild;
          baselineOffset == BaselineOffset.noBaseline && child != null;
          child = childAfter(child)
        ) {
          final BoxConstraints childConstraints = constraintsForChild(child);
          final Size childSize = child.getDryLayout(childConstraints);
          final double? childBaselineOffset = child.getDryBaseline(
            childConstraints,
            baseline,
          );
          final double additionalY = flipMainAxis ? -childSize.height : 0.0;
          baselineOffset =
              BaselineOffset(childBaselineOffset) + y + additionalY;
          y += directionUnit * (spaceBetween + childSize.height);
        }
      case Axis.horizontal:
        final bool flipCrossAxis = _flipCrossAxis;
        for (
          RenderBox? child = firstChild;
          child != null;
          child = childAfter(child)
        ) {
          final BoxConstraints childConstraints = constraintsForChild(child);
          final BaselineOffset distance = BaselineOffset(
            child.getDryBaseline(childConstraints, baseline),
          );
          final double freeCrossAxisSpace =
              sizes.axisSize.crossAxisExtent -
              child.getDryLayout(childConstraints).height;
          final BaselineOffset childBaseline =
              distance +
              crossAxisAlignment._getChildCrossAxisOffset(
                freeCrossAxisSpace,
                flipCrossAxis,
              );
          baselineOffset = baselineOffset.minOf(childBaseline);
        }
    }
    return baselineOffset.offset;
  }

  @override
  @protected
  Size computeDryLayout(covariant BoxConstraints constraints) {
    FlutterError? constraintsError;
    assert(() {
      constraintsError = _debugCheckConstraints(
        constraints: constraints,
        reportParentConstraints: false,
      );
      return true;
    }());
    if (constraintsError != null) {
      assert(debugCannotComputeDryLayout(error: constraintsError));
      return Size.zero;
    }

    return _computeSizes(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
      getBaseline: ChildLayoutHelper.getDryBaseline,
    ).axisSize.toSize(direction);
  }

  FlutterError? _debugCheckConstraints({
    required BoxConstraints constraints,
    required bool reportParentConstraints,
  }) {
    FlutterError? result;
    assert(() {
      final double maxMainSize = _direction == Axis.horizontal
          ? constraints.maxWidth
          : constraints.maxHeight;
      final bool canFlex = maxMainSize < double.infinity;
      RenderBox? child = firstChild;
      while (child != null) {
        final double flex = _getFlex(child);
        if (flex > 0.0) {
          final String identity = _direction == Axis.horizontal
              ? "row"
              : "column";
          final String axis = _direction == Axis.horizontal
              ? "horizontal"
              : "vertical";
          final String dimension = _direction == Axis.horizontal
              ? "width"
              : "height";
          DiagnosticsNode error, message;
          final List<DiagnosticsNode> addendum = <DiagnosticsNode>[];
          if (!canFlex &&
              (mainAxisSize == MainAxisSize.max ||
                  _getFit(child) == FlexFit.tight)) {
            error = ErrorSummary(
              "RenderFlex children have non-zero flex but incoming $dimension constraints are unbounded.",
            );
            message = ErrorDescription(
              "When a $identity is in a parent that does not provide a finite $dimension constraint, for example "
              "if it is in a $axis scrollable, it will try to shrink-wrap its children along the $axis "
              "axis. Setting a flex on a child (e.g. using Expanded) indicates that the child is to "
              "expand to fill the remaining space in the $axis direction.",
            );
            if (reportParentConstraints) {
              // Constraints of parents are unavailable in dry layout.
              RenderBox? node = this;
              switch (_direction) {
                case Axis.horizontal:
                  while (!node!.constraints.hasBoundedWidth &&
                      node.parent is RenderBox) {
                    node = node.parent! as RenderBox;
                  }
                  if (!node.constraints.hasBoundedWidth) {
                    node = null;
                  }
                case Axis.vertical:
                  while (!node!.constraints.hasBoundedHeight &&
                      node.parent is RenderBox) {
                    node = node.parent! as RenderBox;
                  }
                  if (!node.constraints.hasBoundedHeight) {
                    node = null;
                  }
              }
              if (node != null) {
                addendum.add(
                  node.describeForError(
                    "The nearest ancestor providing an unbounded width constraint is",
                  ),
                );
              }
            }
            addendum.add(
              ErrorHint("See also: https://flutter.dev/unbounded-constraints"),
            );
          } else {
            return true;
          }
          result = FlutterError.fromParts(<DiagnosticsNode>[
            error,
            message,
            ErrorDescription(
              "These two directives are mutually exclusive. If a parent is to shrink-wrap its child, the child "
              "cannot simultaneously expand to fit its parent.",
            ),
            ErrorHint(
              "Consider setting mainAxisSize to MainAxisSize.min and using FlexFit.loose fits for the flexible "
              "children (using Flexible rather than Expanded). This will allow the flexible children "
              "to size themselves to less than the infinite remaining space they would otherwise be "
              "forced to take, and then will cause the RenderFlex to shrink-wrap the children "
              "rather than expanding to fit the maximum constraints provided by the parent.",
            ),
            ErrorDescription(
              "If this message did not help you determine the problem, consider using debugDumpRenderTree():\n"
              "  https://flutter.dev/to/debug-render-layer\n"
              "  https://api.flutter.dev/flutter/rendering/debugDumpRenderTree.html",
            ),
            describeForError(
              "The affected RenderFlex is",
              style: DiagnosticsTreeStyle.errorProperty,
            ),
            DiagnosticsProperty<dynamic>(
              "The creator information is set to",
              debugCreator,
              style: DiagnosticsTreeStyle.errorProperty,
            ),
            ...addendum,
            ErrorDescription(
              "If none of the above helps enough to fix this problem, please don't hesitate to file a bug:\n"
              "  https://github.com/flutter/flutter/issues/new?template=02_bug.yml",
            ),
          ]);
          return true;
        }
        child = childAfter(child);
      }
      return true;
    }());
    return result;
  }

  _LayoutSizes _computeSizes({
    required BoxConstraints constraints,
    required ChildLayouter layoutChild,
    required ChildBaselineGetter getBaseline,
  }) {
    assert(_debugHasNecessaryDirections);

    // Determine used flex factor, size inflexible items, calculate free space.
    final double maxMainSize = _getMainSize(constraints.biggest);
    final bool canFlex = maxMainSize.isFinite;
    final BoxConstraints nonFlexChildConstraints = _constraintsForNonFlexChild(
      constraints,
    );
    // Null indicates the children are not baseline aligned.
    final TextBaseline? textBaseline = _isBaselineAligned
        ? (this.textBaseline ??
              (throw FlutterError(
                "To use CrossAxisAlignment.baseline, you must also specify which baseline to use using the \"textBaseline\" argument.",
              )))
        : null;

    // The first pass lays out non-flex children and computes total flex.
    double totalFlex = 0.0;
    RenderBox? firstFlexChild;
    _AscentDescent accumulatedAscentDescent = _AscentDescent.none;
    // Initially, accumulatedSize is the sum of the spaces between children in the main axis.
    _AxisSize accumulatedSize = _AxisSize._(
      Size(spacing * (childCount - 1), 0.0),
    );
    for (
      RenderBox? child = firstChild;
      child != null;
      child = childAfter(child)
    ) {
      final double flex;
      if (canFlex && (flex = _getFlex(child)) > 0.0) {
        totalFlex += flex;
        firstFlexChild ??= child;
      } else {
        final _AxisSize childSize = _AxisSize.fromSize(
          size: layoutChild(child, nonFlexChildConstraints),
          direction: direction,
        );
        accumulatedSize += childSize;
        // Baseline-aligned children contributes to the cross axis extent separately.
        final double? baselineOffset = textBaseline == null
            ? null
            : getBaseline(child, nonFlexChildConstraints, textBaseline);
        accumulatedAscentDescent += _AscentDescent(
          baselineOffset: baselineOffset,
          crossSize: childSize.crossAxisExtent,
        );
      }
    }

    assert((totalFlex == 0.0) == (firstFlexChild == null));
    assert(
      firstFlexChild == null || canFlex,
    ); // If we are given infinite space there's no need for this extra step.

    // The second pass distributes free space to flexible children.
    final double flexSpace = math.max(
      0.0,
      maxMainSize - accumulatedSize.mainAxisExtent,
    );
    final double spacePerFlex = flexSpace / totalFlex;
    for (
      RenderBox? child = firstFlexChild;
      child != null && totalFlex > 0.0;
      child = childAfter(child)
    ) {
      final double flex = _getFlex(child);
      if (flex == 0.0) {
        continue;
      }
      totalFlex -= flex;
      assert(spacePerFlex.isFinite);
      final double maxChildExtent = spacePerFlex * flex;
      assert(
        _getFit(child) == FlexFit.loose || maxChildExtent < double.infinity,
      );
      final BoxConstraints childConstraints = _constraintsForFlexChild(
        child,
        constraints,
        maxChildExtent,
      );
      final _AxisSize childSize = _AxisSize.fromSize(
        size: layoutChild(child, childConstraints),
        direction: direction,
      );
      accumulatedSize += childSize;
      final double? baselineOffset = textBaseline == null
          ? null
          : getBaseline(child, childConstraints, textBaseline);
      accumulatedAscentDescent += _AscentDescent(
        baselineOffset: baselineOffset,
        crossSize: childSize.crossAxisExtent,
      );
    }
    assert(totalFlex == 0.0);

    // The overall height of baseline-aligned children contributes to the cross axis extent.
    accumulatedSize += switch (accumulatedAscentDescent) {
      null => _AxisSize.empty,
      (final double ascent, final double descent) => _AxisSize(
        mainAxisExtent: 0.0,
        crossAxisExtent: ascent + descent,
      ),
    };

    final double idealMainSize = switch (mainAxisSize) {
      MainAxisSize.max when maxMainSize.isFinite => maxMainSize,
      MainAxisSize.max || MainAxisSize.min => accumulatedSize.mainAxisExtent,
    };

    final _AxisSize constrainedSize = _AxisSize(
      mainAxisExtent: idealMainSize,
      crossAxisExtent: accumulatedSize.crossAxisExtent,
    ).applyConstraints(constraints, direction);
    return _LayoutSizes(
      axisSize: constrainedSize,
      mainAxisFreeSpace:
          constrainedSize.mainAxisExtent - accumulatedSize.mainAxisExtent,
      baselineOffset: accumulatedAscentDescent.baselineOffset,
      spacePerFlex: firstFlexChild == null ? null : spacePerFlex,
    );
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    assert(() {
      final FlutterError? constraintsError = _debugCheckConstraints(
        constraints: constraints,
        reportParentConstraints: true,
      );
      if (constraintsError != null) {
        throw constraintsError;
      }
      return true;
    }());

    final _LayoutSizes sizes = _computeSizes(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
      getBaseline: ChildLayoutHelper.getBaseline,
    );

    final double crossAxisExtent = sizes.axisSize.crossAxisExtent;
    size = sizes.axisSize.toSize(direction);
    _overflow = math.max(0.0, -sizes.mainAxisFreeSpace);

    final double remainingSpace = math.max(0.0, sizes.mainAxisFreeSpace);
    final bool flipMainAxis = _flipMainAxis;
    final bool flipCrossAxis = _flipCrossAxis;
    final (double leadingSpace, double betweenSpace) = mainAxisAlignment
        ._distributeSpace(remainingSpace, childCount, flipMainAxis, spacing);
    final (_NextChild nextChild, RenderBox? topLeftChild) = flipMainAxis
        ? (childBefore, lastChild)
        : (childAfter, firstChild);
    final double? baselineOffset = sizes.baselineOffset;
    assert(
      baselineOffset == null ||
          (crossAxisAlignment == CrossAxisAlignment.baseline &&
              direction == Axis.horizontal),
    );

    // Position all children in visual order: starting from the top-left child and
    // work towards the child that's farthest away from the origin.
    double childMainPosition = leadingSpace;
    for (
      RenderBox? child = topLeftChild;
      child != null;
      child = nextChild(child)
    ) {
      final double? childBaselineOffset;
      final bool baselineAlign =
          baselineOffset != null &&
          (childBaselineOffset = child.getDistanceToBaseline(
                textBaseline!,
                onlyReal: true,
              )) !=
              null;
      final double childCrossPosition = baselineAlign
          ? baselineOffset - childBaselineOffset!
          : crossAxisAlignment._getChildCrossAxisOffset(
              crossAxisExtent - _getCrossSize(child.size),
              flipCrossAxis,
            );
      final FlexParentData childParentData =
          child.parentData! as FlexParentData;
      childParentData.offset = switch (direction) {
        Axis.horizontal => Offset(childMainPosition, childCrossPosition),
        Axis.vertical => Offset(childCrossPosition, childMainPosition),
      };
      childMainPosition += _getMainSize(child.size) + betweenSpace;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (!_hasOverflow) {
      defaultPaint(context, offset);
      return;
    }

    // There's no point in drawing the children if we're empty.
    if (size.isEmpty) {
      return;
    }

    _clipRectLayer.layer = context.pushClipRect(
      needsCompositing,
      offset,
      Offset.zero & size,
      defaultPaint,
      clipBehavior: clipBehavior,
      oldLayer: _clipRectLayer.layer,
    );

    assert(() {
      final List<DiagnosticsNode> debugOverflowHints = <DiagnosticsNode>[
        ErrorDescription(
          "The overflowing $runtimeType has an orientation of $_direction.",
        ),
        ErrorDescription(
          "The edge of the $runtimeType that is overflowing has been marked "
          "in the rendering with a yellow and black striped pattern. This is "
          "usually caused by the contents being too big for the $runtimeType.",
        ),
        ErrorHint(
          "Consider applying a flex factor (e.g. using an Expanded widget) to "
          "force the children of the $runtimeType to fit within the available "
          "space instead of being sized to their natural size.",
        ),
        ErrorHint(
          "This is considered an error condition because it indicates that there "
          "is content that cannot be seen. If the content is legitimately bigger "
          "than the available space, consider clipping it with a ClipRect widget "
          "before putting it in the flex, or using a scrollable container rather "
          "than a Flex, like a ListView.",
        ),
      ];

      // Simulate a child rect that overflows by the right amount. This child
      // rect is never used for drawing, just for determining the overflow
      // location and amount.
      final Rect overflowChildRect = switch (_direction) {
        Axis.horizontal => Rect.fromLTWH(0.0, 0.0, size.width + _overflow, 0.0),
        Axis.vertical => Rect.fromLTWH(0.0, 0.0, 0.0, size.height + _overflow),
      };
      paintOverflowIndicator(
        context,
        offset,
        Offset.zero & size,
        overflowChildRect,
        overflowHints: debugOverflowHints,
      );
      return true;
    }());
  }

  final LayerHandle<ClipRectLayer> _clipRectLayer =
      LayerHandle<ClipRectLayer>();

  @override
  void dispose() {
    _clipRectLayer.layer = null;
    super.dispose();
  }

  @override
  Rect? describeApproximatePaintClip(RenderObject child) {
    switch (clipBehavior) {
      case Clip.none:
        return null;
      case Clip.hardEdge:
      case Clip.antiAlias:
      case Clip.antiAliasWithSaveLayer:
        return _hasOverflow ? Offset.zero & size : null;
    }
  }

  @override
  String toStringShort() {
    String header = super.toStringShort();
    if (!kReleaseMode) {
      if (_hasOverflow) {
        header += " OVERFLOWING";
      }
    }
    return header;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Axis>("direction", direction));
    properties.add(
      EnumProperty<MainAxisAlignment>("mainAxisAlignment", mainAxisAlignment),
    );
    properties.add(EnumProperty<MainAxisSize>("mainAxisSize", mainAxisSize));
    properties.add(
      EnumProperty<CrossAxisAlignment>(
        "crossAxisAlignment",
        crossAxisAlignment,
      ),
    );
    properties.add(
      EnumProperty<TextDirection>(
        "textDirection",
        textDirection,
        defaultValue: null,
      ),
    );
    properties.add(
      EnumProperty<VerticalDirection>(
        "verticalDirection",
        verticalDirection,
        defaultValue: null,
      ),
    );
    properties.add(
      EnumProperty<TextBaseline>(
        "textBaseline",
        textBaseline,
        defaultValue: null,
      ),
    );
    properties.add(DoubleProperty("spacing", spacing, defaultValue: null));
  }
}

extension on MainAxisAlignment {
  (double leadingSpace, double betweenSpace) _distributeSpace(
    double freeSpace,
    int itemCount,
    bool flipped,
    double spacing,
  ) {
    assert(itemCount >= 0);
    return switch (this) {
      MainAxisAlignment.start =>
        flipped ? (freeSpace, spacing) : (0.0, spacing),

      MainAxisAlignment.end => MainAxisAlignment.start._distributeSpace(
        freeSpace,
        itemCount,
        !flipped,
        spacing,
      ),
      MainAxisAlignment.spaceBetween when itemCount < 2 =>
        MainAxisAlignment.start._distributeSpace(
          freeSpace,
          itemCount,
          flipped,
          spacing,
        ),
      MainAxisAlignment.spaceAround when itemCount == 0 =>
        MainAxisAlignment.start._distributeSpace(
          freeSpace,
          itemCount,
          flipped,
          spacing,
        ),

      MainAxisAlignment.center => (freeSpace / 2.0, spacing),
      MainAxisAlignment.spaceBetween => (
        0.0,
        freeSpace / (itemCount - 1) + spacing,
      ),
      MainAxisAlignment.spaceAround => (
        freeSpace / itemCount / 2,
        freeSpace / itemCount + spacing,
      ),
      MainAxisAlignment.spaceEvenly => (
        freeSpace / (itemCount + 1),
        freeSpace / (itemCount + 1) + spacing,
      ),
    };
  }
}

extension on CrossAxisAlignment {
  double _getChildCrossAxisOffset(double freeSpace, bool flipped) {
    // This method should not be used to position baseline-aligned children.
    return switch (this) {
      CrossAxisAlignment.stretch || CrossAxisAlignment.baseline => 0.0,
      CrossAxisAlignment.start => flipped ? freeSpace : 0.0,
      CrossAxisAlignment.center => freeSpace / 2.0,
      CrossAxisAlignment.end =>
        CrossAxisAlignment.start._getChildCrossAxisOffset(freeSpace, !flipped),
    };
  }
}

// A 2D vector that uses a [RenderFlex]'s main axis and cross axis as its first and second coordinate axes.
// It represents the same vector as (double mainAxisExtent, double crossAxisExtent).
extension type const _AxisSize._(Size _size) {
  _AxisSize({required double mainAxisExtent, required double crossAxisExtent})
    : this._(Size(mainAxisExtent, crossAxisExtent));
  _AxisSize.fromSize({required Size size, required Axis direction})
    : this._(_convert(size, direction));

  static const _AxisSize empty = _AxisSize._(Size.zero);

  static Size _convert(Size size, Axis direction) {
    return switch (direction) {
      Axis.horizontal => size,
      Axis.vertical => size.flipped,
    };
  }

  double get mainAxisExtent => _size.width;
  double get crossAxisExtent => _size.height;

  Size toSize(Axis direction) => _convert(_size, direction);

  _AxisSize applyConstraints(BoxConstraints constraints, Axis direction) {
    final BoxConstraints effectiveConstraints = switch (direction) {
      Axis.horizontal => constraints,
      Axis.vertical => constraints.flipped,
    };
    return _AxisSize._(effectiveConstraints.constrain(_size));
  }

  _AxisSize operator +(_AxisSize other) => _AxisSize._(
    Size(
      _size.width + other._size.width,
      math.max(_size.height, other._size.height),
    ),
  );
}

// The ascent and descent of a baseline-aligned child.
//
// Baseline-aligned children contributes to the cross axis extent of a [RenderFlex]
// differently from children with other [CrossAxisAlignment]s.
extension type const _AscentDescent._(
  (double ascent, double descent)? ascentDescent
) {
  factory _AscentDescent({
    required double? baselineOffset,
    required double crossSize,
  }) {
    return baselineOffset == null
        ? none
        : _AscentDescent._((baselineOffset, crossSize - baselineOffset));
  }
  static const _AscentDescent none = _AscentDescent._(null);

  double? get baselineOffset => ascentDescent?.$1;

  _AscentDescent operator +(_AscentDescent other) => switch ((this, other)) {
    (null, final _AscentDescent v) || (final _AscentDescent v, null) => v,
    (
      (final double xAscent, final double xDescent),
      (final double yAscent, final double yDescent),
    ) =>
      _AscentDescent._((
        math.max(xAscent, yAscent),
        math.max(xDescent, yDescent),
      )),
  };
}

typedef _ChildSizingFunction = double Function(RenderBox child, double extent);
typedef _NextChild = RenderBox? Function(RenderBox child);

class _LayoutSizes {
  _LayoutSizes({
    required this.axisSize,
    required this.baselineOffset,
    required this.mainAxisFreeSpace,
    required this.spacePerFlex,
  }) : assert(spacePerFlex?.isFinite ?? true);

  // The final constrained _AxisSize of the RenderFlex.
  final _AxisSize axisSize;

  // The free space along the main axis. If the value is positive, the free space
  // will be distributed according to the [MainAxisAlignment] specified. A
  // negative value indicates the RenderFlex overflows along the main axis.
  final double mainAxisFreeSpace;

  // Null if the RenderFlex is not baseline aligned, or none of its children has
  // a valid baseline of the given [TextBaseline] type.
  final double? baselineOffset;

  // The allocated space for flex children.
  final double? spacePerFlex;
}
