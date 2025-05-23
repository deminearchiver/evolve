import 'package:flutter/foundation.dart';
import 'package:material/material.dart';
import 'package:flutter/material.dart' as flutter_material;

/// A Material Design tooltip.
///
/// Tooltips provide text labels which help explain the function of a button or
/// other user interface action. Wrap the button in a [Tooltip] widget and provide
/// a message which will be shown when the widget is long pressed.
///
/// Many widgets, such as [IconButton], [FloatingActionButton], and
/// [PopupMenuButton] have a `tooltip` property that, when non-null, causes the
/// widget to include a [Tooltip] in its build.
///
/// Tooltips improve the accessibility of visual widgets by proving a textual
/// representation of the widget, which, for example, can be vocalized by a
/// screen reader.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=EeEfD5fI-5Q}
///
/// {@tool dartpad}
/// This example show a basic [Tooltip] which has a [Text] as child.
/// [message] contains your label to be shown by the tooltip when
/// the child that Tooltip wraps is hovered over on web or desktop. On mobile,
/// the tooltip is shown when the widget is long pressed.
///
/// This tooltip will default to showing above the [Text] instead of below
/// because its ambient [TooltipThemeData.preferBelow] is false.
/// (See the use of [MaterialApp.theme].)
/// Setting that piece of theme data is recommended to avoid having a finger or
/// cursor hide the tooltip. For other ways to set that piece of theme data see:
///
/// * [Theme.data], [ThemeData.tooltipTheme]
/// * [TooltipTheme.data]
///
/// or it can be set directly on each tooltip with [Tooltip.preferBelow].
///
/// ** See code in examples/api/lib/material/tooltip/tooltip.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example covers most of the attributes available in Tooltip.
/// `decoration` has been used to give a gradient and borderRadius to Tooltip.
/// `constraints` has been used to set the minimum width of the Tooltip.
/// `preferBelow` is true; the tooltip will prefer showing below [Tooltip]'s child widget.
/// However, it may show the tooltip above if there's not enough space
/// below the widget.
/// `textStyle` has been used to set the font size of the 'message'.
/// `showDuration` accepts a Duration to continue showing the message after the long
/// press has been released or the mouse pointer exits the child widget.
/// `waitDuration` accepts a Duration for which a mouse pointer has to hover over the child
/// widget before the tooltip is shown.
///
/// ** See code in examples/api/lib/material/tooltip/tooltip.1.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows a rich [Tooltip] that specifies the [richMessage]
/// parameter instead of the [message] parameter (only one of these may be
/// non-null. Any [InlineSpan] can be specified for the [richMessage] attribute,
/// including [WidgetSpan].
///
/// ** See code in examples/api/lib/material/tooltip/tooltip.2.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how [Tooltip] can be shown manually with [TooltipTriggerMode.manual]
/// by calling the [TooltipState.ensureTooltipVisible] function.
///
/// ** See code in examples/api/lib/material/tooltip/tooltip.3.dart **
/// {@end-tool}
///
/// See also:
///
///  * <https://material.io/design/components/tooltips.html>
///  * [TooltipTheme] or [ThemeData.tooltipTheme]
///  * [TooltipVisibility]
class Tooltip extends StatelessWidget {
  /// Creates a tooltip.
  ///
  /// By default, tooltips should adhere to the
  /// [Material specification](https://material.io/design/components/tooltips.html#spec).
  /// If the optional constructor parameters are not defined, the values
  /// provided by [TooltipTheme.of] will be used if a [TooltipTheme] is present
  /// or specified in [ThemeData].
  ///
  /// All parameters that are defined in the constructor will
  /// override the default values _and_ the values in [TooltipTheme.of].
  ///
  /// Only one of [message] and [richMessage] may be non-null.
  const Tooltip({
    super.key,
    this.message,
    this.richMessage,
    @Deprecated(
      "Use Tooltip.constraints instead. "
      "This feature was deprecated after v3.30.0-0.1.pre.",
    )
    this.height,
    this.constraints,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.preferBelow,
    this.excludeFromSemantics,
    this.decoration,
    this.textStyle,
    this.textAlign,
    this.waitDuration,
    this.showDuration,
    this.exitDuration,
    this.enableTapToDismiss = true,
    this.triggerMode,
    this.enableFeedback,
    this.onTriggered,
    this.mouseCursor,
    this.ignorePointer,
    this.child,
  }) : assert(
         (message == null) != (richMessage == null),
         'Either `message` or `richMessage` must be specified',
       ),
       assert(
         height == null || constraints == null,
         'Only one of `height` and `constraints` may be specified.',
       );

  /// The text to display in the tooltip.
  ///
  /// Only one of [message] and [richMessage] may be non-null.
  final String? message;

  /// The rich text to display in the tooltip.
  ///
  /// Only one of [message] and [richMessage] may be non-null.
  final InlineSpan? richMessage;

