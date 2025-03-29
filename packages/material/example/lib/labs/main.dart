import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:example/labs/dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:material/material.dart';
import 'package:collection/collection.dart';

import 'package:material/src/navigation/navigation_drawer.dart'
    as navigation_drawer;

import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildWrapper(BuildContext context, Widget? child) {
    if (child == null) return const SizedBox.shrink();
    return ComponentThemes(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.fromColorTheme(
        colorTheme: ColorThemeData.baseline(brightness: Brightness.light),
      ),
      darkTheme: AppTheme.fromColorTheme(
        colorTheme: ColorThemeData.baseline(brightness: Brightness.dark),
      ),
      home: const Test1(),
      builder: _buildWrapper,
    );
  }
}

sealed class _DrawerItem {}

enum _DrawerNavigationItem implements _DrawerItem {
  // Basic
  home,
  search,
  // Styles
  color,
  typography,
  shape,
  motion,
  elevation,
  state,
  // Components
  commonButtons,
  iconButtons,
  fab,
  extendedFab,
  basicDialog,
  fullscreenDialog,
  badge,
  snackbar,
  navigationDrawer,
  navigationBar,
  navigationRail,
  carousel,

  // Miscellaneous
  settings,
  about,
}

class _DrawerDividerItem implements _DrawerItem {
  const _DrawerDividerItem({required this.label});

