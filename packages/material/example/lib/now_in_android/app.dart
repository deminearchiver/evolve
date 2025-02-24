import 'dart:math' as math;
import 'dart:ui';

import 'package:example/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nia/nia.dart';

abstract final class NowInAndroidTheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF8b418f),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFffd6fa),
    onPrimaryContainer: Color(0xFF36003c),
    secondary: Color(0xFFa23f16),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFffdbcf),
    onSecondaryContainer: Color(0xFF380d00),
    tertiary: Color(0xFF006780),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFb8eaff),
    onTertiaryContainer: Color(0xFF001f28),
    error: Color(0xFFba1a1a),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFffdad6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFfcfcfc),
    onSurface: Color(0xFF201a1b),
    surfaceVariant: Color(0xFFeddee8),
    onSurfaceVariant: Color(0xFF4d444c),
    outline: Color(0xFF7f747c),
    inverseSurface: Color(0xFF362f30),
    onInverseSurface: Color(0xFFfaeeef),
    scrim: Color(0xFF201a1b), // onSurface
    // Tinted
    surfaceContainerLow: Color(0xFFf9f1f9), // +1
    surfaceContainer: Color(0xFFf6ecf6), // +2
    surfaceContainerHigh: Color(0xFFf2e6f3), // +3
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFffa9fe),
    onPrimary: Color(0xFF560a5d),
    primaryContainer: Color(0xFF702776),
    onPrimaryContainer: Color(0xFFffd6fa),
    secondary: Color(0xFFffb59b),
    onSecondary: Color(0xFF5b1a00),
    secondaryContainer: Color(0xFF812800),
    onSecondaryContainer: Color(0xFFffdbcf),
    tertiary: Color(0xFF5dd5fc),
    onTertiary: Color(0xFF003544),
    tertiaryContainer: Color(0xFF004d61),
    onTertiaryContainer: Color(0xFFb8eaff),
    error: Color(0xFFffb4ab),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000a),
    onErrorContainer: Color(0xFFffdad6),
    surface: Color(0xFF201A1B),
    onSurface: Color(0xFFecdfe0),
    surfaceVariant: Color(0xFF4d444c),
    onSurfaceVariant: Color(0xFFd0c3cc),
    outline: Color(0xFF998d96),
    inverseSurface: Color(0xFFecdfe0),
    onInverseSurface: Color(0xFF201a1b),
    scrim: Color(0xFFECDFE0), // onSurface
    // Tinted
    surfaceContainerLow: Color(0xFF2e242a), // +1
    surfaceContainer: Color(0xFF342830), // +2
    surfaceContainerHigh: Color(0xFF3b2c37), // +3
  );

  static ColorScheme buildColorScheme({required Brightness brightness}) =>
      switch (brightness) {
        Brightness.light => lightColorScheme,
        Brightness.dark => darkColorScheme,
      };
  static ThemeData buildTheme({required Brightness brightness}) {
    final colorScheme = buildColorScheme(brightness: brightness);
    final typography = Typography.material2021(
      platform: TargetPlatform.android,
      colorScheme: colorScheme,
    );
    // final textTheme = switch (brightness) {
    //   Brightness.light => typography.black,
    //   Brightness.dark => typography.white,
    // };
    final robotoFlex = GoogleFonts.robotoFlexTextTheme();
    return ThemeData(
      colorScheme: colorScheme,
      platform: TargetPlatform.android,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashFactory: InkSparkle.splashFactory,
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        barrierColor: colorScheme.onSurface.withValues(alpha: 0.5),
      ),
      textTheme: GoogleFonts.robotoFlexTextTheme(
        TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontWeight: FontWeight.w500),
          labelLarge: TextStyle(fontWeight: FontWeight.w700),
          labelMedium: TextStyle(fontWeight: FontWeight.w700),
          labelSmall: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: colorScheme.surfaceVariant,
        dividerHeight: 1,
        indicatorColor: colorScheme.onSurface,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: colorScheme.onSurface,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        // labelTextStyle: WidgetStateProperty.fromMap({
        //   WidgetState.selected: TextStyle(color: colorScheme.onPrimaryContainer),
        //   WidgetState.any: TextStyle(color: colorScheme.onSurfaceVariant),
        // }),
        iconTheme: WidgetStateProperty.fromMap({
          WidgetState.selected: IconThemeData(color: colorScheme.onPrimary),
          WidgetState.any: IconThemeData(color: colorScheme.onSurfaceVariant),
        }),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(0, 0, 0, 0)),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateColor.fromMap({
          WidgetState.disabled: colorScheme.onSurface.withValues(alpha: 0.38),
          WidgetState.selected: colorScheme.onPrimaryContainer,
          ~WidgetState.selected: colorScheme.onSurfaceVariant,
        }),
        thumbColor: WidgetStateColor.fromMap({
          WidgetState.disabled: colorScheme.surface,
          WidgetState.selected: colorScheme.primaryContainer,
          ~WidgetState.selected: colorScheme.surfaceVariant,
        }),
        overlayColor: WidgetStateColor.fromMap({
          WidgetState.disabled: Colors.transparent,
          WidgetState.dragged: colorScheme.primary.withValues(alpha: 0.16),
          WidgetState.pressed: colorScheme.primary.withValues(alpha: 0.12),
          WidgetState.hovered: colorScheme.primary.withValues(alpha: 0.08),
          WidgetState.focused: colorScheme.primary.withValues(alpha: 0.12),
          WidgetState.any: Colors.transparent,
        }),
        splashRadius: 15.0,
        trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
        trackOutlineWidth: WidgetStatePropertyAll(0.0),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class NowInAndroidApp extends StatefulWidget {
  const NowInAndroidApp({super.key});

  @override
  State<NowInAndroidApp> createState() => _NowInAndroidAppState();
}