  /// The minimum height of the [Tooltip]'s message.
  @Deprecated(
    'Use Tooltip.constraints instead. '
    'This feature was deprecated after v3.30.0-0.1.pre.',
  )
  final double? height;

  /// Constrains the size of the [Tooltip]'s message.
  ///
  /// If null, then the [TooltipThemeData.constraints] of the ambient [ThemeData.tooltipTheme]
  /// will be used. If that is also null, then a default value will be picked based on the current
  /// platform. For desktop platforms, the default value is `BoxConstraints(minHeight: 24.0)`,
  /// while for mobile platforms the default value is `BoxConstraints(minHeight: 32.0)`.
  final BoxConstraints? constraints;

  /// The amount of space by which to inset the [Tooltip]'s message.
  ///
  /// On mobile, defaults to 16.0 logical pixels horizontally and 4.0 vertically.
  /// On desktop, defaults to 8.0 logical pixels horizontally and 4.0 vertically.
  final EdgeInsetsGeometry? padding;

  /// The empty space that surrounds the tooltip.
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a
  /// long tooltip will span the width of its window. If long enough,
  /// a tooltip might also span the window's height. This property allows
  /// one to define how much space the tooltip must be inset from the edges
  /// of their display window.
  ///
  /// If this property is null, then [TooltipThemeData.margin] is used.
  /// If [TooltipThemeData.margin] is also null, the default margin is
  /// 0.0 logical pixels on all sides.
  ///
  /// See also:
  ///
  ///  * [constraints], which allow setting an explicit size for the tooltip.
  final EdgeInsetsGeometry? margin;

  /// The vertical gap between the widget and the displayed tooltip.
  ///
  /// When [preferBelow] is set to true and tooltips have sufficient space to
  /// display themselves, this property defines how much vertical space
  /// tooltips will position themselves under their corresponding widgets.
  /// Otherwise, tooltips will position themselves above their corresponding
  /// widgets with the given offset.
  final double? verticalOffset;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// If there is insufficient space to display the tooltip in
  /// the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  ///
  /// If this property is null, then [TooltipThemeData.preferBelow] is used.
  /// If that is also null, the default value is true.
  ///
  /// Applying [TooltipThemeData.preferBelow]: `false` for the entire app
  /// is recommended to avoid having a finger or cursor hide a tooltip.
  final bool? preferBelow;

  /// Whether the tooltip's [message] or [richMessage] should be excluded from
  /// the semantics tree.
  ///
  /// Defaults to false. A tooltip will add a [Semantics] label that is set to
  /// [Tooltip.message] if non-null, or the plain text value of
  /// [Tooltip.richMessage] otherwise. Set this property to true if the app is
  /// going to provide its own custom semantics label.
  final bool? excludeFromSemantics;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// Specifies the tooltip's shape and background color.
  ///
  /// The tooltip shape defaults to a rounded rectangle with a border radius of
  /// 4.0. Tooltips will also default to an opacity of 90% and with the color
  /// [Colors.grey]\[700\] if [ThemeData.brightness] is [Brightness.light], and
  /// [Colors.white] if it is [Brightness.dark].
  final Decoration? decoration;

  /// The style to use for the message of the tooltip.
  ///
  /// If null, the message's [TextStyle] will be determined based on
  /// [ThemeData]. If [ThemeData.brightness] is set to [Brightness.dark],
  /// [TextTheme.bodyMedium] of [ThemeData.textTheme] will be used with
  /// [Colors.white]. Otherwise, if [ThemeData.brightness] is set to
  /// [Brightness.light], [TextTheme.bodyMedium] of [ThemeData.textTheme] will be
  /// used with [Colors.black].
  final TextStyle? textStyle;

  /// How the message of the tooltip is aligned horizontally.
  ///
  /// If this property is null, then [TooltipThemeData.textAlign] is used.
  /// If [TooltipThemeData.textAlign] is also null, the default value is
  /// [TextAlign.start].
  final TextAlign? textAlign;

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to 0 milliseconds (tooltips are shown immediately upon hover).
  final Duration? waitDuration;

  /// The length of time that the tooltip will be shown after a long press is
  /// released (if triggerMode is [TooltipTriggerMode.longPress]) or a tap is
  /// released (if triggerMode is [TooltipTriggerMode.tap]). This property
  /// does not affect mouse pointer devices.
  ///
  /// Defaults to 1.5 seconds for long press and tap released
  ///
  /// See also:
  ///
  ///  * [exitDuration], which allows configuring the time until a pointer
  /// disappears when hovering.
  final Duration? showDuration;

  /// The length of time that a pointer must have stopped hovering over a
  /// tooltip's widget before the tooltip will be hidden.
  ///
  /// Defaults to 100 milliseconds.
  ///
  /// See also:
  ///
  ///  * [showDuration], which allows configuring the length of time that a
  /// tooltip will be visible after touch events are released.
  final Duration? exitDuration;

  /// Whether the tooltip can be dismissed by tap.
  ///
  /// The default value is true.
  final bool enableTapToDismiss;

