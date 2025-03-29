import 'dart:collection';
import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';

import 'package:example/browser/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:material/material.dart';
import 'package:simple_icons/simple_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.windows) {
    final availableVersion = await WebViewEnvironment.getAvailableVersion();
    assert(
      availableVersion != null,
      'Failed to find an installed WebView2 Runtime or non-stable Microsoft Edge installation.',
    );

    // webViewEnvironment = await WebViewEnvironment.create(
    //     settings: WebViewEnvironmentSettings(userDataFolder: 'YOUR_CUSTOM_PATH'));
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildTooltipTheme(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final textTheme = TextTheme.of(context);
    return TooltipTheme(
      data: TooltipThemeData(
        constraints: BoxConstraints(minHeight: 24),
        decoration: ShapeDecoration(
          shape: CornersBorder(
            delegate: shapeTheme.corner.family.delegate,
            corners: Corners.all(shapeTheme.corner.extraSmall),
          ),
          color: colorTheme.inverseSurface,
        ),
        textStyle: textTheme.bodySmall!.copyWith(
          color: colorTheme.inverseOnSurface,
        ),
        waitDuration: Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior:
          kDebugMode
              ? MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              )
              : null,
      themeMode: ThemeMode.system,
      theme: ThemeBuilder.fromColorScheme(
        ColorThemeData.baseline(brightness: Brightness.light).toColorScheme(),
      ),
      darkTheme: ThemeBuilder.fromColorScheme(
        ColorThemeData.baseline(brightness: Brightness.dark).toColorScheme(),
      ),
      builder:
          (context, child) =>
              child != null
                  ? CombiningBuilder(
                    builders: [_buildTooltipTheme],
                    child: child,
                  )
                  : const SizedBox.shrink(),
      home: const BrowserView(),
    );
  }
}

class BrowserTabBar extends StatefulWidget {
  const BrowserTabBar({super.key});

  @override
  State<BrowserTabBar> createState() => _BrowserTabBarState();
}

