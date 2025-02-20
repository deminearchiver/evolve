part of 'sliver_persistent_footer.dart';

class _SliverPersistentFooterElement extends RenderObjectElement {
  _SliverPersistentFooterElement(
    _SliverPersistentFooterRenderObjectWidget super.widget, {
    this.floating = false,
  });

  final bool floating;

  @override
  _RenderSliverPersistentFooterForWidgetsMixin get renderObject =>
      super.renderObject as _RenderSliverPersistentFooterForWidgetsMixin;

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    renderObject._element = this;
  }

  @override
  void unmount() {
    renderObject._element = null;
    super.unmount();
  }

  @override
  void update(_SliverPersistentFooterRenderObjectWidget newWidget) {
    final _SliverPersistentFooterRenderObjectWidget oldWidget =
        widget as _SliverPersistentFooterRenderObjectWidget;
    super.update(newWidget);
    final SliverPersistentHeaderDelegate newDelegate = newWidget.delegate;
    final SliverPersistentHeaderDelegate oldDelegate = oldWidget.delegate;
    if (newDelegate != oldDelegate &&
        (newDelegate.runtimeType != oldDelegate.runtimeType ||
            newDelegate.shouldRebuild(oldDelegate))) {
      final _RenderSliverPersistentFooterForWidgetsMixin renderObject =
          this.renderObject;
      _updateChild(
        newDelegate,
        renderObject.lastShrinkOffset,
        renderObject.lastOverlapsContent,
      );
      renderObject.triggerRebuild();
    }
  }

  @override
  void performRebuild() {
    super.performRebuild();
    renderObject.triggerRebuild();
  }

  Element? child;

  void _updateChild(
    SliverPersistentHeaderDelegate delegate,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final newWidget = delegate.build(this, shrinkOffset, overlapsContent);
    child = updateChild(
      child,
      floating ? _FloatingFooter(child: newWidget) : newWidget,
      null,
    );
  }

  void _build(double shrinkOffset, bool overlapsContent) {
    owner!.buildScope(this, () {
      final sliverPersistentHeaderRenderObjectWidget =
          widget as _SliverPersistentFooterRenderObjectWidget;
      _updateChild(
        sliverPersistentHeaderRenderObjectWidget.delegate,
        shrinkOffset,
        overlapsContent,
      );
    });
  }

  @override
  void forgetChild(Element child) {
    assert(child == this.child);
    this.child = null;
    super.forgetChild(child);
  }

  @override
  void insertRenderObjectChild(covariant RenderBox child, Object? slot) {
    assert(renderObject.debugValidateChild(child));
    renderObject.child = child;
  }

  @override
  void moveRenderObjectChild(
    covariant RenderObject child,
    Object? oldSlot,
    Object? newSlot,
  ) {
    assert(false);
  }

  @override
  void removeRenderObjectChild(covariant RenderObject child, Object? slot) {
    renderObject.child = null;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (child != null) {
      visitor(child!);
    }
  }
}
