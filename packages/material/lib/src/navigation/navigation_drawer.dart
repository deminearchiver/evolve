import 'package:material/material.dart'
    hide
        NavigationDrawer,
        NavigationDrawerDestination,
        NavigationDrawerTheme,
        NavigationDrawerThemeData;
import 'package:flutter/material.dart' as flutter_material;

import 'navigation_drawer_theme.dart';

// TODO: remove these globals used during development
late final flutter_material.NavigationDrawer _navigationDrawer;
late final flutter_material.NavigationDrawerThemeData
_navigationDrawerThemeData;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    required this.child,
  });

  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final navigationDrawerTheme = NavigationDrawerTheme.of(context);
    return Drawer(
      backgroundColor: backgroundColor ?? navigationDrawerTheme.backgroundColor,
      shadowColor: shadowColor ?? navigationDrawerTheme.shadowColor,
      elevation: elevation ?? navigationDrawerTheme.elevation,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SafeArea(bottom: false, child: child),
    );
  }
}

class NavigationDrawerDestination extends StatelessWidget {
  const NavigationDrawerDestination({
    super.key,
    this.onTap,
    this.selected = false,
    this.activeIndicatorColor,
    this.activeIndicatorSize,
    this.activeIndicatorShape,
    required this.icon,
    this.selectedIcon,
    required this.label,
  });

  final VoidCallback? onTap;
  final bool selected;

  final Color? activeIndicatorColor;
  final Size? activeIndicatorSize;
  final ShapeBorder? activeIndicatorShape;

  final Widget icon;
  final Widget? selectedIcon;
  final Widget label;

  Widget _buildSelectable(BuildContext context, Animation<double> animation) {
    const Set<WidgetState> disabledState = <WidgetState>{WidgetState.disabled};
    const Set<WidgetState> selectedState = <WidgetState>{WidgetState.selected};
    const Set<WidgetState> unselectedState = <WidgetState>{};

    final NavigationDrawerThemeData navigationDrawerTheme =
        NavigationDrawerTheme.of(context);

    const bool enabled = true;

    return _NavigationDestinationBuilder(
      onTap: onTap,
      animation: animation,
      color: activeIndicatorColor,
      size: activeIndicatorSize,
      shape: activeIndicatorShape,
      buildIcon: (context) {
        final Widget selectedIconWidget = IconTheme.merge(
          data: navigationDrawerTheme.iconTheme.resolve(
            enabled ? selectedState : disabledState,
          ),
          child: selectedIcon ?? icon,
        );
        final Widget unselectedIconWidget = IconTheme.merge(
          data: navigationDrawerTheme.iconTheme.resolve(
            enabled ? unselectedState : disabledState,
          ),
          child: icon,
        );

        return animation.isForwardOrCompleted
            ? selectedIconWidget
            : unselectedIconWidget;
      },
      buildLabel: (context) {
        final effectiveSelectedLabelTextStyle = navigationDrawerTheme
            .labelTextStyle
            .resolve(enabled ? selectedState : disabledState);
        final effectiveUnselectedLabelTextStyle = navigationDrawerTheme
            .labelTextStyle
            .resolve(enabled ? unselectedState : disabledState);

        return DefaultTextStyle.merge(
          style:
              animation.isForwardOrCompleted
                  ? effectiveSelectedLabelTextStyle
                  : effectiveUnselectedLabelTextStyle,
          child: label,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final motionTheme = MotionTheme.of(context);
    return SelectableAnimatedBuilder(
      selected: selected,
      duration: motionTheme.duration.long2,
      builder: _buildSelectable,
    );
  }
}

class _NavigationDestinationBuilder extends StatelessWidget {
  const _NavigationDestinationBuilder({
    this.onTap,
    required this.animation,
    this.color,
    this.size,
    this.shape,
    required this.buildIcon,
    required this.buildLabel,
  });

  final VoidCallback? onTap;
  final Animation<double> animation;

  final WidgetBuilder buildIcon;

  final WidgetBuilder buildLabel;

  final Color? color;
  final Size? size;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final navigationDrawerTheme = NavigationDrawerTheme.of(context);

    final resolvedColor = color ?? navigationDrawerTheme.activeIndicatorColor;
    final resolvedSize = size ?? navigationDrawerTheme.activeIndicatorSize;
    final resolvedShape = shape ?? navigationDrawerTheme.activeIndicatorShape;

    final Widget inkWell = InkWell(
      onTap: onTap,
      customBorder: resolvedShape,
      overlayColor: navigationDrawerTheme.stateLayerColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          NavigationIndicator(
            animation: animation,
            color: resolvedColor,
            shape: resolvedShape,
            width: resolvedSize.width,
            height: resolvedSize.height,
          ),
          Flex.horizontal(
            children: <Widget>[
              const SizedBox(width: 16),
              buildIcon(context),
              const SizedBox(width: 12),
              buildLabel(context),
            ],
          ),
        ],
      ),
    );

    final Widget destination = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: _NavigationDestinationSemantics(
        animation: animation,
        // TODO: fix semantics
        index: 0,
        totalNumberOfDestinations: 1,
        child: SizedBox(
          height: navigationDrawerTheme.activeIndicatorSize.height,
          child: inkWell,
        ),
      ),
    );

    return destination;
  }
}

class _NavigationDestinationSemantics extends StatelessWidget {
  const _NavigationDestinationSemantics({
    required this.animation,
    required this.index,
    required this.totalNumberOfDestinations,
    required this.child,
  });

  final Animation<double> animation;

  final int index;
  final int totalNumberOfDestinations;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(
      context,
    );
    // The AnimationStatusBuilder will make sure that the semantics update to
    // "selected" when the animation status changes.
    return StatusTransitionBuilder(
      animation: animation,
      builder: (context, child) {
        return Semantics(
          selected: animation.isForwardOrCompleted,
          container: true,
          child: child,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Semantics(
            label: localizations.tabLabel(
              tabIndex: index + 1,
              tabCount: totalNumberOfDestinations,
            ),
          ),
        ],
      ),
    );
  }
}
