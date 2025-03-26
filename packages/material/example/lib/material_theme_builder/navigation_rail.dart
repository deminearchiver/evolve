import 'package:flutter/foundation.dart';
import 'package:material/material.dart';

@immutable
class Destination with Diagnosticable {
  const Destination({
    required this.icon,
    this.selectedIcon,
    required this.label,
  });

  final Widget icon;
  final Widget? selectedIcon;
  final Widget label;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Widget>("icon", icon));
    properties.add(
      DiagnosticsProperty<Widget>(
        "selectedIcon",
        selectedIcon,
        defaultValue: null,
      ),
    );
    properties.add(DiagnosticsProperty<Widget>("label", label));
  }
}

class ExperimentalNavigationRail extends StatefulWidget {
  const ExperimentalNavigationRail({
    super.key,
    this.onDestinationSelected,
    required this.selectedIndex,
    required this.destinations,
  }) : assert(destinations.length >= 2);

  final ValueChanged<int>? onDestinationSelected;
  final int? selectedIndex;
  final List<Destination> destinations;

  @override
  State<ExperimentalNavigationRail> createState() =>
      _ExperimentalNavigationRailState();
}

class _ExperimentalNavigationRailState
    extends State<ExperimentalNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Material(
        child: Flex.vertical(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Symbols.menu)),
            const Flexible.expanded(),
            ...widget.destinations.map(
              (destination) => _Indicator(destination: destination),
            ),
          ],
        ),
      ),
    );
  }
}

class _Indicator extends StatefulWidget {
  const _Indicator({super.key, required this.destination});

  final Destination destination;

  @override
  State<_Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<_Indicator> {
  final GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return _IndicatorInkWell(
      containerKey: _containerKey,
      onTap: () {},
      child: SizedBox(
        width: 56,
        height: 32,
        child: Material(
          key: _containerKey,
          color: Colors.red,
          shape: const StadiumBorder(),
          child: widget.destination.icon,
        ),
      ),
    );
  }
}

class _IndicatorInkWell extends InkWell {
  const _IndicatorInkWell({
    required this.containerKey,
    super.onTap,
    super.overlayColor,
    super.child,
  });

  final GlobalKey containerKey;

  @override
  RectCallback? getRectCallback(RenderBox referenceBox) {
    return () {
      final containerBox =
          containerKey.currentContext!.findRenderObject()! as RenderBox;
      final containerRect =
          containerBox.localToGlobal(Offset.zero) & containerBox.size;
      return referenceBox.globalToLocal(containerRect.topLeft) &
          containerBox.size;
    };
  }
}
