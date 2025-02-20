import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Widgets
part 'sliver_persistent_footer_render_object_widget.dart';
// Elements
part 'sliver_persistent_footer_element.dart';
// Render objects
part 'render_sliver_persistent_footer.dart';

// Mixed
part 'sliver_scrolling_persistent_footer.dart';
part 'sliver_pinned_persistent_footer.dart';

SliverPersistentHeader? _;

class SliverPersistentFooter extends StatelessWidget {
  /// Creates a sliver that varies its size when it is scrolled to the start of
  /// a viewport.
  const SliverPersistentFooter({
    super.key,
    required this.delegate,
    this.pinned = false,
    this.floating = false,
  });

  /// Configuration for the sliver's layout.
  ///
  /// The delegate provides the following information:
  ///
  ///  * The minimum and maximum dimensions of the sliver.
  ///
  ///  * The builder for generating the widgets of the sliver.
  ///
  ///  * The instructions for snapping the scroll offset, if [floating] is true.
  final SliverPersistentHeaderDelegate delegate;

  /// Whether to stick the header to the start of the viewport once it has
  /// reached its minimum size.
  ///
  /// If this is false, the header will continue scrolling off the screen after
  /// it has shrunk to its minimum extent.
  final bool pinned;

  /// Whether the header should immediately grow again if the user reverses
  /// scroll direction.
  ///
  /// If this is false, the header only grows again once the user reaches the
  /// part of the viewport that contains the sliver.
  ///
  /// The [delegate]'s [SliverPersistentHeaderDelegate.snapConfiguration] is
  /// ignored unless [floating] is true.
  final bool floating;

  @override
  Widget build(BuildContext context) {
    // if (floating && pinned) {
    //   return _SliverFloatingPinnedPersistentFooter(delegate: delegate);
    // }
    if (pinned) {
      return _SliverPinnedPersistentFooter(delegate: delegate);
    }
    // if (floating) {
    //   return _SliverFloatingPersistentFooter(delegate: delegate);
    // }
    return _SliverScrollingPersistentFooter(delegate: delegate);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<SliverPersistentHeaderDelegate>("delegate", delegate),
    );
    final List<String> flags = <String>[
      if (pinned) "pinned",
      if (floating) "floating",
    ];
    if (flags.isEmpty) {
      flags.add("normal");
    }
    properties.add(IterableProperty<String>("mode", flags));
  }
}

class _FloatingFooter extends StatefulWidget {
  const _FloatingFooter({required this.child});

  final Widget child;

  @override
  _FloatingFooterState createState() => _FloatingFooterState();
}

// A wrapper for the widget created by _SliverPersistentHeaderElement that
// starts and stops the floating app bar's snap-into-view or snap-out-of-view
// animation. It also informs the float when pointer scrolling by updating the
// last known ScrollDirection when scrolling began.
class _FloatingFooterState extends State<_FloatingFooter> {
  ScrollPosition? _position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    _position = Scrollable.maybeOf(context)?.position;
    if (_position != null) {
      _position!.isScrollingNotifier.addListener(_isScrollingListener);
    }
  }

  @override
  void dispose() {
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    super.dispose();
  }

  RenderSliverFloatingPersistentHeader? _headerRenderer() {
    return context
        .findAncestorRenderObjectOfType<RenderSliverFloatingPersistentHeader>();
  }

  void _isScrollingListener() {
    assert(_position != null);

    // When a scroll stops, then maybe snap the app bar into view.
    // Similarly, when a scroll starts, then maybe stop the snap animation.
    // Update the scrolling direction as well for pointer scrolling updates.
    final RenderSliverFloatingPersistentHeader? header = _headerRenderer();
    if (_position!.isScrollingNotifier.value) {
      header?.updateScrollStartDirection(_position!.userScrollDirection);
      // Only SliverAppBars support snapping, headers will not snap.
      header?.maybeStopSnapAnimation(_position!.userScrollDirection);
    } else {
      // Only SliverAppBars support snapping, headers will not snap.
      header?.maybeStartSnapAnimation(_position!.userScrollDirection);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