class _BrowserTabBarState extends State<BrowserTabBar> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final textTheme = TextTheme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Material(
        child: Flex.horizontal(
          children: [
            SizedBox(
              height: 32,
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: colorTheme.surfaceContainer,
                shape: const StadiumBorder(),
                child: InkWell(
                  overlayColor: WidgetStateLayerColor(
                    WidgetStatePropertyAll(colorTheme.onSurface),
                    stateTheme.stateLayerOpacity,
                  ),
                  child: Flex.horizontal(
                    children: [
                      const SizedBox(width: 12),
                      Icon(
                        Symbols.tab,
                        size: 18,
                        opticalSize: 18,
                        color: colorTheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "YouTube",
                        style: textTheme.labelLarge!.copyWith(
                          color: colorTheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          minimumSize: WidgetStatePropertyAll(Size(24, 24)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          iconColor: WidgetStatePropertyAll(
                            colorTheme.onSurfaceVariant,
                          ),
                        ),
                        icon: const Icon(
                          Symbols.close,
                          size: 18,
                          opticalSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Symbols.add)),
          ],
        ),
      ),
    );
  }
}

class BrowserView extends StatefulWidget {
  const BrowserView({super.key});

  @override
  State<BrowserView> createState() => _BrowserViewState();
}

class _BrowserViewState extends State<BrowserView> {
  late TextEditingController _urlController;

  InAppWebViewController? _webviewController;
  InAppWebViewSettings _webviewSettings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    disableContextMenu: true,
  );

  final GlobalKey _anchorKey = GlobalKey();

  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
  }

  @override
  void dispose() {
    _webviewController = null;
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final motionTheme = MotionTheme.of(context);
    final textTheme = TextTheme.of(context);

    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: Flex.vertical(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BrowserTabBar(),
          SizedBox(
            height: 72,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Flex.horizontal(
                    children: [
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed:
                            _webviewController != null
                                ? () => _webviewController!.goBack()
                                : null,
                        icon: const Icon(Symbols.arrow_back),
                        tooltip: "Click to go back, hold to see history",
                      ),
                      IconButton(
                        onPressed:
                            _webviewController != null
                                ? () => _webviewController!.goForward()
                                : null,
                        icon: const Icon(Symbols.arrow_forward),
                        tooltip: "Click to go forward, hold to see history",
                      ),
                      IconButton(
                        onPressed:
                            _webviewController != null
                                ? () => _webviewController!.reload()
                                : null,
                        icon: const Icon(Symbols.refresh),
                        tooltip: "Reload this page",
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Symbols.home),
                        tooltip: "Open the home page",
                      ),
                      const SizedBox(width: 4),
                      Flexible.expanded(
                        child: BrowserSearchBar(
                          enabled: true,
                          controller: _urlController,
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Symbols.extension),
                        tooltip: "Extensions",
                      ),
                      IconButton(
                        onPressed:
                            _webviewController != null
                                ? () => _webviewController!.openDevTools()
                                : null,
                        icon: const Icon(Symbols.code),
                        tooltip: "Developer tools",
                      ),
                      IconButton(
                        key: _anchorKey,
                        onPressed:
                            () => Navigator.push(
                              context,
                              _MenuRoute(anchorKey: _anchorKey),
                            ),
                        icon: const Icon(Symbols.more_vert),
                        tooltip: "Customize and control <browser name>",
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child:
                        _progress < 1.0
                            ? LinearProgressIndicator(value: _progress)
                            : null,
                  ),
                ),
              ],
            ),
          ),
          Flexible.expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ContextMenuRegion(
                  child: InAppWebView(
                    initialSettings: _webviewSettings,
                    initialUrlRequest: URLRequest(
                      url: WebUri("https://google.com"),
                    ),
                    onWebViewCreated: (controller) {
                      setState(() => _webviewController = controller);
                    },
                    onLoadStart: (controller, url) async {
                      _urlController.text = url.toString();
                    },
                    onLoadStop: (controller, url) async {},
                    onProgressChanged: (controller, progress) {
                      setState(() => _progress = progress / 100);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuRoute<T extends Object?> extends PopupRoute<T> {
  _MenuRoute({required this.anchorKey});

  final GlobalKey anchorKey;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Durations.extralong4;

  @override
  Duration get reverseTransitionDuration => Durations.extralong4;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final size = MediaQuery.sizeOf(context);

    final anchorContext = anchorKey.currentContext!;
    final anchorBox = anchorContext.findRenderObject()! as RenderBox;
    final anchorRect = anchorBox.localToGlobal(Offset.zero) & anchorBox.size;

    final viewRect = Offset.zero & size;

    final rect = Rect.lerp(anchorRect, viewRect, animation.value)!;

    return Align.topLeft(
      child: Transform.translate(
        offset: rect.topLeft,
        child: SizedBox.fromSize(
          size: rect.size,
          child: Material(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return const SizedBox.shrink();
  }
}

class ContextMenuRegion extends StatefulWidget {
  const ContextMenuRegion({super.key, required this.child});

  final Widget child;

  @override
  State<ContextMenuRegion> createState() => _ContextMenuRegionState();
}

class _ContextMenuRegionState extends State<ContextMenuRegion> {
  late NavigatorState _navigator;

  late ValueNotifier<Offset> _globalPosition;

  _ContextMenuRoute? _route;

  @override
  void initState() {
    super.initState();
    _globalPosition = ValueNotifier(Offset.zero);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigator = Navigator.of(context);
  }

  @override
  void dispose() {
    _globalPosition.dispose();
    super.dispose();
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    _globalPosition.value = details.globalPosition;
    _show();
  }

  void _show() {
    final oldRoute = _route;
    if (oldRoute != null) {
    } else {
      final newRoute = _ContextMenuRoute(
        globalPosition: _globalPosition,
        onPop: (route, result) {
          if (_route == route) _route = null;
        },
      );
      _navigator.push(newRoute);
      _route = newRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapUp: _onSecondaryTapUp,
      child: widget.child,
    );
  }
}

enum _Change { globalPosition }

class _ContextMenuRoute<T extends Object?> extends PopupRoute<T> {
  _ContextMenuRoute({
    required this.globalPosition,
    this.onPop,
    this.onDispose,
    // super.requestFocus = true,
  });

  final ValueListenable<Offset> globalPosition;

  final void Function(_ContextMenuRoute route, T? result)? onPop;
  final void Function(_ContextMenuRoute route)? onDispose;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Durations.long2;

  @override
  Duration get reverseTransitionDuration => Durations.short3;

  final Set<_Change> _changes = <_Change>{};

  @override
  void install() {
    super.install();
    globalPosition.addListener(_onGlobalPositionChanged);
  }

  @override
  bool didPop(T? result) {
    onPop?.call(this, result);
    return super.didPop(result);
  }

  @override
  void dispose() {
    onDispose?.call(this);

    _opacityAnimation.dispose();
    _curvedAnimation.dispose();

    globalPosition.removeListener(_onGlobalPositionChanged);

    super.dispose();
  }

  void _onGlobalPositionChanged() {
    setStateSafe(() {
      _changes.add(_Change.globalPosition);
    });
  }

  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  CurvedAnimation _opacityAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );
  final Tween<double> _opacityTween = Tween<double>(begin: 0, end: 1);
  late Animation<double> _opacity;

  final Tween<Offset> _offsetTween = Tween<Offset>(
    begin: Offset(0, -50),
    end: Offset.zero,
  );
  late Animation<Offset> _offset;

  Tween<ShapeBorder?> _shapeTween = ShapeBorderTween();
  late Animation<ShapeBorder?> _shape;

  void _didChangeState(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Set<_Change> changes,
  ) {
    if (_curvedAnimation.parent != animation) {
      final motionTheme = MotionTheme.of(context);

      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: motionTheme.easing.emphasizedDecelerate,
        reverseCurve: motionTheme.easing.emphasizedAccelerate.flipped,
      );
      _offset = _offsetTween.animate(_curvedAnimation);

      _opacityAnimation.dispose();
      _opacityAnimation = CurvedAnimation(
        parent: animation,
        curve: Interval(0, 50 / 500),
        reverseCurve: Interval(0, 100 / 150),
      );
      _opacity = _opacityTween.animate(_opacityAnimation);
    }
    final shapeTheme = ShapeTheme.of(context);

    final shape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      // TODO: decide medium or large
      corners: Corners.all(shapeTheme.corner.large),
    );
    _shapeTween.begin = CroppedBorder.positioned(
      shape: shape,
      left: 0,
      top: 0,
      right: 0,
      height: 0,
    );
    _shapeTween.end = shape;
    _shape = _shapeTween.animate(_curvedAnimation);
  }

  @override
  Widget buildModalBarrier() {
    return super.buildModalBarrier();
    // return GestureDetector(
    //   behavior: HitTestBehavior.translucent,
    //   onTap: () => debugPrint("MODAL BARRIER TAPPED"),
    //   onSecondaryTapUp: (details) {},
    // );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    _didChangeState(
      context,
      animation,
      secondaryAnimation,
      UnmodifiableSetView(_changes),
    );
    _changes.clear();

    final colorTheme = ColorTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final textTheme = TextTheme.of(context);

    final size = MediaQuery.sizeOf(context);

    final navigatorBox = navigator?.context.findRenderObject() as RenderBox?;
    final localPosition =
        navigatorBox != null
            ? navigatorBox.globalToLocal(globalPosition.value)
            : globalPosition.value;
    return Align.topLeft(
      child: Transform.translate(
        offset: localPosition + _offset.value,
        filterQuality: FilterQuality.low,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 112,
            // maxWidth: 280,
            maxWidth: 360,
            // maxWidth: size.width - localPosition.dx - 56,
            minHeight: 0,
            maxHeight: size.height - localPosition.dy - 56,
          ),
          child: Opacity(
            opacity: _opacity.value,
            child: Material(
              animationDuration: Duration.zero,
              type: MaterialType.card,
              clipBehavior: Clip.antiAlias,
              shape: _shape.value!,
              color: colorTheme.surfaceContainer,
              shadowColor: colorTheme.shadow,
              elevation: elevationTheme.level2,
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    sliver: SliverList.list(
                      children: [
                        ContextMenuItem(label: Text("Open link in new tab")),
                        ContextMenuItem(
                          label: Text("Open link in background tab"),
                        ),
                        ContextMenuItem(label: Text("Open link")),
                        const Divider(),
                        ContextMenuItem(label: Text("Open link in new window")),
                        ContextMenuItem(
                          label: Text("Open link in incognito window"),
                        ),
                        const Divider(),

                        Text(
                          "Link",
                          style: textTheme.labelLarge!.copyWith(
                            color: colorTheme.secondary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Flex.horizontal(
                            children: [
                              const SizedBox(width: 4),
                              IconButton.filledTonal(
                                onPressed: () {},
                                icon: const Icon(Symbols.save),
                                tooltip: "Save link as...",
                              ),
                              IconButton.filledTonal(
                                onPressed: () {},
                                icon: const Icon(Symbols.link),
                                tooltip: "Copy link address",
                              ),
                              IconButton.filledTonal(
                                onPressed: () {},
                                icon: const Icon(Symbols.content_copy),
                                tooltip: "Copy link text",
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Developer tools",
                          style: textTheme.labelLarge!.copyWith(
                            color: colorTheme.secondary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Flex.horizontal(
                            children: [
                              const SizedBox(width: 4),
                              IconButton.filledTonal(
                                onPressed: () {},
                                icon: const Icon(Symbols.frame_source),
                                tooltip: "View page source",
                              ),
                              IconButton.filledTonal(
                                onPressed: () {},
                                icon: const Icon(Symbols.frame_inspect),
                                tooltip: "Inspect",
                              ),
                            ],
                          ),
                        ),
                        // Flex.horizontal(
                        //   children: [
                        //     Button.text(
                        //       onPressed: () {},
                        //       icon: const Icon(Symbols.save),
                        //       label: Text("Save as"),
                        //     ),
                        //     Button.text(
                        //       onPressed: () {},
                        //       icon: const Icon(Symbols.content_copy),
                        //       label: Text("Copy address"),
                        //     ),
                        //     Button.text(
                        //       onPressed: () {},
                        //       icon: const Icon(Symbols.content_copy),
                        //       label: Text("Copy text"),
                        //     ),
                        //   ],
                        // ),
                        const Divider(),
                        ContextMenuItem(label: Text("Save link as ...")),
                        ContextMenuItem(label: Text("Copy link address")),
                        ContextMenuItem(label: Text("Copy link text")),
                        const Divider(),
                        ContextMenuItem(
                          leading: const Icon(Symbols.frame_source),
                          label: Text("View page source"),
                        ),
                        ContextMenuItem(
                          leading: const Icon(Symbols.frame_inspect),
                          label: Text("Inspect"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return const SizedBox.shrink();
  }
}

class ContextMenuItem extends StatelessWidget {
  const ContextMenuItem({super.key, this.leading, required this.label});

  final Widget? leading;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final textTheme = TextTheme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        overlayColor: WidgetStateLayerColor(
          WidgetStatePropertyAll(colorTheme.onSurface),
          stateTheme.stateLayerOpacity,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Flex.horizontal(
            children: [
              SizedBox(
                width: 24,
                child:
                    leading != null
                        ? Align.center(
                          child: IconTheme.merge(
                            data: IconThemeDataPartial(
                              color: colorTheme.onSurface,
                              size: 20,
                              opticalSize: 20,
                            ),
                            child: leading!,
                          ),
                        )
                        : null,
              ),
              const SizedBox(width: 8),
              DefaultTextStyle.merge(
                style: textTheme.bodyMedium!.copyWith(
                  color: colorTheme.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin StatefulRouteMixin<T extends Object?, Change extends Object?>
    on ModalRoute<T> {
  final Set<Change> _changes = <Change>{};

  @mustCallSuper
  void didChangeState(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Set<Change> changes,
  ) {}

  @mustCallSuper
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    didChangeState(
      context,
      animation,
      secondaryAnimation,
      UnmodifiableSetView(_changes),
    );
    _changes.clear();
    return const _NullWidget();
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Routes that mix in StatefulRouteMixin must '
      'call super.build() but must ignore the return value of the superclass.',
    );
  }
}

class BrowserSearchBar extends StatefulWidget {
  const BrowserSearchBar({
    super.key,
    this.controller,
    this.enabled = true,
    this.leading,
    this.trailing,
  });

  final TextEditingController? controller;
  final bool enabled;

  final Widget? leading;
  final Widget? trailing;

  @override
  State<BrowserSearchBar> createState() => _BrowserSearchBarState();
}

class _BrowserSearchBarState extends State<BrowserSearchBar> {
  late NavigatorState _navigator;
  late ColorThemeData _color;
  late StateThemeData _state;
  late TextTheme _text;

  final GlobalKey _containerKey = GlobalKey();

  late WidgetStatesController _statesController;
  late FocusNode _focusNode;
  TextEditingController? _internalTextController;
  TextEditingController get _textController =>
      widget.controller ?? _internalTextController!;

  WidgetStateProperty<Color> get _backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.12);
        }
        return _color.surface;
      });

  WidgetStateProperty<BorderSide> get _side =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return BorderSide(color: _color.primary, width: 2);
        }
        return BorderSide.none;
        // if (states.contains(WidgetState.disabled)) {
        //   return BorderSide(
        //     color: _color.onSurface.withValues(alpha: 0.12),
        //     width: 1,
        //   );
        // }
        // if (states.contains(WidgetState.focused)) {
        //   return BorderSide(color: _color.primary, width: 2);
        // }
        // if (states.contains(WidgetState.pressed)) {
        //   return BorderSide(color: _color.onSurface, width: 1);
        // }
        // if (states.contains(WidgetState.hovered)) {
        //   return BorderSide(color: _color.onSurface, width: 1);
        // }
        // return BorderSide(color: _color.outlineVariant, width: 1);
      });
  WidgetStateProperty<Color> get _overlayColor => WidgetStateLayerColor(
    WidgetStatePropertyAll(_color.onSurface),
    _state.stateLayerOpacity,
  );

  WidgetStateProperty<Color> get _leadingColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onSurface;
      });
  WidgetStateProperty<Color> get _trailingColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _color.onSurface.withValues(alpha: 0.38);
        }
        return _color.onSurfaceVariant;
      });

  WidgetStateProperty<TextStyle> get _supportingTextStyle =>
      WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _text.bodyLarge!.copyWith(
            color: _color.onSurface.withValues(alpha: 0.38),
          );
        }
        return _text.bodyLarge!.copyWith(color: _color.onSurfaceVariant);
      });
  WidgetStateProperty<TextStyle> get _inputTextStyle =>
      WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _text.bodyLarge!.copyWith(
            color: _color.onSurface.withValues(alpha: 0.38),
          );
        }
        return _text.bodyLarge!.copyWith(color: _color.onSurface);
      });

  @override
  void initState() {
    super.initState();
    _statesController =
        WidgetStatesController()..addListener(() => setStateSafe(() {}));
    _focusNode =
        FocusNode()..addListener(() {
          setStateSafe(() {});
          if (_focusNode.hasFocus) {
            _textController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: _textController.text.length,
            );
          }
        });
    if (widget.controller == null) {
      _internalTextController = TextEditingController();
    }
    _textController.addListener(() => setStateSafe(() {}));
  }

  @override
  void didUpdateWidget(covariant BrowserSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      if (widget.controller == null) {
        _internalTextController = TextEditingController();
      } else {
        _internalTextController?.dispose();
        _internalTextController = null;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigator = Navigator.of(context, rootNavigator: true);
    _color = ColorTheme.of(context);
    _state = StateTheme.of(context);
    _text = TextTheme.of(context);
  }

  @override
  void dispose() {
    _internalTextController?.dispose();
    _focusNode.dispose();
    _statesController.dispose();
    super.dispose();
  }

  _SearchViewRoute? _route;

  void _openView() {
    double start = 0.0;
    if (_route != null) {
      final oldRoute = _route!;
      final animation = oldRoute._curvedAnimation;
      start = animation.value;
      _navigator.removeRoute(oldRoute);
    }
    final newRoute = _SearchViewRoute(
      anchorKey: _containerKey,
      value: start,
      onDispose: (route) {
        if (route == _route) _route = null;
      },
    );
    _route = newRoute;
    _navigator.push(newRoute);
  }

  @override
  Widget build(BuildContext context) {
    final states = Set.of(_statesController.value);
    if (widget.enabled) {
      states.remove(WidgetState.disabled);
    } else {
      states.add(WidgetState.disabled);
    }
    return SizedBox(
      key: _containerKey,
      height: 56,
      child: Material(
        // animationDuration: Duration.,
        type: MaterialType.card,
        clipBehavior: Clip.antiAlias,
        shape: StadiumBorder(side: _side.resolve(states)),
        color: _backgroundColor.resolve(states),
        child: InkWell(
          statesController: _statesController,
          onTap: widget.enabled ? () => _focusNode.requestFocus() : null,
          overlayColor: _overlayColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Flex.horizontal(
              children: [
                IconButton(
                  onPressed: () => _openView(),
                  icon: const Icon(Symbols.tune),
                ),
                const SizedBox(width: 4),
                Flexible.expanded(
                  child: TextField(
                    controller: _textController,
                    enabled: widget.enabled,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.url,
                    style: _inputTextStyle.resolve(states),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Search or type URL",
                      hintStyle: _supportingTextStyle.resolve(states),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                if (_focusNode.hasFocus) ...[
                  IconButton(
                    onPressed:
                        widget.enabled && _textController.text.isNotEmpty
                            ? () => _textController.clear()
                            : null,
                    style: ButtonStyle(iconColor: _trailingColor),
                    icon: const Icon(Symbols.close),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchViewRoute<T extends Object?> extends PopupRoute<T> {
  _SearchViewRoute({required this.anchorKey, this.value = 0.0, this.onDispose});

  final GlobalKey anchorKey;

  final double value;

  final ValueChanged<_SearchViewRoute>? onDispose;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => Durations.extralong4;

  @override
  Duration get reverseTransitionDuration => Durations.extralong4;

  @override
  void install() {
    super.install();
  }

  @override
  void dispose() {
    onDispose?.call(this);
    super.dispose();
  }

  @override
  AnimationController createAnimationController() {
    assert(
      !debugTransitionCompleted(),
      "Cannot reuse a $runtimeType after disposing it.",
    );
    return AnimationController(
      vsync: navigator!,
      duration: transitionDuration,
      reverseDuration: reverseTransitionDuration,
      value: value,
      debugLabel: debugLabel,
    );
  }

  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  void _updateState(Animation<double> animation) {
    if (_curvedAnimation.parent != animation) {
      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized.flipped,
      );
    }
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    _updateState(animation);

    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final textTheme = TextTheme.of(context);

    final size = MediaQuery.sizeOf(context);

    final anchorContext = anchorKey.currentContext!;
    final anchorRenderBox = anchorContext.findRenderObject()! as RenderBox;

    final anchorRect =
        anchorRenderBox.localToGlobal(Offset.zero) & anchorRenderBox.size;

    final left = 0;
    final right = 0;

    final viewRect = Rect.fromLTWH(
      anchorRect.left - left,
      anchorRect.top,
      math.max(360.0, anchorRect.width + left + right),
      anchorRect.height,
    );

    final rect = Rect.lerp(anchorRect, viewRect, _curvedAnimation.value)!;

    final shape = CornersBorder(
      delegate: shapeTheme.corner.family.delegate,
      corners: Corners.all(shapeTheme.corner.extraLarge),
    );
    final backgroundColor =
        Color.lerp(
          colorTheme.surface,
          colorTheme.surfaceContainerHigh,
          _curvedAnimation.value,
        )!;

    final transition = Align.topLeft(
      child: Transform.translate(
        offset: rect.topLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: rect.width,
            maxWidth: rect.width,
            minHeight: 240,
            maxHeight: size.height * 2 / 3,
          ),
          child: Material(
            animationDuration: Duration.zero,
            type: MaterialType.card,
            clipBehavior: Clip.antiAlias,
            color: backgroundColor,
            shadowColor: colorTheme.shadow,
            elevation:
                lerpDouble(0, elevationTheme.level3, _curvedAnimation.value)!,
            shape:
                ShapeBorder.lerp(
                  CroppedBorder.positioned(
                    shape: shape,
                    left: 0,
                    right: 0,
                    top: 0,
                    height: 56,
                  ),
                  shape,
                  _curvedAnimation.value,
                )!,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverHeader(
                  pinned: true,
                  minExtent: 56,
                  maxExtent: 56,
                  builder:
                      (context, shrinkOffset, overlapsContent) =>
                          SizedBox.expand(
                            child: Material(
                              color: backgroundColor,
                              child: InkWell(
                                onTap: () {},
                                overlayColor: WidgetStateLayerColor(
                                  WidgetStatePropertyAll(colorTheme.onSurface),
                                  WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.focused)) {
                                      return 0.0;
                                    }
                                    return stateTheme.stateLayerOpacity.resolve(
                                      states,
                                    );
                                  }),
                                ),
                                child: SearchInput(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  leading: [
                                    Icon(SimpleIcons.google),
                                    const SizedBox(width: 16),
                                  ],
                                  hintText: "Search or type URL",
                                  trailing: [
                                    // const SizedBox
                                  ],
                                ),
                              ),
                            ),
                          ),
                ),
                SliverTransform.translate(
                  offset:
                      Offset.lerp(
                        Offset(0, 0),
                        Offset.zero,
                        _curvedAnimation.value,
                      )!,
                  sliver: SliverFixedExtentList.builder(
                    itemBuilder:
                        (context, index) => Transform.translate(
                          offset:
                              Offset.lerp(
                                // Offset(
                                //   0,
                                //   -(56 - textTheme.bodyLarge!.fontSize!) *
                                //           index -
                                //       (56 - textTheme.bodyLarge!.fontSize!) / 2,
                                // ),
                                Offset(0, -32.0 * index - 16.0),
                                Offset.zero,
                                _curvedAnimation.value,
                              )!,
                          child: InkWell(
                            onTap: navigator?.pop,
                            child: SearchSuggestion(
                              leading: const Icon(Symbols.search),
                              headline: Text("Suggestion"),
                            ),
                          ),
                        ),
                    itemExtent: 56,
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
        _ => false,
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
    return const SizedBox.shrink();
  }
}

class SearchSuggestion extends StatelessWidget {
  const SearchSuggestion({super.key, this.leading, required this.headline});

  final Widget? leading;
  final Widget headline;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Flex.horizontal(
        spacing: 16,
        children: [
          if (leading != null)
            IconTheme.merge(
              data: IconThemeDataPartial(color: colorTheme.onSurface),
              child: leading!,
            ),
          DefaultTextStyle.merge(
            style: textTheme.bodyLarge!.copyWith(color: colorTheme.onSurface),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            child: headline,
          ),
        ],
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.padding = EdgeInsets.zero,
    this.leading = const [],
    this.hintText,
    this.trailing = const [],
  });

  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;
  final List<Widget> leading;
  final String? hintText;
  final List<Widget> trailing;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return Padding(
      padding: widget.padding,
      child: Flex.horizontal(
        children: [
          ...widget.leading.map(
            (child) => IconTheme.merge(
              data: IconThemeDataPartial(color: colorTheme.onSurface),
              child: child,
            ),
          ),
          Flexible.expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              style: textTheme.bodyLarge!.copyWith(color: colorTheme.onSurface),
              enabled: widget.enabled,
              keyboardType: TextInputType.url,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: textTheme.bodyLarge!.copyWith(
                  color: colorTheme.onSurfaceVariant,
                ),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          ...widget.trailing.map(
            (child) => IconTheme.merge(
              data: IconThemeDataPartial(color: colorTheme.onSurfaceVariant),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

extension SetStateSafeWidgetExtension on State {
  void setStateSafe(VoidCallback callback) {
    switch (SchedulerBinding.instance.schedulerPhase) {
      case SchedulerPhase.persistentCallbacks:
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // ignore: invalid_use_of_protected_member
          if (mounted) setState(callback);
        });
      case _ when mounted:
        // ignore: invalid_use_of_protected_member
        setState(callback);
      default:
    }
  }
}

extension SetStateSafeRouteExtension on ModalRoute {
  void setStateSafe(VoidCallback callback) {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      // ignore: invalid_use_of_protected_member
      SchedulerBinding.instance.addPostFrameCallback((_) => setState(callback));
    } else {
      // ignore: invalid_use_of_protected_member
      setState(callback);
    }
  }
}
