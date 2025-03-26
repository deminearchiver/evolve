import 'package:example/material_theme_builder/app.dart';
import 'package:example/now_in_android/app.dart';
import 'package:flutter/material.dart';
import 'package:material/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialThemeBuilderApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorTheme(
      data: ColorThemeData.static(brightness: Brightness.dark),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Test1(),
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
    final color = ColorTheme.of(context);
    return Scaffold(
      backgroundColor: color.surfaceContainer,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          color: color.surface,
          child: FilledButton(onPressed: () {}, child: Text("Click me!")),
        ),
      ),
    );
  }
}