  /// The [TooltipTriggerMode] that will show the tooltip.
  ///
  /// If this property is null, then [TooltipThemeData.triggerMode] is used.
  /// If [TooltipThemeData.triggerMode] is also null, the default mode is
  /// [TooltipTriggerMode.longPress].
  ///
  /// This property does not affect mouse devices. Setting [triggerMode] to
  /// [TooltipTriggerMode.manual] will not prevent the tooltip from showing when
  /// the mouse cursor hovers over it.
  final TooltipTriggerMode? triggerMode;

  /// Whether the tooltip should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// When null, the default value is true.
  ///
  /// See also:
  ///
  ///  * [Feedback], for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// Called when the Tooltip is triggered.
  ///
  /// The tooltip is triggered after a tap when [triggerMode] is [TooltipTriggerMode.tap]
  /// or after a long press when [triggerMode] is [TooltipTriggerMode.longPress].
  final TooltipTriggeredCallback? onTriggered;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If this property is null, [MouseCursor.defer] will be used.
  final MouseCursor? mouseCursor;

  /// Whether this tooltip should be invisible to hit testing.
  ///
  /// If no value is passed, pointer events are ignored unless the tooltip has a
  /// [richMessage] instead of a [message].
  ///
  /// See also:
  ///
  /// * [IgnorePointer], for more information about how pointer events are
  /// handled or ignored.
  final bool? ignorePointer;

  @override
  Widget build(BuildContext context) {
    final TooltipThemeData defaults = _TooltipDefaults(context: context);
    final tooltipTheme = TooltipTheme.of(context);
    return TooltipTheme(
      data: defaults.merge(tooltipTheme),
      child: flutter_material.Tooltip(
        key: key,
        // ignore: deprecated_member_use, deprecated_member_use_from_same_package
        height: height,
        constraints: constraints,
        message: message,
        richMessage: richMessage,
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        excludeFromSemantics: excludeFromSemantics,
        decoration: decoration,
        textStyle: textStyle,
        textAlign: textAlign,
        waitDuration: waitDuration,
        showDuration: showDuration,
        exitDuration: exitDuration,
        enableTapToDismiss: enableTapToDismiss,
        triggerMode: triggerMode,
        enableFeedback: enableFeedback,
        onTriggered: onTriggered,
        mouseCursor: mouseCursor,
        ignorePointer: ignorePointer,
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      StringProperty(
        'message',
        message,
        showName: message == null,
        defaultValue: message == null ? null : kNoDefaultValue,
      ),
    );
    properties.add(
      StringProperty(
        'richMessage',
        richMessage?.toPlainText(),
        showName: richMessage == null,
        defaultValue: richMessage == null ? null : kNoDefaultValue,
      ),
    );
    properties.add(DoubleProperty('height', height, defaultValue: null));
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'constraints',
        constraints,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'padding',
        padding,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'margin',
        margin,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty('vertical offset', verticalOffset, defaultValue: null),
    );
    properties.add(
      FlagProperty(
        'position',
        value: preferBelow,
        ifTrue: 'below',
        ifFalse: 'above',
        showName: true,
      ),
    );
    properties.add(
      FlagProperty(
        'semantics',
        value: excludeFromSemantics,
        ifTrue: 'excluded',
        showName: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'wait duration',
        waitDuration,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'show duration',
        showDuration,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'exit duration',
        exitDuration,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TooltipTriggerMode>(
        'triggerMode',
        triggerMode,
        defaultValue: null,
      ),
    );
    properties.add(
      FlagProperty(
        'enableFeedback',
        value: enableFeedback,
        ifTrue: 'true',
        showName: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextAlign>(
        'textAlign',
        textAlign,
        defaultValue: null,
      ),
    );
  }

  /// Dismiss all of the tooltips that are currently shown on the screen,
  /// including those with mouse cursors currently hovering over them.
  ///
  /// This method returns true if it successfully dismisses the tooltips. It
  /// returns false if there is no tooltip shown on the screen.
  static bool dismissAllToolTips() {
    return flutter_material.Tooltip.dismissAllToolTips();
  }
}

class _TooltipDefaults extends TooltipThemeData {
  _TooltipDefaults({required this.context});

  final BuildContext context;
  late final ColorThemeData _color = ColorTheme.of(context);
  late final ShapeThemeData _shape = ShapeTheme.of(context);
  late final TextTheme _text = TextTheme.of(context);

  @override
  bool? get preferBelow => false;

  @override
  Decoration? get decoration => ShapeDecoration(
    shape: CornersBorder(
      delegate: _shape.corner.family.delegate,
      corners: Corners.all(_shape.corner.extraSmall),
    ),
    color: _color.inverseSurface,
  );

  @override
  TextStyle? get textStyle =>
      _text.bodySmall!.copyWith(color: _color.inverseOnSurface);

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(horizontal: 8);

  @override
  BoxConstraints? get constraints => const BoxConstraints(minHeight: 24);

  @override
  Duration? get waitDuration => const Duration(milliseconds: 500);
}
