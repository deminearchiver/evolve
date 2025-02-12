import 'dart:collection';

import 'package:material/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialThemeBuilderApp extends StatefulWidget {
  const MaterialThemeBuilderApp({super.key});

  @override
  State<MaterialThemeBuilderApp> createState() =>
      _MaterialThemeBuilderAppState();
}

class _MaterialThemeBuilderAppState extends State<MaterialThemeBuilderApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.standard,
        splashFactory: InkSparkle.splashFactory,
        textTheme: GoogleFonts.robotoTextTheme(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.standard,
        splashFactory: InkSparkle.splashFactory,
        textTheme: GoogleFonts.robotoTextTheme(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      home: const Test2(),
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.surfaceContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 412,
                child: Material(
                  animationDuration: Duration.zero,
                  type: MaterialType.card,
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Material(
                  animationDuration: Duration.zero,
                  type: MaterialType.card,
                  clipBehavior: Clip.antiAlias,
                  color: colorTheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
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
                Row(
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
        child: Column(
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
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Symbols.open_in_new),
                          ),
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
                  child: Row(
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
