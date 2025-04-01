import 'package:example/keep/color_circle.dart';
import 'package:example/keep/floating_toolbar.dart';
import 'package:example/keep/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:material/material.dart';
import 'package:simple_icons/simple_icons.dart';

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
      // Debug
      debugShowCheckedModeBanner: false,
      scrollBehavior:
          kDebugMode
              ? const MaterialScrollBehavior().copyWith(
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              )
              : null,
      // Theme
      themeMode: ThemeMode.light,
      theme: ThemeFactory.fromColorTheme(
        colorTheme: ColorThemeData.fromSeed(
          seedColor: const Color(0xFF334E36),
          brightness: Brightness.light,
          variant: DynamicSchemeVariant.tonalSpot,
        ),
      ),
      darkTheme: ThemeFactory.fromColorTheme(
        colorTheme: ColorThemeData.fromSeed(
          seedColor: const Color(0xFF334E36),
          brightness: Brightness.dark,
          variant: DynamicSchemeVariant.tonalSpot,
        ),
      ),
      builder: _buildWrapper,
      home: const Test3(),
    );
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
    final textDirection = Directionality.of(context);
    final insets = MediaQuery.paddingOf(context).resolve(textDirection);

    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final elevationTheme = ElevationTheme.of(context);
    final textTheme = TextTheme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              builder:
                  (context) => Padding(
                    padding: const EdgeInsets.only(top: 48, bottom: 48),
                    child: Flex.vertical(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.text_fields),
                          title: Text("Text"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.check_box),
                          title: Text("List"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.calendar_month),
                          title: Text("Calendar"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.photo_camera),
                          title: Text("Camera"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.image),
                          title: Text("Gallery"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Symbols.graphic_eq),
                          title: Text("Audio"),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Flex.horizontal(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Button.text(
                                onPressed: () {},
                                label: Text("See all"),
                              ),
                              const SizedBox(width: 8),
                              Button.text(
                                onPressed: () {},
                                icon: const Icon(Symbols.edit),
                                label: Text("Customize"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
        style: ButtonStyle(
          overlayColor: WidgetStateLayerColor(
            WidgetStatePropertyAll(colorTheme.onPrimary),
            stateTheme.stateLayerOpacity,
          ),
          backgroundColor: WidgetStatePropertyAll(colorTheme.primary),
          iconColor: WidgetStatePropertyAll(colorTheme.onPrimary),
        ),
        icon: const Icon(Symbols.add),
        tooltip: "New note",
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {},
        selectedIndex: 2,
        destinations: const [
          NavigationDestination(icon: Icon(Symbols.lightbulb), label: "Notes"),
          NavigationDestination(
            icon: Icon(Symbols.notifications),
            label: "Reminders",
          ),
          NavigationDestination(
            icon: Icon(Symbols.settings),
            label: "Settings",
          ),
        ],
      ),
      // body: SafeArea(
      //   top: false,
      //   child: CustomScrollView(
      //     slivers: [
      //       SliverHeader(
      //         minExtent: 88,
      //         maxExtent: 88,
      //         builder:
      //             (context, shrinkOffset, overlapsContent) => Padding(
      //               padding: EdgeInsets.fromLTRB(16, 16 + insets.top, 16, 16),
      //               child: SizedBox(
      //                 width: double.infinity,
      //                 height: 56,
      //                 child: Material(
      //                   animationDuration: Duration.zero,
      //                   type: MaterialType.card,
      //                   clipBehavior: Clip.antiAlias,
      //                   color: colorTheme.surfaceContainerHigh,
      //                   shape: CornersBorder(
      //                     delegate: shapeTheme.corner.family.delegate,
      //                     corners: Corners.all(shapeTheme.corner.full),
      //                   ),
      //                   shadowColor: Colors.transparent,
      //                   elevation: elevationTheme.level3,
      //                   child: InkWell(
      //                     onTap: () {},
      //                     overlayColor: WidgetStateLayerColor(
      //                       WidgetStatePropertyAll(colorTheme.onSurface),
      //                       stateTheme.stateLayerOpacity,
      //                     ),
      //                     child: Flex.horizontal(
      //                       children: [
      //                         SizedBox(
      //                           width: 56,
      //                           child: Align.center(
      //                             child: IconButton(
      //                               onPressed: () {},
      //                               style: ButtonStyle(
      //                                 iconColor: WidgetStatePropertyAll(
      //                                   colorTheme.onSurface,
      //                                 ),
      //                               ),
      //                               icon: const Icon(Symbols.menu),
      //                             ),
      //                           ),
      //                         ),
      //                         Flexible.expanded(
      //                           child: Text(
      //                             "Search your notes",
      //                             style: textTheme.bodyLarge!.copyWith(
      //                               color: colorTheme.onSurfaceVariant,
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.symmetric(
      //                             horizontal: 16,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //       ),
      //     ],
      //   ),
      // ),
      body: const Test2(),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        controller: widget.scrollController,
        slivers: [
          SliverAppBar.large(
            pinned: true,
            leadingWidth: 56,
            titleSpacing: 0,
            leading: Align.center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Symbols.search),
                tooltip: "Search settings",
              ),
            ),
            title: Text("Settings"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(SimpleIcons.github),
                tooltip: "GitHub",
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(SimpleIcons.patreon),
                tooltip: "Patreon",
              ),
              const SizedBox(width: 4),
            ],
          ),
          SliverToBoxAdapter(child: SizedBox(height: 1000)),
        ],
      ),
    );
  }
}

