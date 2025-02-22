import 'dart:collection';

import 'package:example/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:material/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/widgets.dart';

class MaterialThemeBuilderApp extends StatefulWidget {
  const MaterialThemeBuilderApp({super.key});

  @override
  State<MaterialThemeBuilderApp> createState() =>
      _MaterialThemeBuilderAppState();
}

class _MaterialThemeBuilderAppState extends State<MaterialThemeBuilderApp> {
  @override
  Widget build(BuildContext context) {
    debugPrint("${MediaQuery.sizeOf(context)}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00FF00),
          dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
          brightness: Brightness.light,
        ),
        platform: TargetPlatform.android,
        visualDensity: VisualDensity.standard,
        splashFactory: InkSparkle.splashFactory,
        textTheme: GoogleFonts.robotoTextTheme(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00FF00),
          dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
          brightness: Brightness.dark,
        ),
        platform: TargetPlatform.android,
        visualDensity: VisualDensity.standard,
        splashFactory: InkSparkle.splashFactory,
        textTheme: GoogleFonts.robotoTextTheme(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      home: StateTheme(data: StateThemeData.web(), child: const Test2()),
    );
  }
}

const double _kStrokeThickness = 12.5;
const Size _kTotalSize = Size(720, 1528);
const Radius _kRadius = Radius.circular(121.25);
const BorderRadius _kBorderRadius = BorderRadius.all(_kRadius);

class Pixel9Pro extends StatefulWidget {
  const Pixel9Pro({super.key, this.child});

  final Widget? child;

  @override
  State<Pixel9Pro> createState() => _Pixel9ProState();
}

