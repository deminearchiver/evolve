import 'package:flutter/material.dart' hide DynamicSchemeVariant;
import 'package:material3_expressive/material3_expressive.dart';
import 'package:material_theme_builder/material_app.dart';
import 'package:material_theme_builder/theme/theme.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final colorThemes = ColorThemeFactory(
      variant: DynamicSchemeVariant.fidelity,
      version: DynamicSchemeVersion.spec2025,
    );
    return App(
      themeMode: ThemeMode.system,
      theme: LegacyThemeFactory.from(colorTheme: colorThemes.light),
      darkTheme: LegacyThemeFactory.from(colorTheme: colorThemes.dark),
      home: Test1(),
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
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {},
          child: Text("Material Theme Builder"),
        ),
      ),
    );
  }
}