class _NowInAndroidAppState extends State<NowInAndroidApp> {
  Widget _buildFilledButtonTheme(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    final backgroundColor = switch (colorTheme.brightness) {
      Brightness.light => colorTheme.inverseSurface,
      Brightness.dark => colorTheme.primary,
    };
    final foregroundColor = switch (colorTheme.brightness) {
      Brightness.light => colorTheme.onPrimary, // TODO: investigate why
      Brightness.dark => colorTheme.onPrimary,
    };
    return FilledButtonTheme(
      data: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.12),
            WidgetState.any: backgroundColor,
          }),
          foregroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: foregroundColor,
          }),
          // Design case study says the icon color should be onSurfaceVariant,
          // it looks really ugly, so it has been changed to match the foreground color
          iconColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: foregroundColor,
          }),
        ),
      ),
      child: child,
    );
  }

  Widget _buildOutlinedButtonTheme(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.fromMap({
            WidgetState.disabled: BorderSide(
              color: colorTheme.onSurface.withValues(alpha: 0.12),
            ),
            WidgetState.focused: BorderSide(color: colorTheme.onSurface),
            WidgetState.any: BorderSide(color: colorTheme.outline),
          }),
          foregroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: colorTheme.onSurface,
          }),
          iconColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: colorTheme.onSurface,
          }),
        ),
      ),
      child: child,
    );
  }

  Widget _buildTextButtonTheme(BuildContext context, Widget child) {
    final colorTheme = ColorTheme.of(context);
    final foregroundColor = colorTheme.onSurface;
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: colorTheme.onSurface,
          }),
          iconColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: colorTheme.onSurface.withValues(alpha: 0.38),
            WidgetState.any: colorTheme.onSurface,
          }),
        ),
      ),
      child: child,
    );
  }

  Widget _buildTheme(BuildContext context) {
    return _buildFilledButtonTheme(
      context,
      _buildOutlinedButtonTheme(
        context,
        _buildTextButtonTheme(context, _buildChild()),
      ),
    );
  }

  Widget _buildChild() {
    return const Test1();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: NowInAndroidTheme.buildTheme(brightness: Brightness.light),
      darkTheme: NowInAndroidTheme.buildTheme(brightness: Brightness.dark),
      home: Builder(builder: _buildTheme),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  final _anchorKey = GlobalKey();

  void _openSearchView() {
    final route = _SearchViewRoute(anchorKey: _anchorKey);
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = ColorTheme.of(context);
    final stateTheme = StateTheme.of(context);
    return ColoredBox(
      color: colorTheme.surfaceContainer,
      child: GradientStack(
        position: DecorationPosition.background,
        gradients: [
          // LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   colors: [
          //     colorTheme.tertiaryContainer,
          //     colorTheme.tertiaryContainer.withAlpha(0),
          //   ],
          //   stops: [0, 0.72],
          // ),
          // LinearGradient(
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   colors: [
          //     colorTheme.secondaryContainer.withAlpha(0),
          //     colorTheme.secondaryContainer,
          //   ],
          //   stops: [0.26, 1],
          // ),
        ],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // body: Center(
          //   // child: Button.filled(
          //   //   onPressed: () {},
          //   //   label: const Text("Now in Android"),
          //   // ),
          //   child: Flex.horizontal(
          //     children: [
          //       Switch(value: false, onChanged: (value) {}),
          //       Switch(value: true, onChanged: (value) {}),
          //     ],
          //   ),
          // ),
          body: CustomScrollView(
            slivers: [
              DefaultTabController(
                length: 2,
                child: SliverAppBar(
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 64,
                  centerTitle: true,
                  leadingWidth: 16 + 24 + 16,
                  titleSpacing: 0,
                  leading: Align.center(
                    child: IconButton(
                      onPressed: _openSearchView,
                      style: ButtonStyle(
                        iconColor: WidgetStatePropertyAll(
                          colorTheme.onSurfaceVariant,
                        ),
                      ),
                      icon: Icon(Symbols.search, key: _anchorKey),
                    ),
                  ),
                  title: Text("Now in Android"),
                  actions: [
                    SizedBox(
                      width: 16 + 36 + 16,
                      child: Align.center(
                        child: IconButton(
                          onPressed:
                              () => Navigator.push(
                                context,
                                _SettingsRoute.withDefaults(context: context),
                              ),
                          style: ButtonStyle(
                            // fixedSize: WidgetStatePropertyAll(Size(48, 48)),
                            iconColor: WidgetStatePropertyAll(
                              colorTheme.onSurface,
                            ),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(4)),
                          ),
                          icon: const Icon(Symbols.account_circle, size: 36),
                        ),
                      ),
                    ),
                  ],
                  bottom: TabBar.secondary(
                    labelStyle: Theme.of(context).textTheme.labelLarge!
                        .copyWith(color: colorTheme.onSurface),
                    tabs: [Tab(text: "Hello"), Tab(text: "World")],
                  ),
                ),
              ),
              SliverList.list(
                children: [
                  CircleAvatar(
                    radius: 192 / 2,
                    backgroundColor: colorTheme.surfaceVariant,
                    child: AvatarIcon(size: 86.62),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 64,
                      child: Material(
                        animationDuration: Duration.zero,
                        type: MaterialType.card,
                        clipBehavior: Clip.antiAlias,
                        color: colorTheme.primaryContainer,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: InkWell(
                          onTap:
                              () => showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: Text(
                                        "Basic dialog",
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                              color: colorTheme.onSurface,
                                            ),
                                      ),
                                      actions: [
                                        Button.text(
                                          onPressed: () {},
                                          label: Text("Cancel"),
                                        ),
                                        Button.text(
                                          onPressed: () {},
                                          label: Text("OK"),
                                        ),
                                      ],
                                    ),
                              ),
                          overlayColor: WidgetStateLayerColor(
                            colorTheme.onPrimaryContainer,
                            opacity: stateTheme.stateLayerOpacity,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Flex.horizontal(
                              children: [
                                Flexible.expanded(
                                  child: Text(
                                    "Switch text",
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      color:
                                          theme.colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                ),
                                Switch(value: true, onChanged: (value) {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ...const <ButtonVariant>[
                    ButtonVariant.filled,
                    ButtonVariant.outlined,
                    ButtonVariant.text,
                  ].map<Widget>(
                    (variant) => Flex.vertical(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flex.horizontal(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Button(
                              variant: variant,
                              onPressed: () {},
                              label: Text("Enabled"),
                            ),

                            Button(
                              variant: variant,
                              onPressed: null,
                              label: Text("Disabled"),
                            ),
                          ],
                        ),
                        Flex.horizontal(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Button(
                              variant: variant,
                              onPressed: () {},
                              icon: const Icon(Symbols.add),
                              label: Text("Enabled"),
                            ),
                            Button(
                              variant: variant,
                              onPressed: null,
                              icon: const Icon(Symbols.add),
                              label: Text("Disabled"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: const Icon(Symbols.upcoming, fill: 0),
                selectedIcon: const Icon(Symbols.upcoming, fill: 1),
                label: "For you",
              ),
              NavigationDestination(
                icon: const Icon(Symbols.menu_book, fill: 0),
                selectedIcon: const Icon(Symbols.menu_book, fill: 1),
                label: "Episodes",
              ),
              NavigationDestination(
                icon: const Icon(Symbols.bookmarks, fill: 0),
                selectedIcon: const Icon(Symbols.bookmarks, fill: 1),
                label: "Saved",
              ),
              NavigationDestination(
                icon: const Icon(Symbols.tag, fill: 0),
                selectedIcon: const Icon(Symbols.tag, fill: 1),
                label: "Interests",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({super.key, this.size, this.opacity});

  final double? size;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final colorTheme = ColorTheme.of(context);
    final iconTheme = IconTheme.of(context);
    final resolvedSize = size ?? iconTheme.size ?? 24.0;
    final resolvedOpacity = opacity ?? iconTheme.opacity ?? 1.0;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Opacity(
        opacity: resolvedOpacity,
        child: CustomPaint(
          size: Size.square(resolvedSize),
          painter: _AvatarIconPainter(
            textDirection: textDirection,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme.secondary, colorTheme.primary],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarIconPainter extends CustomPainter {
  const _AvatarIconPainter({
    required this.textDirection,
    required this.gradient,
  });

  final TextDirection textDirection;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);

    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..shader = gradient.createShader(
            Rect.fromLTRB(0, 0, 24, 24),
            textDirection: textDirection,
          );
    final path =
        Path()
          ..moveTo(12, 12)
          ..cubicTo(15.315, 12, 18, 9.315, 18, 6)
          ..cubicTo(18, 2.685, 15.315, 0, 12, 0)
          ..cubicTo(8.685, 0, 6, 2.685, 6, 6)
          ..cubicTo(6, 9.315, 8.685, 12, 12, 12)
          ..close()
          ..moveTo(12, 15)
          ..cubicTo(7.995, 15, 0, 17.01, 0, 21)
          ..lineTo(0, 22.5)
          ..cubicTo(0, 23.325, 0.675, 24, 1.5, 24)
          ..lineTo(22.5, 24)
          ..cubicTo(23.325, 24, 24, 23.325, 24, 22.5)
          ..lineTo(24, 21)
          ..cubicTo(24, 17.01, 16.005, 15, 12, 15)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _AvatarIconPainter oldDelegate) {
    return textDirection != oldDelegate.textDirection ||
        gradient != oldDelegate.gradient;
  }
}

class NowInAndroidSearchView extends StatelessWidget {
  const NowInAndroidSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
                child: Flex.horizontal(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        24 - 12,
                        0,
                        14 - 12,
                        0,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Symbols.arrow_back),
                      ),
                    ),
                    Flexible.expanded(
                      child: SearchBar(
                        controller: TextEditingController(
                          text: "jetpack compose",
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 16),
                          child: const Icon(Symbols.search),
                        ),
                        hintText: "Search",
                        trailing: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12 - 12,
                              right: 16 - 12,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(
                                  colorTheme.onSurface,
                                ),
                              ),
                              icon: const Icon(Symbols.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              ListTile(
                minTileHeight: 24,
                contentPadding: EdgeInsets.fromLTRB(16, 0, 16 - 11, 0),
                titleTextStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                title: Text("Recent searches"),
                trailing: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    minimumSize: WidgetStatePropertyAll(Size(40, 40)),
                    iconColor: WidgetStatePropertyAll(colorTheme.onSurface),
                    iconSize: WidgetStatePropertyAll(18),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: const Icon(Symbols.close),
                ),
              ),
              const SizedBox(height: 26),
              ListTile(
                onTap: () {},
                minTileHeight: 60,
                contentPadding: EdgeInsets.fromLTRB(16, 0, 16 - 11, 0),
                titleTextStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                title: Text("jetpack compose"),
                trailing: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    minimumSize: WidgetStatePropertyAll(Size(40, 40)),
                    iconColor: WidgetStatePropertyAll(colorTheme.onSurface),
                    iconSize: WidgetStatePropertyAll(18),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: const Icon(Symbols.close),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchViewRoute<T> extends PageRoute<T> {
  _SearchViewRoute({required this.anchorKey});

  final GlobalKey anchorKey;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return const NowInAndroidSearchView();
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Durations.extralong2;

  @override
  Duration get reverseTransitionDuration => Durations.long2;

  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  void _updateState(BuildContext context, Animation<double> animation) {
    if (_curvedAnimation.parent != animation) {
      final motionTheme = MotionTheme.of(context);
      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: motionTheme.easing.emphasized,
        reverseCurve: motionTheme.easing.emphasized.flipped,
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
    _updateState(context, animation);
    const collapsedSize = Size(48.0, 56.0);

    final anchorBox =
        anchorKey.currentContext!.findRenderObject()! as RenderBox;
    final anchorRect = Rect.fromPoints(
      anchorBox.localToGlobal(Offset.zero),
      anchorBox.localToGlobal(anchorBox.size.bottomRight(Offset.zero)),
    );
    final anchorPadding = EdgeInsets.symmetric(
      horizontal: (collapsedSize.width - anchorRect.width) / 2,
      vertical: (collapsedSize.height - anchorRect.height) / 2,
    );
    final beginRect = Rect.fromLTRB(
      anchorRect.left - anchorPadding.left,
      anchorRect.top - anchorPadding.top,
      anchorRect.right + anchorPadding.right,
      anchorRect.bottom + anchorPadding.bottom,
    );

    final theme = Theme.of(context);
    final colorTheme = ColorTheme.of(context);
    if (animation.isCompleted) return child;
    return ColoredBox(
      color: colorTheme.surfaceContainer,
      child: Align.topLeft(
        child: ColoredBox(
          color: colorTheme.surfaceContainer,
          child: Padding(
            padding:
                EdgeInsets.lerp(
                  EdgeInsets.fromLTRB(0, 0, 0, 0),
                  EdgeInsets.fromLTRB(0, 14, 10, 18),
                  _curvedAnimation.value,
                )!,
            child: Transform.translate(
              offset:
                  Offset.lerp(
                    beginRect.topLeft,
                    Offset.zero,
                    _curvedAnimation.value,
                  )!,
              child: Flex.horizontal(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: lerpDouble(0, 1, _curvedAnimation.value)!,
                    child: Align.centerRight(
                      widthFactor: lerpDouble(0, 1, _curvedAnimation.value)!,
                      heightFactor: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          24 - 12,
                          0,
                          14 - 12,
                          0,
                        ),
                        child: IconButton(
                          onPressed: () => navigator?.pop(),
                          icon: const Icon(Symbols.arrow_back),
                        ),
                      ),
                    ),
                  ),
                  Flexible.expanded(
                    child: SizedBox(
                      height:
                          lerpDouble(
                            beginRect.height,
                            56,
                            _curvedAnimation.value,
                          )!,
                      child: Material(
                        animationDuration: Duration.zero,
                        type: MaterialType.card,
                        clipBehavior: Clip.antiAlias,
                        color:
                            Color.lerp(
                              colorTheme.surface.withAlpha(0),
                              colorTheme.surface,
                              _curvedAnimation.value,
                            )!,
                        shape:
                            ShapeBorder.lerp(
                              _RectBorder(
                                shape: const StadiumBorder(),
                                alignment: Alignment.topLeft,
                                size: beginRect.size,
                                // size: Size(48, 48),
                              ),
                              const StadiumBorder(),
                              _curvedAnimation.value,
                            )!,
                        child: Flex.horizontal(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.lerp(
                                    anchorPadding,
                                    EdgeInsets.fromLTRB(12, 0, 16, 0),
                                    _curvedAnimation.value,
                                  )!,
                              child: Icon(
                                Symbols.search,
                                color:
                                    Color.lerp(
                                      colorTheme.onSurfaceVariant,
                                      colorTheme.onSurface,
                                      _curvedAnimation.value,
                                    )!,
                              ),
                            ),
                            Flexible.expanded(
                              child: Text(
                                "jetpack compose",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color: colorTheme.onSurface,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16 - 12,
                                0,
                                16 - 12,
                                0,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  iconColor: WidgetStatePropertyAll(
                                    colorTheme.onSurface,
                                  ),
                                ),
                                icon: const Icon(Symbols.close),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}

class _SettingsRoute extends PopupRoute<void> {
  _SettingsRoute({
    this.barrierColor,
    required this.transitionDuration,
    required this.reverseTransitionDuration,
  });

  static _SettingsRoute withDefaults({required BuildContext context}) {
    final colorTheme = ColorTheme.of(context);
    final motionTheme = MotionTheme.of(context);
    return _SettingsRoute(
      barrierColor: colorTheme.onSurface.withValues(alpha: 0.5),
      transitionDuration: motionTheme.duration.long2,
      reverseTransitionDuration: motionTheme.duration.short3,
    );
  }

  @override
  final Color? barrierColor;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  Animation<double> _linearAnimation = kAlwaysDismissedAnimation;
  CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: kAlwaysDismissedAnimation,
    curve: Easing.linear,
  );

  SplitAnimation _splitLinearAnimation = SplitAnimation(
    parent: kAlwaysDismissedAnimation,
  );
  SplitAnimation _splitCurvedAnimation = SplitAnimation(
    parent: kAlwaysDismissedAnimation,
  );

  late Animation<double> _forwardHeightFactor;
  late Animation<double> _reverseHeightFactor;

  late Animation<double> _enterOuterOpacity;
  late Animation<double> _exitOuterOpacity;

  void _updateState(BuildContext context, Animation<double> animation) {
    final motionTheme = MotionTheme.of(context);
    if (_linearAnimation != animation) {
      _linearAnimation = animation;
      _splitLinearAnimation.dispose();
      _splitLinearAnimation = SplitAnimation(parent: _linearAnimation);
      _enterOuterOpacity = Tween<double>(begin: 0, end: 1)
          .chain(CurveTween(curve: const Interval(0, 0.1)))
          .animate(_splitLinearAnimation.forward);
      _exitOuterOpacity = Tween<double>(begin: 1, end: 0)
          .chain(CurveTween(curve: const Interval(2 / 3, 1)))
          .animate(_splitLinearAnimation.reverse);
    }
    if (_curvedAnimation.parent != animation) {
      _curvedAnimation.dispose();
      _curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: motionTheme.easing.emphasizedDecelerate,
        reverseCurve: motionTheme.easing.emphasizedAccelerate.flipped,
        // curve: Easing.linear,
      );
      _splitCurvedAnimation.dispose();
      _splitCurvedAnimation = SplitAnimation(parent: _curvedAnimation);
      _forwardHeightFactor = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(_splitCurvedAnimation.forward);
      _reverseHeightFactor = Tween<double>(
        begin: 1,
        end: 0.35,
      ).animate(_splitCurvedAnimation.reverse);
    }
  }

  @override
  void dispose() {
    _splitCurvedAnimation.dispose();
    _splitLinearAnimation.dispose();
    _curvedAnimation.dispose();
    super.dispose();
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    _updateState(context, animation);
    final colorTheme = ColorTheme.of(context);
    const OutlinedBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    );
    return Align(
      alignment: Alignment.center,
      child: Transform.translate(
        offset:
            Offset.lerp(Offset(0, -50), Offset.zero, _curvedAnimation.value)!,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 460, maxHeight: 560),
          child: Opacity(
            opacity: _enterOuterOpacity.value * _exitOuterOpacity.value,
            child: Material(
              animationDuration: Duration.zero,
              type: MaterialType.card,
              clipBehavior: Clip.antiAlias,
              color: colorTheme.surface,
              shape: CroppedBorder.align(
                shape: shape,
                alignment: Alignment.topCenter,
                heightFactor:
                    _forwardHeightFactor.value * _reverseHeightFactor.value,
              ),

              child: child,
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
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        slivers: [
          SliverAppBar(
            toolbarHeight: 24 + 60 + 20,
            automaticallyImplyLeading: false,
            leading: const SizedBox.shrink(),
            leadingWidth: 16,
            titleSpacing: 0,
            title: Text("Settings"),
            actions: [
              IconButton(
                onPressed: () => navigator?.pop(),
                icon: const Icon(Symbols.close),
              ),
              SizedBox(width: 16 - 12),
            ],
          ),
          SliverList.list(
            children: [
              Align.center(
                child: Button.outlined(
                  onPressed: () {},
                  label: Text("Manage your Google account"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RectBorder extends ShapeBorder {
  const _RectBorder({
    required this.shape,
    required this.alignment,
    required this.size,
  });

  final ShapeBorder shape;
  final AlignmentGeometry alignment;
  final Size size;

  @override
  EdgeInsetsGeometry get dimensions => shape.dimensions;

  Rect _adjustRect(Rect rect, TextDirection? textDirection) {
    final resolvedAlignment = alignment.resolve(textDirection);
    final offset = resolvedAlignment.alongSize(rect.size);
    final sizeRect = offset & size;
    return rect.intersect(sizeRect);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = _adjustRect(rect, textDirection);
    return shape.getInnerPath(adjustedRect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = _adjustRect(rect, textDirection);
    return shape.getOuterPath(adjustedRect, textDirection: textDirection);
  }

  @override
  bool get preferPaintInterior => shape.preferPaintInterior;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final adjustedRect = _adjustRect(rect, textDirection);

    shape.paint(canvas, adjustedRect, textDirection: textDirection);
  }

  @override
  _RectBorder scale(double t) =>
      _RectBorder(shape: shape, alignment: alignment, size: size);

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double progress) {
    if (a is _RectBorder) {
      return _RectBorder(
        shape: ShapeBorder.lerp(a.shape, shape, progress)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, progress)!,
        size: Size.lerp(a.size, size, progress)!,
      );
    }
    if (a is ShapeBorder) {
      return _RectBorderExpand(
        shape: ShapeBorder.lerp(a, shape, progress)!,
        alignment: alignment,
        size: size,
        t: 1.0 - progress,
      );
    }
    return super.lerpFrom(a, progress);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double progress) {
    if (b is _RectBorder) {
      return _RectBorder(
        shape: ShapeBorder.lerp(shape, b.shape, progress)!,
        alignment: AlignmentGeometry.lerp(alignment, b.alignment, progress)!,
        size: Size.lerp(size, b.size, progress)!,
      );
    }
    if (b is ShapeBorder) {
      return _RectBorderExpand(
        shape: ShapeBorder.lerp(shape, b, progress)!,
        alignment: alignment,
        size: size,
        t: progress,
      );
    }
    return super.lerpTo(b, progress);
  }
}

class _RectBorderExpand extends _RectBorder {
  const _RectBorderExpand({
    required super.shape,
    required super.alignment,
    required super.size,
    required this.t,
  });

  final double t;

  @override
  Rect _adjustRect(Rect rect, TextDirection? textDirection) {
    final adjustedRect = super._adjustRect(rect, textDirection);
    return Rect.lerp(adjustedRect, rect, t)!;
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double progress) {
    if (a is _RectBorderExpand) {
      return _RectBorderExpand(
        shape: ShapeBorder.lerp(a.shape, shape, progress)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, progress)!,
        size: Size.lerp(a.size, size, progress)!,
        t: lerpDouble(a.t, t, progress)!,
      );
    }
    if (a is _RectBorder) {
      return _RectBorderExpand(
        shape: ShapeBorder.lerp(a.shape, shape, progress)!,
        alignment: AlignmentGeometry.lerp(a.alignment, alignment, progress)!,
        size: Size.lerp(a.size, size, progress)!,
        t: lerpDouble(1.0, t, progress)!,
      );
    }

    return super.lerpFrom(a, progress);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double progress) {
    return super.lerpTo(b, progress);
  }
}

class SplitAnimation extends Animation<double>
    with
        AnimationWithParentMixin,
        AnimationEagerListenerMixin,
        AnimationLocalListenersMixin,
        AnimationLocalStatusListenersMixin {
  SplitAnimation({required this.parent}) {
    _effectiveAnimationStatus = parent.status;
    parent.addStatusListener(_statusListener);
    _updateAnimations();
  }

  @override
  final Animation<double> parent;

  late AnimationStatus _effectiveAnimationStatus;
  final ProxyAnimation _forward = ProxyAnimation();
  final ProxyAnimation _reverse = ProxyAnimation();

  Animation<double> get forward => _forward;
  Animation<double> get reverse => _reverse;

  @override
  double get value => parent.value;

  AnimationStatus _calculateEffectiveAnimationStatus({
    required AnimationStatus lastEffective,
    required AnimationStatus current,
  }) {
    switch (current) {
      case AnimationStatus.dismissed:
      case AnimationStatus.completed:
        return current;
      case AnimationStatus.forward:
        switch (lastEffective) {
          case AnimationStatus.dismissed:
          case AnimationStatus.completed:
          case AnimationStatus.forward:
            return current;
          case AnimationStatus.reverse:
            return lastEffective;
        }
      case AnimationStatus.reverse:
        switch (lastEffective) {
          case AnimationStatus.dismissed:
          case AnimationStatus.completed:
          case AnimationStatus.reverse:
            return current;
          case AnimationStatus.forward:
            return lastEffective;
        }
    }
  }

  void _updateAnimations() {
    switch (_effectiveAnimationStatus) {
      case AnimationStatus.dismissed:
      case AnimationStatus.forward:
        _forward.parent = parent;
        _reverse.parent = kAlwaysDismissedAnimation;
      case AnimationStatus.reverse:
      case AnimationStatus.completed:
        _forward.parent = kAlwaysCompleteAnimation;
        _reverse.parent = ReverseAnimation(parent);
    }
  }

  void _statusListener(AnimationStatus animationStatus) {
    final AnimationStatus oldEffective = _effectiveAnimationStatus;
    _effectiveAnimationStatus = _calculateEffectiveAnimationStatus(
      lastEffective: _effectiveAnimationStatus,
      current: animationStatus,
    );
    if (oldEffective != _effectiveAnimationStatus) {
      _updateAnimations();
    }
  }

  @override
  void dispose() {
    parent.removeStatusListener(_statusListener);
    super.dispose();
  }
}