class _Pixel9ProState extends State<Pixel9Pro> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final colorTheme = ColorTheme.of(context);
    return SizedBox.fromSize(
      size: _kTotalSize,
      child: Align.center(
        child: SizedBox(
          width: _kTotalSize.width - _kStrokeThickness * 2,
          height: _kTotalSize.height - _kStrokeThickness * 2,
          child: Material(
            animationDuration: Duration.zero,
            type: MaterialType.card,
            // clipBehavior: Clip.antiAlias,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                _kRadius - const Radius.circular(_kStrokeThickness),
              ),
              side: BorderSide(
                width: _kStrokeThickness,
                color: colorTheme.outline,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                _kRadius - const Radius.circular(_kStrokeThickness),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: 448.0,
                  height: 997.3,
                  child: MediaQuery(
                    data: media.copyWith(
                      padding: EdgeInsets.fromLTRB(0.0, 53.0, 0.0, 24.0),
                    ),
                    child: widget.child ?? const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Flex.horizontal(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible.expanded(
                child: Material(
                  animationDuration: Duration.zero,
                  type: MaterialType.card,
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                  child: CustomScrollView(
                    scrollBehavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    slivers: [
                      SliverFillViewport(
                        delegate: SliverChildListDelegate([
                          Assets.images.googlePixel9ProPorcelainRear.svg(),
                          Assets.images.googlePixel9ProObsidianRear.svg(),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Pixel9Pro(
                              child: Scaffold(
                                body: SafeArea(
                                  child: CustomScrollView(
                                    slivers: [
                                      SliverAppBar(title: Text("Maps")),
                                      SliverList.list(
                                        children: [
                                          Button.filled(
                                            onPressed: () {},
                                            label: Text("Hello world!"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                bottomNavigationBar: NavigationBar(
                                  indicatorColor: colorTheme.primary,
                                  selectedIndex: 0,
                                  destinations: [
                                    NavigationDestination(
                                      icon: Icon(
                                        Symbols.upcoming,
                                        fill: 0,
                                        color: colorTheme.onSurfaceVariant,
                                      ),
                                      selectedIcon: Icon(
                                        Symbols.upcoming,
                                        fill: 1,
                                        color: colorTheme.onPrimary,
                                      ),
                                      label: "For you",
                                    ),
                                    NavigationDestination(
                                      icon: Icon(
                                        Symbols.menu_book,
                                        fill: 0,
                                        color: colorTheme.onSurfaceVariant,
                                      ),
                                      selectedIcon: Icon(
                                        Symbols.menu_book,
                                        fill: 1,
                                        color: colorTheme.onPrimary,
                                      ),
                                      label: "Episodes",
                                    ),
                                    NavigationDestination(
                                      icon: Icon(
                                        Symbols.bookmarks,
                                        fill: 0,
                                        color: colorTheme.onSurfaceVariant,
                                      ),
                                      selectedIcon: Icon(
                                        Symbols.bookmarks,
                                        fill: 1,
                                        color: colorTheme.onPrimary,
                                      ),
                                      label: "Saved",
                                    ),
                                    NavigationDestination(
                                      icon: Icon(
                                        Symbols.tag,
                                        fill: 0,
                                        color: colorTheme.onSurfaceVariant,
                                      ),
                                      selectedIcon: Icon(
                                        Symbols.tag,
                                        fill: 1,
                                        color: colorTheme.onPrimary,
                                      ),
                                      label: "Interests",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              SizedBox(
                // width: 400, // Modal
                width: 412, // Supporting pane
                child: Material(
                  animationDuration: Duration.zero,
                  type: MaterialType.card,
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Flex.vertical(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible.expanded(
                        child: CustomScrollView(
                          scrollBehavior: ScrollConfiguration.of(
                            context,
                          ).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },
                          ),
                          slivers: [
                            SliverAppBar(
                              leading: Align.center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Symbols.arrow_back),
                                ),
                              ),
                              leadingWidth: (16 - 4) + 48 + (12 - 4),
                              titleSpacing: 0,
                              toolbarHeight: 72,
                              title: Text("Choose theme colors"),
                              actions: [
                                const SizedBox(width: 8), // 12 - 4
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Symbols.close),
                                ),
                                const SizedBox(width: 20), // 24 - 4
                              ],
                            ),
                            SliverList.list(
                              children: [
                                // ListTile(
                                //   leading: const Icon(Symbols.format_size),
                                //   title: Text("Display, headlines & titles"),
                                //   subtitle: Text(
                                //     "As the largest text on the screen, these styles are reserved for short",
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 72,
                        child: Material(
                          color: colorTheme.surface,
                          shape: Border(
                            top: BorderSide(color: colorTheme.outlineVariant),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              24,
                              16 - 4,
                              24,
                              24 - 4,
                            ),
                            child: Flex.horizontal(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 8,
                              children: [
                                Button.outlined(
                                  onPressed: () {},
                                  label: const Text("Back"),
                                ),
                                Button.filledTonal(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    iconAlignment: IconAlignment.end,
                                  ),
                                  icon: const Icon(Symbols.arrow_forward),
                                  // label: const Text("Export theme"),
                                  label: const Text("Pick your fonts"),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _SideSheetActions extends SliverPersistentHeaderDelegate {
  const _SideSheetActions();

  @override
  double get minExtent => 72.0;

  @override
  double get maxExtent => 72.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final colorTheme = ColorTheme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: Material(
        color: colorTheme.surface,
        shape: Border(top: BorderSide(color: colorTheme.outlineVariant)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16 - 4, 24, 24 - 4),
          child: Flex.horizontal(
            spacing: 8,
            children: [
              Button.filled(onPressed: () {}, label: const Text("Save")),
              Button.outlined(onPressed: () {}, label: const Text("Cancel")),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(title: Text("Pick your fonts")),
            SliverList.list(
              children: [
                Flex.horizontal(
                  children: [
                    Button.filled(
                      onPressed:
                          () => showDialog(
                            context: context,
                            builder: (context) => const GoogleFontsDialog(),

                            // builder: (context) => GoogleFontsDialog(),
                          ),
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(0, 56)),
                        maximumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 56),
                        ),
                        // iconSize: WidgetStatePropertyAll(24.0),
                      ),
                      icon: const Icon(SimpleIcons.googlefonts),
                      label: Text("Use Google Fonts"),
                    ),
                    const SizedBox(width: 8),
                    Button.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Symbols.upload),
                      label: Text("Upload"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleFontsDialog extends StatefulWidget {
  const GoogleFontsDialog({super.key});

  @override
  State<GoogleFontsDialog> createState() => _GoogleFontsDialogState();
}

class _GoogleFontsDialogState extends State<GoogleFontsDialog> {
  static final List<String> _googleFonts = UnmodifiableListView(
    GoogleFonts.asMap().keys,
  );

  late TextEditingController _textController;
  List<String> _filtered = _googleFonts;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController()..addListener(() {
          setState(() {
            _filtered =
                _googleFonts
                    .where(
                      (font) => font.toLowerCase().contains(
                        _textController.text.toLowerCase(),
                      ),
                    )
                    .toList();
          });
        });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final motionTheme = MotionTheme.of(context);
    return Dialog(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.antiAlias,

      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 360, maxWidth: 720),
        child: Flex.vertical(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: AnimatedSize(
                duration: motionTheme.durationExtraLong2,
                curve: motionTheme.easingEmphasized,
                alignment: Alignment.topCenter,
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList.list(
                        children: [
                          SearchBar(
                            backgroundColor: WidgetStatePropertyAll(
                              colorTheme.surface,
                            ),
                            shadowColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 16),
                            ),
                            controller: _textController,
                            leading: const Icon(Symbols.search),
                            hintText: "Search fonts",
                          ),
                        ],
                      ),
                    ),
                    SliverFixedExtentList.builder(
                      itemExtent: 56,
                      itemCount: _filtered.length,
                      itemBuilder: (context, index) {
                        final font = _filtered[index];
                        return ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.search),
                          title: Text(font),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
              child: Material(
                color: colorTheme.surfaceContainerHigh,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex.horizontal(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button.text(onPressed: () {}, label: Text("Cancel")),
                      const SizedBox(width: 8),
                      Button.filled(onPressed: null, label: Text("Confirm")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
