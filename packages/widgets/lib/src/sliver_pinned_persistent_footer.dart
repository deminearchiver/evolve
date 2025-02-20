part of 'sliver_persistent_footer.dart';

class _SliverPinnedPersistentFooter
    extends _SliverPersistentFooterRenderObjectWidget {
  const _SliverPinnedPersistentFooter({required super.delegate});

  @override
  _RenderSliverPersistentFooterForWidgetsMixin createRenderObject(
    BuildContext context,
  ) {
    return _RenderSliverPinnedPersistentFooterForWidgets(
      stretchConfiguration: delegate.stretchConfiguration,
      showOnScreenConfiguration: delegate.showOnScreenConfiguration,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderSliverPinnedPersistentFooterForWidgets renderObject,
  ) {
    renderObject
      ..stretchConfiguration = delegate.stretchConfiguration
      ..showOnScreenConfiguration = delegate.showOnScreenConfiguration;
  }
}

Rect? _trim(
  Rect? original, {
  double top = -double.infinity,
  double right = double.infinity,
  double bottom = double.infinity,
  double left = -double.infinity,
}) => original?.intersect(Rect.fromLTRB(left, top, right, bottom));

/// A sliver with a [RenderBox] child which never scrolls off the viewport in
/// the positive scroll direction, and which first scrolls on at a full size but
/// then shrinks as the viewport continues to scroll.
///
/// This sliver avoids overlapping other earlier slivers where possible.
abstract class RenderSliverPinnedPersistentFooter
    extends RenderSliverPersistentFooter {
  /// Creates a sliver that shrinks when it hits the start of the viewport, then
  /// stays pinned there.
  RenderSliverPinnedPersistentFooter({
    super.child,
    super.stretchConfiguration,
    this.showOnScreenConfiguration =
        const PersistentHeaderShowOnScreenConfiguration(),
  });

  /// Specifies the persistent header's behavior when `showOnScreen` is called.
  ///
  /// If set to null, the persistent header will delegate the `showOnScreen` call
  /// to it's parent [RenderObject].
  PersistentHeaderShowOnScreenConfiguration? showOnScreenConfiguration;

  double? _childPosition;

  @protected
  double updateGeometry() {
    double stretchOffset = 0.0;
    if (stretchConfiguration != null) {
      stretchOffset += constraints.overlap.abs();
    }
    final double maxExtent = this.maxExtent;
    // final double paintExtent = maxExtent - _effectiveScrollOffset!;
    final double paintExtent = maxExtent;
    final double layoutExtent = maxExtent - constraints.scrollOffset;
    geometry = SliverGeometry(
      scrollExtent: maxExtent,
      paintOrigin: math.min(constraints.overlap, 0.0),
      paintExtent: clampDouble(
        paintExtent,
        0.0,
        constraints.remainingPaintExtent,
      ),
      layoutExtent: clampDouble(
        layoutExtent,
        0.0,
        constraints.remainingPaintExtent,
      ),
      maxPaintExtent: maxExtent + stretchOffset,
      hasVisualOverflow:
          true, // Conservatively say we do have overflow to avoid complexity.
    );
    debugPrint("${stretchOffset}");
    return stretchOffset > 0 ? 0.0 : math.min(0.0, paintExtent - childExtent);
  }

  @override
  void performLayout() {
    final SliverConstraints constraints = this.constraints;
    final double maxExtent = this.maxExtent;
    final bool overlapsContent = constraints.overlap > 0.0;
    layoutChild(
      constraints.scrollOffset,
      maxExtent,
      overlapsContent: overlapsContent,
    );
    final double effectiveRemainingPaintExtent = math.max(
      0,
      constraints.remainingPaintExtent - constraints.overlap,
    );
    final double layoutExtent = clampDouble(
      maxExtent - constraints.scrollOffset,
      0.0,
      effectiveRemainingPaintExtent,
    );
    debugPrint("${constraints.viewportMainAxisExtent - maxExtent}");
    final double stretchOffset =
        stretchConfiguration != null ? constraints.overlap.abs() : 0.0;

    // debugPrint(
    //   "${math.max(0, constraints.remainingPaintExtent - constraints.overlap)}",
    // );
    // debugPrint(
    //   "${childExtent}, ${effectiveRemainingPaintExtent} layoutExtent: ${layoutExtent} constraints.scrollOffset: ${constraints.remainingPaintExtent}",
    // );
    geometry = SliverGeometry(
      scrollExtent: maxExtent,
      paintOrigin: constraints.overlap,
      paintExtent: math.min(childExtent, effectiveRemainingPaintExtent),
      layoutExtent: layoutExtent,
      maxPaintExtent: maxExtent + stretchOffset,
      maxScrollObstructionExtent: minExtent,
      cacheExtent:
          layoutExtent > 0.0
              ? -constraints.cacheOrigin + layoutExtent
              : layoutExtent,
      hasVisualOverflow:
          true, // Conservatively say we do have overflow to avoid complexity.
    );

    _childPosition =
        math.min(childExtent, effectiveRemainingPaintExtent) - childExtent;
  }

  // @override
  // double childMainAxisPosition(RenderBox child) => 0.0;

  @override
  double childMainAxisPosition(covariant RenderObject child) {
    assert(child == this.child);
    return _childPosition ?? 0.0;
  }

  @override
  void showOnScreen({
    RenderObject? descendant,
    Rect? rect,
    Duration duration = Duration.zero,
    Curve curve = Curves.ease,
  }) {
    final Rect? localBounds =
        descendant != null
            ? MatrixUtils.transformRect(
              descendant.getTransformTo(this),
              rect ?? descendant.paintBounds,
            )
            : rect;

    final Rect? newRect = switch (applyGrowthDirectionToAxisDirection(
      constraints.axisDirection,
      constraints.growthDirection,
    )) {
      AxisDirection.up => _trim(localBounds, bottom: childExtent),
      AxisDirection.left => _trim(localBounds, right: childExtent),
      AxisDirection.right => _trim(localBounds, left: 0),
      AxisDirection.down => _trim(localBounds, top: 0),
    };

    super.showOnScreen(
      descendant: this,
      rect: newRect,
      duration: duration,
      curve: curve,
    );
  }
}

class _RenderSliverPinnedPersistentFooterForWidgets
    extends RenderSliverPinnedPersistentFooter
    with _RenderSliverPersistentFooterForWidgetsMixin {
  _RenderSliverPinnedPersistentFooterForWidgets({
    super.stretchConfiguration,
    super.showOnScreenConfiguration,
  });
}
