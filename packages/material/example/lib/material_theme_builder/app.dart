import 'dart:collection';

import 'package:example/gen/assets.gen.dart';
import 'package:example/material_theme_builder/navigation_rail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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

class Three1 extends StatefulWidget {
  const Three1({super.key});

  @override
  State<Three1> createState() => _Three1State();
}

class _Three1State extends State<Three1> {
  InAppWebViewController? _webviewController;
  InAppWebViewSettings _webviewSettings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllowFullscreen: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    return Stack(
      children: [
        InAppWebView(
          initialSettings: _webviewSettings,
          onWebViewCreated: (controller) {
            setState(() => _webviewController = controller);
            controller.addJavaScriptHandler(
              handlerName: "load",
              callback: (data) async {
                final asset = await rootBundle.load("assets/caiman.glb");
                return asset.buffer.asUint8List();
              },
            );
          },
          initialData: InAppWebViewInitialData(
            data: """<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
		<title>My first three.js app</title>
    <style>
      body {
        margin: 0;
        color-scheme: light dark;
      }
    </style>
    <script type="importmap">
      {
        "imports": {
          "three": "https://cdn.jsdelivr.net/npm/three@0.174.0/build/three.module.js",
          "three/addons/": "https://cdn.jsdelivr.net/npm/three@0.174.0/examples/jsm/"
        }
      }
    </script>
  </head>
  <body>
    <script type="module">
import * as THREE from 'three';

			import { GUI } from 'three/addons/libs/lil-gui.module.min.js';

			import { EffectComposer } from 'three/addons/postprocessing/EffectComposer.js';
			import { RenderPass } from 'three/addons/postprocessing/RenderPass.js';
			import { AfterimagePass } from 'three/addons/postprocessing/AfterimagePass.js';
			import { OutputPass } from 'three/addons/postprocessing/OutputPass.js';

			let camera, scene, renderer, composer;
			let mesh;

			let afterimagePass;

			const params = {

				enable: true

			};

			init();

			function init() {

				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.setAnimationLoop( animate );
				document.body.appendChild( renderer.domElement );

				camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 1000 );
				camera.position.z = 400;

				scene = new THREE.Scene();
				scene.fog = new THREE.Fog( 0x000000, 1, 1000 );

				const geometry = new THREE.BoxGeometry( 150, 150, 150, 2, 2, 2 );
				const material = new THREE.MeshNormalMaterial();
				mesh = new THREE.Mesh( geometry, material );
				scene.add( mesh );

				// postprocessing

				composer = new EffectComposer( renderer );
				composer.addPass( new RenderPass( scene, camera ) );

				afterimagePass = new AfterimagePass();
				composer.addPass( afterimagePass );

				const outputPass = new OutputPass();
				composer.addPass( outputPass );

				window.addEventListener( 'resize', onWindowResize );

				const gui = new GUI( { title: 'Damp setting' } );
				gui.add( afterimagePass.uniforms[ 'damp' ], 'value', 0, 1 ).step( 0.001 );
				gui.add( params, 'enable' );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );
				composer.setSize( window.innerWidth, window.innerHeight );

			}

			function animate() {

				mesh.rotation.x += 0.005;
				mesh.rotation.y += 0.01;

				afterimagePass.enabled = params.enable;

				composer.render();


			}

    </script>
  </body>
</html>""",
          ),
          onLoadStop: (controller, url) async {},
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              color: colorTheme.surface,
              // borderRadius: BorderRadius.circular(28),
              shape: const StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),

                child: Flex.horizontal(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton.filledTonal(
                      onPressed:
                          _webviewController != null
                              ? () => _webviewController!.reload()
                              : null,
                      icon: const Icon(Symbols.refresh),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BrowserView extends StatefulWidget {
  const BrowserView({super.key});

  @override
  State<BrowserView> createState() => _BrowserViewState();
}

class _BrowserViewState extends State<BrowserView> {
  InAppWebViewSettings _webviewSettings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllowFullscreen: true,
  );
  InAppWebViewController? _webviewController;

  late TextEditingController _urlController;

  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _urlController =
        TextEditingController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _urlController.dispose();
    _webviewController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = ColorTheme.of(context);
    final textTheme = TextTheme.of(context);
    return Flex.vertical(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 72,
          child: Material(
            child: Flex.vertical(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flex.horizontal(
                  children: [
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed:
                          _webviewController != null
                              ? () => _webviewController!.goBack()
                              : null,
                      icon: const Icon(Symbols.arrow_back),
                    ),
                    IconButton(
                      onPressed:
                          _webviewController != null
                              ? () => _webviewController!.goForward()
                              : null,
                      icon: const Icon(Symbols.arrow_forward),
                    ),
                    IconButton(
                      onPressed:
                          _webviewController != null
                              ? () => _webviewController!.reload()
                              : null,
                      icon: const Icon(Symbols.refresh),
                    ),
                    const SizedBox(width: 4),
                    Flexible.expanded(
                      child: SizedBox(
                        height: 56,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          color: colorTheme.surfaceContainerHigh,
                          shape: const StadiumBorder(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: Flex.horizontal(
                              children: [
                                Flexible.expanded(
                                  child: TextField(
                                    controller: _urlController,
                                    onSubmitted: (value) {
                                      final url = WebUri(value);
                                      if (url.scheme.isEmpty) {
                                        // url = WebUri(
                                        //   "https://www.google.com/search?q=$value",
                                        // );
                                        return;
                                      }
                                      _webviewController?.loadUrl(
                                        urlRequest: URLRequest(url: url),
                                      );
                                    },
                                    keyboardType: TextInputType.url,
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: colorTheme.onSurface,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Search or type URL",
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
                                if (_urlController.text.isNotEmpty || true) ...[
                                  IconButton(
                                    onPressed:
                                        _urlController.text.isNotEmpty
                                            ? () => _urlController.clear()
                                            : null,
                                    icon: const Icon(Symbols.close),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                Button.filled(
                                  onPressed:
                                      _urlController.text.isNotEmpty
                                          ? () {}
                                          : null,
                                  icon: const Icon(Symbols.search),
                                  label: Text("Search"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TweenAnimationBuilder(
            tween: Tween<double>(end: _progress == 1.0 ? 0.0 : 4.0),
            duration: Durations.long4,
            curve: Curves.easeInOutCubicEmphasized,
            builder:
                (context, height, child) =>
                    height > 0.0
                        ? TweenAnimationBuilder(
                          tween: Tween<double>(end: _progress),
                          duration: Durations.short4,
                          curve: Easing.standard,
                          builder:
                              (context, value, child) =>
                                  LinearProgressIndicator(
                                    year2023: false,
                                    value: value,
                                    minHeight: height,
                                  ),
                        )
                        : const SizedBox.shrink(),
          ),
        ),
        Flexible.expanded(
          child: Stack(
            children: [
              InAppWebView(
                initialSettings: _webviewSettings,
                initialUrlRequest: URLRequest(
                  url: WebUri("https://youtube.com"),
                ),
                onWebViewCreated: (controller) {
                  setState(() => _webviewController = controller);
                },
                onLoadStop: (controller, url) {},
                onProgressChanged: (controller, progress) {
                  debugPrint("${progress}");
                  setState(() => _progress = progress / 100);
                },
              ),
            ],
          ),
        ),
      ],
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
              ExperimentalNavigationRail(
                selectedIndex: 0,
                destinations: [
                  Destination(
                    icon: const Icon(Symbols.home),
                    label: Text("Home"),
                  ),
                  Destination(
                    icon: const Icon(Symbols.home),
                    label: Text("Home"),
                  ),
                  Destination(
                    icon: const Icon(Symbols.home),
                    label: Text("Home"),
                  ),
                  Destination(
                    icon: const Icon(Symbols.home),
                    label: Text("Home"),
                  ),
                ],
              ),
              Flexible.expanded(child: BrowserView()),
              // Flexible.expanded(child: Three1()),
              // Flexible.expanded(
              //   child: Material(
              //     animationDuration: Duration.zero,
              //     type: MaterialType.card,
              //     clipBehavior: Clip.antiAlias,
              //     color: colorTheme.surface,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(28)),
              //     ),
              //     child: CustomScrollView(
              //       scrollBehavior: ScrollConfiguration.of(context).copyWith(
              //         dragDevices: {
              //           PointerDeviceKind.touch,
              //           PointerDeviceKind.mouse,
              //         },
              //       ),
              //       slivers: [
              //         SliverFillViewport(
              //           delegate: SliverChildListDelegate([
              //             Assets.images.googlePixel9ProPorcelainRear.svg(),
              //             Assets.images.googlePixel9ProObsidianRear.svg(),
              //             FittedBox(
              //               fit: BoxFit.scaleDown,
              //               child: Pixel9Pro(
              //                 child: Scaffold(
              //                   body: SafeArea(
              //                     child: CustomScrollView(
              //                       slivers: [
              //                         SliverAppBar(title: Text("Maps")),
              //                         SliverList.list(
              //                           children: [
              //                             Button.filled(
              //                               onPressed: () {},
              //                               label: Text("Hello world!"),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   bottomNavigationBar: NavigationBar(
              //                     indicatorColor: colorTheme.primary,
              //                     selectedIndex: 0,
              //                     destinations: [
              //                       NavigationDestination(
              //                         icon: Icon(
              //                           Symbols.upcoming,
              //                           fill: 0,
              //                           color: colorTheme.onSurfaceVariant,
              //                         ),
              //                         selectedIcon: Icon(
              //                           Symbols.upcoming,
              //                           fill: 1,
              //                           color: colorTheme.onPrimary,
              //                         ),
              //                         label: "For you",
              //                       ),
              //                       NavigationDestination(
              //                         icon: Icon(
              //                           Symbols.menu_book,
              //                           fill: 0,
              //                           color: colorTheme.onSurfaceVariant,
              //                         ),
              //                         selectedIcon: Icon(
              //                           Symbols.menu_book,
              //                           fill: 1,
              //                           color: colorTheme.onPrimary,
              //                         ),
              //                         label: "Episodes",
              //                       ),
              //                       NavigationDestination(
              //                         icon: Icon(
              //                           Symbols.bookmarks,
              //                           fill: 0,
              //                           color: colorTheme.onSurfaceVariant,
              //                         ),
              //                         selectedIcon: Icon(
              //                           Symbols.bookmarks,
              //                           fill: 1,
              //                           color: colorTheme.onPrimary,
              //                         ),
              //                         label: "Saved",
              //                       ),
              //                       NavigationDestination(
              //                         icon: Icon(
              //                           Symbols.tag,
              //                           fill: 0,
              //                           color: colorTheme.onSurfaceVariant,
              //                         ),
              //                         selectedIcon: Icon(
              //                           Symbols.tag,
              //                           fill: 1,
              //                           color: colorTheme.onPrimary,
              //                         ),
              //                         label: "Interests",
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ]),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
                duration: motionTheme.duration.extraLong2,
                curve: motionTheme.easing.emphasized,
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