  final String label;
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  _DrawerNavigationItem? _selectedDrawerNavigationItem =
      _DrawerNavigationItem.home;
  List<_DrawerItem> get _drawerItems => const <_DrawerItem>[
    _DrawerNavigationItem.home,
    _DrawerNavigationItem.search,
    _DrawerDividerItem(label: "Styles"),
    _DrawerNavigationItem.color,
    _DrawerNavigationItem.typography,
    _DrawerNavigationItem.shape,
    _DrawerNavigationItem.motion,
    _DrawerNavigationItem.elevation,
    _DrawerNavigationItem.state,
    _DrawerDividerItem(label: "Components"),
    _DrawerNavigationItem.commonButtons,
    _DrawerNavigationItem.iconButtons,
    _DrawerNavigationItem.fab,
    _DrawerNavigationItem.extendedFab,
    _DrawerNavigationItem.basicDialog,
    _DrawerNavigationItem.fullscreenDialog,
    _DrawerNavigationItem.snackbar,

    _DrawerNavigationItem.carousel,
    _DrawerDividerItem(label: "Miscellaneous"),
    _DrawerNavigationItem.settings,
    _DrawerNavigationItem.about,
  ];
  List<_DrawerNavigationItem> get _drawerNavigationItems =>
      _drawerItems.whereType<_DrawerNavigationItem>().toList();
  Widget _buildDrawerItem(BuildContext context, int index, _DrawerItem item) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return switch (item) {
      _DrawerDividerItem(:final label) => Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
        child: Flex.vertical(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (index > 0) ...[
              Divider(
                indent: 0,
                endIndent: 0,
                color: colorTheme.outlineVariant,
                height: 1,
              ),
              const SizedBox(height: 12),
            ],
            Text(
              label,
              style: textTheme.labelLarge!.copyWith(
                color: colorTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      _DrawerNavigationItem.home => NavigationDrawerDestination(
        icon: const Icon(Symbols.home),
        label: Text("Home"),
      ),
      _DrawerNavigationItem.search => NavigationDrawerDestination(
        icon: const Icon(Symbols.search),
        label: Text("Search"),
      ),
      _DrawerNavigationItem.color => NavigationDrawerDestination(
        icon: const Icon(Symbols.palette),
        label: Text("Color"),
      ),
      _DrawerNavigationItem.typography => NavigationDrawerDestination(
        icon: const Icon(Symbols.text_fields),
        label: Text("Typography"),
      ),
      _DrawerNavigationItem.motion => NavigationDrawerDestination(
        icon: const Icon(Symbols.animation),
        label: Text("Motion"),
      ),
      _DrawerNavigationItem.state => NavigationDrawerDestination(
        icon: const Icon(Symbols.transition_fade),
        label: Text("State"),
      ),
      _DrawerNavigationItem.elevation => NavigationDrawerDestination(
        icon: const Icon(Symbols.layers),
        label: Text("Elevation"),
      ),
      _DrawerNavigationItem.shape => NavigationDrawerDestination(
        icon: const Icon(Symbols.category),
        label: Text("Shape"),
      ),
      _DrawerNavigationItem.settings => NavigationDrawerDestination(
        icon: const Icon(Symbols.settings),
        label: Text("Settings"),
      ),
      _DrawerNavigationItem.about => NavigationDrawerDestination(
        icon: const Icon(Symbols.info),
        label: Text("About"),
      ),
      _DrawerNavigationItem.commonButtons => NavigationDrawerDestination(
        icon: const Icon(Symbols.buttons_alt),
        label: Text("Common buttons"),
      ),
      _DrawerNavigationItem.iconButtons => NavigationDrawerDestination(
        icon: const Icon(Symbols.apps),
        label: Text("Icon buttons"),
      ),
      _DrawerNavigationItem.fab => NavigationDrawerDestination(
        icon: const Icon(Symbols.add_circle),
        label: Text("FAB"),
      ),
      _DrawerNavigationItem.extendedFab => NavigationDrawerDestination(
        icon: const Icon(Symbols.buttons_alt),
        label: Text("Extended FAB"),
      ),
      _DrawerNavigationItem.basicDialog => NavigationDrawerDestination(
        icon: const Icon(Symbols.dialogs),
        label: Text("Basic dialog"),
      ),
      _DrawerNavigationItem.fullscreenDialog => NavigationDrawerDestination(
        icon: const Icon(Symbols.fullscreen_portrait),
        label: Text("Full-screen dialog"),
      ),
      _DrawerNavigationItem.snackbar => NavigationDrawerDestination(
        icon: const Icon(Symbols.toast),
        label: Text("Snackbar"),
      ),
      _DrawerNavigationItem.navigationBar => NavigationDrawerDestination(
        icon: const Icon(Symbols.bottom_navigation),
        label: Text("Navigation bar"),
      ),
      _DrawerNavigationItem.navigationDrawer => NavigationDrawerDestination(
        icon: const Icon(Symbols.side_navigation),
        label: Text("Navigation drawer"),
      ),
      _DrawerNavigationItem.navigationRail => NavigationDrawerDestination(
        icon: const Icon(Symbols.dock_to_right),
        label: Text("Navigation rail"),
      ),
      _DrawerNavigationItem.carousel => NavigationDrawerDestination(
        icon: const Icon(Symbols.view_carousel),
        label: Text("Carousel"),
      ),
      _DrawerNavigationItem.badge => NavigationDrawerDestination(
        icon: const Icon(Symbols.app_badging),
        label: Text("Badge"),
      ),
    };
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey _drawerKey = GlobalKey();
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  final GlobalKey _repaintBoundaryChildKey = GlobalKey();

  Timer? _drawerTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _drawerTimer?.cancel();
    _drawerTimer = null;
    super.dispose();
  }

  bool _openDrawer() {
    final scaffoldState = _scaffoldKey.currentState;
    if (scaffoldState == null) return false;

    _drawerTimer?.cancel();
    _drawerTimer = null;

    if (!scaffoldState.isDrawerOpen) {
      scaffoldState.openDrawer();
    }
    return true;
  }

  bool _closeDrawer({Duration? delay}) {
    final scaffoldState = _scaffoldKey.currentState;
    if (scaffoldState == null) return false;

    _drawerTimer?.cancel();
    if (delay != null && delay > Duration.zero) {
      _drawerTimer = Timer(delay, () => scaffoldState.closeDrawer());
    } else if (scaffoldState.isDrawerOpen) {
      _drawerTimer = null;
      scaffoldState.closeDrawer();
    } else {
      _drawerTimer = null;
    }
    return true;
  }

  ui.Image _getDrawerImage() {
    final repaintBoundaryContext = _repaintBoundaryKey.currentContext!;
    final repaintBoundary =
        repaintBoundaryContext.findRenderObject()! as RenderRepaintBoundary;
    final pixelRatio =
        MediaQuery.maybeDevicePixelRatioOf(repaintBoundaryContext) ?? 1.0;
    final image = repaintBoundary.toImageSync(pixelRatio: pixelRatio);
    return image;
  }

  Size _imageSize(ui.Image image) =>
      Size(image.width.toDouble(), image.height.toDouble());
  Future<ImageProvider?> _imageFromImage(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return null;
    final bytes = byteData.buffer.asUint8List();
    return MemoryImage(bytes);
  }

  void _onDestinationSelected(int value) async {
    final item = _drawerNavigationItems.elementAtOrNull(value);
    if (item == null) return;
    setState(() => _selectedDrawerNavigationItem = item);
    switch (item) {
      case _DrawerNavigationItem.settings:
        final image = _getDrawerImage();
        final route = _NavigationDrawerRoute(
          containerKey: _drawerKey,
          image: await _imageFromImage(image).then((value) => value!),
          imageSize: _imageSize(image),
          items: _drawerItems,
          builder:
              (context) => Scaffold(
                body: SafeArea(
                  top: false,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar.large(
                        leadingWidth: 64,
                        titleSpacing: 0,
                        leading: Align.center(
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Symbols.close),
                          ),
                        ),
                        title: Text("Settings"),
                        actions: [],
                      ),
                    ],
                  ),
                ),
              ),
        );
        if (!mounted) return;
        final navigator = Navigator.of(_scaffoldKey.currentContext ?? context);
        navigator.push(route);
      default:
        _closeDrawer(delay: Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: RepaintBoundary(
        key: _repaintBoundaryKey,
        child: NavigationDrawer(
          key: _drawerKey,
          onDestinationSelected: _onDestinationSelected,
          selectedIndex:
              _selectedDrawerNavigationItem != null
                  ? _drawerNavigationItems.indexOf(
                    _selectedDrawerNavigationItem!,
                  )
                  : null,
          children: [
            // SizedBox.shrink(key: _repaintBoundaryChildKey),
            ..._NavigationDrawerLayout.list(
              context: context,
              items: _drawerItems,
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leadingWidth: 64,
              titleSpacing: 0,
              leading: Align.center(
                child: IconButton(
                  onPressed: _openDrawer,
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(colorTheme.onSurface),
                  ),
                  icon: const Icon(Symbols.menu),
                ),
              ),
              title: Text("Dialogs"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Symbols.favorite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Symbols.more_vert),
                ),

                const SizedBox(width: 4),
              ],
            ),
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex.horizontal(
                    children: [
                      Icon(Symbols.experiment, color: colorTheme.primary),
                      const SizedBox(width: 16),
                      Flexible.expanded(
                        child: Text(
                          "Experimental",
                          style: textTheme.titleLarge!.copyWith(
                            color: colorTheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Button.text(
                        onPressed:
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text("This feature is unstable"),
                                action: SnackBarAction(
                                  label: "Dismiss",
                                  onPressed: () {},
                                ),
                              ),
                            ),
                        label: const Text("Learn more"),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex.vertical(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Flutter dialogs",
                        style: textTheme.titleMedium!.copyWith(
                          color: colorTheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Button.outlined(
                        onPressed:
                            () => showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text("Default Flutter dialog"),
                                    actions: [
                                      Button.text(
                                        onPressed: () {},
                                        label: Text("Cancel"),
                                      ),
                                      Button.filledTonal(
                                        onPressed: () {},
                                        label: Text("OK"),
                                      ),
                                    ],
                                  ),
                            ),
                        icon: const Icon(Symbols.flutter),
                        label: Text("Show dialog"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),

                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex.vertical(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "New dialogs",
                        style: textTheme.titleMedium!.copyWith(
                          color: colorTheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Button.filled(
                        onPressed:
                            () => showBasicDialog(
                              context: context,
                              builder:
                                  (context) => BasicDialog(
                                    headline: Text("Basic dialog"),
                                    actions: [
                                      Button.text(
                                        onPressed: () {},
                                        label: Text("Cancel"),
                                      ),
                                      const SizedBox(width: 8),
                                      Button.filledTonal(
                                        onPressed: () {},
                                        label: Text("OK"),
                                      ),
                                    ],
                                  ),
                            ),
                        icon: const Icon(Symbols.dialogs),
                        label: Text("Show basic dialog"),
                      ),
                      Button.filled(
                        onPressed: null,
                        icon: const Icon(Symbols.fullscreen_portrait),
                        label: Text("Show full-screen dialog"),
                        tooltip: "Not implemented",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationDrawerRoute<T extends Object?> extends PageRoute<T> {
  _NavigationDrawerRoute({
    required this.containerKey,
    required this.image,
    required this.imageSize,
    required this.items,
    required this.builder,
    super.requestFocus = true,
  });

  final GlobalKey containerKey;
  final ImageProvider image;
  final Size imageSize;
  final List<_DrawerItem> items;
  final WidgetBuilder builder;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;
  @override
  Duration get transitionDuration => Durations.extralong2;

  @override
  Duration get reverseTransitionDuration => Durations.long2;

  @override
  void dispose() {
    _curvedAnimation.dispose();
    super.dispose();
  }

  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  final _exitOpacityTween = Tween<double>(
    begin: 1,
    end: 0,
  ).chain(CurveTween(curve: Interval(0, 0.5)));
  final _enterOpacityTween = Tween<double>(
    begin: 0,
    end: 1,
  ).chain(CurveTween(curve: Interval(0.5, 1)));

  final _exitOffsetTween = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(-50, 0),
  );
  final _enterOffsetTween = Tween<Offset>(
    begin: Offset(50, 0),
    end: Offset.zero,
  );

  late Animation<double> _exitOpacity;
  late Animation<double> _enterOpacity;
  late Animation<Offset> _exitOffset;
  late Animation<Offset> _enterOffset;

  void _didChangeState(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final motionTheme = MotionTheme.of(context);
    if (_curvedAnimation.parent != animation) {
      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: motionTheme.easing.emphasized,
        reverseCurve: motionTheme.easing.emphasized.flipped,
      );

      _exitOpacity = _exitOpacityTween.animate(_curvedAnimation);
      _enterOpacity = _enterOpacityTween.animate(_curvedAnimation);

      _exitOffset = _exitOffsetTween.animate(_curvedAnimation);
      _enterOffset = _enterOffsetTween.animate(_curvedAnimation);
    }
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    _didChangeState(context, animation, secondaryAnimation);

    final navigatorContext = navigator!.context;
    final navigatorBox = navigatorContext.findRenderObject()! as RenderBox;
    final navigatorRect = Offset.zero & navigatorBox.size;

    final containerContext = containerKey.currentContext;

    if (containerContext == null) return const SizedBox.shrink();

    final containerBox = containerContext.findRenderObject()! as RenderBox;
    final globalContainerRect =
        containerBox.localToGlobal(Offset.zero) & containerBox.size;
    final localContainerRect =
        navigatorBox.globalToLocal(globalContainerRect.topLeft) &
        containerBox.size;

    final rect =
        Rect.lerp(localContainerRect, navigatorRect, _curvedAnimation.value)!;

    final layout = _NavigationDrawerLayout(items: items);

    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);

    final drawerShape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      corners: Corners.horizontal(right: shapeTheme.corner.large),
    );
    final screenShape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      corners: Corners.none,
    );
    final shape =
        ShapeBorder.lerp(drawerShape, screenShape, _curvedAnimation.value)!;
    if (animation.isCompleted) return child;

    final transition = Align.topLeft(
      child: Transform.translate(
        offset: rect.topLeft,
        filterQuality: FilterQuality.low,
        child: SizedBox(
          width: rect.width,
          height: rect.height,
          child: Material(
            animationDuration: Duration.zero,
            clipBehavior: Clip.antiAlias,
            color: colorTheme.surface,
            shape: shape,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: Stack(
              fit: StackFit.expand,
              children: [
                SizedBox(
                  width: localContainerRect.width,
                  height: localContainerRect.height,
                  child: Transform.translate(
                    offset: _exitOffset.value,
                    child: FadeTransition(
                      opacity: _exitOpacity,
                      child: Image(
                        image: image,
                        alignment: Alignment.topLeft,
                        width: imageSize.width,
                        height: imageSize.height,
                      ),
                    ),
                  ),
                ),
                OverflowBox(
                  fit: OverflowBoxFit.max,
                  alignment: Alignment.topLeft,
                  maxWidth: navigatorRect.width,
                  maxHeight: navigatorRect.height,
                  child: Transform.translate(
                    offset: _enterOffset.value,
                    child: FadeTransition(opacity: _enterOpacity, child: child),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return IgnorePointer(
      ignoring: switch (animation.status) {
        AnimationStatus.dismissed || AnimationStatus.reverse => true,
        AnimationStatus.completed || AnimationStatus.forward => false,
      },
      child: transition,
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }
}

class _NavigationDrawerLayout extends StatefulWidget {
  const _NavigationDrawerLayout({super.key, required this.items});

  final List<_DrawerItem> items;

  @override
  State<_NavigationDrawerLayout> createState() =>
      _NavigationDrawerLayoutState();

  static List<Widget> list({
    required BuildContext context,
    required List<_DrawerItem> items,
  }) {
    return [
      const SizedBox(height: 12),
      ...items.mapIndexed(
        (index, item) =>
            _NavigationDrawerLayoutState._buildNavigationDrawerItem(
              context,
              index,
              item,
            ),
      ),
      const SizedBox(height: 12),
    ];
  }
}

class _NavigationDrawerLayoutState extends State<_NavigationDrawerLayout> {
  static Widget _buildNavigationDrawerItem(
    BuildContext context,
    int index,
    _DrawerItem item,
  ) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return switch (item) {
      _DrawerDividerItem(:final label) => Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
        child: Flex.vertical(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (index > 0) ...[
              Divider(
                indent: 0,
                endIndent: 0,
                color: colorTheme.outlineVariant,
                height: 1,
              ),
              const SizedBox(height: 12),
            ],
            Text(
              label,
              style: textTheme.labelLarge!.copyWith(
                color: colorTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      _DrawerNavigationItem.home => NavigationDrawerDestination(
        icon: const Icon(Symbols.home),
        label: Text("Home"),
      ),
      _DrawerNavigationItem.search => NavigationDrawerDestination(
        icon: const Icon(Symbols.search),
        label: Text("Search"),
      ),
      _DrawerNavigationItem.color => NavigationDrawerDestination(
        icon: const Icon(Symbols.palette),
        label: Text("Color"),
      ),
      _DrawerNavigationItem.typography => NavigationDrawerDestination(
        icon: const Icon(Symbols.text_fields),
        label: Text("Typography"),
      ),
      _DrawerNavigationItem.motion => NavigationDrawerDestination(
        icon: const Icon(Symbols.animation),
        label: Text("Motion"),
      ),
      _DrawerNavigationItem.state => NavigationDrawerDestination(
        icon: const Icon(Symbols.transition_fade),
        label: Text("State"),
      ),
      _DrawerNavigationItem.elevation => NavigationDrawerDestination(
        icon: const Icon(Symbols.layers),
        label: Text("Elevation"),
      ),
      _DrawerNavigationItem.shape => NavigationDrawerDestination(
        icon: const Icon(Symbols.category),
        label: Text("Shape"),
      ),
      _DrawerNavigationItem.settings => NavigationDrawerDestination(
        icon: const Icon(Symbols.settings),
        label: Text("Settings"),
      ),
      _DrawerNavigationItem.about => NavigationDrawerDestination(
        icon: const Icon(Symbols.info),
        label: Text("About"),
      ),
      _DrawerNavigationItem.commonButtons => NavigationDrawerDestination(
        icon: const Icon(Symbols.buttons_alt),
        label: Text("Common buttons"),
      ),
      _DrawerNavigationItem.iconButtons => NavigationDrawerDestination(
        icon: const Icon(Symbols.apps),
        label: Text("Icon buttons"),
      ),
      _DrawerNavigationItem.fab => NavigationDrawerDestination(
        icon: const Icon(Symbols.add_circle),
        label: Text("FAB"),
      ),
      _DrawerNavigationItem.extendedFab => NavigationDrawerDestination(
        icon: const Icon(Symbols.buttons_alt),
        label: Text("Extended FAB"),
      ),
      _DrawerNavigationItem.basicDialog => NavigationDrawerDestination(
        icon: const Icon(Symbols.dialogs),
        label: Text("Basic dialog"),
      ),
      _DrawerNavigationItem.fullscreenDialog => NavigationDrawerDestination(
        icon: const Icon(Symbols.fullscreen_portrait),
        label: Text("Full-screen dialog"),
      ),
      _DrawerNavigationItem.snackbar => NavigationDrawerDestination(
        icon: const Icon(Symbols.toast),
        label: Text("Snackbar"),
      ),
      _DrawerNavigationItem.navigationBar => NavigationDrawerDestination(
        icon: const Icon(Symbols.bottom_navigation),
        label: Text("Navigation bar"),
      ),
      _DrawerNavigationItem.navigationDrawer => NavigationDrawerDestination(
        icon: const Icon(Symbols.side_navigation),
        label: Text("Navigation drawer"),
      ),
      _DrawerNavigationItem.navigationRail => NavigationDrawerDestination(
        icon: const Icon(Symbols.dock_to_right),
        label: Text("Navigation rail"),
      ),
      _DrawerNavigationItem.carousel => NavigationDrawerDestination(
        icon: const Icon(Symbols.view_carousel),
        label: Text("Carousel"),
      ),
      _DrawerNavigationItem.badge => NavigationDrawerDestination(
        icon: const Icon(Symbols.app_badging),
        label: Text("Badge"),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final children =
        widget.items
            .mapIndexed(
              (index, item) => _buildNavigationDrawerItem(context, index, item),
            )
            .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Flex.vertical(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