class Test3 extends StatefulWidget {
  const Test3({super.key});

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  bool _editing = true;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 64,
              backgroundColor: _editing ? colorTheme.surfaceContainer : null,
              leading: Align.center(
                child:
                    _editing
                        ? IconButton(
                          onPressed: () => setState(() => _editing = false),
                          style: ButtonStyle(
                            iconColor: WidgetStatePropertyAll(
                              colorTheme.primary,
                            ),
                          ),
                          icon: const Icon(Symbols.check),
                          tooltip: "Finish editing",
                        )
                        : IconButton(
                          onPressed: () {},
                          icon: const Icon(Symbols.close),
                        ),
              ),
              actions: [
                if (_editing)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Symbols.undo),
                    tooltip: "Undo",
                  ),
                if (_editing)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Symbols.redo),
                    tooltip: "Redo",
                  ),
                if (_editing)
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Symbols.magic_button, fill: 1),
                    tooltip: "Ask Gemini",
                  ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Symbols.more_vert),
                  tooltip: "More options",
                ),
                const SizedBox(width: 4),
              ],
            ),
            SliverList.list(
              children: [
                FloatingToolbar.horizontal(
                  variant: FloatingToolbarVariant.vibrant,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Flex.horizontal(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.format_bold),
                            selected: true,
                            tooltip: "Toggle bold",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.format_italic),
                            tooltip: "Toggle italic",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.strikethrough_s),
                            tooltip: "Toggle strikethrough",
                          ),
                          IconButton.filledTonal(
                            onPressed: () {},
                            icon: const Icon(Symbols.format_underlined),
                            selected: true,
                            tooltip: "Toggle underlined",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.format_indent_increase),
                            tooltip: "Increase indentation",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.format_indent_decrease),
                            tooltip: "Decrease indentation",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.superscript),
                            tooltip: "Toggle superscript",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.subscript),
                            tooltip: "Toggle subscript",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.add_link),
                            tooltip: "Add link",
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.article_shortcut),
                            tooltip: "Add file callout",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Button.text(onPressed: () {}, label: const Text("Edit order")),
                Wrap(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.format_bold),
                      tooltip: "Toggle bold",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.format_italic),
                      tooltip: "Toggle italic",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.strikethrough_s),
                      tooltip: "Toggle strikethrough",
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Symbols.format_underlined),
                      tooltip: "Toggle underlined",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.format_indent_increase),
                      tooltip: "Increase indentation",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.format_indent_decrease),
                      tooltip: "Decrease indentation",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.superscript),
                      tooltip: "Toggle superscript",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.subscript),
                      tooltip: "Toggle subscript",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.add_link),
                      tooltip: "Add link",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Symbols.article_shortcut),
                      tooltip: "Add file callout",
                    ),
                  ],
                ),
                Button.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Symbols.format_clear),
                  label: Text("Clear formatting"),
                ),
                Flex.horizontal(
                  children: [
                    Flexible.expanded(
                      child: ColorPill(
                        color: Colors.red,
                        label: Text("Text color"),
                      ),
                    ),
                    Flexible.expanded(
                      child: ColorPill(
                        color: null,
                        label: Text("Highlight color"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        style: const ButtonStyle(shadowColor: WidgetStateColor.transparent),
        icon: const Icon(Symbols.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Flex.horizontal(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.subject),
              tooltip: "Paragraph",
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.check_box),
              tooltip: "Checklist",
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.brush),
              tooltip: "Drawing",
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Symbols.add_photo_alternate),
              tooltip: "Image",
            ),
            SizedBox.square(dimension: 30, child: ColorCircle(color: null)),
          ],
        ),
      ),
    );
  }
}

class ColorPill extends StatelessWidget {
  const ColorPill({super.key, required this.color, required this.label});

  final Color? color;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final shapeTheme = ShapeTheme.of(context);
    final stateTheme = StateTheme.of(context);
    final textTheme = TextTheme.of(context);
    return SizedBox(
      height: 56,
      child: Material(
        animationDuration: Duration.zero,
        clipBehavior: Clip.antiAlias,
        color: colorTheme.surfaceContainerHighest,
        shape: CornersBorder(
          delegate: shapeTheme.corner.family.delegate,
          corners: Corners.all(shapeTheme.corner.full),
        ),
        child: InkWell(
          onTap: () {},
          overlayColor: WidgetStateLayerColor(
            WidgetStatePropertyAll(colorTheme.onSurface),
            stateTheme.stateLayerOpacity,
          ),
          child: Flex.horizontal(
            children: [
              const SizedBox(width: 16),
              Flexible.expanded(
                child: DefaultTextStyle.merge(
                  style: textTheme.labelLarge!.copyWith(
                    color: colorTheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  child: label,
                ),
              ),
              const SizedBox(width: 12),
              SizedBox.square(dimension: 40, child: ColorCircle(color: color)),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
