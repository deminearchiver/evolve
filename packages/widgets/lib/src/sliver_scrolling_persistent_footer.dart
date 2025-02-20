part of 'sliver_persistent_footer.dart';

class _SliverScrollingPersistentFooter
    extends _SliverPersistentFooterRenderObjectWidget {
  const _SliverScrollingPersistentFooter({required super.delegate});

  @override
  _RenderSliverPersistentFooterForWidgetsMixin createRenderObject(
    BuildContext context,
  ) {
    return _RenderSliverScrollingPersistentFooterForWidgets(
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderSliverScrollingPersistentFooterForWidgets renderObject,
  ) {
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

/// A sliver with a [RenderBox] child which scrolls normally, except that when
/// it hits the leading edge (typically the top) of the viewport, it shrinks to
/// a minimum size before continuing to scroll.
///
/// This sliver makes no effort to avoid overlapping other content.
abstract class RenderSliverScrollingPersistentFooter
    extends RenderSliverPersistentFooter {
  /// Creates a sliver that shrinks when it hits the start of the viewport, then
  /// scrolls off.
  RenderSliverScrollingPersistentFooter({
    super.child,
    super.stretchConfiguration,
  });

  // Distance from our leading edge to the child's leading edge, in the axis
  // direction. Negative if we're scrolled off the top.
  double? _childPosition;

  /// Updates [geometry], and returns the new value for [childMainAxisPosition].
  ///
  /// This is used by [performLayout].
  @protected
  double updateGeometry() {
    double stretchOffset = 0.0;
    if (stretchConfiguration != null) {
      stretchOffset += constraints.overlap.abs();
    }
    final double maxExtent = this.maxExtent;
    final double paintExtent = maxExtent - constraints.scrollOffset;
    final double cacheExtent = calculateCacheOffset(
      constraints,
      from: 0.0,
      to: maxExtent,
    );
    debugPrint("${paintExtent}");

    geometry = SliverGeometry(
      cacheExtent: cacheExtent,
      scrollExtent: maxExtent,
      paintOrigin: math.min(constraints.overlap, 0.0),
      paintExtent: clampDouble(
        paintExtent,
        0.0,
        constraints.remainingPaintExtent,
      ),
      maxPaintExtent: maxExtent + stretchOffset,
      hasVisualOverflow:
          true, // Conservatively say we do have overflow to avoid complexity.
    );
    return stretchOffset > 0 ? 0.0 : math.min(0.0, paintExtent - childExtent);
  }

  @override
  void performLayout() {
    layoutChild(constraints.scrollOffset, maxExtent);
    _childPosition = updateGeometry();
  }

  @override
  double childMainAxisPosition(RenderBox child) {
    assert(child == this.child);
    assert(_childPosition != null);
    return _childPosition!;
  }
}

class _RenderSliverScrollingPersistentFooterForWidgets
    extends RenderSliverScrollingPersistentFooter
    with _RenderSliverPersistentFooterForWidgetsMixin {
  _RenderSliverScrollingPersistentFooterForWidgets({
    super.stretchConfiguration,
  });
}
