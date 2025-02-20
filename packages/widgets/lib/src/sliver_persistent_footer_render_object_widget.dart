part of 'sliver_persistent_footer.dart';

abstract class _SliverPersistentFooterRenderObjectWidget
    extends RenderObjectWidget {
  const _SliverPersistentFooterRenderObjectWidget({
    required this.delegate,
    this.floating = false,
  });

  final SliverPersistentHeaderDelegate delegate;
  final bool floating;

  @override
  _SliverPersistentFooterElement createElement() =>
      _SliverPersistentFooterElement(this, floating: floating);

  @override
  _RenderSliverPersistentFooterForWidgetsMixin createRenderObject(
    BuildContext context,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<SliverPersistentHeaderDelegate>('delegate', delegate),
    );
  }
}
