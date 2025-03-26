import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef SliverPersistentHeaderBuilder =
    Widget Function(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
    );

class SliverHeader extends StatefulWidget {
  const SliverHeader({
    super.key,
    this.pinned = false,
    this.floating = false,
    this.snapConfiguration,
    this.showOnScreenConfiguration,
    this.stretchConfiguration,
    required this.minExtent,
    required this.maxExtent,
    required this.builder,
  });

  final bool pinned;
  final bool floating;

  final FloatingHeaderSnapConfiguration? snapConfiguration;
  final PersistentHeaderShowOnScreenConfiguration? showOnScreenConfiguration;
  final OverScrollHeaderStretchConfiguration? stretchConfiguration;
  final double minExtent;
  final double maxExtent;
  final SliverPersistentHeaderBuilder builder;

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: widget.pinned,
      floating: widget.floating,
      delegate: _SliverHeaderDelegate(
        vsync: this,
        snapConfiguration: widget.snapConfiguration,
        showOnScreenConfiguration: widget.showOnScreenConfiguration,
        stretchConfiguration: widget.stretchConfiguration,
        minExtent: widget.minExtent,
        maxExtent: widget.maxExtent,
        builder: widget.builder,
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverHeaderDelegate({
    this.vsync,
    this.snapConfiguration,
    this.showOnScreenConfiguration,
    this.stretchConfiguration,
    required this.minExtent,
    required this.maxExtent,
    required this.builder,
  });

  final SliverPersistentHeaderBuilder builder;

  @override
  final TickerProvider? vsync;

  @override
  final FloatingHeaderSnapConfiguration? snapConfiguration;

  @override
  final PersistentHeaderShowOnScreenConfiguration? showOnScreenConfiguration;

  @override
  final OverScrollHeaderStretchConfiguration? stretchConfiguration;

  @override
  final double minExtent;

  @override
  final double maxExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => builder(context, shrinkOffset, overlapsContent);

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    // TODO: figure out if this actually cannot be optimized. See below for comments.
    return true;

    // The solution below returns true every time because "configurations"
    // don't have the equality operator and hashCode overriden,
    // so it's easier to return true each time without checking.

    // return vsync != oldDelegate.vsync ||
    //     snapConfiguration != oldDelegate.snapConfiguration ||
    //     showOnScreenConfiguration != oldDelegate.showOnScreenConfiguration ||
    //     stretchConfiguration != oldDelegate.stretchConfiguration ||
    //     minExtent != oldDelegate.minExtent ||
    //     maxExtent != oldDelegate.maxExtent ||
    //     builder != oldDelegate.builder;
  }
}
